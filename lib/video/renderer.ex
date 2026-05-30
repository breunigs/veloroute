defmodule Video.Renderer do
  @min_renderer_version 5

  import Guards

  @spec ffmpeg_image() :: Util.Docker.image_ref()
  def ffmpeg_image(), do: {:dockerfile, "tools/ffmpeg/Dockerfile.ffmpeg"}

  @doc """
  Returns the commands to preview the given video(s).
  """
  def preview_cmd(rendered, blur, dewarp, burn_filenames, start_from \\ nil)
      when is_nil(start_from) or valid_timestamp(start_from) do
    ensure_min_version(rendered)
    sources = Video.Track.normalize_video_tuples(rendered.sources())

    prefix = "scale=640:-1,"
    blurred = if blur, do: blurs(sources, prefix), else: settb(sources, prefix)
    dewarped = if dewarp, do: dewarp(sources), else: []
    burned = if burn_filenames, do: burn_in_filename(sources), else: []
    time_lapsed = time_lapse_corrects(sources)
    cross_fades = xfades(sources, rendered)
    filter = Enum.join(blurred ++ dewarped ++ burned ++ time_lapsed ++ cross_fades, ";")

    filter =
      if start_from do
        start_from = "#{Video.Timestamp.in_milliseconds(start_from)}ms"
        filter <> "[trim];[trim]trim=start=#{start_from},setpts=PTS-STARTPTS"
      else
        filter
      end

    rife_fps_fix = if rife?(rendered), do: ["-r", Video.Constants.output_fps_s()], else: []

    [
      Util.low_priority_cmd_prefix(15),
      "ffmpeg",
      "-hide_banner",
      ["-loglevel", "error"],
      inputs(sources),
      ["-filter_complex", filter],
      ["-pix_fmt", "yuv420p"],
      ["-c:v", "libx264"],
      ["-preset", "ultrafast"],
      ["-qp", "17"],
      ["-tune", "zerolatency"],
      "-an",
      rife_fps_fix,
      ["-f", "matroska"],
      "-"
    ]
    |> List.flatten()
  end

  @spec join_preview_cmds(
          [
            {video1 :: binary(), video2 :: binary(), video1_stop :: non_neg_integer(),
             video2_start :: non_neg_integer()}
          ],
          join_surround_seconds :: float(),
          fade_duration_seconds :: float(),
          temp_dir :: binary(),
          blur :: boolean()
        ) ::
          {preview_video_fifo :: binary(), [temporary_fifos :: binary()],
           [commands_to_run_in_parallel :: binary()]}
  def join_preview_cmds(timestamps, surround_seconds, fade_duration, dir, blur) do
    {width, height, stack_filter} = stacker(length(timestamps))

    ffmpeg = Util.low_priority_cmd_prefix() ++ ["ffmpeg", "-hide_banner", "-loglevel", "warning"]

    {outs, cmds} =
      timestamps
      |> Enum.with_index()
      |> Enum.map(fn {{v1, v2, stop1, start2}, idx} ->
        start1 = max(0, stop1 - round(surround_seconds * 1000))
        stop2 = start2 + round(surround_seconds * 1000)

        videos = [
          {v1, Video.Timestamp.from_milliseconds(start1),
           Video.Timestamp.from_milliseconds(stop1)},
          {v2, Video.Timestamp.from_milliseconds(start2),
           Video.Timestamp.from_milliseconds(stop2)}
        ]

        sources = Video.Track.normalize_video_tuples(videos)

        prefix = "scale=#{width}:#{height},"
        scaled = if blur, do: blurs(sources, prefix), else: settb(sources, prefix)
        tlc = time_lapse_corrects(sources)
        xfades = xfades(sources, fade_duration, "join-preview")

        # draw number after RIFE to avoid artifacts
        style = "fontcolor=white:fontsize=128:x=10:y=10:shadowx=3:shadowy=3"
        ident = ",drawtext=#{style}:text='#{idx + 1}'"
        xfades_with_ident = List.update_at(xfades, -1, &(&1 <> ident))

        filter = Enum.join(scaled ++ tlc ++ xfades_with_ident, ";")

        ident = videos |> inspect() |> String.replace(~r/[^a-z0-9:.-]+/, "_")
        out = Path.join(dir, ident)

        cmd =
          List.flatten([
            ffmpeg,
            inputs(sources),
            ["-filter_complex", filter],
            ["-r", Video.Constants.output_fps_s()],
            "-y",
            ["-pix_fmt", "yuv420p"],
            ["-f", "yuv4mpegpipe"],
            ["-vcodec", "rawvideo"],
            out
          ])

        {out, cmd}
      end)
      |> Enum.unzip()

    out = Path.join(dir, "preview.mkv")

    stacker =
      List.flatten([
        ffmpeg,
        Enum.flat_map(outs, &["-i", &1]),
        if(stack_filter, do: ["-filter_complex", stack_filter], else: []),
        ["-pix_fmt", "yuv420p"],
        ["-c:v", "libx264"],
        ["-preset", "ultrafast"],
        ["-qp", "17"],
        ["-tune", "zerolatency"],
        ["-f", "matroska"],
        "-an",
        "-y",
        out
      ])

    {out, outs, [stacker | cmds]}
  end

  defp stacker(1), do: {1920, 1080, nil}
  defp stacker(2), do: {960, 540, "xstack=inputs=2:layout=0_0|w0_0"}
  # 2x2 grid
  defp stacker(3), do: {960, 540, "xstack=inputs=3:layout=0_0|w0_0|0_h0"}
  defp stacker(4), do: {960, 540, "xstack=inputs=4:layout=0_0|w0_0|0_h0|w0_h0"}
  # 3x2 grid
  defp stacker(5), do: {960, 540, "xstack=inputs=5:layout=0_0|w0_0|w0+w1_0|0_h0|w0_h0"}
  defp stacker(6), do: {960, 540, "xstack=inputs=6:layout=0_0|w0_0|w0+w1_0|0_h0|w0_h0|w0+w1_h0"}
  # 3x3 grid
  @row0_w3 "0_0|w0_0|w0+w1_0"
  @row1_w3 "0_h0|w0_h0|w0+w1_h0"
  @row2_w3 "0_h0+h1|w0_h0+h1|w0+w1_h0+h1"
  @row01_w3 "#{@row0_w3}|#{@row1_w3}"
  defp stacker(7), do: {640, 360, "xstack=inputs=7:layout=#{@row01_w3}|0_h0+h1"}
  defp stacker(8), do: {640, 360, "xstack=inputs=8:layout=#{@row01_w3}|0_h0+h1|w0_h0+h1"}
  defp stacker(9), do: {640, 360, "xstack=inputs=9:layout=#{@row01_w3}|#{@row2_w3}"}

  @spec adhoc_cmd(Video.Track.plain()) :: [binary()]
  def adhoc_cmd(sources) when is_list(sources) do
    sources = Video.Track.normalize_video_tuples(sources)
    blurs = blurs(sources, "scale=1920:1080,")
    dewarped = dewarp(sources)
    tlc = time_lapse_corrects(sources)
    xfades = xfades(sources, Video.Track.default_fade(), "ad-hoc")
    filter = Enum.join(blurs ++ dewarped ++ tlc ++ xfades, ";")

    Util.low_priority_cmd_prefix() ++
      ["ffmpeg", "-hide_banner", "-loglevel", "error"] ++
      inputs(sources) ++
      [
        "-filter_complex",
        filter,
        "-pix_fmt",
        "yuv420p",
        "-c:v",
        "libx264",
        "-preset",
        "medium",
        "-qp",
        "17",
        "-an",
        "-r",
        Video.Constants.output_fps_s(),
        "adhoc.mp4"
      ]
  end

  @spec render(Video.Rendered.t()) :: :ok | {:error, binary} | Util.Cmd2.exec_result()
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
          "cannot render #{rendered.name()} (#{rendered.hash()}) since it specifies an old renderer version. Need at least version #{@min_renderer_version}."
        )
  end

  defp render_run(rendered, target) do
    cache_dir = Path.join([File.cwd!(), "data", "cache"])
    Temp.track!()

    try do
      with :ok <- File.mkdir_p(cache_dir),
           {:ok, tmp_path} <-
             Temp.mkdir(%{basedir: cache_dir, prefix: "render_#{rendered.hash()}"}),
           tmp_dir <- Path.basename(tmp_path),
           {pass1, pass2} <- render_cmd(rendered, tmp_dir),
           pbar1 = Video.Renderer.Progress.new(rendered, "rendering pass 1"),
           :ok <- run_ffmpeg("#{rendered.hash()} rendering pass 1", pass1, pbar1),
           pbar2 = Video.Renderer.Progress.new(rendered, "rendering pass 2"),
           :ok <- run_ffmpeg("#{rendered.hash()} rendering pass 2", pass2, pbar2),
           :ok <- render_thumbnails(rendered, tmp_dir),
           :ok <- manually_tag_missing(tmp_path),
           :ok <- append_thumb_pragmas(tmp_path) do
        move(tmp_path, target)
      end
    after
      Temp.cleanup()
    end
  end

  defp run_ffmpeg(label, cmd, pbar) do
    Util.Docker.build_and_run(
      {label, ffmpeg_image()},
      %{command_args: cmd, mount_videos_in_dir: "/workdir/"},
      env: [],
      stderr: pbar,
      slow_warn_message: false
    )
  end

  def variant_thumbs() do
    [
      %{fps: 3, crop_ratio: 0.86, width: 160, height: 90, crf: 30, tag_as: "avc1.64100A"}
    ]
    |> Enum.with_index()
    |> Enum.map(fn {info, idx} -> Map.put(info, :index, idx) end)
  end

  defp thumbnail_source_stream(tmp_dir) do
    %{index: idx} = Enum.find(variants(), & &1[:thumbnail_source])
    "#{tmp_dir}/stream_#{idx}.m3u8"
  end

  defp render_thumbnails(rendered, tmp_dir) do
    Enum.reduce_while(variant_thumbs(), :ok, fn thumb, :ok ->
      label = "rendering thumbs"
      pbar = Video.Renderer.Progress.new(rendered, label, thumb.fps)

      case run_ffmpeg(label, thumbnail_cmd(tmp_dir, thumb), pbar) do
        :ok -> {:cont, :ok}
        err -> {:halt, err}
      end
    end)
  end

  defp thumbnail_cmd(tmp_dir, thumb) do
    thumbnail_cmd(thumbnail_source_stream(tmp_dir), tmp_dir, thumb)
  end

  def thumbnail_cmd(source, out_dir, %{
        fps: fps,
        crop_ratio: crop_ratio,
        width: w,
        height: h,
        crf: crf,
        index: idx
      }) do
    crop = "crop=in_w*#{crop_ratio}:in_h*#{crop_ratio}"

    List.flatten([
      Util.low_priority_cmd_prefix(),
      ["ffmpeg", "-hide_banner"],
      ["-i", source],
      ["-vf", "fps=#{fps},#{crop},scale=#{w}:#{h}"],
      ["-fps_mode", "vfr"],
      ["-c:v", "libx264"],
      ["-x264-params", "keyint=1:min-keyint=1:scenecut=0"],
      ["-movflags", "+faststart+frag_keyframe+separate_moof+omit_tfhd_offset+empty_moov"],
      "-an",
      ["-preset", "veryslow"],
      ["-crf", "#{crf}"],
      ["-f", "hls"],
      ["-hls_time", 1 / fps],
      ["-hls_segment_type", "fmp4"],
      ["-hls_playlist_type", "vod"],
      ["-hls_flags", "iframes_only+single_file+independent_segments"],
      "#{out_dir}/thumb_#{idx}.m3u8"
    ])
  end

  def append_thumb_pragmas(target_path) do
    m3u8 = Path.join(target_path, "stream.m3u8")

    pragmas =
      Enum.map(variant_thumbs(), fn %{index: idx, width: w, height: h, tag_as: tag} ->
        media = Path.join(target_path, "thumb_#{idx}.m3u8")
        {:ok, tokens} = M3U8.Tokenizer.read_file(media)
        peak_bandwidth = M3U8.Utils.peak_bandwidth_bps(tokens)

        "#EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=#{peak_bandwidth},RESOLUTION=#{w}x#{h},CODECS=\"#{tag}\",URI=\"thumb_#{idx}.m3u8\""
      end)

    File.write!(m3u8, Enum.join(pragmas, "\n") <> "\n", [:append])
  end

  def render_cmd(rendered, tmp_dir) do
    sources = Video.Track.normalize_video_tuples(rendered.sources())
    blurs = blurs(sources, nil)
    dewarped = dewarp(sources)
    tlc = time_lapse_corrects(sources)
    xfades = xfades(sources, rendered)
    filter = Enum.join(blurs ++ dewarped ++ tlc ++ xfades, ";")

    outputs = Enum.map(variants(), fn %{index: idx} -> "[out#{idx}]" end)
    filter = filter <> ",split=#{Enum.count(outputs)}#{Enum.join(outputs)}"

    fix_pts = if rife?(rendered), do: ["-r", Video.Constants.output_fps_s()], else: []

    cmd =
      [
        Util.low_priority_cmd_prefix(),
        ["ffmpeg", "-hide_banner"],
        ["-err_detect", "explode"],
        inputs(sources),
        ["-filter_complex", filter],
        ["-g", gop_size()],
        fix_pts,
        ["-color_primaries", "bt709"],
        ["-color_trc", "bt709"],
        ["-colorspace", "bt709"],
        "-an",
        ["-sc_threshold", "0"],
        ["-pix_fmt", "yuv420p"]
      ]

    pass1 = List.flatten([cmd, "-pass", "1", variant_flags(tmp_dir), output_none()])
    pass2 = List.flatten([cmd, "-pass", "2", variant_flags(tmp_dir), output_hls(tmp_dir)])

    {pass1, pass2}
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
      files
      |> Enum.reject(&String.ends_with?(&1, [".log", ".log.mbtree"]))
      |> Enum.map(fn file ->
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

  defp inputs(sources) when is_list(sources) do
    ["-hwaccel", "auto", "-re"] ++
      Enum.flat_map(sources, fn {path, from, to, _opts} ->
        from = if from in [:start, :seamless], do: [], else: ["-ss", from]
        to = if to == :end, do: [], else: ["-to", to]

        from ++ to ++ ["-i", Video.Path.source_rel_to_cwd(path)]
      end)
  end

  # uses the jsonblur frei0r plugin for the input videos (e.g. [0]) and outputs
  # them as blurs (e.g. [blur0]). Additionally it sets the timebase, see settb
  # for details.
  defp blurs(sources, prefix) when is_list(sources) do
    sources
    |> Enum.with_index()
    |> Parallel.map(2, fn {{path, from, _to, opts}, idx} ->
      detections = Video.Path.detections_rel_to_cwd(path)
      from = if from in [:start, :seamless], do: 0, else: Video.Timestamp.in_milliseconds(from)
      blur_frame_skip = blur_frame_skip(path, from)

      "[#{idx}]frei0r=jsonblur:#{detections}|#{blur_frame_skip},#{prefix}#{vf(opts)}settb=AVTB,setsar=1:1[blur#{idx}]"
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
  defp settb(sources, prefix) when is_list(sources) do
    sources
    |> Enum.with_index()
    |> Enum.map(fn {{_path, _from, _to, opts}, idx} ->
      "[#{idx}]#{prefix}#{vf(opts)}settb=AVTB,setsar=1:1[blur#{idx}]"
    end)
  end

  defp burn_in_filename(sources) do
    sources
    |> Enum.with_index()
    |> Enum.map(fn {{path, _from, _to, _opts}, idx} ->
      text = String.replace(path, ~r{[^A-Za-z0-9_./-]}, "")

      "[blur#{idx}]drawtext=fontcolor=white:x=5:y=5:shadowx=1:shadowy=1:text='#{text}'[blur#{idx}]"
    end)
  end

  defp dewarp(sources) do
    filters = Settings.r(:dewarp_filters)

    if filters && filters != [] do
      filters = Enum.join(filters, ",")
      max_idx = length(sources) - 1

      for idx <- 0..max_idx do
        "[blur#{idx}]#{filters}[blur#{idx}]"
      end
    else
      []
    end
  end

  defp vf(opts) when is_list(opts) do
    vf = Keyword.get(opts, :vf)
    if vf, do: vf <> ","
  end

  defp vf({_path, _from, _to}), do: nil

  defp time_lapse_corrects(sources) when is_list(sources) do
    fps = Video.Constants.output_fps()

    sources
    |> Enum.with_index()
    |> Parallel.map(4, fn {{path, _from, _to, _opts}, idx} ->
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
  @spec xfades(Video.Track.plain(), module()) :: [binary()]
  defp xfades(sources, _rendered) when length(sources) == 1 do
    ["[blur0]copy"]
  end

  defp xfades(sources, rendered) when is_list(sources) and is_module(rendered) do
    fade = Video.Track.fade(rendered.renderer())

    if rife?(rendered),
      do: rife(sources, fade, rendered.hash()),
      else: crossfade(sources, fade, rendered.hash())
  end

  @spec xfades(Video.Track.plain(), float(), binary()) :: [binary()]
  defp xfades(sources, fade, hash) do
    if length(sources) == 1, do: ["[blur0]copy"], else: rife(sources, fade, hash)
  end

  defp rife?(rendered), do: rendered.renderer() >= 6

  @spec crossfade(Video.Track.plain(), float(), binary()) :: [binary()]
  defp crossfade(sources, fade, hash) when length(sources) >= 2 do
    count = length(sources)

    sources
    |> with_durations(fade, hash)
    |> Enum.reduce({0, []}, fn
      %{duration: dur, index: idx, fade_prev: fprev, fade_next: fnext}, {total, filter_graph} ->
        new_duration = total + dur - fnext

        prev = if idx == 1, do: "[blur0]", else: "[fade#{idx - 1}]"
        next = "[blur#{idx}]"

        xfade =
          cond do
            idx == 0 -> nil
            fprev == 0 -> "#{prev}#{next}concat=n=2:v=1:a=0"
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

  @spec rife(Video.Track.plain(), float(), binary()) :: [binary()]
  defp rife(sources, fade, hash) when length(sources) >= 2 do
    # using these filters introduces subtle PTS rounding errors, which might
    # result in semi-duplicated frames in RIFE, where video1 is updated at
    # 166.833ms and video2 at 166.834ms, resulting in two output frames when we
    # want just one. So we reset PTS often to work around these rounding errors.
    fix_pts = "setpts=N/(#{Video.Constants.output_fps_s()})/TB"

    {filters, concats} =
      sources
      |> with_durations(fade, hash)
      |> Enum.map(fn %{index: idx} = video ->
        # inputs
        inp = "[blur#{idx}]"
        pprev = "[rife#{idx - 1}next]"

        # outputs / temp
        prev = "[rife#{idx}prev]"
        main = "[rife#{idx}main]"
        next = "[rife#{idx}next]"
        join = "[join#{idx - 1}_#{idx}]"

        # Timestamps are absolute to start of video.
        #
        # ts_prev needs to be extended by 1 frame because of how the segment
        # filter works. Essentially, it puts the frame at the timestamp into the
        # latter segment. Since we merge the last segment of the previous video
        # (i.e. has extra frame) with the first segment of the next video (i.e.
        # no extra frame), we'd end up with a 1 frame difference without this.
        ts_prev = if video.fade_prev > 0, do: video.fade_prev + video.frame_s
        ts_next = if video.fade_next > 0, do: video.duration - video.fade_next

        # We want the older crossfade and the newer RIFE to match frames
        # perfectly. Otherwise code elsewhere would need to handle the drift of
        # video and GPS data.
        extra_fade = if ts_prev && !video.prev_at_end, do: video.frame_s, else: 0.0
        ts_prev = if extra_fade > 0, do: ts_prev + video.frame_s, else: ts_prev
        # prepare for next segment
        ts_next = if ts_next && !video.at_end, do: ts_next - video.frame_s, else: ts_next

        # split stream into 2 or 3 segments with meaningful names
        f_split =
          case {ts_prev, ts_next} do
            {nil, nil} -> nil
            {tsp, nil} -> "#{inp}segment=timestamps=#{tsp}#{prev}#{main}"
            {nil, tsn} -> "#{inp}segment=timestamps=#{tsn}#{main}#{next}"
            {tsp, tsn} -> "#{inp}segment=timestamps=#{tsp}|#{tsn}#{prev}#{main}#{next}"
          end

        # reset PTS for all streams that were created
        f_resets = [
          if(ts_prev, do: "#{prev}#{fix_pts}#{prev}"),
          if(f_split, do: "#{main}#{fix_pts}#{main}"),
          if(ts_next, do: "#{next}#{fix_pts}#{next}")
        ]

        # transition if needed. Duration is optimized to avoid ratio=0.0 or
        # ratio>=1.0 frames.
        fade_dur = fade + extra_fade + video.frame_s / 2.0
        # needs GPU, as CPU path in NCNN/RIFE is broken
        frei0r = "frei0r=filter_name=rife_transition:filter_params=#{fade_dur}||0"
        # frei0r = frei0r <> "||0|1" # debug
        f_trans = if ts_prev, do: "#{pprev}#{prev}#{frei0r}#{join}"

        # put everything together, only taking streams that actually exist
        filters = [f_split, f_resets, f_trans]
        concats = [if(f_trans, do: join), if(f_split, do: main, else: inp)]
        {filters, concats}
      end)
      |> Enum.unzip()

    filters = filters |> List.flatten() |> Util.compact()
    concats = concats |> List.flatten() |> Util.compact()

    filters ++ ["#{Enum.join(concats)}concat=n=#{length(concats)},#{fix_pts}"]
  end

  @spec with_durations(Video.Track.plain(), float(), binary()) :: [
          %{
            path: binary(),
            from: float(),
            to: float(),
            at_end: boolean(),
            duration: float(),
            fade_prev: float(),
            index: non_neg_integer(),
            frame_s: float(),
            fade_next: float(),
            prev_at_end: boolean()
          }
        ]
  defp with_durations(sources, fade, hash) when is_list(sources) do
    sources
    |> Enum.with_index()
    |> Parallel.map(&with_duration_single(&1, fade, hash))
    |> List.insert_at(0, nil)
    |> Enum.chunk_every(3, 1)
    |> Enum.map(fn
      [nil, cur, next] -> %{cur | fade_next: next.fade_prev, prev_at_end: false}
      [prev, cur, next] -> %{cur | fade_next: next.fade_prev, prev_at_end: prev.at_end}
      [prev, cur] -> %{cur | fade_next: 0, prev_at_end: prev.at_end}
    end)
  end

  defp with_duration_single({{path, from, to, _opts}, idx}, fade, hash) do
    meta = metadata(path)

    start_in_s = if from in [:start, :seamless], do: 0, else: Video.Timestamp.in_seconds(from)
    to_in_s = if to == :end, do: meta.duration, else: Video.Timestamp.in_seconds(to)
    segment_fade = if from == :seamless || idx == 0, do: 0, else: fade
    segment_duration = Float.round((to_in_s - start_in_s) * meta.pts_correction, 3)

    if segment_fade >= segment_duration,
      do:
        raise(
          "hash=#{hash} #{path} #{from}→#{to} is #{Float.round(segment_duration, 3)}s long, but segment fade is #{segment_fade}s. Reduce the fade duration or change the segment."
        )

    %{
      path: path,
      from: from,
      to: to,
      at_end: to == :end,
      duration: segment_duration,
      fade_prev: segment_fade,
      index: idx,
      frame_s: Video.Metadata.frame_duration_s(meta),

      # need to be set later
      fade_next: :not_set,
      prev_at_end: :not_set
    }
  end

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
  defp hls_time, do: 1

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

  @spec codec_av1_svt(map(), non_neg_integer()) :: map()
  defp codec_av1_svt(info, idx) do
    {tiles, cols, rows} =
      if info[:height] >= 1080,
        do: {2, 0, 1},
        else: {1, 0, 0}

    params =
      %{
        tune: 0,
        "enable-dlf": 2,
        scm: 0,
        "tile-columns": cols,
        "tile-rows": rows,
        "enable-variance-boost": 1,
        "variance-boost-strength": 4,
        "ac-bias": 1.0,
        # VBR
        rc: 1,
        tbr: "#{info[:bitrate]}m",
        # max bit rate is only supported on CRF
        mbr: "0",
        "maxsection-pct": 120,
        "undershoot-pct": 20,
        "overshoot-pct": 5,
        # not supported multipass
        # "enable-overlays": 1,
        "enable-tf": 0,
        "enable-qm": 1,
        "qm-min": 1,
        "qp-scale-compress-strength": 1,
        sharpness: 1
      }
      |> Enum.map_join(":", fn {k, v} -> "#{k}=#{v}" end)

    %{
      codec: [
        "libsvtav1",
        "-preset:#{idx}",
        "1",
        "-svtav1-params:#{idx}",
        params
      ],
      tag_as: av1_codec_tag(info, tiles, 8)
    }
  end

  # ffmpeg itself manages avc tags
  @spec codec_avc(map(), non_neg_integer()) :: map()
  defp codec_avc(_info, idx),
    do: %{codec: ["libx264", "-preset:v:#{idx}", "veryslow", "-x264-params:#{idx}", "threads=4"]}

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

  defp variants() do
    [
      # av1, with default quality as first entry
      %{width: 1280, height: 720, bitrate: 4.5, codec: &codec_av1_svt/2},
      %{width: 640, height: 360, bitrate: 3, codec: &codec_av1_svt/2},
      %{width: 1920, height: 1080, bitrate: 9, codec: &codec_av1_svt/2, thumbnail_source: true},
      # legacy codec
      %{width: 640, height: 360, bitrate: 4, codec: &codec_avc/2},
      %{width: 1280, height: 720, bitrate: 6, codec: &codec_avc/2}
    ]
    |> Enum.with_index()
    |> Enum.map(fn {info, idx} ->
      info
      |> Map.put(:index, idx)
      |> Map.merge(info[:codec].(info, idx))
    end)
  end

  def variant_flags(tmp_dir) do
    variants()
    |> Enum.flat_map(fn %{width: w, height: h, bitrate: rate, index: idx, codec: codec} ->
      [
        ["-c:v:#{idx}", codec],
        ["-flags", "+cgop"],
        ["-map", "[out#{idx}]"],
        ["-s:#{idx}", "#{w}x#{h}"],
        ["-metadata:s:v:#{idx}", "title=\"#{h}p\""],
        ["-b:v:#{idx}", "#{rate}M"],
        ["-maxrate:#{idx}", "#{max_bitrate(rate)}M"],
        ["-bufsize:#{idx}", "#{buf_size(rate)}M"],
        ["-passlogfile:#{idx}", "#{tmp_dir}/pass1_idx#{idx}.log"]
      ]
    end)
  end

  defp output_hls(tmp_dir) when is_binary(tmp_dir) do
    stream_map = Enum.map_join(variants(), " ", &"v:#{&1[:index]}")

    [
      ["-f", "hls"],
      ["-hls_playlist_type", "vod"],
      ["-hls_segment_type", "fmp4"],
      ["-master_pl_name", "stream.m3u8"],
      ["-hls_flags", "single_file+independent_segments"],
      ["-hls_list_size", "0"],
      ["-hls_time", hls_time()],
      ["-var_stream_map", stream_map],
      "#{tmp_dir}/stream_%v.m3u8"
    ]
  end

  defp output_none() do
    ~w[-f null /dev/null]
  end
end
