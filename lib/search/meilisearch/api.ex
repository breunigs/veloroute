defmodule Search.Meilisearch.API do
  require Logger
  use Tesla

  @index_timeout_ms 5 * 60 * 1000
  @general_timeout_ms 500

  plug Tesla.Middleware.BaseUrl, "http://localhost:7700/"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.BearerAuth, token: Search.Meilisearch.Shared.master_key()

  @adapter_opts_general [adapter: [recv_timeout: @general_timeout_ms]]
  @adapter_opts_index [adapter: [recv_timeout: @index_timeout_ms]]

  def healthy?() do
    with {:ok, %{status: 200}} <- get("/health", opts: @adapter_opts_general) do
      true
    else
      _ -> false
    end
  end

  @spec list_indexes() :: {:error, %{binary() => integer()}} | {:ok, %{binary() => integer()}}
  def list_indexes() do
    with {:ok, %{body: %{"results" => results}}} <-
           get("/indexes", opts: @adapter_opts_general) do
      indexes =
        Enum.into(results, %{}, fn %{"uid" => uid} ->
          with {:ok, count} <- get_index_doc_count(uid) do
            {uid, count}
          else
            _ -> {uid, -1}
          end
        end)

      {:ok, indexes}
    else
      err -> {:error, "failed to get indexes: #{inspect(err)}"}
    end
  end

  @spec get_index_doc_count(binary() | atom()) :: {:error, binary()} | {:ok, pos_integer()}
  def get_index_doc_count(index) do
    with {:ok, %{body: %{"numberOfDocuments" => count}}} <-
           get("/indexes/#{index}/stats", opts: @adapter_opts_general) do
      {:ok, count}
    else
      err -> {:error, "failed to get document count for index #{index}: #{inspect(err)}"}
    end
  end

  def delete_index(index) when is_atom(index) do
    delete("/indexes/#{index}", opts: @adapter_opts_general)
    |> await_finish()
  end

  def create_index(index) when is_atom(index) do
    post("/indexes", %{uid: index}, opts: @adapter_opts_general)
    |> await_finish()
  end

  def configure_index(index, config) when is_atom(index) and is_map(config) do
    patch("/indexes/#{index}/settings", config)
    |> await_finish()
  end

  def index_documents(index, documents) when is_atom(index) and is_list(documents) do
    Logger.debug("index=#{index}: adding #{length(documents)} documents")

    post("/indexes/#{index}/documents", documents, opts: @adapter_opts_index)
    |> await_finish()
  end

  @valid_content_types ["application/json", "application/x-ndjson", "text/csv"]
  def index_documents(index, {content_type, blob})
      when is_atom(index) and content_type in @valid_content_types and is_binary(blob) do
    size = round(byte_size(blob) / 1024 / 1024)
    Logger.debug("index=#{index}: adding documents from #{size} MB blob")

    post("/indexes/#{index}/documents", blob,
      headers: [{"content-type", content_type}],
      opts: @adapter_opts_index
    )
    |> await_finish()
  end

  @spec search(atom, map()) :: list()
  def search(index, params) when is_atom(index) do
    params = Map.put_new(params, "showRankingScore", true)

    with {:ok, %{body: %{"hits" => results}}} <-
           post("/indexes/#{index}/search", params, opts: @adapter_opts_general) do
      results
    else
      other ->
        Logger.warning("failed to query for #{inspect(params)}. Result: #{inspect(other)}")

        []
    end
  end

  @spec multi_search(%{atom() => map()}) :: %{atom() => list()}
  def multi_search(queries) do
    payload = %{
      "queries" =>
        Enum.map(queries, fn {index, params} ->
          params
          |> Map.put_new("showRankingScore", true)
          |> Map.put("indexUid", index)
        end)
    }

    with {:ok, %{body: %{"results" => results}}} <-
           post("/multi-search", payload, opts: @adapter_opts_general) do
      Enum.into(results, %{}, fn %{"indexUid" => index, "hits" => hits} ->
        {String.to_existing_atom(index), hits}
      end)
    else
      other ->
        Logger.warning("failed to multi-query for #{inspect(payload)}. Result: #{inspect(other)}")

        []
    end
  end

  @spec await_finish(any) :: :ok | {:error, binary()}
  defp await_finish({:ok, %{body: %{"status" => "succeeded"}}}), do: :ok
  defp await_finish({:ok, %{body: %{"status" => "failed"} = body}}), do: {:error, inspect(body)}

  defp await_finish({:ok, %{status: status, body: %{"taskUid" => uid}}})
       when status >= 200 and status <= 299 and is_integer(uid) do
    await_finish(uid)
  end

  defp await_finish({:ok, %{status: status, body: %{"uid" => uid}}})
       when status >= 200 and status <= 299 and is_integer(uid) do
    await_finish(uid)
  end

  defp await_finish(uid) when is_integer(uid) do
    Process.sleep(100)
    get("/tasks/#{uid}", opts: @adapter_opts_general) |> await_finish()
  end

  defp await_finish(other), do: {:error, inspect(other)}
end
