defmodule Map.Enrich do
  require Logger
  import Guards

  @spec with_articles(Map.Parsed.t(), Article.List.t()) :: Map.Parsed.t()
  @doc """
  Takes a parsed map, finds all ways that reference an article and adds all info from the
  article into the way's tags. All of the article's properties are prefixed with "article_",
  but otherwise have the same names as the article struct.
  """
  def with_articles(%Map.Parsed{} = map, articles) do
    Map.update!(map, :ways, fn ways ->
      Enum.into(ways, %{}, fn
        {id, w = %{tags: %{type: type}}} when type in ["article", "detour"] ->
          with art when is_module(art) <- find_article_for(articles, w) do
            art_tags = %{
              article_title: art.title(),
              article_type: art.type(),
              article_icon: art.icon()
            }

            {id, Map.Element.add_new_tags(w, art_tags)}
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

  defp find_article_for(articles, w = %Map.Way{tags: %{name: name}}) do
    Article.List.find_exact(articles, name) ||
      {:error,
       "Tried to find article for way.id=#{w.id} (tags: #{inspect(w.tags)}), but it does not seem to exist. Known articles: #{inspect(articles)}"}
  end

  defp find_article_for(_articles, w) do
    {:error,
     "Cannot find article for way.id=#{w.id} (tags: #{inspect(w.tags)}), since it doesn't specify a name"}
  end
end
