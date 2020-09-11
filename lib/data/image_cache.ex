defmodule Data.ImageCache do
  require Logger

  @image_path "data/images/"
  @glob_path @image_path <> "*.yaml"

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  IO.puts("Recompiling images (md5: #{paths_hash |> Base.encode16()})")
  @imgs Data.Image.load_all(@image_path)
  @seqs Data.Image.sequences(@imgs)

  def __phoenix_recompile__?() do
    Path.wildcard(@glob_path) |> :erlang.md5() != unquote(paths_hash)
  end

  @spec images() :: Data.Image.indexed_images()
  def images() do
    @imgs
  end

  # @spec images(route_id: [binary()]) :: Data.Image.indexed_images()
  def images(route_id: ids) when is_list(ids) or is_binary(ids) do
    ids = List.wrap(ids)

    Map.keys(@imgs)
    |> Enum.filter(fn
      {route_id, _rest} -> Enum.member?(ids, route_id)
      :index -> true
    end)
    |> images()
  end

  # @spec images([Data.Image.route() | :index]) :: Data.Image.indexed_images()
  def images(keys) when is_list(keys) do
    Map.take(@imgs, keys)
  end

  def images_stream(route_id: ids) when is_list(ids) or is_binary(ids) do
    ids = List.wrap(ids)

    Stream.filter(Map.keys(@imgs), fn
      {route_id, _rest} -> Enum.member?(ids, route_id)
      :index -> false
    end)
    |> Stream.flat_map(fn key ->
      @imgs[key]
    end)
  end

  def sequences() do
    @seqs
  end

  def image_keys() do
    Map.keys(@imgs)
  end
end
