defmodule Search.Meilisearch.Shared do
  # Meilisearch is reverse proxy'd and not directly exposed, so we don't care
  def master_key, do: "fakefakefakefake"
end
