defmodule DiskCache do
  use Agent

  @cache_dir "data/cache"
  @allowed [:mapillary, :overpass]

  def lazy(namespace, cache_key, func) do
    start_link()
    get(namespace, cache_key) || write(namespace, cache_key, func)
  end

  defp start_link() do
    Agent.start(
      fn ->
        Process.flag(:trap_exit, true)
        Enum.map(@allowed, &open/1)
      end,
      name: __MODULE__
    )
    |> case do
      {:ok, pid} -> pid
      {:error, {:already_started, pid}} -> pid
    end
  end

  defp get(namespace, cache_key) when namespace in @allowed do
    Agent.get(__MODULE__, fn _open_tables ->
      :dets.lookup(namespace, cache_key)
      |> case do
        [{^cache_key, res}] -> res
        _ -> nil
      end
    end)
  end

  defp write(namespace, cache_key, func) when namespace in @allowed do
    res = func.()

    if res do
      Agent.get(__MODULE__, fn _open_tables ->
        :dets.insert_new(namespace, {cache_key, res})
        :dets.sync(namespace)
      end)
    end

    res
  end

  defp open(namespace) do
    path = String.to_atom("#{@cache_dir}/v2_#{namespace}.dets")
    IO.puts("Opening disk cache #{path}")
    {:ok, ^namespace} = :dets.open_file(namespace, file: path, type: :set)
    namespace
  end
end
