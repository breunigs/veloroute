defmodule Data.ArticleTest do
  use ExUnit.Case

  test "parses decently" do
    {:ok, dir_path} = Temp.mkdir("veloroutehamburgtest")
    file_path = Path.join(dir_path, "2020-03-29-dummy-article.yaml")

    File.write(file_path, """
      type: type
      title: title
      start: 2019Q4
      images: 123
      hideFromMap: false
      tags:
      - tag
      text: text
    """)

    assert Data.Article.load(file_path) == %Data.Article{
             date: ~D[2020-03-29],
             end: nil,
             hideFromMap: false,
             images: 123,
             name: "2020-03-29-dummy-article",
             start: "2019Q4",
             tags: ["tag"],
             text: "text",
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
