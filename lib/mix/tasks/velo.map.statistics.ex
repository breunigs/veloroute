defmodule Mix.Tasks.Velo.Map.Statistics do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Shows statistics about the fields of the basemap"
  def run(_) do
    Basemap.OpenStreetMap.statistics()
    |> JSON.encode!()
    |> IO.puts()
  end
end
