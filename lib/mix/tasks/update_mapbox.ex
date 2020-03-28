defmodule Mix.Tasks.UpdateMapbox do
  use Mix.Task

  # mix runs from root directory
  @root_dir File.cwd!()

  @shortdoc "Updates data on Mapbox from local state."
  def run(_) do
    geojson =
      Data.map()
      |> Data.Map.to_feature_list()
      |> Jason.encode!()

    File.write!("#{@root_dir}/tmp/mapbox_routes.geojson", geojson)
  end
end
