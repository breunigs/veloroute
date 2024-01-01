defmodule Mix.Tasks.Velo.Map.Ensure do
  use Mix.Task
  require Logger

  @requirements ["app.start"]
  @shortdoc "Ensures the basemap exists"
  def run(_) do
    Logger.info("ensuring map tiles exists")
    Basemap.Servable.ensure()
  end
end
