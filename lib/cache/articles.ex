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

  def find(key) when is_binary(key) do
    key = key |> String.downcase() |> String.replace(" ", "-")

    get()[key] ||
      Enum.find(get(), fn {name, art} ->
        cond do
          String.ends_with?(name, "-" <> key) -> art
          Enum.member?(art.tags, key) -> art
          true -> nil
        end
      end)
  end
end
