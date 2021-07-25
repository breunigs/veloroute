defmodule Mix.Tasks.Velo.Videos do
  # XXX: path needs to be absolute for JOSM to find it
  @out_anonymized "data/cache/videos_anonymized.gpx"
  @out_pending "data/cache/videos_pending.gpx"

  def out_anonymized, do: @out_anonymized
  def out_pending, do: @out_pending
end

defmodule Mix.Tasks.Velo.Videos.Generate do
  use Mix.Task

  @shortdoc "Finds videos in routes and articles and generates their metadata"
  def run(_) do
    # disable the warning if we're updating files
    Code.compiler_options(ignore_module_conflict: true)

    tracks = route_tracks() ++ article_tracks()

    tracks
    |> Parallel.map(&Video.Rendered.save_from_track/1)
    |> Enum.map(fn
      rendered when is_atom(rendered) ->
        rendered

      broken ->
        IO.puts(:stderr, inspect(broken))
        nil
    end)
    |> list_unused()
  end

  def list_unused(rendered) do
    keep = rendered |> Enum.map(&Video.Rendered.path/1) |> MapSet.new()
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
    |> Enum.sort_by(& &1.name)
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
    |> Enum.sort_by(& &1.name)
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

defmodule Mix.Tasks.Velo.Videos.Preload do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Print command to preload the videos on the server"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    video_files =
      Settings.video_target_dir_abs()
      |> IOUtil.tree()
      |> Enum.map(&Path.relative_to(&1, Settings.video_target_dir_abs()))

    Video.Rendered.rendered()
    |> Enum.flat_map(fn rendered ->
      Enum.filter(video_files, &String.starts_with?(&1, rendered.hash))
    end)
    |> Parallel.each(4, fn path ->
      full_path = Path.join(Settings.deploy_video_mount_dir(), path)
      cmd = [Settings.deploy_ssh_name(), "--", "cat", full_path, ">/dev/null"]

      try do
        System.cmd("ssh", cmd)
        |> case do
          {_msgs, 0} ->
            IO.puts("✓ #{path}")

          {msgs, exit_code} ->
            IO.puts(:stderr, "FAILED #{path} with exit code #{exit_code}:\n#{msgs}\n\n")
        end
      rescue
        error ->
          IO.puts(:stderr, "FAILED #{path}:\n#{inspect(error)}\n\n")
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
          %{available_gpx: false, name: source} ->
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

  defp named_track_segments(%{source: source}) do
    abs_path = Video.Path.gpx(source)
    {:ok, content} = File.read(abs_path)
    name = Video.Path.source_base(source)

    Regex.scan(~r/<trkseg>.*?<\/trkseg>/s, content)
    |> Enum.map(fn seg -> "<trk><name>" <> name <> "</name>" <> hd(seg) <> "</trk>" end)
    |> Enum.join("\n")
  end
end
