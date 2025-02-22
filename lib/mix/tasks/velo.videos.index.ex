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
    exist = Path.wildcard(osm_index_path("*"))

    Settings.r(:video_source_dir_abs)
    |> Video.Source.new_from_folder(fn folder ->
      year = folder |> Path.basename() |> String.slice(0, 4)

      with {year, ""} <- Integer.parse(year) do
        year == current_year || !(osm_index_path(year) in exist)
      else
        _ -> true
      end
    end)
    |> Enum.filter(fn %{available_gpx: has_gpx, source: source} ->
      if !has_gpx, do: IO.puts("skipping #{source} as it doesn't have a GPX file")
      has_gpx
    end)
    |> Enum.group_by(fn %{date: %{year: year}} -> year end)
    |> Enum.reject(fn {year, _sources} ->
      year != current_year && osm_index_path(year) in exist
    end)
    |> Enum.each(fn {year, sources} ->
      osm =
        sources
        |> named_track_segments_parallel()
        |> Enum.map(&elem(&1, 1))
        |> wrap()

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

  defp named_track_segments_parallel(sources) do
    sources
    |> Enum.with_index()
    |> Task.async_stream(
      fn {source, idx} ->
        base_osm_id = -1 * (idx + 1) * @max_ids_per_single_track
        osm = named_track_segments(source, base_osm_id)
        IO.write(~c".")
        osm
      end,
      timeout: :infinity,
      ordered: false,
      max_concurrency: 3
    )
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

        path = Video.Path.source_base(source.source)

        """
          <way id='#{osm_id}'>
            #{refs}
            <tag k='gpx:name' v='#{path}' />
            <tag k='oneway' v='yes' />
          </way>
          #{nodes}
        """
    end
  end
end
