defmodule Mix.Tasks.Velo.Videos do
  def osm_index_path(year), do: "data/cache/videos_#{year}.osm"
end

defmodule Mix.Tasks.Velo.Videos.Generate do
  use Mix.Task

  @shortdoc "Finds videos in routes and articles and generates their metadata"
  def run(_) do
    Article.List.all()
    |> Stream.flat_map(& &1.tracks())
    |> Tqdm.tqdm(description: "generating")
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
    keep = rendered |> MapSet.new()
    all = Video.Rendered.all() |> MapSet.new()
    unused = MapSet.difference(all, keep)

    if MapSet.size(unused) > 0 do
      IO.puts(:stderr, "unused/unreferenced rendered videos:")
      Enum.each(unused, &IO.puts(:stderr, "#{Video.Rendered.path(&1)}: #{&1.name()}"))
      IO.puts(:stderr, "\n")
    end
  end
end

defmodule Mix.Tasks.Velo.Videos.Render do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Print commands to render videos that are still missing"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    Video.Rendered.pending()
    |> Enum.sort_by(& &1.name)
    |> Enum.each(fn rendered ->
      cmd = Video.Renderer.render(rendered)

      IO.puts("""

      ###########################################################
      echo "#{rendered.name}"
      # Hash: #{rendered.hash}
      ###########################################################

      #{Util.cli_printer(cmd)}
      """)
    end)
  end
end

defmodule Mix.Tasks.Velo.Videos.Preview do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Print commands to preview videos that are still missing. Set BLUR=1 to include blurs."
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    Video.Rendered.pending()
    |> Enum.sort_by(& &1.name)
    |> Enum.each(fn rendered ->
      blur = System.get_env("BLUR", nil) == "1"
      cmd = Video.Renderer.preview_cmd(rendered, blur)

      IO.puts("""

      ###########################################################
      # #{rendered.name}
      # Hash: #{rendered.hash}
      ###########################################################

      #{Util.cli_printer(cmd)}
      """)

      # for {preview, idx} <- Enum.with_index(previews) do
      #   desc = if idx == 0, do: "full preview", else: "#{idx}. concat preview"

      #   IO.puts("""

      #   #{desc}:
      #     #{Enum.join(preview, " ")}
      #   """)
      # end
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

  @shortdoc "Indexes videos and their GPX tracks"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  @max_ids_per_single_track 10_000

  defp real_run() do
    IO.puts("Finding videos…")

    Settings.video_source_dir_abs()
    |> Video.Source.new_from_folder()
    |> Enum.reduce({%{}, %{}}, fn video, {ids, tracks} ->
      case video do
        %{available_gpx: false, name: source} ->
          IO.puts("skipping #{source} as it doesn't have a GPX file")
          {ids, tracks}

        %{date: <<year::binary-size(4)>> <> _rest} ->
          ids = Map.update(ids, year, -1, fn prev -> prev - @max_ids_per_single_track end)
          task = named_track_segments_task(video, ids[year])
          tracks = Map.update(tracks, year, [task], fn list -> [task | list] end)

          {ids, tracks}
      end
    end)
    |> elem(1)
    |> Enum.each(fn {year, tasks} ->
      osm = tasks |> join_tasks() |> wrap()
      :ok = File.write(osm_index_path(year), osm)
      IO.puts("Wrote #{osm_index_path(year)}")
    end)
  end

  defp wrap(data) do
    """
      <?xml version='1.0' encoding='UTF-8'?>
      <osm version='0.6' upload='false'>
        #{data}
      </osm>
    """
    |> String.trim()
  end

  defp join_tasks(list) when is_list(list) do
    list |> Enum.map(&Task.await(&1, :infinity)) |> Enum.join("\n\n")
  end

  defp named_track_segments_task(x, base_osm_id) do
    Task.async(fn ->
      res = named_track_segments(x, base_osm_id)
      IO.write('.')
      res
    end)
  end

  defp named_track_segments(%Video.Source{} = source, base_osm_id) do
    source
    |> Video.Source.timed_points()
    |> case do
      {:error, msg} ->
        IO.warn(msg)
        ""

      points ->
        {osm_id, nodes, refs} =
          Enum.reduce(points, {base_osm_id, "", ""}, fn tp, {osm_id, nodes, refs} ->
            node = Video.TimedPoint.to_osm_node(tp, osm_id)
            ref = "<nd ref='#{osm_id}' />"
            # refs need to be in right order, but for the nodes itself it doesn't matter
            {osm_id - 1, node <> nodes, refs <> ref}
          end)

        """
          <way id='#{osm_id}'>
            #{refs}
            <tag k='gpx:name' v='#{source.source}' />
            <tag k='oneway' v='yes' />
          </way>
          #{nodes}
        """
    end
  end
end

defmodule Mix.Tasks.Velo.Videos.Detect do
  use Mix.Task

  @shortdoc "Detects regions to anonymize and stores the results alongside the videos"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run() do
    Docker.build_detector_image()
    Docker.boot_detector()
  end
end
