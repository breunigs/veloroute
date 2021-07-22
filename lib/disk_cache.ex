defmodule DiskCache do
  use Agent

  @cache_dir "data/cache"
  @allowed [:overpass]

  def lazy(namespace, cache_key, func) do
    try do
      start_link()
      get_or_write(namespace, cache_key, func)
    rescue
      err ->
        IO.warn("Failed to resolve #{namespace} #{cache_key}, retrying once (#{inspect(err)})")
        get_or_write(namespace, cache_key, func)
    end
  end

  defp start_link() do
    Agent.start(
      fn ->
        Process.flag(:trap_exit, true)
        %{}
      end,
      name: __MODULE__
    )
    |> case do
      {:ok, pid} -> pid
      {:error, {:already_started, pid}} -> pid
    end
  end

  defp get_or_write(namespace, cache_key, func) do
    Agent.update(__MODULE__, fn open_tables -> ensure_open(open_tables, namespace) end)
    get(namespace, cache_key) || write(namespace, cache_key, func)
  end

  defp get(namespace, cache_key) when namespace in @allowed do
    Agent.get(
      __MODULE__,
      fn _open_tables ->
        :dets.lookup(namespace, cache_key)
        |> case do
          [{^cache_key, res}] -> res
          _ -> nil
        end
      end,
      5 * 60 * 1000
    )
  end

  defp write(namespace, cache_key, func) when namespace in @allowed do
    res = func.()

    Agent.get(
      __MODULE__,
      fn _open_tables ->
        :ok =
          :dets.insert(namespace, {cache_key, res})
          |> case do
            :ok ->
              :ok

            {:error, err} ->
              IO.warn(
                "Encountered dets(#{namespace}) error: #{inspect(err)}, trying to close/reopen"
              )

              :dets.close(namespace)
              open(namespace)
              :dets.insert(namespace, {cache_key, res})
          end

        :ok = :dets.sync(namespace)
      end,
      5 * 60 * 1000
    )

    res
  end

  defp ensure_open(open_tables, namespace) do
    if open_tables[namespace] do
      open_tables
    else
      Map.put(open_tables, open(namespace), true)
    end
  end

  defp open(namespace) do
    path = String.to_atom("#{@cache_dir}/v2_#{namespace}.dets")
    IO.puts("Opening disk cache #{path}")
    {:ok, ^namespace} = :dets.open_file(namespace, file: path, type: :set)

    # ets = :ets.new(:temp, [])
    # :dets.to_ets(namespace, ets)
    # :ets.tab2list(ets) |> Enum.map(&elem(&1, 0)) |> IO.inspect()

    namespace
  end
end
