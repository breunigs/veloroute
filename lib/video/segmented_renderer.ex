defmodule Video.SegmentedRenderer do
  require Logger

  @spec render(Video.Rendered.t()) :: :ok | {:error, binary()}
  def render(rendered) do
    target = Video.Path.target(rendered.hash())

    case File.ls(target) do
      {:ok, []} -> render_run(rendered, target)
      {:error, :enoent} -> render_run(rendered, target)
      _ -> {:error, "#{target} already exists, refusing to overwrite"}
    end
  end

  defp render_run(rendered, target) do
    cache_dir = Path.join([File.cwd!(), "data", "cache"])
    Temp.track!()

    try do
      segments = Video.Segment.segments(rendered)

      with :ok <- File.mkdir_p(Video.Path.segment_dir()),
           :ok <- File.mkdir_p(cache_dir),
           :ok <- render_segments(rendered, segments, cache_dir),
           :ok <- File.mkdir_p(target),
           :ok <- assemble_playlists(segments, target),
           :ok <- render_thumbnails(rendered, Video.Path.target_rel_to_cwd(rendered.hash())),
           :ok <- manually_tag_missing(target) do
        Video.Renderer.append_thumb_pragmas(target)
      end
    after
      Temp.cleanup()
    end
  end

  @parallel_segments 2

  defp render_segments(rendered, segments, cache_dir) do
    {regular, transitions} = Enum.split_with(segments, &(&1.type == :regular))

    regular_missing = Enum.reject(regular, &Video.Segment.all_variants_exist?/1)
    transition_missing = Enum.reject(transitions, &Video.Segment.all_variants_exist?/1)

    skipped =
      length(regular) - length(regular_missing) + length(transitions) - length(transition_missing)

    total = length(regular_missing) + length(transition_missing)
    all_missing = regular_missing ++ transition_missing

    if skipped > 0, do: Logger.info("Skipping #{skipped} segments that already exist")

    render_segments_parallel(rendered, all_missing, cache_dir, total)
  end

  defp render_segments_parallel(_rendered, [], _cache_dir, _total), do: :ok

  defp render_segments_parallel(rendered, segments, cache_dir, total) do
    alias Video.SegmentedRenderer.LiveProgress
    LiveProgress.start_link()
    LiveProgress.start_bar(:segments, label: "segments", total: total, absolute_values: true)

    errors =
      segments
      |> Enum.with_index()
      |> Task.async_stream(
        fn {segment, idx} ->
          if Video.StopFlag.stopped?() do
            :stopped
          else
            Process.put(:niceness, if(rem(idx, @parallel_segments) == 0, do: 5, else: 19))

            case segment.type do
              :regular -> render_regular_segment(rendered, segment, cache_dir)
              :transition -> render_transition_segment(rendered, segment, cache_dir)
            end
          end
        end,
        max_concurrency: @parallel_segments,
        ordered: false,
        timeout: :infinity
      )
      |> Enum.reduce([], fn
        {:ok, :ok}, errors ->
          LiveProgress.inc(:segments)
          errors

        {:ok, :stopped}, errors ->
          errors

        {:ok, {:error, reason}}, errors ->
          LiveProgress.log(reason)
          LiveProgress.inc(:segments)
          [reason | errors]
      end)

    LiveProgress.stop()

    case errors do
      [] -> :ok
      errs -> {:error, "#{length(errs)} segment(s) failed"}
    end
  end

  defp render_regular_segment(_rendered, segment, cache_dir) do
    basename = Video.Segment.basename(segment)
    filepart = Path.basename(basename)
    %{source: source, start_s: start_s, end_s: end_s, opts: opts} = segment

    with {:ok, tmp_path} <- Temp.mkdir(%{basedir: cache_dir, prefix: "seg_#{filepart}"}) do
      tmp_dir = Path.basename(tmp_path)
      meta = metadata(source)
      filter = regular_filter(source, start_s, opts)
      input = regular_input(source, start_s, end_s)
      {pass1, pass2} = two_pass_cmd(input, input, filter, tmp_dir, filepart)

      with :ok <-
             run_ffmpeg(
               "#{basename} pass 1",
               pass1,
               segment_progress(basename, "pass 1", start_s, end_s, meta.pts_correction)
             ),
           :ok <-
             run_ffmpeg(
               "#{basename} pass 2",
               pass2,
               segment_progress(basename, "pass 2", start_s, end_s, meta.pts_correction)
             ) do
        move_segment_outputs(tmp_path, filepart, basename)
      end
    end
  end

  defp render_transition_segment(_rendered, segment, cache_dir) do
    basename = Video.Segment.basename(segment)

    %{
      source_a: source_a,
      source_b: source_b,
      end_a_s: end_a_s,
      start_b_s: start_b_s,
      fade_s: fade_s,
      opts_a: opts_a,
      opts_b: opts_b
    } = segment

    filepart = Path.basename(basename)

    with {:ok, tmp_path} <- Temp.mkdir(%{basedir: cache_dir, prefix: "xfade_#{filepart}"}) do
      tmp_dir = Path.basename(tmp_path)
      meta_a = metadata(source_a)
      meta_b = metadata(source_b)

      a_start = max(0, end_a_s - fade_s)
      a_end = end_a_s
      b_start = start_b_s
      b_end = start_b_s + fade_s

      transition_ctx = %{
        source_a: source_a,
        source_b: source_b,
        a_start: a_start,
        b_start: b_start,
        fade_s: fade_s,
        meta_a: meta_a,
        meta_b: meta_b,
        opts_a: opts_a,
        opts_b: opts_b
      }

      filter = transition_filter(transition_ctx)

      input = transition_input(source_a, a_start, a_end, source_b, b_start, b_end)

      fps = Video.Constants.output_fps_s()

      {pass1, pass2} =
        two_pass_cmd(input, input, filter, tmp_dir, filepart, ["-r", fps])

      with :ok <-
             run_ffmpeg(
               "#{basename} pass 1",
               pass1,
               segment_progress(basename, "pass 1", 0, fade_s)
             ),
           :ok <-
             run_ffmpeg(
               "#{basename} pass 2",
               pass2,
               segment_progress(basename, "pass 2", 0, fade_s)
             ) do
        move_segment_outputs(tmp_path, filepart, basename)
      end
    end
  end

  defp regular_filter(source, start_s, opts) do
    detections = Video.Path.detections_rel_to_cwd(source)
    from_ms = round(start_s * 1000)
    blur_skip = blur_frame_skip(source, from_ms)

    vf_part = if opts[:vf], do: opts[:vf] <> ",", else: ""

    parts = [
      "[0]frei0r=jsonblur:#{detections}|#{blur_skip},#{vf_part}settb=AVTB,setsar=1:1[blur0]"
    ]

    parts = parts ++ dewarp_filters("[blur0]", "[blur0]")
    meta = metadata(source)
    parts = parts ++ time_lapse_filter(meta, "[blur0]", "[blur0]")

    variant_count = length(Video.Renderer.variants())
    outputs = Enum.map(0..(variant_count - 1), &"[out#{&1}]")
    parts ++ ["[blur0]split=#{variant_count}#{Enum.join(outputs)}"]
  end

  defp transition_filter(ctx) do
    det_a = Video.Path.detections_rel_to_cwd(ctx.source_a)
    det_b = Video.Path.detections_rel_to_cwd(ctx.source_b)
    skip_a = blur_frame_skip(ctx.source_a, round(ctx.a_start * 1000))
    skip_b = blur_frame_skip(ctx.source_b, round(ctx.b_start * 1000))

    vf_a = if ctx.opts_a[:vf], do: ctx.opts_a[:vf] <> ",", else: ""
    vf_b = if ctx.opts_b[:vf], do: ctx.opts_b[:vf] <> ",", else: ""

    fps_s = Video.Constants.output_fps_s()

    parts = [
      "[0]frei0r=jsonblur:#{det_a}|#{skip_a},#{vf_a}settb=AVTB,setsar=1:1[blur0]",
      "[1]frei0r=jsonblur:#{det_b}|#{skip_b},#{vf_b}settb=AVTB,setsar=1:1[blur1]"
    ]

    parts = parts ++ dewarp_filters("[blur0]", "[blur0]")
    parts = parts ++ dewarp_filters("[blur1]", "[blur1]")
    parts = parts ++ time_lapse_filter(ctx.meta_a, "[blur0]", "[blur0]")
    parts = parts ++ time_lapse_filter(ctx.meta_b, "[blur1]", "[blur1]")

    fade_dur = ctx.fade_s

    parts =
      parts ++
        [
          "[blur0]setpts=N/(#{fps_s})/TB[a]",
          "[blur1]setpts=N/(#{fps_s})/TB[b]",
          "[a][b]frei0r=filter_name=rife_transition:filter_params=#{fade_dur}||0[joined]"
        ]

    variant_count = length(Video.Renderer.variants())
    outputs = Enum.map(0..(variant_count - 1), &"[out#{&1}]")
    parts ++ ["[joined]split=#{variant_count}#{Enum.join(outputs)}"]
  end

  defp dewarp_filters(inp, out) do
    filters = Settings.r(:dewarp_filters)

    if filters && filters != [] do
      ["#{inp}#{Enum.join(filters, ",")}#{out}"]
    else
      []
    end
  end

  defp time_lapse_filter(meta, inp, out) do
    if meta.pts_correction != 1 do
      fps = Video.Constants.output_fps()
      ["#{inp}setpts=#{meta.pts_correction}*PTS,fps=#{fps},settb=AVTB#{out}"]
    else
      []
    end
  end

  defp regular_input(source, start_s, end_s) do
    [
      "-hwaccel",
      "auto",
      "-ss",
      format_ts(start_s),
      "-to",
      format_ts(end_s),
      "-i",
      Video.Path.source_rel_to_cwd(source)
    ]
  end

  defp transition_input(source_a, a_start, a_end, source_b, b_start, b_end) do
    [
      "-hwaccel",
      "auto",
      "-ss",
      format_ts(a_start),
      "-to",
      format_ts(a_end),
      "-i",
      Video.Path.source_rel_to_cwd(source_a),
      "-ss",
      format_ts(b_start),
      "-to",
      format_ts(b_end),
      "-i",
      Video.Path.source_rel_to_cwd(source_b)
    ]
  end

  defp two_pass_cmd(pass1_input, pass2_input, filter_parts, tmp_dir, basename, extra_flags \\ []) do
    filter = Enum.join(filter_parts, ";")
    variant_count = length(Video.Renderer.variants())

    cmd_base = fn input ->
      [
        Util.low_priority_cmd_prefix(Process.get(:niceness, 19)),
        ["ffmpeg", "-hide_banner", "-v", "verbose"],
        ["-err_detect", "explode"],
        input,
        ["-filter_complex", filter],
        ["-g", gop_size()],
        extra_flags,
        ["-color_primaries", "bt709"],
        ["-color_trc", "bt709"],
        ["-colorspace", "bt709"],
        "-an",
        ["-sc_threshold", "0"],
        ["-pix_fmt", "yuv420p"]
      ]
    end

    pass1 =
      List.flatten([cmd_base.(pass1_input), "-pass", "1", variant_flags(tmp_dir), output_none()])

    stream_map = Enum.map_join(0..(variant_count - 1), " ", &"v:#{&1}")

    pass2_output = [
      ["-f", "hls"],
      ["-hls_playlist_type", "vod"],
      ["-hls_segment_type", "fmp4"],
      ["-hls_flags", "single_file+independent_segments"],
      ["-hls_list_size", "0"],
      ["-hls_time", hls_time()],
      ["-master_pl_name", "unused.m3u8"],
      ["-var_stream_map", stream_map],
      "#{tmp_dir}/#{basename}_v%v.m3u8"
    ]

    pass2 =
      List.flatten([cmd_base.(pass2_input), "-pass", "2", variant_flags(tmp_dir), pass2_output])

    {pass1, pass2}
  end

  defp variant_flags(tmp_dir) do
    Video.Renderer.variant_flags(tmp_dir)
  end

  defp move_segment_outputs(tmp_path, filepart, basename) do
    seg_dir = Video.Path.segment_dir()
    target_subdir = Path.join(seg_dir, Path.dirname(basename))
    variant_count = length(Video.Renderer.variants())

    with :ok <- File.mkdir_p(target_subdir) do
      errors =
        for idx <- 0..(variant_count - 1), ext <- [".m3u8", ".m4s"], reduce: [] do
          errors ->
            src_file = "#{filepart}_v#{idx}#{ext}"
            source = Path.join(tmp_path, src_file)
            target = Path.join(target_subdir, src_file)

            case move_file(source, target) do
              :ok -> errors
              {:error, err} -> ["#{src_file}: #{inspect(err)}" | errors]
            end
        end

      if errors == [], do: :ok, else: {:error, Enum.join(errors, "\n")}
    end
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

  # --- Playlist Assembly ---

  defp assemble_playlists(segments, target_dir) do
    with :ok <- assemble_variant_playlists(segments, target_dir) do
      assemble_master_playlist(target_dir)
    end
  end

  defp assemble_variant_playlists(segments, target_dir) do
    variant_count = length(Video.Renderer.variants())

    Enum.reduce_while(0..(variant_count - 1), :ok, fn variant_idx, :ok ->
      case assemble_variant_playlist(segments, variant_idx, target_dir) do
        :ok -> {:cont, :ok}
        err -> {:halt, err}
      end
    end)
  end

  defp assemble_variant_playlist(segments, variant_idx, target_dir) do
    entries_result =
      Enum.reduce_while(segments, {:ok, [], 0.0}, fn segment, {:ok, acc, _max_dur} ->
        basename = Video.Segment.basename(segment)
        m3u8_path = Video.Path.segment_m3u8(basename, variant_idx)

        case M3U8.Tokenizer.read_file(m3u8_path) do
          {:ok, tokens} ->
            rel_path = Video.Path.segment_rel_from_hash(basename, variant_idx)
            {map_info, extinf_entries} = extract_companion_entries(tokens)
            max_dur = extinf_entries |> Enum.map(& &1.duration) |> Enum.max(fn -> 0.0 end)

            entry = %{
              rel_path: rel_path,
              map: map_info,
              entries: extinf_entries,
              max_dur: max_dur
            }

            {:cont, {:ok, [entry | acc], max_dur}}

          {:error, reason} ->
            {:halt, {:error, reason}}
        end
      end)

    case entries_result do
      {:ok, entries_rev, _} ->
        entries = Enum.reverse(entries_rev)

        max_duration =
          entries
          |> Enum.flat_map(& &1.entries)
          |> Enum.map(& &1.duration)
          |> Enum.max(fn -> 1.0 end)
          |> Float.ceil()
          |> trunc()

        lines = [
          "#EXTM3U",
          "#EXT-X-VERSION:7",
          "#EXT-X-TARGETDURATION:#{max_duration}",
          "#EXT-X-MEDIA-SEQUENCE:0",
          "#EXT-X-PLAYLIST-TYPE:VOD",
          "#EXT-X-INDEPENDENT-SEGMENTS"
        ]

        body =
          Enum.flat_map(entries, fn entry ->
            map_line =
              "#EXT-X-MAP:URI=\"#{entry.rel_path}\",BYTERANGE=\"#{entry.map.length}@#{entry.map.offset}\""

            ["#EXT-X-DISCONTINUITY", map_line] ++
              Enum.flat_map(entry.entries, fn e ->
                [
                  "#EXTINF:#{format_extinf_duration(e.duration)},",
                  "#EXT-X-BYTERANGE:#{e.length}@#{e.offset}",
                  entry.rel_path
                ]
              end)
          end)

        content = Enum.join(lines ++ body ++ ["#EXT-X-ENDLIST", ""], "\n")
        File.write(Path.join(target_dir, "stream_#{variant_idx}.m3u8"), content)

      {:error, _} = err ->
        err
    end
  end

  defp extract_companion_entries(tokens) do
    map_info =
      Enum.find_value(tokens, %{length: 0, offset: 0}, fn
        {:map, attrs} ->
          case attrs["BYTERANGE"] do
            %{length: l, offset: o} -> %{length: l, offset: o || 0}
            _ -> nil
          end

        _ ->
          nil
      end)

    extinf_entries =
      tokens
      |> Enum.chunk_while(
        nil,
        fn
          {:extinf, %{duration: d}}, nil ->
            {:cont, %{duration: d}}

          {:byte_range, %{length: l, offset: o}}, %{duration: _} = acc ->
            {:cont, Map.merge(acc, %{length: l, offset: o || 0})}

          {:url, _url}, %{length: _} = acc ->
            {:cont, acc, nil}

          _other, acc ->
            {:cont, acc}
        end,
        fn
          nil -> {:cont, nil}
          acc -> {:cont, acc, nil}
        end
      )
      |> Enum.reject(&is_nil/1)

    {map_info, extinf_entries}
  end

  defp format_extinf_duration(dur) do
    :erlang.float_to_binary(dur / 1, decimals: 6)
  end

  defp assemble_master_playlist(target_dir) do
    variants = Video.Renderer.variants()

    lines =
      ["#EXTM3U"] ++
        Enum.map(variants, fn %{width: w, height: h, bitrate: rate, index: idx} = v ->
          bandwidth = round(rate * 1_000_000)
          codecs_part = if v[:tag_as], do: ",CODECS=\"#{v[:tag_as]}\"", else: ""

          "#EXT-X-STREAM-INF:BANDWIDTH=#{bandwidth},RESOLUTION=#{w}x#{h}#{codecs_part}\nstream_#{idx}.m3u8"
        end)

    File.write(Path.join(target_dir, "stream.m3u8"), Enum.join(lines, "\n") <> "\n")
  end

  # --- Thumbnails ---

  defp render_thumbnails(rendered, target_dir) do
    Enum.reduce_while(Video.Renderer.variant_thumbs(), :ok, fn thumb, :ok ->
      source = thumbnail_source_stream(target_dir)
      label = "rendering thumbs"
      pbar = Video.Renderer.Progress.new(rendered, label, thumb.fps)

      case run_ffmpeg(label, Video.Renderer.thumbnail_cmd(source, target_dir, thumb), pbar) do
        :ok -> {:cont, :ok}
        err -> {:halt, err}
      end
    end)
  end

  defp thumbnail_source_stream(target_dir) do
    %{index: idx} = Enum.find(Video.Renderer.variants(), & &1[:thumbnail_source])
    "#{target_dir}/stream_#{idx}.m3u8"
  end

  # --- Codec Tagging ---

  defp manually_tag_missing(target_dir) do
    m3u8 = Path.join(target_dir, "stream.m3u8")

    contents =
      File.read!(m3u8)
      |> String.split("\n")
      |> Enum.reduce({[], Video.Renderer.variants()}, fn line, {mapped, variants} ->
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

  # --- Helpers ---

  defp run_ffmpeg(label, cmd, pbar) do
    Util.Docker.build_and_run(
      {label, Video.Renderer.ffmpeg_image()},
      %{command_args: cmd, mount_videos_in_dir: "/workdir/"},
      env: [],
      stderr: pbar,
      stdout: "",
      slow_warn_message: false
    )
  end

  defp segment_progress(basename, pass, start_s, end_s, pts_correction \\ 1) do
    alias Video.SegmentedRenderer.LiveProgress
    fps = Video.Constants.output_fps()
    duration = end_s - start_s
    total_frames = max(1, round(duration * pts_correction * fps))
    label = "#{pass} #{Path.basename(basename)}"
    id = {pass, basename, :erlang.unique_integer()}

    LiveProgress.start_bar(id, label: label, total: total_frames)

    Video.SegmentedRenderer.OwlProgress.new(id, total_frames)
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

  defp blur_frame_skip(_path, 0), do: 0

  defp blur_frame_skip(path, from_ms) when is_integer(from_ms) do
    from_in_s = from_ms / 1000.0
    meta = metadata(path)
    frame_no = round(meta.fps * from_in_s)
    frame_pts = round(frame_no / meta.fps / meta.time_base) * meta.time_base
    if frame_pts < from_in_s, do: frame_no + 1, else: frame_no
  end

  defp format_ts(seconds) when is_number(seconds) do
    total_ms = round(seconds * 1000)
    h = div(total_ms, 3_600_000)
    rem_after_h = rem(total_ms, 3_600_000)
    m = div(rem_after_h, 60_000)
    rem_after_m = rem(rem_after_h, 60_000)
    s = div(rem_after_m, 1000)
    ms = rem(rem_after_m, 1000)

    base =
      String.pad_leading("#{h}", 2, "0") <>
        ":" <> String.pad_leading("#{m}", 2, "0") <> ":" <> String.pad_leading("#{s}", 2, "0")

    if ms == 0, do: base, else: base <> "." <> String.pad_leading("#{ms}", 3, "0")
  end

  defp hls_time, do: 1

  defp gop_size, do: round(hls_time() * Video.Constants.output_fps())

  defp output_none, do: ~w[-f null /dev/null]
end
