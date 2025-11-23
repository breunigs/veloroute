defmodule Basemap.Tiles do
  use Basemap.Renderable
  use Basemap.Servable
  require Logger

  @combine_container {"merging data sources", {:dockerfile, "lib/basemap/Dockerfile.tippecanoe"}}
  # @convert_container {"converting to MLT", {:dockerfile, "lib/basemap/Dockerfile.mlt"}}

  @impl Basemap.Renderable
  def staleness() do
    stale_deps =
      Enum.filter(dependencies(), fn dep ->
        {stale, _reason} = dep.staleness()
        stale
      end)

    cond do
      stale_deps != [] ->
        {true, "outdated dependencies: #{Enum.join(stale_deps, ", ")}"}

      reason = Util.IO.stale_reason(assets_path(), source_mbtiles(:cache)) ->
        {true, "tiles: #{reason}"}

      true ->
        {false, "dependencies and tiles are up to date"}
    end
  end

  defp dependencies(), do: [Basemap.OpenStreetMap, Basemap.Project]

  @impl Basemap.Renderable
  def render() do
    Parallel.each(dependencies(), & &1.ensure())

    File.rm_rf!(target(:cache))

    :ok =
      Util.Docker.build_and_run(
        @combine_container,
        %{
          command_args:
            Util.low_priority_cmd_prefix(10) ++
              [
                "/usr/bin/tile-join",
                "--no-tile-size-limit",
                "--no-tile-compression",
                "--no-tile-stats",
                # "--output=#{target(:container, "merged.mbtiles")}"
                "--output-to-directory=#{target(:container)}"
              ] ++ source_mbtiles(:container)
        },
        []
      )
      |> print_error()

    # MLT converter is not production ready:
    # on vanilla: "Specified geometry type is not (yet) supported: GeometryCollection"
    # maplibre-gl-js also complains about FastPfor not being implemented, even if disabled
    # :ok =
    #   Util.Docker.build_and_run(
    #     @convert_container,
    #     %{command_args: [target(:container)]},
    #     []
    #   )
    #   |> print_error()

    :ok = rewrite_metadata_json()
    File.rm_rf!(assets_path())
    File.rename!(target(:cache), assets_path())

    Util.Compress.file_glob(assets_path("**/*.{pbf,mlt}"), "basemap tiles")
    Util.Compress.file_glob(assets_path("**/*.json"), "basemap tile metadata", keep_source: true)

    :ok
  end

  # an empty pbf vector tile
  @impl Basemap.Servable
  def fallback,
    do:
      <<31, 139, 8, 0, 250, 120, 24, 94, 0, 3, 147, 226, 227, 98, 143, 143, 79, 205, 45, 40, 169,
        212, 104, 80, 168, 96, 2, 0, 100, 113, 68, 54, 16, 0, 0, 0>>

  @doc """
  Returns a relative URL path to a tile most likely needed to render the given bounds
  """
  @spec tile_path_for_bounds(Geo.BoundingBox.like()) :: binary()
  def tile_path_for_bounds(bounds) do
    max_zoom = Basemap.OpenStreetMap.max_zoom()
    name = Geo.CheapRuler.bounds_to_xyz(bounds, max_zoom).str
    serve_path(name <> ".pbf")
  end

  defp source_mbtiles(where) do
    [Basemap.OpenStreetMap.target(where), Basemap.Project.target(where)]
  end

  defp rewrite_metadata_json() do
    path = path(:cache, "metadata.json")
    old = path |> File.read!() |> JSON.decode!()

    new =
      %{
        "tilejson" => "2.0.0",
        "scheme" => "xyz",
        "type" => "baselayer",
        "format" => "pbf",
        # "encoding" => "mlt",
        # "tiles" => ["#{serve_url()}/{z}/{x}/{y}.mlt"],
        "tiles" => ["#{serve_url()}/{z}/{x}/{y}.pbf"],
        "bounds" => old["bounds"] |> String.split(",") |> Enum.map(&String.to_float/1),
        "name" => "merged #{Settings.r(:sitebar_name)} tiles",
        "version" => "3.0",
        "description" =>
          "tiles made from OpenStreetMap and project data for #{Settings.r(:sitebar_name)}",
        "minzoom" => String.to_integer(old["minzoom"]),
        "maxzoom" => String.to_integer(old["maxzoom"])
      }
      |> Map.merge(JSON.decode!(old["json"]))

    File.write!(path, JSON.encode!(new))

    new_local = Map.replace!(new, "tiles", ["asset://#{serve_path()}/{z}/{x}/{y}.pbf.gz"])
    File.write!(path <> ".local", JSON.encode!(new_local))
  end

  defp print_error(:ok), do: :ok

  defp print_error({:error, reason}) do
    Logger.error(reason)
    {:error, "see above"}
  end
end
