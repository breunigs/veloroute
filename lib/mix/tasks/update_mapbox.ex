defmodule Mix.Tasks.UpdateMapbox do
  use Mix.Task

  @shortdoc "Updates data on Mapbox from local state."
  def run(_) do
    Application.ensure_all_started(:hackney)

    Data.map()
    |> Data.Map.to_feature_list(Data.articles())
    |> Jason.encode!()
    |> convert_to_mbtiles(
      "veloroute-routes",
      ["-zg", "--drop-densest-as-needed", "--extend-zooms-if-still-dropping"]
    )
    |> Mapbox.upload_file("veloroute-routes")

    require IEx
    IEx.pry()
  end

  defp convert_to_mbtiles(geojson, name, opts) do
    IO.puts("Updating tileset #{name}")
    {:ok, dir_path} = Temp.mkdir("veloroutehamburgtippecanoe")

    geojson_path = Path.join(dir_path, "input.geojson")
    File.write!(geojson_path, geojson)

    out_name = "#{name}.mbtiles"
    opts = opts ++ ["--no-progress-indicator", "-o", out_name, geojson_path, "-f"]
    {_out, 0} = System.cmd("tippecanoe", opts, cd: dir_path, stderr_to_stdout: true)

    Path.join(dir_path, out_name)
  end
end
