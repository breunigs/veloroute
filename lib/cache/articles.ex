defmodule Cache.Articles do
  @glob_path "data/articles/**/*.yaml"

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  # automatically recompile if new articles are added
  # https://hexdocs.pm/mix/1.12/Mix.Tasks.Compile.Elixir.html#module-__mix_recompile__-0
  def __mix_recompile__?() do
    Path.wildcard(@glob_path) |> :erlang.md5() != unquote(paths_hash)
  end

  @get Benchmark.measure("#{__MODULE__}: loading", fn ->
         ways = Cache.Map.full_map() |> Article.article_ways()

         relation_bboxes =
           Enum.into(Cache.Map.relations(), %{}, fn
             {_rel_id, rel} ->
               id = rel.tags[:id] || Route.from_relation(rel).id()
               {id, Map.Element.bbox(rel)}
           end)

         paths
         |> Parallel.map(&Article.Parser.load/1)
         |> Parallel.map(&Article.Search.preprocess/1)
         |> Parallel.map(&Article.enrich_with_map(&1, ways, relation_bboxes))
         |> Enum.into(%{}, fn art -> {art.name, art} end)
       end)
  def get, do: @get

  def get_dated() do
    get()
    |> Enum.reject(fn {name, _art} -> String.contains?(name, "0000-00-00-") end)
    |> Enum.into(%{})
  end

  @spec find(binary()) :: Article.t() | nil
  def find(key) when is_binary(key) do
    key = String.replace(key, " ", "-")
    downkey = String.downcase(key)

    get()[key] ||
      Enum.find_value(get(), fn {name, art} ->
        if String.ends_with?(name, "-#{downkey}"), do: art
      end) ||
      Enum.find_value(get(), fn {_name, art} ->
        if Enum.member?(art.tags, key) || Enum.member?(art.tags, downkey), do: art
      end)
  end

  @doc """
  Find an Article that contains a video with exactly the given resources
  """
  @spec find_by_sources(Video.Track.plain()) :: Article.t() | nil
  def find_by_sources(sources) do
    get()
    |> Map.values()
    |> Enum.find(fn %{tracks: tracks} ->
      Enum.any?(tracks, fn %{videos: videos} -> videos == sources end)
    end)
  end
end
