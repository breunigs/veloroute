defmodule Mix.Tasks.Velo.Map.Debug do
  use Mix.Task
  @requirements ["app.start"]

  @path "data/cache/geojson_debug/"
  @shortdoc "Dump the GeoJSON files that are used for map generation"
  def run(_opts) do
    File.mkdir_p!(@path)

    save_geojson(@path)
    |> Enum.each(fn %{name: name, geojson: geojson} ->
      path = Path.join(@path, "#{name}_no_coords.geojson")
      File.write!(path, Jason.encode!(remove_coords(geojson), pretty: true))
    end)

    IO.puts("Debug GeoJSON has been put in #{@path}")
  end

  defp data_as_geojson do
    Cache.Map.full_map()
    |> Map.Enrich.with_articles(Article.List.all())
    |> Data.GeoJSON.to_feature_lists()
  end

  defp save_geojson(dir) do
    Enum.map(data_as_geojson(), fn {name, geojson} ->
      geojson_path = Path.join(dir, "#{name}.geojson")
      File.write!(geojson_path, Jason.encode!(geojson))
      %{name: name, geojson: geojson, geojson_path: geojson_path}
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
