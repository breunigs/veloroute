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
    current_year = Date.utc_today().year

    Settings.video_source_dir_abs()
    |> Video.Source.new_from_folder()
    |> Enum.reduce({%{}, %{}, %{}}, fn video, {ids, tracks, exists} ->
      case video do
        %{available_gpx: false, name: source} ->
          IO.puts("skipping #{source} as it doesn't have a GPX file")
          {ids, tracks}

        %{date: %{year: year}} ->
          exists = Map.put_new_lazy(exists, year, fn -> File.exists?(osm_index_path(year)) end)

          if !exists[year] || year == current_year do
            ids = Map.update(ids, year, -1, fn prev -> prev - @max_ids_per_single_track end)
            task = named_track_segments_task(video, ids[year])
            tracks = Map.update(tracks, year, [task], fn list -> [task | list] end)

            {ids, tracks, exists}
          else
            {ids, tracks, exists}
          end
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
    Enum.map_join(list, "\n\n", &Task.await(&1, :infinity))
  end

  defp named_track_segments_task(x, base_osm_id) do
    Task.async(fn ->
      res = named_track_segments(x, base_osm_id)
      IO.write(~c".")
      res
    end)
  end

  defp named_track_segments(%Video.Source{} = source, base_osm_id) do
    source
    |> Video.Source.timed_points_with_gpx()
    |> case do
      {:error, msg} ->
        IO.warn(msg)
        ""

      points ->
        {osm_id, nodes, refs} =
          Enum.reduce(points, {base_osm_id, "", ""}, fn tp, {osm_id, nodes, refs} ->
            node = Video.TimedPointWithGPX.to_osm_node(tp, osm_id)
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
