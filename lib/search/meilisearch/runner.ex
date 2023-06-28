defmodule Search.Meilisearch.Runner do
  require Logger
  use GenServer

  @indexers [Search.Meilisearch.Articles]
  @behaviour Search.Behaviour

  @impl Search.Behaviour
  def query(query, bbox) do
    try do
      GenServer.call(__MODULE__, {:search, query, bbox}, 1000)
    catch
      :exit, err ->
        Logger.warning("MEILISEARCH #{inspect(err)}")
        []
    end
  end

  def boot() do
    Logger.debug("MEILISEARCH: sending boot event")
    GenServer.cast(__MODULE__, :boot)
  end

  def index() do
    GenServer.call(__MODULE__, :index, :infinity)
  end

  def start_link(opts \\ []) do
    opts = Keyword.put_new(opts, :name, __MODULE__)
    state = %{print: false, indexers: @indexers}
    GenServer.start_link(__MODULE__, state, opts)
  end

  @impl GenServer
  def init(%{} = state) do
    Process.flag(:trap_exit, true)
    {:ok, state}
  end

  @impl GenServer
  def handle_call({:search, query, bbox}, _from, state) do
    state = ensure_started(state)

    %{lat: lat, lon: lon} = Geo.CheapRuler.center(bbox)

    res =
      @indexers
      |> Enum.flat_map(fn indexer ->
        params = indexer.params(query, lat, lon)
        results = Search.Meilisearch.API.search(indexer.id(), params)
        Enum.map(results, &indexer.format/1)
      end)

    {:reply, res, state}
  end

  def handle_call(:index, _from, state) do
    {:reply, :ok, state |> ensure_started() |> index()}
  end

  def handle_call(term, _from, state) do
    Logger.debug("MEILISEARCH: received unknown call: #{inspect(term)}")
    {:reply, nil, state}
  end

  @impl GenServer
  def handle_cast(:boot, state) do
    Logger.debug("MEILISEARCH: received boot event")
    {:noreply, ensure_started(state)}
  end

  def handle_cast(term, state) do
    Logger.debug("MEILISEARCH: received unknown cast: #{inspect(term)}")
    {:noreply, state}
  end

  @impl GenServer
  def handle_info({port, {:data, {_flag, text}}}, %{port: port} = state) do
    if state.print, do: Logger.info("MEILISEARCH | #{text}")
    {:noreply, state}
  end

  def handle_info({port, {:exit_status, _}}, %{port: port} = state) do
    IO.puts("exit1? #{inspect(state)}")
    {:stop, :normal, cleanup(state)}
  end

  def handle_info({:EXIT, port, _reason}, %{port: port} = state) do
    IO.puts("exit2? #{inspect(state)}")
    {:stop, :normal, cleanup(state)}
  end

  def handle_info({:EXIT, _pid, :normal}, state) do
    {:noreply, state}
  end

  def handle_info(term, state) do
    Logger.debug("MEILISEARCH: received unknown info: #{inspect(term)}")

    {:noreply, state}
  end

  defp ensure_started(state) do
    state
    |> ensure_db_path()
    |> ensure_running()
    |> wait_until_healthy(max_tries: 10)
  end

  defp ensure_running(%{port: port} = state) when not is_nil(port), do: state

  defp ensure_running(state) do
    Search.Meilisearch.Exe.ensure_downloaded()

    # golfed version of https://hexdocs.pm/elixir/Port.html#module-zombie-operating-system-processes
    exe = Search.Meilisearch.Exe.path()
    args = ["-c", ~s|#{exe} "$0" "$@" & PID=$!; read a; kill -KILL $PID|]
    args = if :os.type() == {:unix, :freebsd}, do: args ++ ["--"], else: args

    args =
      args ++
        [
          "--no-analytics",
          "--env",
          # "development",
          "production",
          "--db-path",
          state.db_path,
          "--master-key",
          Search.Meilisearch.Shared.master_key()
        ]

    port =
      Port.open(
        {:spawn_executable, "/bin/sh"},
        [
          :binary,
          :exit_status,
          {:line, 16384},
          :stderr_to_stdout,
          {:args, args},
          {:cd, System.tmp_dir!()}
        ]
      )

    Process.link(port)

    Map.put(state, :port, port)
  end

  defp wait_until_healthy(%{healthy: true} = state, max_tries: _), do: state
  defp wait_until_healthy(state, max_tries: 0), do: state

  defp wait_until_healthy(state, max_tries: tries) do
    state = update_healthy_status(state)

    if state.healthy do
      state
    else
      Process.sleep(1000)
      wait_until_healthy(state, max_tries: tries - 1)
    end
  end

  defp update_healthy_status(state),
    do: Map.put(state, :healthy, Search.Meilisearch.API.healthy?())

  defp index(%{indexers: []} = state), do: state

  defp index(%{indexers: [indexer | rest]} = state) do
    Search.Meilisearch.API.delete_index(indexer.id())
    :ok = Search.Meilisearch.API.create_index(indexer.id())
    :ok = Search.Meilisearch.API.configure_index(indexer.id(), indexer.config())

    docs = indexer.documents()
    :ok = Search.Meilisearch.API.index_documents(indexer.id(), docs)

    index(%{state | indexers: rest})
  end

  defp ensure_db_path(%{db_path: path} = state) when is_binary(path), do: state

  defp ensure_db_path(state),
    do: Map.put(state, :db_path, Path.join(:code.priv_dir(:veloroute), "meilisearch-db"))

  defp cleanup(%{db_path: path} = state) when is_binary(path) do
    File.rm_rf(path)
    %{state | db_path: nil}
  end

  defp cleanup(state), do: state
end
