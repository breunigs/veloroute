defmodule Map.Enrich do
  require Logger
  import Guards

  @article_properties [:name, :title, :type, :icon]

  @doc """
  Article properties that will be made availabe on the enriched map for a given
  article.
  """
  @spec article_tags(Article.t()) :: %{atom() => any()}
  def article_tags(art) do
    Enum.into(@article_properties, %{}, fn property ->
      {:"article_#{property}", apply(art, property, [])}
    end)
  end

  @spec with_articles(Map.Parsed.t(), Article.List.t()) :: Map.Parsed.t()
  @doc """
  Takes a parsed map, finds all ways that reference an article and adds
  `article_tags/1` from the article into the way's tags. All of the
  article's properties are prefixed with "article_", but otherwise have the same
  names as the article.

  If an unreleased article is referenced, the way's reference to the article are
  cleaned up.
  """
  def with_articles(%Map.Parsed{} = map, articles) do
    Map.update!(map, :ways, fn ways ->
      Enum.into(ways, %{}, fn
        {id, w = %{tags: %{type: type}}} when type in ["article", "detour"] ->
          with art when is_module(art) <- find_article_for(articles, w) do
            {id, update_way_with_article(w, art)}
          else
            {:error, reason} ->
              Logger.error(reason)
              {id, w}
          end

        elem ->
          elem
      end)
    end)
  end

  defp find_article_for(articles, %Map.Way{tags: %{name: name}} = w) do
    art = Article.List.find_exact(articles, name)

    if art == nil do
      {:error,
       "Tried to find article for way.id=#{w.id} (tags: #{inspect(w.tags)}), but it does not seem to exist. Similarly named articles: #{inspect(Article.List.find_similar(articles, name))}"}
    else
      art
    end
  end

  defp find_article_for(_articles, w) do
    {:error,
     "Cannot find article for way.id=#{w.id} (tags: #{inspect(w.tags)}), since it doesn't specify a name"}
  end

  defp update_way_with_article(w, art) do
    if Article.released?(art) do
      Map.Element.add_new_tags(w, article_tags(art))
    else
      Map.Element.remove_tags(w, [:type, :name])
    end
  end
end
