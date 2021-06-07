defmodule Article.SearchTest do
  use ExUnit.Case, async: true

  @example_article %Article{
    date: ~D[2020-03-29],
    full_title: "Baustelle: title",
    name: "2020-03-29-dummy-article",
    text: "<a>text</a> <a href=\"ignore.me.example.com\">link</a>",
    title: "title",
    type: "construction"
  }

  test "preprocess" do
    expected = %{
      search_text: %FuzzyCompare.Preprocessed{
        chunks: ["TEXT", "LINK"],
        set: MapSet.new(["TEXT", "LINK"]),
        string: "TEXTLINK"
      },
      search_title: %FuzzyCompare.Preprocessed{
        chunks: ["BAUSTELLE", "TITLE"],
        set: MapSet.new(["BAUSTELLE", "TITLE"]),
        string: "BAUSTELLETITLE"
      }
    }

    assert expected ==
             @example_article |> Article.Search.preprocess() |> Map.take(Map.keys(expected))
  end
end
