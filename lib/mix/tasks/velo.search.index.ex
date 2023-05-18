defmodule Mix.Tasks.Velo.Search.Index do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Updates Search Index"
  def run(_) do
    # Search.Meilisearch.Runner.start_link()
    Search.Meilisearch.Exe.ensure_downloaded()
    Search.Meilisearch.Runner.index()
  end
end
