defmodule Article.SearchTest do
  use ExUnit.Case, async: true

  defmodule FakeArticle do
    use Article.Default

    def name, do: "fake-test-article"
    def type, do: :construction
    def created_at, do: ~D[2021-11-11]
    def tags, do: []
    def title, do: "title"
    def text(assigns), do: ~H{<i>text</i> <.a href="http://example.com">link</.a>}
  end

  test "preprocess" do
    expected = %{
      text: %FuzzyCompare.Preprocessed{
        chunks: ["TEXT", "LINK"],
        set: MapSet.new(["TEXT", "LINK"]),
        string: "TEXTLINK"
      },
      title: %FuzzyCompare.Preprocessed{
        chunks: ["BAUSTELLE", "TITLE"],
        set: MapSet.new(["BAUSTELLE", "TITLE"]),
        string: "BAUSTELLETITLE"
      }
    }

    assert expected == Article.Search.article_terms(FakeArticle)
  end
end
