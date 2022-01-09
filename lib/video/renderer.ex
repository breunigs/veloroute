defmodule Video.Renderer do
  @doc """
  Returns the commands to preview the given video(s).
  """
  def preview(rendered, blur) do
    filter =
      if blur,
        do: Enum.join(blurs(rendered) ++ xfades(rendered, true), ";"),
        else: Enum.join(xfades(rendered, false), ";")

    ["nice", "-n15", "ffmpeg", "-hide_banner"] ++
      inputs(rendered) ++
      [
        "-filter_complex",
        filter,
        "-pix_fmt",
        "yuv420p",
        "-f",
        "yuv4mpegpipe",
        "-",
        "|",
        "mpv",
        "--pause",
        "--no-resume-playback",
        "--framedrop=no",
        "--audio=no",
        "--keep-open=yes",
        "--demuxer-max-bytes=10G",
        "--force-seekable=yes",
        "-"
      ]
  end

  def render(rendered, target) when is_binary(target) do
    target = Path.expand(target)

    case File.ls(target) do
      {:ok, []} -> render_real(rendered, target)
      {:error, :enoent} -> render_real(rendered, target)
      _ -> {:error, "#{target} already exists, refusing to overwrite"}
    end
  end

  @nice_render ["nice", "-n19", "ionice", "-c", "3"]

  defp render_real(rendered, target) do
    pbar = Video.Renderer.Progress.new(rendered)
    filter = Enum.join(blurs(rendered) ++ xfades(rendered, true), ";")

    outputs = Enum.map(variants(), fn %{index: idx} -> "[out#{idx}]" end)
    filter = filter <> ",split=#{Enum.count(outputs)}#{Enum.join(outputs)}"

    cmd =
      @nice_render ++
        ["ffmpeg", "-hide_banner"] ++
        inputs(rendered) ++ ["-filter_complex", filter]

    {:ok, tmp_dir} = Temp.mkdir("veloroutehamburg_render_#{rendered.hash()}")

    try do
      cmd = cmd ++ encoder(tmp_dir)

      with %{result: :ok} <- Util.cmd2(cmd, stderr: pbar, name: "ffmpeg render") do
        create_fallbacks(tmp_dir)
      end
    after
      File.rm_rf!(tmp_dir)
    end
  end

  defp create_fallbacks(tmp_dir) do
    fails =
      variants()
      |> Enum.filter(&is_map_key(&1, :fallback))
      |> Enum.map(fn %{index: idx, fallback: fb} ->
        Util.cmd2(
          @nice_render ++
            [
              "ffmpeg",
              "-hide_banner",
              "-log_level",
              "fatal",
              "-i",
              Path.join(tmp_dir, "stream_#{idx}.m4s"),
              "-c:v",
              "copy",
              "-movflags",
              "+faststart",
              Path.join(tmp_dir, "fallback.#{fb}")
            ],
          name: "ffmpeg fallback #{fb}"
        )
      end)
      |> Enum.reject(fn %{result: res} -> res == :ok end)

    if Enum.count(fails) >= 1 do
      Enum.reduce("", fn %{result: {:error, res}}, acc -> "#{acc}\n\n#{res}" end)
    else
      :ok
    end
  end

  defp inputs(rendered) do
    ["-hwaccel", "auto", "-re"]

    rendered.sources()
    |> Enum.flat_map(fn {path, from, to} ->
      from = if from == :start, do: [], else: ["-ss", from]
      to = if to == :end, do: [], else: ["-to", to]

      from ++ to ++ ["-i", Video.Path.source(path)]
    end)
  end

  defp blurs(rendered) do
    rendered.sources()
    |> Enum.with_index()
    |> Parallel.map(2, fn {{path, from, _to}, idx} ->
      path = Video.Path.detections(path)
      from = if from == :start, do: 0, else: Video.Timestamp.in_milliseconds(from)
      blur_frame_skip = if from == 0, do: 0, else: ceil(fps(path) * from / 1000.0)
      "[#{idx}]frei0r=jsonblur:#{path}|#{blur_frame_skip}[blur#{idx}]"
    end)
  end

  defp xfades(rendered, blur) when is_boolean(blur) do
    fade = rendered.fade()
    if fade == nil, do: raise("cannot render videos without fades, please set it")

    count = length(rendered.sources())
    blur = if blur, do: "blur", else: ""

    if count == 1 do
      ["[#{blur}0]copy"]
    else
      rendered.sources()
      |> Enum.with_index()
      |> Parallel.map(2, fn {{path, from, to}, idx} ->
        from = if from == :start, do: 0, else: Video.Timestamp.in_seconds(from)
        to = if to == :end, do: duration_in_s(path), else: Video.Timestamp.in_seconds(to)
        {Float.round(to - from, 3), idx}
      end)
      |> Enum.reduce({0, []}, fn {dur, idx}, {total, list} ->
        {total + dur - fade,
         if idx == 0 do
           list
         else
           prev = if idx == 1, do: "[#{blur}0]", else: "[fade#{idx - 1}]"
           xfade = "#{prev}[#{blur}#{idx}]xfade=transition=fade:duration=#{fade}:offset=#{total}"
           xfade = if idx == count - 1, do: xfade, else: xfade <> "[fade#{idx}]"
           [xfade | list]
         end}
      end)
      |> elem(1)
      |> Enum.reverse()
    end
  end

  defp duration_in_s(path), do: (path |> Video.Path.source() |> Video.Metadata.for())[:duration]
  defp fps(path), do: (path |> Video.Path.source() |> Video.Metadata.for())[:fps]

  # length of a single segment in seconds. Quality usually switches between
  # segments. https://ffmpeg.org/ffmpeg-formats.html#Options-8
  defp hls_time, do: 2

  # GOP=group of pictures, essentially when to insert a keyframe. The script sets
  # the min/max for this to the same value, i.e. there will be a keyframe exactly
  # every GOP_SIZE. Ideally HLS_TIME * FPS = GOP_SIZE.
  # https://video.stackexchange.com/a/24684
  defp gop_size, do: round(hls_time() * Video.Source.fps())

  # The average bitrate is given in the variants above. This defined
  # how much the maximum bitrate may deviate from that (as a ratio)
  defp max_bitrate(input), do: 1.1 * input
  # The sliding window in which the codec can distribute its bits,
  # as a ratio of the bitrate, see
  # https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate
  defp buf_size(input), do: 2.0 * input

  # codec tag specification:
  # https://developer.mozilla.org/en-US/docs/Web/Media/Formats/codecs_parameter

  # vp9 levels: https://www.webmproject.org/vp9/levels/
  defp codec_vp9,
    do: %{
      codec:
        ~w[libvpx-vp9 -row-mt:v:__INDEX__ 1 -tile-columns 4 -frame-parallel 1 -speed 1 -threads 2 -refs:v:__INDEX__ 5],
      tag_as: "vp09.00.30.08"
    }

  # ffmpeg itself manages avc tags
  defp codec_avc,
    do: %{codec: ~w[libx264 -preset veryslow -x264opts opencl  -refs:v:__INDEX__ 5]}

  # hevc tag: ISO/IEC 14496-15 (€). If ffmpeg is modern enough, it will create
  # the tag. The one given here is a fallback.
  defp codec_hevc do
    specific =
      if Video.Metadata.can_use?("hevc_nvenc"),
        do:
          ~w[hevc_nvenc -preset slow -tier:v:__INDEX__ high -level:v:__INDEX__ 6.2 -nonref_p 1 -spatial_aq 1 hvc1 -refs:v:__INDEX__ 0],
        else: ~w[libx265 -x265-params log-level=error]

    %{codec: specific ++ ~w[-tag:v:__INDEX__ hvc1], tag_as: "hvc1.1.4.L186.B01"}
  end

  defp variants do
    codec_avc = codec_avc()
    codec_vp9 = codec_vp9()
    codec_hevc = codec_hevc()

    [
      Map.merge(%{width: 640, height: 360, bitrate: 4, fallback: :mp4}, codec_avc),
      Map.merge(%{width: 256, height: 144, bitrate: 0.7}, codec_avc),
      Map.merge(%{width: 426, height: 240, bitrate: 2}, codec_avc),
      Map.merge(%{width: 854, height: 480, bitrate: 4, fallback: :webm}, codec_vp9),
      Map.merge(%{width: 1280, height: 720, bitrate: 6}, codec_avc),
      Map.merge(%{width: 1920, height: 1080, bitrate: 12}, codec_avc),
      Map.merge(%{width: 1920, height: 1080, bitrate: 12}, codec_hevc)
    ]
    |> Enum.with_index()
    |> Enum.map(fn {info, idx} ->
      info
      |> Map.put(:index, idx)
      |> Map.put(:codec, Enum.map(info[:codec], &String.replace(&1, "__INDEX__", "#{idx}")))
    end)
  end

  def variant_flags() do
    variants()
    |> Enum.flat_map(fn %{width: w, height: h, bitrate: rate, index: idx, codec: codec} ->
      ["-c:v:#{idx}"] ++
        codec ++
        [
          "-flags",
          "+cgop",
          "-map",
          "[out#{idx}]",
          "-s:#{idx}",
          "#{w}x#{h}",
          "-metadata:s:v:#{idx}",
          "title=\"#{h}p\"",
          "-b:v:#{idx}",
          "#{rate}M",
          "-maxrate:#{idx}",
          "#{max_bitrate(rate)}M",
          "-bufsize:#{idx}",
          "#{buf_size(rate)}M"
        ]
    end)
  end

  defp encoder(tmp_dir) when is_binary(tmp_dir) do
    stream_map = variants() |> Enum.map(&"v:#{&1[:index]}") |> Enum.join(" ")

    ~w[
      -an
      -f hls
      -hls_playlist_type vod
      -sc_threshold 0
      -movflags +faststart
      -pix_fmt yuv420p
      -hls_segment_type fmp4
      -master_pl_name stream.m3u8
      -hls_flags single_file+independent_segments
      -hls_list_size 0] ++
      ["-keyint_min", gop_size(), "-g", gop_size(), "-hls_time", hls_time()] ++
      variant_flags() ++ ["-var_stream_map", stream_map, "#{tmp_dir}/stream_%v.m3u8"]
  end
end
