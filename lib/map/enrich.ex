defmodule Map.Enrich do
  @spec with_articles(Map.Parsed.t(), Article.collection()) :: Map.Parsed.t()
  @doc """
  Takes a parsed map, finds all ways that reference an article and adds all info from the
  article into the way's tags. All of the article's properties are prefixed with "article_",
  but otherwise have the same names as the article struct.
  """
  def with_articles(%Map.Parsed{} = map, %{} = articles) do
    Map.update!(map, :ways, fn ways ->
      Enum.into(ways, %{}, fn
        {id, w = %{tags: %{type: "article"}}} ->
          art_tags =
            articles
            |> find_article_for(w)
            |> Map.from_struct()
            |> Enum.into(%{}, fn {k, v} -> {:"article_#{k}", v} end)

          {id, Map.Element.add_new_tags(w, art_tags)}

        elem ->
          elem
      end)
    end)
  end

  defp find_article_for(articles, w = %Map.Way{tags: %{name: name}}) do
    articles[name] ||
      raise(
        "Tried to find article for way.id=#{w.id} (tags: #{inspect(w.tags)}), but it does not seem to exist. Known articles: #{inspect(Map.keys(articles))}"
      )
  end
end
