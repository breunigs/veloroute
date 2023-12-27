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

  @spec query(binary() | nil, Geo.BoundingBox.like()) :: [Search.Result.t()]
  def query(nil, _bbox), do: []
  def query("", _bbox), do: []

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
    Logger.info("MEILISEARCH | sending boot event")
    GenServer.cast(__MODULE__, :boot)
  end

  @doc """
  Indexes from any indexer that was not yet run
  """
  def index() do
    no_indexing_in_prod!()
    GenServer.call(__MODULE__, :index, :infinity)
  end

  @doc """
  Re-runs all existing indexers, but does not clean up stale data
  """
  def reindex() do
    GenServer.call(__MODULE__, :reindex, :infinity)
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

  def handle_call(:reindex, _from, state) do
    Logger.debug("MEILISEARCH | re-indexing")
    {:reply, :ok, index(%{state | indexers: @indexers})}
  end

  def handle_call(term, _from, state) do
    Logger.warning("MEILISEARCH | received unknown call: #{inspect(term)}")
    {:reply, nil, state}
  end

  @impl GenServer
  @spec handle_cast(any(), state()) :: {:noreply, state()}
  def handle_cast(:boot, state) do
    Logger.debug("MEILISEARCH | received boot event")
    {:noreply, start(state)}
  end

  def handle_cast(term, state) do
    Logger.warning("MEILISEARCH | received unknown cast: #{inspect(term)}")
    {:noreply, state}
  end

  @impl GenServer
  @spec handle_info(any(), state()) :: {:noreply, state()} | {:stop, :normal, state()}
  def handle_info(:health, state) do
    {:noreply, state |> set_health_status() |> maybe_process_queue()}
  end

  def handle_info(:maybe_index, %{healthy: true} = state) do
    state =
      with {:ok, have} <- Search.Meilisearch.API.list_indexes() do
        have = have |> Map.reject(fn {_k, count} -> count <= 0 end) |> Map.keys()
        want = Enum.into(@indexers, %{}, &{to_string(&1.id()), &1})
        missing = Enum.reduce(have, want, &Map.delete(&2, &1))
        missing = Map.values(missing)

        if missing != [] do
          Logger.info("MEILISEARCH | adding missing indexes #{inspect(missing)}")
          index(%{state | indexers: missing})
        else
          state
        end
      else
        {:error, err} ->
          Logger.debug("MEILISEARCH | failed to check existing indexes #{inspect(err)}")
          Process.send_after(self(), :maybe_index, 1000)
          state
      end

    {:noreply, state}
  end

  def handle_info(:maybe_index, state) do
    Process.send_after(self(), :maybe_index, 1000)
    {:noreply, state}
  end

  def handle_info({port, {:data, {_flag, text}}}, %{port: port} = state) do
    level = if String.contains?(String.downcase(text), "error"), do: :warning, else: :info
    if level == :warning || state.debug, do: Logger.log(level, "MEILISEARCH | #{text}")
    {:noreply, state}
  end

  def handle_info({port, {:exit_status, status}}, %{port: port} = state) do
    Logger.warning(
      "MEILISEARCH | exit code=#{status}, see above for errors or re-run with debug logs"
    )

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
    Logger.warning("MEILISEARCH | received unknown info: #{inspect(term)}")
    {:noreply, state}
  end

  defp start(state) do
    state
    |> start_meilisearch()
    |> set_health_status()
    |> maybe_index()
  end

  defp start_meilisearch(state) do
    Logger.info("MEILISEARCH | starting")
    Search.Meilisearch.Exe.ensure_downloaded()

    # golfed version of https://hexdocs.pm/elixir/Port.html#module-zombie-operating-system-processes
    exe = Search.Meilisearch.Exe.path()
    args = ["-c", ~s|#{exe} "$0" "$@"&P=$!;(read;kill -9 $P)<&0&M=$?;wait $P;kill -9 $M;exit $?|]

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
          "1Gb",
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
        GenServer.reply(from, {:error, "the tasked #{inspect(task)} timed out"})
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

    lookup = Enum.into(@indexers, %{}, &{&1.id(), &1})

    @indexers
    |> Enum.into(%{}, fn indexer ->
      {indexer.id(), indexer.params(query, lat, lon)}
    end)
    |> Search.Meilisearch.API.multi_search()
    |> Enum.flat_map(fn {index, results} ->
      indexer = lookup[index]

      results =
        if function_exported?(indexer, :maybe_merge, 1),
          do: indexer.maybe_merge(results),
          else: results

      Enum.map(results, fn result ->
        sr = indexer.format(result)
        Map.put(sr, :source, inspect(result, pretty: true))
      end)
    end)
    |> Util.compact()
  end

  @spec index(state()) :: state()
  defp index(%{indexers: []} = state), do: state

  defp index(%{indexers: indexers} = state) do
    no_indexing_in_prod!()

    Parallel.map(indexers, &indexer_run(&1))
    |> Enum.each(fn
      {:ok, indexer} ->
        Logger.debug("MEILISEARCH | indexed #{indexer} ✓")

      {:error, indexer, reason} ->
        Logger.error("MEILISEARCH | failed to index #{indexer}: #{reason}")
    end)

    queue =
      Enum.reject(state.queue, fn {:queued, _deadline, from, task} ->
        if task == :index, do: GenServer.reply(from, :ok)
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
    if Application.get_env(:veloroute, :env) == :prod,
      do: raise("cannot index search items in production")
  end
end
