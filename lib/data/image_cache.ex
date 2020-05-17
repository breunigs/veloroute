defmodule Data.ImageCache do
  require Logger

  @image_path "data/images/"
  @glob_path @image_path <> "*.yaml"
  @cache_path String.to_atom("data/cache/images.dets")

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  # precompute everything
  Code.ensure_compiled(Data.Image)

  Benchmark.measure("loading images", fn ->
    imgs = Data.Image.load_all(@image_path)
    seqs = Data.Image.sequences(imgs)
    {:ok, table} = :dets.open_file(:image_cache, file: @cache_path, type: :set)
    :dets.insert_new(table, {:imgs, imgs})
    :dets.insert_new(table, {:seqs, seqs})
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

  def images() do
    [imgs: imgs] = :ets.lookup(ets(), :imgs)
    imgs
  end

  def sequences() do
    [seqs: seqs] = :ets.lookup(ets(), :seqs)
    seqs
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
