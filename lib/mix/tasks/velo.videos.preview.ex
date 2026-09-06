defmodule Mix.Tasks.Velo.Videos.Preview do
  use Mix.Task
  @requirements ["app.start"]

  import Guards

  @shortdoc "Preview not yet rendered videos. Call without arguments for a list and help."
  def run(args) do
    Video.Dir.must_exist!()
    if args == [], do: list(), else: preview(args)
  end

  defp list do
    IO.puts("""

    ##############################################################################################
    Help
    ##############################################################################################

    You can specify not-yet-generated videos by name and index. The article can be given as a module
    name, file path, filename, or basename. For example, these are all equivalent:
    mix velo.videos.preview Data.Article.Static.Alltagsroute12 0
    mix velo.videos.preview data/articles/static/alltagsroute-12.ex 0
    mix velo.videos.preview alltagsroute-12.ex 0
    mix velo.videos.preview alltagsroute-12 0

    You can also preview later parts of the videos by specifying a timestamp like so:
    mix velo.videos.preview alltagsroute-12 0 00:05:00.000
    mix velo.videos.preview b02ba2966179568a3307afb13cac6783  00:05:00.000

    Below any generated, but not rendered videos will be shown. If there are none, try running:
    mix velo.videos.generate new

    ##############################################################################################
    Options (environment variables)
    ##############################################################################################

    VELO_PREVIEW_TOOL=<shell>   By default "mpv" is used. You can specify any shell command here
                                that can handle the video stream being piped to it. To save the
                                video into a file, use VELO_PREVIEW_TOOL="cat > somefile"
                                Recommendation is to install "mpv".

    ##############################################################################################
    Previews
    ##############################################################################################
    """)

    Video.Generator.pending()
    |> Enum.sort_by(& &1.name())
    |> Enum.each(fn rendered ->
      IO.puts("""
      # #{rendered.name()}
      mix velo.videos.preview #{rendered.hash()}
      """)
    end)
  end

  defp preview([hash | tail]) when valid_hash(hash) do
    rendered = Video.Generator.find_by_hash(hash)

    if rendered == nil do
      IO.puts(
        :stderr,
        "No video with \u201c#{hash}\u201d found. Maybe try \u201cmix velo.videos.generate\u201d?"
      )
    else
      stream_video(rendered, tail)
    end
  end

  defp preview([in_art, in_index | tail] = args) do
    with art when is_module(art) <- Article.List.resolve(in_art) || :not_found,
         {index, ""} when index >= 0 <- Integer.parse(in_index),
         track when is_struct(track, Video.Track) <- Enum.at(art.tracks(), index),
         mod when is_module(mod) <- Video.Generator.dynamic_compile(track) do
      stream_video(mod, tail)
    else
      error ->
        IO.puts(
          :stderr,
          "failed to resolve args: #{inspect(args)}. One of the parsing steps returned: #{inspect(error)}"
        )

        exit({:shutdown, 1})
    end
  end

  defp preview(args) do
    IO.puts(
      :stderr,
      "cannot find video to preview from params. Expected a [video_hash], or [article, index]. Got: #{inspect(args)}"
    )

    exit({:shutdown, 1})
  end

  defp stream_video(rendered, args) when is_module(rendered) do
    start_from = List.first(args)
    start_from_text = start_from || "the start"
    info = "previewing #{rendered.hash()} – #{rendered.name()} from #{start_from_text}"
    IO.puts(:stderr, info)

    segments = Video.Segment.segments(rendered)

    segments =
      if start_from do
        skip_s = Video.Timestamp.in_seconds(start_from)
        skip_segments(segments, skip_s)
      else
        segments
      end

    if segments == [] do
      IO.puts(:stderr, "No segments to preview (timestamp may be past end of video)")
      exit({:shutdown, 1})
    end

    Temp.track!()

    try do
      {segment_infos, quick_count} = prepare_segment_infos(segments)

      if quick_count > 0 do
        IO.puts(:stderr, "Quick-rendered #{quick_count} missing segment(s)")
      end

      stream_to_player(segment_infos, info)
    after
      Temp.cleanup()
    end
  end

  # Use AVC 360p variant for cached segments to match quick-rendered codec/resolution
  defp preview_variant_idx do
    Enum.find_index(Video.Renderer.variants(), fn v ->
      v.width == 640 and v.height == 360 and hd(v.codec) == "libx264"
    end) || 0
  end

  defp prepare_segment_infos(segments) do
    variant_idx = preview_variant_idx()

    Enum.map_reduce(segments, 0, fn seg, quick_count ->
      if Video.Segment.all_variants_exist?(seg) do
        basename = Video.Segment.basename(seg)

        info = %{
          m4s_path: Video.Path.segment_file(basename, variant_idx),
          m3u8_path: Video.Path.segment_m3u8(basename, variant_idx)
        }

        {info, quick_count}
      else
        IO.puts(:stderr, "Quick-rendering segment #{Video.Segment.basename(seg)}...")

        case Video.SegmentedRenderer.preview_render_segment(seg) do
          {:ok, info} ->
            {info, quick_count + 1}

          {:error, reason} ->
            IO.puts(:stderr, "Failed to render segment: #{inspect(reason)}")
            exit({:shutdown, 1})
        end
      end
    end)
  end

  defp stream_to_player(segment_infos, info) do
    default_player = Util.default_player_cmd(info) |> Util.cli_printer()
    player = System.get_env("VELO_PREVIEW_TOOL", default_player)

    port =
      Port.open({:spawn, player}, [
        :binary,
        :exit_status,
        :use_stdio,
        :stream
      ])

    result =
      Video.FMP4.Stream.stream_segments(segment_infos, fn data ->
        try do
          Port.command(port, data)
          :ok
        rescue
          ArgumentError -> {:error, :port_closed}
        end
      end)

    try do
      Port.close(port)
    rescue
      ArgumentError -> :ok
    end

    case result do
      :ok -> :ok
      {:error, reason} -> IO.puts(:stderr, "Streaming ended: #{inspect(reason)}")
    end
  end

  defp skip_segments(segments, skip_s) do
    {_, remaining} =
      Enum.reduce(segments, {0.0, segments}, fn seg, {elapsed, remaining} ->
        dur = segment_duration(seg)

        if elapsed + dur <= skip_s do
          {elapsed + dur, tl(remaining)}
        else
          {elapsed + dur, remaining}
        end
      end)

    remaining
  end

  defp segment_duration(%{type: :regular} = seg), do: seg.end_s - seg.start_s
  defp segment_duration(%{type: :transition} = seg), do: seg.fade_s
end
