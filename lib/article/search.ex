defmodule Article.Search do
  alias Article
  require Logger
  import Guards

  @type searchable() :: %{
          title: %FuzzyCompare.Preprocessed{},
          text: %FuzzyCompare.Preprocessed{}
        }

  @min_relevance 0.7

  @spec search(Article.List.t(), binary | nil) :: [SearchResult.t()]
  def search(_articles, nil), do: []
  def search(articles, query) when is_binary(query), do: real_search(articles, String.trim(query))

  defp real_search(_articles, ""), do: []

  defp real_search(articles, query) do
    want = FuzzyCompare.Preprocessor.process(query)

    Logger.debug("query: #{query}")

    articles
    |> Enum.map(fn art -> {art, article_terms(art)} end)
    |> Enum.reject(fn {_art, have} -> blank?(have.title.string) || blank?(have.text.string) end)
    |> Enum.map(fn {art, have} ->
      title_sim = FuzzyCompare.ChunkSet.standard_similarity(want, have.title)
      text_sim = FuzzyCompare.ChunkSet.standard_similarity(want, have.text)
      title_cont = if String.contains?(have.title.string, want.string), do: 0.4, else: 0

      relevance =
        [title_sim + title_cont, text_sim]
        |> Enum.max()
        |> clamp
        |> consider_age(art)
        |> consider_finished(art)
        |> clamp

      if relevance >= @min_relevance,
        do:
          Logger.debug(
            "relevance: #{Float.round(relevance, 2)} / #{Float.round(title_sim, 2)} / #{Float.round(text_sim, 2)} @ #{inspect(have.title.chunks)} "
          )

      {art, relevance}
    end)
    |> Enum.reject(fn {_art, relevance} -> relevance < @min_relevance end)
    |> Enum.map(fn {art, relevance} ->
      bbox = Article.Decorators.bbox(art)
      bounds = if bbox, do: bbox, else: Settings.initial()
      type = if art.created_at(), do: "article", else: "page"

      subtext = if art.created_at(), do: "Letzte Änderung #{Article.Decorators.updated_at(art)}"

      %SearchResult{
        bounds: bounds,
        name: Article.Decorators.full_title(art),
        url: Article.Decorators.path(art),
        relevance: relevance,
        polylines: Article.Decorators.polylines(art),
        type: type,
        subtext: subtext
      }
    end)
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

  use Memoize
  @spec article_terms(Article.t()) :: searchable()
  defmemo article_terms(art) when is_module(art) do
    title = Article.Decorators.full_title(art)
    text = Article.Decorators.text(art)

    %{
      title: preprocess_text(title),
      text: preprocess_text(text)
    }
  end

  @spec preprocess_text(binary()) :: %FuzzyCompare.Preprocessed{}
  def preprocess_text(text) when is_binary(text) do
    text
    |> word_and_num_only()
    |> FuzzyCompare.Preprocessor.process()
  end

  defp word_and_num_only(str) do
    Regex.replace(~r/[^\p{L}\p{N}]+/u, str, " ")
  end
end
