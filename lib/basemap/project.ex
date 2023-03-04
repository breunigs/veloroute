defmodule Basemap.Project do
  use Basemap.Renderable
  @dockerfile "lib/basemap/Dockerfile.tippecanoe"

  @impl Basemap.Renderable
  def target(where), do: path(where, "project.mbtiles")

  @impl Basemap.Renderable
  def stale?() do
    geojson_source = Data.GeoJSON.__info__(:compile) |> Keyword.get(:source) |> to_string()
    articles = Path.wildcard("data/articles/**/*.ex")
    Util.IO.stale?(target(:cache), [Cache.Map.source(), __ENV__.file, geojson_source] ++ articles)
  end

  @impl Basemap.Renderable
  def render() do
    geojsons = write_geojson() |> Enum.map(fn {_host, container} -> container end)

    with %{result: :ok} <-
           Docker.build_and_run(
             @dockerfile,
             [
               "/usr/bin/tippecanoe",
               "--force",
               "--coalesce-densest-as-needed",
               "--extend-zooms-if-still-dropping",
               "-d#{Basemap.OpenStreetMap.max_zoom()}",
               "--no-progress-indicator",
               "--output=#{target(:container)}"
             ] ++ geojsons,
             name: "converting project specific map data into tiles"
           ) do
      :ok
    else
      %{result: {:error, error}} -> {:error, error}
    end
  end

  @spec write_geojson() :: [{host_path :: binary(), container_path :: binary()}]
  defp write_geojson do
    File.mkdir_p!(path(:cache, ""))

    Cache.Map.full_map()
    |> Map.Enrich.with_articles(Article.List.all())
    |> Data.GeoJSON.to_feature_lists()
    |> Enum.map(fn {name, geojson} ->
      # without coordinates, useful for debugging
      path = path(:cache, "#{name}_no_coords.geojson")
      File.write!(path, Jason.encode!(remove_coords(geojson), pretty: true))

      # with coords, for further processing
      path = path(:cache, "#{name}.geojson")
      File.write!(path, Jason.encode!(geojson))

      {path, path(:container, "#{name}.geojson")}
    end)
  end

  defp remove_coords(obj) when is_list(obj) do
    Enum.map(obj, &remove_coords/1)
  end

  defp remove_coords(obj) when is_map(obj) do
    obj = Map.replace(obj, :coordinates, [])
    Enum.into(obj, %{}, &remove_coords/1)
  end

  defp remove_coords({key, val}) when is_atom(key) and is_list(val) do
    {key, Enum.map(val, &remove_coords/1)}
  end

  defp remove_coords({key, val}) when is_atom(key) and is_map(val) do
    {key, remove_coords(val)}
  end

  defp remove_coords({key, _val} = elem) when is_atom(key), do: elem
end
