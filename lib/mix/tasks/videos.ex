defmodule Mix.Tasks.Velo.Videos do
  # XXX: path needs to be absolute for JOSM to find it
  @working_dir File.cwd!()
  @out_anonymized @working_dir <> "/data/cache/videos_anonymized.gpx"
  @out_pending @working_dir <> "/data/cache/videos_pending.gpx"

  def out_anonymized, do: @out_anonymized
  def out_pending, do: @out_pending
end

defmodule Mix.Tasks.Velo.Videos.Generate do
  use Mix.Task

  @shortdoc "Finds videos in routes and articles and generates their metadata"
  def run(_) do
    # disable the warning if we're updating files
    Code.compiler_options(ignore_module_conflict: true)

    tracks =
      (route_tracks() ++ article_tracks())
      |> Enum.map(&Video.TrimmedSourceSequence.new_from_track/1)

    tracks
    |> Parallel.map(&Video.Rendered.save_from_tsv_seq/1)
    |> Enum.each(fn
      :ok -> :ok
      broken -> IO.puts(:stderr, inspect(broken))
    end)

    list_unused(tracks)
  end

  def list_unused(tracks) do
    keep = tracks |> Enum.map(&Video.Rendered.path/1) |> MapSet.new()
    all = Enum.map(Video.Rendered.all(), &Video.Rendered.path/1) |> MapSet.new()

    Enum.each(MapSet.difference(all, keep), fn path ->
      IO.puts(:stderr, "unused/unreferenced rendered video: #{path}")
    end)
  end

  defp route_tracks do
    Enum.flat_map(Route.List.all(), & &1.tracks())
  end

  defp article_tracks do
    Cache.Articles.get()
    |> Map.values()
    |> Enum.flat_map(fn %Article{tracks: tracks} -> tracks end)
  end
end

defmodule Mix.Tasks.Velo.Videos.Render do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Print commands to render videos that are still missing"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    IO.puts("""
    ###########################################################
    # Optional: enable HW acceleration if the GPU is unused
    export HW_ACCEL=1
    """)

    Video.Rendered.pending()
    |> Enum.each(fn rendered ->
      render = Video.Rendered.render(rendered)

      IO.puts("""

      ###########################################################
      echo "#{rendered.name}"
      # Hash: #{rendered.hash}
      ###########################################################

      #{Enum.join(render, " ")}
      """)
    end)
  end
end

defmodule Mix.Tasks.Velo.Videos.Preview do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Print commands to preview videos that are still missing"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    Video.Rendered.pending()
    |> Enum.each(fn rendered ->
      previews = Video.Rendered.preview(rendered)

      IO.puts("""

      ###########################################################
      # #{rendered.name}
      # Hash: #{rendered.hash}
      ###########################################################

      """)

      for {preview, idx} <- Enum.with_index(previews) do
        desc = if idx == 0, do: "full preview", else: "#{idx}. concat preview"

        IO.puts("""

        #{desc}:
          #{Enum.join(preview, " ")}
        """)
      end
    end)
  end
end

defmodule Mix.Tasks.Velo.Videos.Index do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Indexes videos and their anonymization status"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run() do
    IO.puts("Indexing videos…")

    {anon, pending} =
      Settings.video_source_dir_abs()
      |> Video.Source.new_from_folder()
      |> Enum.reduce({[], []}, fn video, {anon, pending} ->
        case video do
          %{available_gpx: false, path_source: source} ->
            IO.puts("skipping #{source} as it doesn't have a GPX file")
            {anon, pending}

          %{available_anonymized: true} ->
            {[named_track_segments_task(video) | anon], pending}

          %{available_anonymized: false} ->
            {anon, [named_track_segments_task(video) | pending]}
        end
      end)

    anon = anon |> join_tasks() |> wrap()
    pending = pending |> join_tasks() |> wrap()

    :ok = File.write(out_anonymized(), anon)
    IO.puts("Wrote #{out_anonymized()}")
    :ok = File.write(out_pending(), pending)
    IO.puts("Wrote #{out_pending()}")
  end

  defp wrap(tracks) do
    """
      <?xml version='1.0' encoding='UTF-8'?>
      <gpx version="1.1" creator="JOSM GPX export" xmlns="http://www.topografix.com/GPX/1/1"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
        #{tracks}
      </gpx>
    """
    |> String.trim()
  end

  defp join_tasks(list) do
    list |> Enum.map(&Task.await(&1, :infinity)) |> Enum.join("\n\n")
  end

  defp named_track_segments_task(x) do
    Task.async(fn -> named_track_segments(x) end)
  end

  defp named_track_segments(%{path_gpx: rel_path}) do
    abs_path = Path.join(Settings.video_source_dir_abs(), rel_path)
    {:ok, content} = File.read(abs_path)
    name = String.replace_suffix(rel_path, ".gpx", "")

    Regex.scan(~r/<trkseg>.*?<\/trkseg>/s, content)
    |> Enum.map(fn seg -> "<trk><name>" <> name <> "</name>" <> hd(seg) <> "</trk>" end)
    |> Enum.join("\n")
  end
end
