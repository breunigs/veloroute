defmodule Search.Meilisearch.API do
  require Logger
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://localhost:7700/"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.BearerAuth, token: Search.Meilisearch.Shared.master_key()
  plug Tesla.Middleware.Timeout, timeout: 2_000

  def healthy?() do
    with {:ok, %{status: 200}} <- get("/health") do
      true
    else
      _ -> false
    end
  end

  @spec list_indexes() :: {:error, binary()} | {:ok, [binary()]}
  def list_indexes() do
    with {:ok, %{body: %{"results" => results}}} <- get("/indexes") do
      indexes = Enum.map(results, &Map.get(&1, "uid"))
      {:ok, indexes}
    else
      err -> {:error, "failed to get indexes: #{inspect(err)}"}
    end
  end

  def delete_index(index) when is_atom(index) do
    delete("/indexes/#{index}")
    |> await_finish()
  end

  def create_index(index) when is_atom(index) do
    post("/indexes", %{uid: index})
    |> await_finish()
  end

  def configure_index(index, config) when is_atom(index) and is_map(config) do
    patch("/indexes/#{index}/settings", config)
    |> await_finish()
  end

  def index_documents(index, documents) when is_atom(index) and is_list(documents) do
    Logger.debug("MEILISEARCH: adding #{length(documents)} into #{index}")

    post("/indexes/#{index}/documents", documents)
    |> await_finish()
  end

  @spec search(atom, map()) :: list()
  def search(index, params) when is_atom(index) do
    with {:ok, %{body: %{"hits" => results}}} <- post("/indexes/#{index}/search", params) do
      results
    else
      other ->
        Logger.warning(
          "MEILISEARCH: failed to query for #{inspect(params)}. Result: #{inspect(other)}"
        )

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
    get("/tasks/#{uid}") |> await_finish()
  end

  defp await_finish(other), do: {:error, inspect(other)}
end
