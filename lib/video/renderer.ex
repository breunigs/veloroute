defmodule Video.Renderer do
  @min_renderer_version 3

  import Guards

  @doc """
  Returns the commands to preview the given video(s).
  """
  def preview_cmd(rendered, blur, start_from \\ nil)
      when is_nil(start_from) or valid_timestamp(start_from) do
    ensure_min_version(rendered)

    blurred = if blur, do: blurs(rendered), else: settb(rendered)
    filter = Enum.join(blurred ++ time_lapse_corrects(rendered) ++ xfades(rendered), ";")

    filter =
      if start_from do
        start_from = "#{Video.Timestamp.in_milliseconds(start_from)}ms"
        filter <> "[trim];[trim]trim=start=#{start_from}"
      else
        filter
      end

    ["nice", "-n15", "ffmpeg", "-hide_banner", "-loglevel", "fatal"] ++
      inputs(rendered) ++
      [
        "-filter_complex",
        filter,
        "-pix_fmt",
        "yuv420p",
        "-s",
        "640x480",
        "-c:v",
        "libx264",
        "-preset",
        "ultrafast",
        "-qp",
        "17",
        "-an",
        "-f",
        "matroska",
        "-"
      ]
  end

  @spec adhoc_cmd(Video.Track.plain()) :: [binary()]
  def adhoc_cmd(sources) when is_list(sources) do
    blurs = blurs(sources)
    xfades = xfades(sources, Video.Track.default_fade(), "ad-hoc")
    filter = Enum.join(blurs ++ xfades, ";")

    ["nice", "-n15", "ffmpeg", "-hide_banner", "-loglevel", "fatal"] ++
      inputs(sources) ++
      [
        "-filter_complex",
        filter,
        "-pix_fmt",
        "yuv420p",
        "-c:v",
        "libx264",
        "-preset",
        "ultrafast",
        "-qp",
        "17",
        "-an",
        "adhoc.mp4"
      ]
  end

  @spec render(Video.Generator.t()) :: :ok | {:error, binary} | Util.Cmd2.exec_result()
  def render(rendered) do
    ensure_min_version(rendered)

    target = Video.Path.target(rendered.hash())

    case File.ls(target) do
      {:ok, []} -> render_run(rendered, target)
      {:error, :enoent} -> render_run(rendered, target)
      _ -> {:error, "#{target} already exists, refusing to overwrite"}
    end
  end

  defp ensure_min_version(rendered) do
    if rendered.renderer() < @min_renderer_version,
      do:
        raise(
          "cannot render #{rendered.name()} (#{rendered.hash()}) since it specifies an old renderer version. Need at least version 3."
        )
  end

  @nice_render ["nice", "-n19", "ionice", "-c", "3"]

  defp render_run(rendered, target) do
    pbar = Video.Renderer.Progress.new(rendered)
    cache_dir = Path.join([File.cwd!(), "data", "cache"])
    Temp.track!()

    try do
      with :ok <- File.mkdir_p(cache_dir),
           {:ok, tmp_path} <-
             Temp.mkdir(%{basedir: cache_dir, prefix: "render_#{rendered.hash()}"}),
           tmp_dir <- Path.basename(tmp_path),
           cmd <- render_cmd(rendered, tmp_dir),
           %{result: :ok} <-
             Docker.run("tools/ffmpeg/Dockerfile.ffmpeg", cmd,
               env: [],
               stderr: pbar,
               name: "ffmpeg render"
             ),
           :ok <- manually_tag_missing(tmp_path),
           :ok <- create_fallbacks(tmp_dir),
           :ok <- move(tmp_path, target) do
        :ok
      end
    after
      Temp.cleanup()
    end
  end

  def render_cmd(rendered, tmp_dir) do
    filter = Enum.join(blurs(rendered) ++ xfades(rendered), ";")

    outputs = Enum.map(variants(), fn %{index: idx} -> "[out#{idx}]" end)
    filter = filter <> ",split=#{Enum.count(outputs)}#{Enum.join(outputs)}"

    @nice_render ++
      ["ffmpeg", "-hide_banner"] ++
      inputs(rendered) ++ ["-filter_complex", filter] ++ encoder(tmp_dir)
  end

  defp manually_tag_missing(tmp_dir) do
    m3u8 = Path.join(tmp_dir, "stream.m3u8")

    contents =
      File.read!(m3u8)
      |> String.split("\n")
      |> Enum.reduce({[], variants()}, fn line, {mapped, variants} ->
        cond do
          !String.starts_with?(line, "#EXT-X-STREAM-INF:") ->
            {[line | mapped], variants}

          String.contains?(line, "CODECS=") ->
            {[line | mapped], tl(variants)}

          hd(variants)[:tag_as] ->
            {[line <> ",CODECS=\"#{hd(variants)[:tag_as]}\"" | mapped], tl(variants)}

          true ->
            {[line | mapped], tl(variants)}
        end
      end)
      |> elem(0)
      |> Enum.reverse()
      |> Enum.join("\n")

    File.write!(m3u8, contents)
  end

  defp move(tmp_dir, target) do
    with :ok <- File.mkdir_p(target),
         {:ok, files} <- File.ls(tmp_dir) do
      Enum.map(files, fn file ->
        source = Path.join(tmp_dir, file)
        target = Path.join(target, file)
        move_file(source, target)
      end)
    end
    |> collect_errors()
  end

  defp move_file(source, target) do
    case File.rename(source, target) do
      :ok ->
        :ok

      {:error, :exdev} ->
        with {:ok, _copied} <- File.copy(source, target) do
          File.rm(source)
        end

      {:error, err} ->
        {:error, err}
    end
  end

  defp create_fallbacks(tmp_dir) do
    variants()
    |> Enum.filter(&is_map_key(&1, :fallback))
    |> Enum.map(fn %{index: idx, fallback: fb} ->
      cmd =
        @nice_render ++
          [
            "ffmpeg",
            "-hide_banner",
            "-loglevel",
            "fatal",
            "-i",
            Path.join(tmp_dir, "stream_#{idx}.m4s"),
            "-c:v",
            "copy",
            "-movflags",
            "+faststart",
            Path.join(tmp_dir, "fallback.#{fb}")
          ]

      Docker.run("tools/ffmpeg/Dockerfile.ffmpeg", cmd,
        env: [],
        name: "ffmpeg fallback #{fb}"
      )
    end)
    |> collect_errors()
  end

  defp collect_errors(list) do
    errors =
      Enum.reduce(list, [], fn item, errors ->
        case item do
          :ok -> errors
          %{result: :ok} -> errors
          %{result: {:error, err}} -> ["#{err}" | errors]
          {:error, err} -> ["#{err}" | errors]
        end
      end)

    if errors == [] do
      :ok
    else
      {:error, Enum.join(errors, "\n\n")}
    end
  end

  defp inputs(rendered) when is_module(rendered), do: inputs(rendered.sources())

  defp inputs(sources) when is_list(sources) do
    ["-hwaccel", "auto", "-re"] ++
      Enum.flat_map(sources, fn {path, from, to} ->
        from = if from in [:start, :seamless], do: [], else: ["-ss", from]
        to = if to == :end, do: [], else: ["-to", to]

        from ++ to ++ ["-i", Video.Path.source_rel_to_cwd(path)]
      end)
  end

  # uses the jsonblur frei0r plugin for the input videos (e.g. [0]) and outputs
  # them as blrs (e.g. [blur0]). Additionally it sets the timebase, see settb
  # for details.
  defp blurs(rendered) when is_module(rendered), do: blurs(rendered.sources())

  defp blurs(sources) when is_list(sources) do
    sources
    |> Enum.with_index()
    |> Parallel.map(2, fn {{path, from, _to}, idx} ->
      detections = Video.Path.detections_rel_to_cwd(path)
      from = if from in [:start, :seamless], do: 0, else: Video.Timestamp.in_milliseconds(from)
      blur_frame_skip = blur_frame_skip(path, from)
      "[#{idx}]frei0r=jsonblur:#{detections}|#{blur_frame_skip},settb=AVTB[blur#{idx}]"
    end)
  end

  defp blur_frame_skip(_path, 0), do: 0

  defp blur_frame_skip(path, from) when is_integer(from) do
    from_in_s = from / 1000.0
    meta = metadata(path)
    frame_no = round(meta.fps * from_in_s)
    # The timestamps displayed in the GUIs are usually up to milliseconds, e.g.
    # 00:00:36.904. This is also the variant specified when creating video
    # tracks within the project. Depending on container formats, this timestamp
    # might be stored more accurately, e.g. 00:00:36.903533. The accuracy is
    # given by the time base.
    #
    # This creates an off-by-one when the more accurate value is lower than the
    # variant shown to the user. ffmpeg will not pick the "closest" timestamp,
    # but rather the one that satisfies ">=". Thus if we detect that the
    # presentation timestamp (PTS) in time base accuracy for our calculated
    # frame is less than what we specified originally, we need to pick the next
    # frame to match ffmpeg behaviour.
    frame_pts = round(frame_no / meta.fps / meta.time_base) * meta.time_base
    if frame_pts < from_in_s, do: frame_no + 1, else: frame_no
  end

  # sets the timebase for all input videos (e.g. [0]) and outputs them as blurs
  # (e.g. [blur0]). This is sometimes required or ffmpeg will fail with
  # "different timebase".
  defp settb(rendered) do
    rendered.sources()
    |> Enum.with_index()
    |> Enum.map(fn {{_path, _from, _to}, idx} ->
      "[#{idx}]settb=AVTB[blur#{idx}]"
    end)
  end

  defp time_lapse_corrects(rendered) do
    fps = Video.Constants.output_fps()

    rendered.sources()
    |> Enum.with_index()
    |> Parallel.map(2, fn {{path, _from, _to}, idx} ->
      meta = metadata(path)

      if meta.pts_correction != 1 do
        "[blur#{idx}]setpts=#{meta.pts_correction}*PTS,fps=#{fps},settb=AVTB[blur#{idx}]"
      end
    end)
    |> Util.compact()
  end

  # xfades reads the blurred videos (e.g. [blur0]) and cross fades or contacts
  # ("seamless") them as needed. It outputs a single, unnamed video at the end
  # of the filter graph.

  defp xfades(rendered),
    do: xfades(rendered.sources(), Video.Track.fade(rendered.renderer()), rendered.hash())

  defp xfades(sources, fade, hash) do
    count = length(sources)

    if count == 1 do
      ["[blur0]copy"]
    else
      sources
      |> Enum.with_index()
      |> Parallel.map(2, fn {{path, from, to}, idx} ->
        meta = metadata(path)

        start_in_s = if from in [:start, :seamless], do: 0, else: Video.Timestamp.in_seconds(from)
        to_in_s = if to == :end, do: meta.duration, else: Video.Timestamp.in_seconds(to)
        segment_fade = if from == :seamless, do: 0, else: fade
        segment_duration = Float.round((to_in_s - start_in_s) * meta.pts_correction, 3)

        if segment_fade >= segment_duration,
          do:
            raise(
              "hash=#{hash} segment=#{idx} is #{segment_duration}s long, but segment fade is #{segment_fade}s. Reduce the fade duration or change the segment."
            )

        {segment_duration, idx, segment_fade}
      end)
      |> Enum.reduce({0, []}, fn
        {dur, idx, segment_fade}, {total, filter_graph} ->
          new_duration = total + dur - segment_fade

          prev = if idx == 1, do: "[blur0]", else: "[fade#{idx - 1}]"
          next = "[blur#{idx}]"

          xfade =
            cond do
              idx == 0 -> nil
              segment_fade == 0 -> "#{prev}#{next}concat=n=2:v=1:a=0"
              true -> "#{prev}#{next}xfade=transition=fade:duration=#{fade}:offset=#{total}"
            end

          xfade =
            cond do
              xfade == nil -> nil
              idx == count - 1 -> xfade
              true -> "#{xfade}[fade#{idx}]"
            end

          filter_graph = if xfade, do: [xfade | filter_graph], else: filter_graph
          {new_duration, filter_graph}
      end)
      |> elem(1)
      |> Enum.reverse()
    end
  end

  # defp duration_in_s(path), do: metadata(path).duration

  defp metadata(path) do
    path
    |> Video.Path.source()
    |> Video.Metadata.for()
    |> case do
      {:ok, meta} -> meta
      {:error, error} -> raise(error)
    end
  end

  # length of a single segment in seconds. Quality usually switches between
  # segments. https://ffmpeg.org/ffmpeg-formats.html#hls-2
  defp hls_time, do: 4

  # GOP=group of pictures, essentially when to insert a keyframe. The script
  # sets the max for this, i.e. there will be a keyframe at most every GOP_SIZE.
  # Ideally HLS_TIME * FPS = GOP_SIZE. https://video.stackexchange.com/a/24684
  defp gop_size, do: round(hls_time() * Video.Constants.output_fps())

  # The average bitrate is given in the variants above. This defined
  # how much the maximum bitrate may deviate from that (as a ratio)
  defp max_bitrate(input), do: 1.3 * input
  # The sliding window in which the codec can distribute its bits,
  # as a ratio of the bitrate, see
  # https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate
  defp buf_size(input), do: 4.0 * input

  # codec tag specification:
  # https://developer.mozilla.org/en-US/docs/Web/Media/Formats/codecs_parameter

  # codec tag specification:
  # https://developer.mozilla.org/en-US/docs/Web/Media/Formats/codecs_parameter#av1
  # find seq_tier and seq_level_idx through:
  # ffmpeg -i <file> -c:v copy -bsf:v trace_headers -f null /dev/null 2>&1 | grep seq_ | head -n5

  @av1_ll_param_examples [
    %{width: 426, height: 240, tiles: 8, fps: 30, level: 2.0, seq_level_idx: 0},
    %{width: 640, height: 360, tiles: 8, fps: 30, level: 2.1, seq_level_idx: 1},
    %{width: 854, height: 480, tiles: 16, fps: 30, level: 3.0, seq_level_idx: 4},
    %{width: 1280, height: 720, tiles: 16, fps: 30, level: 3.1, seq_level_idx: 5},
    %{width: 1920, height: 1080, tiles: 32, fps: 30, level: 4.0, seq_level_idx: 8},
    %{width: 1920, height: 1080, tiles: 32, fps: 60, level: 4.1, seq_level_idx: 9},
    %{width: 3840, height: 2160, tiles: 64, fps: 30, level: 5.0, seq_level_idx: 12},
    %{width: 3840, height: 2160, tiles: 64, fps: 60, level: 5.1, seq_level_idx: 13},
    %{width: 3840, height: 2160, tiles: 64, fps: 120, level: 5.2, seq_level_idx: 14},
    %{width: 3840, height: 2160, tiles: 64, fps: 120, level: 5.3, seq_level_idx: 15},
    %{width: 7680, height: 4320, tiles: 128, fps: 30, level: 6.0, seq_level_idx: 16},
    %{width: 7680, height: 4320, tiles: 128, fps: 60, level: 6.1, seq_level_idx: 17},
    %{width: 7680, height: 4320, tiles: 128, fps: 120, level: 6.2, seq_level_idx: 18},
    %{width: 7680, height: 4320, tiles: 128, fps: 120, level: 6.3, seq_level_idx: 19}
  ]
  # Firefox doesn't support "31" for "maximum parameters". Instead pick the
  # highest specified at the time of writing as a fallback.
  @av1_ll_max_specified 23

  @spec av1_codec_tag(map(), non_neg_integer(), non_neg_integer()) :: binary()
  defp av1_codec_tag(info, tiles, bit_depth) when bit_depth in [8, 10, 12] do
    ll =
      Enum.find_value(@av1_ll_param_examples, @av1_ll_max_specified, fn ex ->
        dim_ok = info[:width] <= ex.width && info[:height] <= ex.height

        if dim_ok && tiles <= ex.tiles && Video.Constants.output_fps() <= ex.fps,
          do: ex.seq_level_idx
      end)
      |> to_string()
      |> String.pad_leading(2, "0")

    bit_depth = bit_depth |> to_string |> String.pad_leading(2, "0")

    "av01.0.#{ll}M.#{bit_depth}"
  end

  # @spec codec_av1_aom(map(), non_neg_integer()) :: map()
  # defp codec_av1_aom(info, idx) do
  #   tiles_c = Integer.floor_div(info[:height], 1000)
  #   tiles_r = max(1, tiles_c - 1)
  #   tiles = 2 ** tiles_c * 2 ** tiles_r

  #   %{
  #     codec: [
  #       "libaom-av1",
  #       "-tile-columns:#{idx}",
  #       "#{tiles_c}",
  #       "-tile-rows:#{idx}",
  #       "#{tiles_r}",
  #       "-cpu-used:#{idx}",
  #       "4",
  #       "-lag-in-frames:#{idx}",
  #       "48",
  #       "-aom-params:#{idx}",
  #       "enable-qm=1:sb-size=64:enable-keyframe-filtering=0:arnr-strength=1:aq-mode=1:deltaq-mode=1:sharpness=1:enable-chroma-deltaq=1:quant-b-adapt=1"
  #     ],
  #     tag_as: av1_codec_tag(info, tiles, 8)
  #   }
  # end

  @spec codec_av1_rav1e(map(), non_neg_integer()) :: map()
  defp codec_av1_rav1e(info, idx) do
    tiles = Integer.floor_div(info[:height], 135)

    %{
      codec: [
        "librav1e",
        "-tiles:v:#{idx}",
        "#{tiles}",
        "-speed:v:#{idx}",
        "3"
      ],
      tag_as: av1_codec_tag(info, tiles, 8)
    }
  end

  # @spec codec_av1_svt(map(), non_neg_integer()) :: map()
  # defp codec_av1_svt(info, idx) do
  #   tiles_c = Integer.floor_div(info[:height], 1000)
  #   tiles_r = max(1, tiles_c - 1)
  #   tiles = 2 ** tiles_c * 2 ** tiles_r

  #   %{
  #     codec: [
  #       "libsvtav1",
  #       "-preset:#{idx}",
  #       "4",
  #       "-svtav1-params:#{idx}",
  #       "tune=0:enable-overlays=1:scd=1:scm=0:irefresh-type=1:tile-columns=#{tiles_c}:tile-rows=#{tiles_r}:enable-tf=0:film-grain=4"
  #     ],
  #     tag_as: av1_codec_tag(info, tiles, 8)
  #   }
  # end

  # ffmpeg itself manages avc tags
  @spec codec_avc(map(), non_neg_integer()) :: map()
  defp codec_avc(_info, idx),
    do: %{codec: ["libx264", "-preset:v:#{idx}", "veryslow", "-refs:v:#{idx}", "5"]}

  # hevc tag: ISO/IEC 14496-15 (€). If ffmpeg is modern enough, it will create
  # the tag. The one given here is a fallback.
  #
  # For some reason ffmpeg creates files that are not actually playable on the
  # only devices which support hevc (iOS). This is true even for old encodes, so
  # potentially something in iOS itself changed. Ran out of the debugging
  # timebox for this one.
  # defp codec_hevc(info, idx) do
  #   specific =
  #     if Video.Metadata.can_use?("hevc_nvenc"),
  #       do:
  #         ["hevc_nvenc", "-preset", "slow", "-tier:v:#{idx}", "high", "-level:v:#{idx}", "6.2", "-nonref_p", "1", "-spatial_aq", "1", "hvc1", "-refs:v:#{idx}", "0"],
  #       else: ["libx265", "-x265-params", "log-level=error"]
  #
  #   %{codec: specific ++ ["-tag:v:#{idx}", "hvc1"], tag_as: "hvc1.1.4.L186.B01"}
  # end

  defp variants do
    [
      # av1, with default quality as first entry
      %{width: 1280, height: 720, bitrate: 4.5, codec: &codec_av1_rav1e/2},
      %{width: 640, height: 360, bitrate: 3, codec: &codec_av1_rav1e/2},
      %{width: 1920, height: 1080, bitrate: 9, codec: &codec_av1_rav1e/2},
      # legacy codec
      %{width: 640, height: 360, bitrate: 4, fallback: :mp4, codec: &codec_avc/2},
      %{width: 1280, height: 720, bitrate: 6, codec: &codec_avc/2}
    ]
    |> Enum.with_index()
    |> Enum.map(fn {info, idx} ->
      info
      |> Map.put(:index, idx)
      |> Map.merge(info[:codec].(info, idx))
    end)
  end

  def variant_flags() do
    # OpenCL can run out of memory on the GPU for some averse inputs it seems.
    opencl =
      if System.get_env("DISABLE_OPENCL", "0") == "1" do
        ~w[-x264-params threads=4]
      else
        IO.puts(
          :stderr,
          "\nOpenCL is enabled. If you run out of GPU memory, set DISABLE_OPENCL=1"
        )

        ~w[-x264-params opencl=true]
      end

    Enum.flat_map(variants(), fn %{width: w, height: h, bitrate: rate, index: idx, codec: codec} ->
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
    end) ++ opencl
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
      ["-g", gop_size(), "-hls_time", hls_time()] ++
      variant_flags() ++ ["-var_stream_map", stream_map, "#{tmp_dir}/stream_%v.m3u8"]
  end
end
