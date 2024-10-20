defmodule Search.Meilisearch.Runner do
  require Logger
  use GenServer

  import Guards

  @debug_meilisearch_output false

  @health_check_seconds 1
  @queue_timeout_seconds 10

  @indexers [Search.Meilisearch.Articles, Search.Meilisearch.Nominatim]

  @typep queued_task :: {:queued, non_neg_integer(), GenServer.from(), any()}
  @typep state :: %{
           debug: boolean(),
           db_path: binary(),
           healthy: boolean(),
           port: port() | nil,
           indexers: [module()],
           queue: [queued_task()]
         }

  @spec query(binary() | nil, Geo.BoundingBox.like()) ::
          {:ok, [Search.Result.t()]} | {:error, binary()}
  def query(nil, _bbox), do: {:ok, []}
  def query("", _bbox), do: {:ok, []}

  def query(query, bbox) do
    try do
      GenServer.call(__MODULE__, {:search, query, bbox}, :infinity)
    catch
      :exit, err -> {:error, inspect(err)}
    end
  end

  def boot() do
    Logger.info("sending boot event")
    GenServer.cast(__MODULE__, :boot)
  end

  @doc """
  Indexes from any indexer that was not yet run
  """
  def index_outdated() do
    no_indexing_in_prod!()
    GenServer.call(__MODULE__, :index_outdated, :infinity)
  end

  def start_link(opts \\ []) do
    opts = Keyword.put_new(opts, :name, __MODULE__)
    is_dev = Application.get_env(:veloroute, :env) == :dev

    db_path =
      Path.join(:code.priv_dir(:veloroute), "meilisearch-db-#{Search.Meilisearch.Exe.version()}")

    :ok = File.mkdir_p(db_path)

    state = %{
      debug: @debug_meilisearch_output && is_dev,
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
    Logger.warning("not healthy, queuing search query")
    state = %{state | queue: add_queued_task(state.queue, from, task)}
    {:noreply, state}
  end

  def handle_call({:search, query, bbox}, _from, state) do
    {:reply, search(query, bbox), state}
  end

  def handle_call(:index_outdated, _from, state) do
    {_result, state} = index_outdated(state)
    {:reply, :ok, state}
  end

  def handle_call(term, _from, state) do
    Logger.warning("received unknown call: #{inspect(term)}")
    {:reply, nil, state}
  end

  @impl GenServer
  @spec handle_cast(any(), state()) :: {:noreply, state()}
  def handle_cast(:boot, state) do
    Logger.debug("received boot event")
    {:noreply, start(state)}
  end

  def handle_cast(term, state) do
    Logger.warning("received unknown cast: #{inspect(term)}")
    {:noreply, state}
  end

  @impl GenServer
  @spec handle_info(any(), state()) :: {:noreply, state()} | {:stop, :normal, state()}
  def handle_info(:health, state) do
    {:noreply, state |> set_health_status() |> maybe_process_queue()}
  end

  def handle_info(:index_outdated_once_healthy, %{healthy: true} = state) do
    state =
      case index_outdated(state) do
        {:ok, state} ->
          state

        {:error, state} ->
          Process.send_after(self(), :index_outdated_once_healthy, 1000)
          state
      end

    {:noreply, state}
  end

  def handle_info(:index_outdated_once_healthy, state) do
    Process.send_after(self(), :index_outdated_once_healthy, 1000)
    {:noreply, state}
  end

  def handle_info({port, {:data, {_flag, text}}}, %{port: port} = state) do
    level = if String.contains?(String.downcase(text), "error"), do: :warning, else: :info
    if level == :warning || state.debug, do: Logger.log(level, "#{text}")
    {:noreply, state}
  end

  def handle_info({port, {:exit_status, status}}, %{port: port} = state) do
    Logger.warning("exit code=#{status}, see above for errors or re-run with debug logs")

    {:stop, :normal, shutdown(state)}
  end

  def handle_info({:EXIT, port, _reason}, %{port: port} = state) do
    Logger.warning("exit2? #{inspect(state)}")
    {:stop, :normal, shutdown(state)}
  end

  def handle_info({:EXIT, _pid, :normal}, state) do
    {:noreply, state}
  end

  def handle_info(term, state) do
    Logger.warning("received unknown info: #{inspect(term)}")
    {:noreply, state}
  end

  defp outdated?(indexer, meili_index_meta)
  defp outdated?(_indexer, nil), do: true
  defp outdated?(_indexer, %{documents: count}) when count <= 0, do: true

  defp outdated?(indexer, %{updated_at: index_at}) when is_module(indexer) do
    # In production, it's likely that:
    # 1) source files are absent
    # 2) file times were modified and don't reflect recency
    # 3) outdated search index beats re-indexing on container/app start
    # Hence we don't check for outdated in prod.
    !in_prod?() && DateTime.compare(index_at, indexer.updated_at()) == :lt
  end

  @spec index_outdated(state()) :: {:ok | :error, state()}
  defp index_outdated(state) do
    with {:ok, have} <- Search.Meilisearch.API.list_indexes() do
      missing = Enum.filter(@indexers, &outdated?(&1, have[to_string(&1.id())]))

      if missing != [] do
        Logger.info("updating outdated indexes #{inspect(missing)}")
        {:ok, index(%{state | indexers: missing})}
      else
        {:ok, state}
      end
    else
      {:error, err} ->
        Logger.debug("failed to check existing indexes #{inspect(err)}")
        {:error, state}
    end
  end

  defp start(state) do
    state
    |> start_meilisearch()
    |> set_health_status()
    |> index_outdated_once_healthy()
  end

  @ulimit "ulimit -Sn 300000"

  defp start_meilisearch(state) do
    Logger.info("starting")
    Search.Meilisearch.Exe.ensure_downloaded()

    exe = Search.Meilisearch.Exe.path()

    args = [
      "-c",
      # golfed version of https://hexdocs.pm/elixir/Port.html#module-zombie-operating-system-processes
      ~s|#{@ulimit}; #{exe} "$0" "$@"&P=$!;(read;kill -9 $P)<&0&M=$?;wait $P;kill -9 $M;exit $?|
    ]

    args =
      args ++
        [
          "--no-analytics",
          "--env",
          if(Application.get_env(:veloroute, :env) == :prod,
            do: "production",
            else: "development"
          ),
          # use all available cores for indexing as opposed to the 50% default,
          # since we do not run indexing in production anyway
          "--max-indexing-threads",
          "#{System.schedulers_online()}",
          "--log-level",
          "WARN",
          "--http-payload-size-limit",
          "10Gb",
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
          {:line, 16_384},
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

  defp index_outdated_once_healthy(state) do
    Process.send_after(self(), :index_outdated_once_healthy, 0)
    state
  end

  @spec maybe_process_queue(state()) :: state()
  defp maybe_process_queue(%{queue: [queued_task | rest], healthy: true} = state) do
    {:queued, _deadline, from, task} = queued_task
    Logger.debug("processing queued task: #{inspect(task)}")

    state =
      if expired?(queued_task) do
        Logger.warning("queued task expired: #{inspect(task)}")
        GenServer.reply(from, {:error, "the tasked #{inspect(task)} timed out"})
        %{state | queue: rest}
      else
        case handle_call(task, from, state) do
          {:reply, reply, state} ->
            GenServer.reply(from, reply)
            %{state | queue: rest}

          {:noreply, state} ->
            Logger.warning("queued task failed a 2nd time: #{inspect(task)}")
            %{state | queue: rest}
        end
      end

    maybe_process_queue(state)
  end

  defp maybe_process_queue(%{queue: queue, healthy: true} = state) when queue == [] do
    # Logger.debug("no queued items")
    state
  end

  defp maybe_process_queue(%{healthy: false} = state) do
    Logger.debug("can't process queued tasks, as still not healthy")
    state
  end

  @min_relevance 0.5
  defp search(query, bbox) do
    %{lat: lat, lon: lon} = Geo.CheapRuler.center(bbox)

    @indexers
    |> Enum.into(%{}, fn indexer ->
      {indexer.id(), indexer.params(query, lat, lon)}
    end)
    |> Search.Meilisearch.API.multi_search(@min_relevance)
    |> post_process()
  end

  defp post_process({:ok, list}) do
    lookup = Enum.into(@indexers, %{}, &{&1.id(), &1})

    {:ok,
     Enum.flat_map(list, fn {index, results} ->
       indexer = lookup[index]

       results =
         if function_exported?(indexer, :maybe_merge, 1),
           do: indexer.maybe_merge(results),
           else: results

       Enum.map(results, fn result ->
         sr = indexer.format(result)
         if sr, do: Map.put(sr, :source, inspect(result, pretty: true))
       end)
     end)
     |> Util.compact()
     |> Search.Result.merge_same()
     |> Search.Result.sort()}
  end

  defp post_process({:error, reason}), do: {:error, reason}

  @spec index(state()) :: state()
  defp index(%{indexers: []} = state), do: state

  defp index(%{indexers: indexers} = state) do
    no_indexing_in_prod!()

    Parallel.map(indexers, &indexer_run(&1))
    |> Enum.each(fn
      {:ok, indexer} ->
        Logger.debug("indexed #{indexer} ✓")

      {:error, indexer, reason} ->
        Logger.error("failed to index #{indexer}: #{reason}")
        raise("index failure, see error message above")
    end)

    queue =
      Enum.reject(state.queue, fn {:queued, _deadline, from, task} ->
        if task == :index_outdated, do: GenServer.reply(from, :ok)
      end)

    %{state | indexers: [], queue: queue}
  end

  @spec indexer_run(module()) :: {:ok, module()} | {:error, module(), binary()}
  defp indexer_run(indexer) when is_module(indexer) do
    Search.Meilisearch.API.delete_index(indexer.id())

    with :ok <- Search.Meilisearch.API.create_index(indexer.id()),
         :ok <- Search.Meilisearch.API.configure_index(indexer.id(), indexer.config()),
         docs = indexer.documents(),
         :ok <- Search.Meilisearch.API.index_documents(indexer.id(), docs) do
      {:ok, indexer}
    else
      {:error, reason} -> {:error, indexer, reason}
    end
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

  defp no_indexing_in_prod! do
    if in_prod?(), do: raise("cannot index search items in production")
  end

  defp in_prod?(), do: Application.get_env(:veloroute, :env) == :prod
end
