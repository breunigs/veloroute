defmodule Mix.Tasks.UpdateMapbox do
  use Mix.Task

  @prefix "veloroute-ex-"

  @shortdoc "Updates data on Mapbox from local state."
  def run(_) do
    Mix.Task.run("app.start")

    {:ok, dir_path} = Temp.mkdir("veloroutehamburgtippecanoe")

    try do
      Cache.Map.full_map()
      |> Map.Enrich.with_articles(Article.List.all())
      |> Data.GeoJSON.to_feature_lists()
      |> Enum.each(fn {name, geojson} ->
        convert_to_mbtiles(
          geojson,
          dir_path,
          name
        )
        |> Mapbox.upload_file()
      end)
    after
      File.rm_rf!(dir_path)
    end
  end

  defp determine_opts(geojson) do
    types =
      geojson[:features]
      |> Enum.reduce(MapSet.new(), fn feat, acc -> MapSet.put(acc, feat[:geometry][:type]) end)
      |> MapSet.to_list()

    if types == ["Point"],
      do: ["-d18", "-D18", "-m18", "-B0", "-z8", "-Z8"],
      else: ["-Z6", "-z13", "--drop-densest-as-needed", "--extend-zooms-if-still-dropping"]
  end

  defp convert_to_mbtiles(geojson, dir_path, name) do
    IO.puts("Updating tileset #{name}")

    geojson_path = Path.join(dir_path, "#{name}.geojson")
    File.write!(geojson_path, Jason.encode!(geojson))

    out_name = "#{@prefix}#{name}.mbtiles"
    opts = determine_opts(geojson)
    opts = opts ++ ["--no-progress-indicator", "-o", out_name, geojson_path, "-f"]
    {_out, 0} = System.cmd("tippecanoe", opts, cd: dir_path, stderr_to_stdout: true)

    Path.join(dir_path, out_name)
  end
end
