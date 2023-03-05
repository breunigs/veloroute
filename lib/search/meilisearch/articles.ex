defmodule Search.Meilisearch.Articles do
  def id(), do: :articles

  def documents() do
    Article.List.all() |> Enum.map(&single/1)
  end

  def params(query, lat, lon) do
    %{
      q: query,
      limit: 10,
      sort: [
        "updated_at:desc",
        "_geoPoint(#{lat}, #{lon}):asc"
      ]
    }
  end

  def format(%{"module" => mod} = _result) do
    Article.Decorators.search_result(String.to_existing_atom(mod), 1)
  end

  @spec single(Article.t()) :: map()
  defp single(art) do
    geo =
      with bounds when is_map(bounds) <- Article.Decorators.bbox(art),
           %{lat: lat, lon: lon} <- Geo.CheapRuler.center(bounds) do
        %{lat: lat, lng: lon}
      end

    %{
      _geo: geo,
      id: module_id(art),
      module: art,
      path: Article.Decorators.path(art),
      summary: art.summary(),
      text: Article.Decorators.text(art),
      title: Article.Decorators.full_title(art),
      type_name: Article.Decorators.type_name(art),
      updated_at: art.updated_at() || art.created_at()
    }
    |> Util.compact()
  end

  def config() do
    %{
      # result will be rendered directly from the article
      displayedAttributes: ~w(module),
      # order is from most important to least important
      searchableAttributes: ~w(title summary type_name text updated_at),
      sortableAttributes: ~w(updated_at _geo),
      # order is from most important to least important
      # rankingRules: ~w(words typo proximity attribute sort exactness),
      synonyms: %{alltagsroute: ~w(veloroute), veloroute: ~w(alltagsroute)}
    }
  end

  defp module_id(mod, extra \\ nil) do
    id = mod |> Module.split() |> Enum.join("-")
    id = if extra, do: "#{id}-#{extra}", else: id
    id
  end
end
