defmodule Data.ArticleCache do
  @glob_path "data/articles/**/*.yaml"

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  def __phoenix_recompile__?() do
    Path.wildcard(@glob_path) |> :erlang.md5() != unquote(paths_hash)
  end

  @get Benchmark.measure("loading articles", fn ->
         Data.Article.load_all(paths)
       end)
  def get, do: @get

  def get_dated() do
    get()
    |> Enum.reject(fn {name, _art} -> String.contains?(name, "0000-00-00-") end)
    |> Enum.into(%{})
  end
end
