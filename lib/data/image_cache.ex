defmodule Data.ImageCache do
  require Logger

  @image_path "data/images/"
  @glob_path @image_path <> "*.yaml"
  @cache_path :"data/cache/images.dets"

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  # precompute everything
  Code.ensure_compiled(Data.Image)

  Benchmark.measure("loading images", fn ->
    imgs = Data.Image.load_all(@image_path)
    keys = Map.keys(imgs)
    seqs = Data.Image.sequences(imgs)

    {:ok, table} = :dets.open_file(:image_cache, file: @cache_path, type: :set)
    :dets.insert(table, {:keys, keys})
    :dets.insert(table, {:seqs, seqs})
    for {key, val} <- imgs, do: :dets.insert(table, {key, val})
    :dets.close(table)
  end)

  def __phoenix_recompile__?() do
    Path.wildcard(@glob_path) |> :erlang.md5() != unquote(paths_hash)
  end

  use Agent

  def start_link(_ \\ nil) do
    Agent.start_link(fn -> load_cache() end, name: __MODULE__)
    |> case do
      # there are some dependency issues, because this is needed at runtime and
      # compile time and may thus run already when the application boots
      {:error, {:already_started, pid}} -> {:ok, pid}
      x -> x
    end
  end

  @spec images() :: Data.Image.indexed_images()
  def images() do
    [keys: keys] = :ets.lookup(ets(), :keys)
    images(keys)
  end

  # @spec images(route_id: [binary()]) :: Data.Image.indexed_images()
  def images(route_id: ids) when is_list(ids) or is_binary(ids) do
    ids = List.wrap(ids)
    [keys: keys] = :ets.lookup(ets(), :keys)

    keys
    |> Enum.filter(fn
      {route_id, _rest} -> Enum.member?(ids, route_id)
      :index -> true
    end)
    |> images()
  end

  # @spec images([Data.Image.route() | :index]) :: Data.Image.indexed_images()
  def images(keys) when is_list(keys) do
    Enum.map(keys, fn key ->
      :ets.lookup(ets(), key) |> hd
    end)
    |> Enum.into(%{})
  end

  def images_stream(route_id: ids) when is_list(ids) or is_binary(ids) do
    ids = List.wrap(ids)
    [keys: keys] = :ets.lookup(ets(), :keys)

    Stream.filter(keys, fn
      {route_id, _rest} -> Enum.member?(ids, route_id)
      :index -> false
    end)
    |> Stream.flat_map(fn key ->
      :ets.lookup(ets(), key) |> hd |> elem(1)
    end)
  end

  def sequences() do
    [seqs: seqs] = :ets.lookup(ets(), :seqs)
    seqs
  end

  def image_keys() do
    [keys: keys] = :ets.lookup(ets(), :keys)
    keys
  end

  defp ets do
    Agent.get(__MODULE__, & &1)
  end

  defp load_cache do
    {:ok, table} = :dets.open_file(:image_cache, file: @cache_path, type: :set, access: :read)
    ram = :ets.new(:image_cache, read_concurrency: true)
    :dets.to_ets(:image_cache, ram)
    :dets.close(table)
    ram
  end
end
