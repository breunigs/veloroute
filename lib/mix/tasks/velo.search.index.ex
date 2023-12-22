defmodule Mix.Tasks.Velo.Search.Index do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Updates Search Index"
  def run(_) do
    Search.Meilisearch.Runner.index()
  end
end
