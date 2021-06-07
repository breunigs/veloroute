defmodule Article.Search do
  alias Article
  require Logger

  @min_relevance 0.7

  @spec search(Article.collection(), binary | nil) :: [SearchResult.t()]
  def search(_articles, nil), do: []
  def search(articles, query) when is_binary(query), do: real_search(articles, String.trim(query))

  defp real_search(_articles, ""), do: []

  defp real_search(articles, query) do
    terms = FuzzyCompare.Preprocessor.process(query)

    Logger.debug("query: #{query}")

    articles
    |> Map.values()
    |> Enum.reject(fn art -> blank?(art.title) || blank?(art.text) end)
    |> Enum.map(fn art ->
      title_sim = FuzzyCompare.ChunkSet.standard_similarity(terms, art.search_title)
      text_sim = FuzzyCompare.ChunkSet.standard_similarity(terms, art.search_text)
      title_cont = if String.contains?(art.search_title.string, terms.string), do: 0.4, else: 0

      relevance =
        max(title_sim + title_cont, text_sim)
        |> clamp
        |> consider_age(art)
        |> consider_finished(art)
        |> clamp

      bounds = if art.bbox, do: art.bbox, else: Settings.initial()
      type = if art.date, do: "article", else: "page"

      subtext =
        if art.date, do: "Letzte Änderung #{art.date.day}.#{art.date.month}.#{art.date.year}"

      if relevance >= @min_relevance,
        do:
          Logger.debug(
            "relevance: #{Float.round(relevance, 2)} / #{Float.round(title_sim, 2)} / #{Float.round(text_sim, 2)} @ #{inspect(art.search_title.chunks)} "
          )

      # Logger.debug("relevance: #{title_sim} / #{text_sim} @ #{inspect(art.search_title)} ")

      %SearchResult{
        bounds: bounds,
        name: art.full_title,
        url: art.url,
        relevance: relevance,
        type: type,
        subtext: subtext
      }
    end)
    |> Enum.reject(fn result -> result.relevance < @min_relevance end)
  end

  defp consider_age(relevance, %{date: date}) when not is_nil(date) do
    n = (Date.utc_today().year - date.year) / 10
    relevance - n
  end

  defp consider_age(relevance, _), do: relevance

  defp consider_finished(relevance, %{type: "finished"}), do: relevance - 0.2
  defp consider_finished(relevance, _), do: relevance

  defp clamp(relevance) when relevance < 0, do: 0.0
  defp clamp(relevance) when relevance > 1, do: 1.0
  defp clamp(relevance), do: relevance

  defp blank?(nil), do: true
  defp blank?(""), do: true
  defp blank?(_), do: false

  @spec preprocess(Article.t()) :: Article.t()
  def preprocess(%Article{} = art) do
    art |> search_preprocess_title |> search_preprocess_text
  end

  defp search_preprocess_title(art) do
    # Benchmark.measure("article: preprocess title", fn ->
    t =
      art.full_title
      |> Kernel.||("")
      |> word_and_num_only()
      |> FuzzyCompare.Preprocessor.process()

    Map.put(art, :search_title, t)
    # end)
  end

  defp search_preprocess_text(%{text: t} = art) when is_binary(t) do
    # Benchmark.measure("article: preprocess text", fn ->
    t =
      t
      |> Floki.parse_fragment!()
      |> Floki.text(sep: " ")
      |> word_and_num_only()
      |> FuzzyCompare.Preprocessor.process()

    Map.put(art, :search_text, t)
    # end)
  end

  defp word_and_num_only(str) do
    Regex.replace(~r/[^\p{L}\p{N}]+/u, str, " ")
  end
end
