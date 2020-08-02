defmodule Data.ArticleSearch do
  alias Data.ArticleCache
  alias Data.Article
  require Logger

  @min_relevance 0.7

  @spec search(binary | nil) :: [SearchResult.t()]
  def search(nil), do: []
  def search(query) when is_binary(query), do: real_search(String.trim(query))

  defp real_search(""), do: []

  defp real_search(query) do
    terms = FuzzyCompare.Preprocessor.process(query)

    Logger.debug("query: #{query}")

    ArticleCache.get()
    |> Map.values()
    |> Enum.reject(fn art -> blank?(art.title) || blank?(art.text) end)
    |> Enum.map(fn art ->
      title_sim = FuzzyCompare.ChunkSet.standard_similarity(terms, art.search_title)
      text_sim = FuzzyCompare.ChunkSet.standard_similarity(terms, art.search_text)
      title_cont = if String.contains?(art.search_title.string, terms.string), do: 0.4, else: 0
      relevance = max(title_sim + title_cont, text_sim) |> min(1.0)

      center = CheapRuler.center(if art.bbox, do: art.bbox, else: Settings.initial())
      type = if art.date, do: "article", else: "page"

      if relevance >= @min_relevance,
        do:
          Logger.debug(
            "relevance: #{Float.round(title_sim, 2)} / #{Float.round(text_sim, 2)} @ #{
              inspect(art.search_title.chunks)
            } "
          )

      # Logger.debug("relevance: #{title_sim} / #{text_sim} @ #{inspect(art.search_title)} ")

      %SearchResult{
        name: Article.full_title(art),
        lon: center.lon,
        lat: center.lat,
        relevance: relevance,
        type: type
      }
    end)
    |> Enum.reject(fn result -> result.relevance < @min_relevance end)
  end

  defp blank?(nil), do: true
  defp blank?(""), do: true
  defp blank?(_), do: false
end
