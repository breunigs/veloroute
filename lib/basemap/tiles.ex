defmodule Basemap.Tiles do
  use Basemap.Renderable
  use Basemap.Servable

  @dockerfile "lib/basemap/Dockerfile.tippecanoe"

  @impl Basemap.Renderable
  def stale?() do
    Enum.any?(dependencies(), &apply(&1, :stale?, [])) || tiles_stale?()
  end

  defp dependencies(), do: [Basemap.OpenStreetMap, Basemap.Project]

  defp tiles_stale?() do
    Util.IO.stale?(assets_path(), source_mbtiles(:cache))
  end

  @impl Basemap.Renderable
  def render() do
    Enum.each(dependencies(), &apply(&1, :ensure, []))

    File.rm_rf!(target(:cache))

    %{result: :ok} =
      Docker.build_and_run(
        @dockerfile,
        [
          "nice",
          "-n10",
          "/usr/bin/tile-join",
          "--no-tile-size-limit",
          "--no-tile-compression",
          "--no-tile-stats",
          "--output-to-directory=#{target(:container)}"
        ] ++ source_mbtiles(:container),
        name: "merging data sources into servable PBFs"
      )

    :ok = rewrite_metadata_json()
    File.rm_rf!(assets_path())
    File.rename!(target(:cache), assets_path())

    Util.Compress.file_glob(assets_path("**/*.pbf"), false, "basemap tiles")
    Util.Compress.file_glob(assets_path("**/*.json"), true, "basemap tile metadata")

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
    old = path |> File.read!() |> Jason.decode!()

    new =
      %{
        "tilejson" => "2.0.0",
        "scheme" => "xyz",
        "type" => "baselayer",
        "format" => "pbf",
        "tiles" => ["#{serve_url()}/{z}/{x}/{y}.pbf"],
        "bounds" => old["bounds"] |> String.split(",") |> Enum.map(&String.to_float/1),
        "name" => "merged #{Settings.sitebar_name()} tiles",
        "version" => "3.0",
        "description" =>
          "tiles made from OpenStreetMap and project data for #{Settings.sitebar_name()}",
        "minzoom" => String.to_integer(old["minzoom"]),
        "maxzoom" => String.to_integer(old["maxzoom"])
      }
      |> Map.merge(Jason.decode!(old["json"]))

    File.write!(path, Jason.encode!(new))
  end
end
