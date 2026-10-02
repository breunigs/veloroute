defmodule Mix.Tasks.Velo.Map.Refresh do
  use Mix.Task
  require Logger

  @requirements ["app.start"]
  @shortdoc "Re-downloads the OSM source and re-renders the basemap"
  def run(_) do
    Logger.info("marking OSM source as outdated")
    :ok = Basemap.OpenStreetMap.expire_osm_source()

    Logger.info("ensuring map tiles exists")
    Basemap.Servable.ensure()
  end
end
