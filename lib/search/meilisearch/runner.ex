defmodule Search.Meilisearch.Runner do
  require Logger
  use GenServer

  @health_check_seconds 1
  @queue_timeout_seconds 10

  @indexers [Search.Meilisearch.Articles]
  @behaviour Search.Behaviour

  @typep queued_task :: {:queued, non_neg_integer(), GenServer.from(), any()}
  @typep state :: %{
           debug: boolean(),
           db_path: binary(),
           healthy: boolean(),
           port: port() | nil,
           indexers: [module()],
           queue: [queued_task()]
         }

  @impl Search.Behaviour
  def query(query, bbox) do
    try do
      GenServer.call(__MODULE__, {:search, query, bbox}, 1000)
    catch
      :exit, err ->
        Logger.warning("MEILISEARCH | #{inspect(err)}")
        []
    end
  end

  def boot() do
    Logger.debug("MEILISEARCH | sending boot event")
    GenServer.cast(__MODULE__, :boot)
  end

  def index() do
    GenServer.call(__MODULE__, :index, :infinity)
  end

  def start_link(opts \\ []) do
    opts = Keyword.put_new(opts, :name, __MODULE__)
    is_dev = Application.get_env(:veloroute, :env) == :dev
    db_path = Path.join(:code.priv_dir(:veloroute), "meilisearch-db")

    state = %{
      debug: is_dev,
      indexers: @indexers,
      healthy: false,
      port: nil,
      db_path: db_path,
      queue: []
    }

    GenServer.start_link(__MODULE__, state, opts)
  end

  @impl GenServer
  @spec init(state()) :: {:ok, state()}
  def init(%{} = state) do
    Process.flag(:trap_exit, true)
    {:ok, state}
  end

  @impl GenServer
  @spec handle_call(any(), GenServer.from(), state()) ::
          {:reply, any(), state()} | {:noreply, state()}
  def handle_call(task, from, %{port: nil} = state) do
    state = %{state | queue: add_queued_task(state.queue, from, task)}
    {:noreply, start(state)}
  end

  def handle_call({:search, _query, _bbox} = task, from, %{healthy: false} = state) do
    Logger.warning("MEILISEARCH | not healthy, queuing search query")
    state = %{state | queue: add_queued_task(state.queue, from, task)}
    {:noreply, state}
  end

  def handle_call({:search, query, bbox}, _from, state) do
    {:reply, search(query, bbox), state}
  end

  def handle_call(:index, _from, state) do
    {:reply, :ok, index(state)}
  end

  def handle_call(term, _from, state) do
    Logger.debug("MEILISEARCH | received unknown call: #{inspect(term)}")
    {:reply, nil, state}
  end

  @impl GenServer
  @spec handle_cast(any(), state()) :: {:noreply, state()}
  def handle_cast(:boot, state) do
    Logger.debug("MEILISEARCH | received boot event")
    {:noreply, start(state)}
  end

  def handle_cast(term, state) do
    Logger.debug("MEILISEARCH | received unknown cast: #{inspect(term)}")
    {:noreply, state}
  end

  @impl GenServer
  @spec handle_info(any(), state()) :: {:noreply, state()} | {:stop, :normal, state()}
  def handle_info(:health, state) do
    {:noreply, state |> set_health_status() |> maybe_process_queue()}
  end

  def handle_info(:maybe_index, state) do
    state =
      with {:ok, have} <- Search.Meilisearch.API.list_indexes() do
        want = Enum.into(@indexers, %{}, &{to_string(&1.id()), &1})
        missing = Enum.reduce(have, want, &Map.delete(&2, &1))
        missing = Map.values(missing)

        if missing != [] do
          Logger.debug("MEILISEARCH | adding missing indexes #{inspect(missing)}")
          index(%{state | indexers: missing})
        else
          state
        end
      else
        err ->
          Logger.debug("MEILISEARCH | re-queuing index because: #{inspect(err)}")
          Process.send_after(self(), :maybe_index, @health_check_seconds * 2 * 1000)
          state
      end

    {:noreply, state}
  end

  def handle_info({port, {:data, {_flag, text}}}, %{port: port} = state) do
    if state.debug, do: Logger.info("MEILISEARCH | #{text}")
    {:noreply, state}
  end

  def handle_info({port, {:exit_status, status}}, %{port: port} = state) do
    Logger.warning("MEILISEARCH | exit code=#{status}, see above for errors")
    {:stop, :normal, shutdown(state)}
  end

  def handle_info({:EXIT, port, _reason}, %{port: port} = state) do
    Logger.warning("MEILISEARCH | exit2? #{inspect(state)}")
    {:stop, :normal, shutdown(state)}
  end

  def handle_info({:EXIT, _pid, :normal}, state) do
    {:noreply, state}
  end

  def handle_info(term, state) do
    Logger.debug("MEILISEARCH | received unknown info: #{inspect(term)}")
    {:noreply, state}
  end

  defp start(state) do
    state
    |> start_meilisearch()
    |> set_health_status()
    |> maybe_index()
  end

  defp start_meilisearch(state) do
    Logger.debug("MEILISEARCH | starting")
    Search.Meilisearch.Exe.ensure_downloaded()

    # golfed version of https://hexdocs.pm/elixir/Port.html#module-zombie-operating-system-processes
    exe = Search.Meilisearch.Exe.path()
    args = ["-c", ~s|#{exe} "$0" "$@"&P=$!;(read;kill -9 $P)<&0&M=$?;wait $P;kill -9 $M;exit $?|]

    args =
      args ++
        [
          "--no-analytics",
          "--env",
          # "development",
          "production",
          "--log-level",
          "WARN",
          "--db-path",
          state.db_path,
          "--master-key",
          Search.Meilisearch.Shared.master_key()
        ]

    port =
      Port.open(
        {:spawn_executable, "/bin/bash"},
        [
          :binary,
          :eof,
          :exit_status,
          {:line, 16384},
          :stderr_to_stdout,
          {:args, args},
          {:cd, System.tmp_dir!()}
        ]
      )

    Map.put(state, :port, port)
  end

  @spec set_health_status(state()) :: state()
  defp set_health_status(state) do
    Process.send_after(self(), :health, @health_check_seconds * 1000)
    %{state | healthy: Search.Meilisearch.API.healthy?()}
  end

  defp maybe_index(state) do
    Process.send_after(self(), :maybe_index, 0)
    state
  end

  @spec maybe_process_queue(state()) :: state()
  defp maybe_process_queue(%{queue: [queued_task | rest], healthy: true} = state) do
    {:queued, _deadline, from, task} = queued_task
    Logger.debug("MEILISEARCH | processing queued task: #{inspect(task)}")

    state =
      if expired?(queued_task) do
        Logger.warning("MEILISEARCH | queued task expired: #{inspect(task)}")
        %{state | queue: rest}
      else
        case handle_call(task, from, state) do
          {:reply, reply, state} ->
            GenServer.reply(from, reply)
            %{state | queue: rest}

          {:noreply, state} ->
            Logger.warning("MEILISEARCH | queued task failed a 2nd time: #{inspect(task)}")
            %{state | queue: rest}
        end
      end

    maybe_process_queue(state)
  end

  defp maybe_process_queue(%{queue: queue, healthy: true} = state) when queue == [] do
    # Logger.debug("MEILISEARCH | no queued items")
    state
  end

  defp maybe_process_queue(%{healthy: false} = state) do
    Logger.debug("MEILISEARCH | can't process queued tasks, as still not healthy")
    state
  end

  defp search(query, bbox) do
    %{lat: lat, lon: lon} = Geo.CheapRuler.center(bbox)

    Enum.flat_map(@indexers, fn indexer ->
      params = indexer.params(query, lat, lon)
      results = Search.Meilisearch.API.search(indexer.id(), params)
      Enum.map(results, &indexer.format/1)
    end)
  end

  @spec index(state()) :: state()
  defp index(%{indexers: []} = state), do: state

  defp index(%{indexers: [indexer | rest]} = state) do
    Search.Meilisearch.API.delete_index(indexer.id())
    :ok = Search.Meilisearch.API.create_index(indexer.id())
    :ok = Search.Meilisearch.API.configure_index(indexer.id(), indexer.config())

    docs = indexer.documents()
    :ok = Search.Meilisearch.API.index_documents(indexer.id(), docs)

    index(%{state | indexers: rest})
  end

  @spec shutdown(state()) :: state()
  defp shutdown(%{port: port} = state) when is_port(port) do
    Port.close(port)
    %{state | port: nil}
  end

  defp shutdown(state), do: state

  @spec add_queued_task([queued_task()], GenServer.from(), any()) :: [queued_task()]
  defp add_queued_task(queue, from, task), do: [{:queued, deadline(), from, task} | queue]

  defp deadline(), do: :os.system_time(:millisecond) + @queue_timeout_seconds * 1000

  @spec expired?(queued_task()) :: boolean()
  defp expired?({:queued, deadline, _from, _task}), do: :os.system_time(:millisecond) > deadline
end
