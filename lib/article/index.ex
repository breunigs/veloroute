defmodule Article.Index do
  use Agent

  def start_link(_opts) do
    articles = Article.List.all()

    indexes = %{
      tags: index_by(articles, & &1.tags()),
      handle: index_by(articles, &[&1.id(), &1.name()]),
      display_id: index_by(articles, &[&1.display_id()]),
      route_group: index_by(articles, &[&1.route_group()]),
      type: index_by(articles, &[&1.type()]),
      has_tracks?: index_by(articles, &[&1.tracks() != []]),
      sources: index_by(articles, &article_sources/1),
      category: index_by(articles, &[Article.category(&1)])
    }

    Agent.start_link(fn -> indexes end, name: __MODULE__)
  end

  @type search_term() :: any()
  @type index_name() :: :tags | :handle | :display_id | :sources | :category

  @type finder() :: :any | :all | :sole
  defguardp is_finder(value) when value in [:any, :all, :sole]

  @type combiner() :: :intersect | :union
  defguardp is_combiner(value) when value in [:intersect, :union]

  @type finalizer() :: :any | :all | :sole | :list
  defguardp is_finalizer(value) when value in [:any, :all, :sole, :list]

  @type find_operation() :: {finder(), index_name() | [index_name()], [search_term()]}
  defguardp is_finder_operation(value)
            when is_tuple(value) and tuple_size(value) == 3 and is_finder(elem(value, 0)) and
                   is_atom(elem(value, 1)) and is_list(elem(value, 2))

  @type combine_operation() :: [combiner() | find_operation() | combine_operation()]
  defguardp is_combiner_operation(value)
            when is_list(value) and length(value) >= 3 and is_combiner(hd(value))

  defguardp is_valid_operation(value)
            when is_combiner_operation(value) or is_finder_operation(value)

  @typep results :: MapSet.t(Article.t()) | Article.t() | nil

  @doc """
  Allows to find articles by indexed attributes. The finders work like this:

  * all: find all articles matching any of the search terms in all indexes
  * any: find articles matching any of the search terms, stop after first
    result(s)
  * sole: find the single article matched by any of the search terms in *all*
    indexes. If more than one match is found, return nothing.

  The combiners allow to combine the results without round tripping the agent.

  The finalizer works similar to the finder:
  * all: return the MapSet with all results
  * list: return all results as a list
  * any: return a result or nil
  * sole: return the single result, or nil if there is more than one match

  The search terms must be given as a list. Otherwise there is ambiguity if the
  index itself uses a list of lookup.

  ## Examples

  Find the article that is the only one with a tag "1"

      iex> Article.Index.find(:sole, :tags, ["1"])
      nil

  Find all articles that have both tags "1" and "2":

      iex> Article.Index.find(:all, [
      ...>   :intersect,
      ...>   {:all, :tags, ["1"]},
      ...>   {:all, :tags, ["2"]}
      ...> ])
      MapSet.new([Data.Article.Blog.Valentinskamp, Data.Article.Blog.KaiserWilhelmStrasse])

  Find the sole static article that is tagged "fahrrad frei":

      iex> Article.Index.find(:sole, [
      ...>   :intersect,
      ...>   {:all, :category, ["Static"]},
      ...>   {:all, :tags, ["fahrrad frei"]}
      ...> ])
      Data.Article.Static.LexikonFahrradFrei

  Find any ("first") article that has a video with no sources:

      iex> Article.Index.find(:any, :sources, [
      ...>   []
      ...> ])
      nil
  """

  @spec find(finder() | finalizer(), [index_name()], [search_term()]) :: results
  def find(finder, indexes, search_terms)
      when is_finder(finder) and is_finalizer(finder) and is_list(search_terms) do
    find(finder, {finder, indexes, search_terms})
  end

  @spec find(find_operation() | combine_operation(), finalizer()) :: results
  def find(finalizer, operation) when is_valid_operation(operation) and is_finalizer(finalizer) do
    Agent.get(__MODULE__, fn state ->
      results = find_real(state, operation)

      case finalizer do
        :any -> Enum.at(results, 0)
        :all -> results
        :list -> MapSet.to_list(results)
        :sole -> if MapSet.size(results) == 1, do: Enum.at(results, 0)
      end
    end)
  end

  @spec find_real(map(), [combine_operation()]) :: MapSet.t(Article.t())
  defp find_real(state, [combiner | operations])
       when is_combiner(combiner) and length(operations) >= 2 do
    Enum.reduce(operations, nil, fn operation, prev ->
      next = find_real(state, operation)

      cond do
        prev == nil -> next
        combiner == :union -> MapSet.union(prev, next)
        combiner == :intersect -> MapSet.intersection(prev, next)
      end
    end)
  end

  defp find_real(state, {finder, index_names, search_terms})
       when is_finder(finder) and is_list(search_terms) do
    indexes = index_names |> List.wrap() |> Enum.map(&Map.fetch!(state, &1))

    case finder do
      :any -> find_any_in_indexes(indexes, search_terms)
      :all -> find_all_in_indexes(indexes, search_terms)
      :sole -> find_sole_in_indexes(indexes, search_terms)
    end
  end

  defp find_real(_sate, {finder, _, search_terms} = op)
       when is_finder(finder) and not is_list(search_terms),
       do: raise("invalid operation: finder requires search terms to be a list: #{inspect(op)}")

  defp find_real(_sate, {method, _, _} = op),
    do: raise("invalid operation: unknown method '#{inspect(method)}' in #{inspect(op)}")

  @spec find_any_in_indexes(list(), [search_term()]) :: MapSet.t(Article.t())
  defp find_any_in_indexes(indexes, search_terms) do
    Enum.find_value(indexes, fn index ->
      find_any_in_index(index, search_terms)
    end) || MapSet.new()
  end

  @spec find_all_in_indexes(list(), [search_term()]) :: MapSet.t(Article.t())
  defp find_all_in_indexes(indexes, search_terms) do
    Enum.reduce(indexes, MapSet.new(), fn index, results ->
      find_all_in_index(index, search_terms, results)
    end)
  end

  @spec find_sole_in_indexes(list(), [search_term()]) :: MapSet.t(Article.t())
  defp find_sole_in_indexes(indexes, search_terms) do
    Enum.reduce_while(indexes, MapSet.new(), fn index, results ->
      results = find_all_in_index(index, search_terms, results)

      if MapSet.size(results) <= 1 do
        {:cont, results}
      else
        {:halt, MapSet.new()}
      end
    end)
  end

  defp find_all_in_index(_index, [], results), do: results

  defp find_all_in_index(index, [search_term | search_terms], results) do
    results =
      case index[search_term] do
        nil -> results
        mapset -> MapSet.union(results, mapset)
      end

    find_all_in_index(index, search_terms, results)
  end

  defp find_any_in_index(_index, []), do: nil

  defp find_any_in_index(index, [search_term | search_terms]) do
    index[search_term] || find_any_in_index(index, search_terms)
  end

  @spec index_by(
          [Article.t()],
          (Article.t() -> [search_term()])
        ) ::
          %{search_term() => MapSet.t(Article.t())}
  defp index_by(articles, func) do
    Enum.reduce(articles, %{}, fn art, acc ->
      Enum.reduce(func.(art), acc, fn tag, acc ->
        Map.update(acc, tag, MapSet.new([art]), &MapSet.put(&1, art))
      end)
    end)
  end

  defp article_sources(art) do
    Enum.map(art.tracks(), & &1.videos)
  end
end
