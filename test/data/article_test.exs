defmodule Data.ArticleTest do
  use ExUnit.Case, async: true
  doctest Data.Article

  def example_article(extra_keys \\ []) do
    %Data.Article{
      date: ~D[2018-07-19],
      end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
      hide_from_map: false,
      name: "2018-07-19-example-article",
      range: nil,
      start: %Data.RoughDate{month: nil, quarter: nil, year: nil},
      tags: ["7"],
      text: "text_here",
      title: "Example Article",
      type: "issue"
    }
    |> Map.merge(Enum.into(extra_keys, %{}))
  end

  test "parses decently" do
    {:ok, dir_path} = Temp.mkdir("veloroutehamburgtest")
    file_path = Path.join(dir_path, "2020-03-29-dummy-article.yaml")

    File.write(file_path, """
      type: type
      title: title
      start: 2019Q4
      images: 123
      hide_from_map: false
      tags:
      - tag
      - 4
      text: "<a>text</a>"
    """)

    assert Data.Article.load(file_path) == %Data.Article{
             date: ~D[2020-03-29],
             end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
             hide_from_map: false,
             images: 123,
             name: "2020-03-29-dummy-article",
             start: %Data.RoughDate{month: nil, quarter: 4, year: 2019},
             tags: ["tag", "4"],
             text: "<a>text</a>",
             title: "title",
             type: "type"
           }

    File.rm_rf(dir_path)
  end

  test "all articles have mandatory params" do
    Data.articles()
    |> Enum.each(fn {name, a} ->
      have = a |> Map.keys() |> MapSet.new()
      want = Data.Article.required_params() |> MapSet.new()
      missing = MapSet.difference(want, have)

      assert length(MapSet.to_list(missing)) == 0,
             "#{name} is missing some of the required keys. Missing: #{inspect(missing)}"
    end)
  end
end
