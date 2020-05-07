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
      - 4
      text: "<a>text</a>"
    """)

    assert Data.Article.load(file_path) == %Data.Article{
             date: ~D[2020-03-29],
             end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
             hideFromMap: false,
             images: 123,
             live_html:
               "<h3>title</h3>  <a phx-click=\"map-zoom-to\" phx-value-name=\"text\">text</a>\n\n  <h3>Verwandte Artikel</h3>\n  <articles tags=\"tag,4\" sort=\"date\"/>\n",
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

  test "all articles use valid filters" do
    known = Map.keys(%Data.Article{})

    Data.articles()
    |> Map.values()
    |> Enum.flat_map(fn art ->
      Regex.scan(~r{<articles>(.*?)</articles>}, art.live_html)
    end)
    |> Enum.flat_map(fn [_match, filters] ->
      String.split(filters, " ")
    end)
    |> Enum.reject(fn
      "" -> true
      _ -> false
    end)
    |> Enum.each(fn filter ->
      [key, _vals] = String.split(filter, "=", parts: 2)
      key = String.to_existing_atom(key)
      assert Enum.member?(known, key), "There is no '#{key}' for articles. Filter: #{filter}"
    end)
  end
end
