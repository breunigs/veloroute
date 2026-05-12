defmodule Mix.Tasks.Velo.Search.Index do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Updates Search Index"
  def run(_) do
    Basemap.Nominatim.ensure()
    Search.Meilisearch.Runner.index_outdated()
  end
end
