defmodule Data.ArticleTest do
  use ExUnit.Case, async: true
  doctest Data.Article

  import Mapillary, only: [is_ref: 1]

  def example_article(extra_keys \\ []) do
    %Data.Article{
      date: ~D[2018-07-19],
      end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
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
      tags:
      - tag
      - 4
      text: "<a>text</a>"
    """)

    assert %Data.Article{
             bbox: %{
               maxLat: 53.68007921432,
               maxLon: 10.0262893,
               minLat: 53.5508649,
               minLon: 9.9909322
             },
             date: ~D[2020-03-29],
             end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
             images: 123,
             start_image: nil,
             name: "2020-03-29-dummy-article",
             start: %Data.RoughDate{month: nil, quarter: 4, year: 2019},
             tags: ["tag", "4"],
             text: "<a>text</a>",
             title: "title",
             type: "type"
           } == Data.Article.load(file_path)

    File.rm_rf(dir_path)
  end

  test "articles only refer to known route IDs" do
    route_ids = Data.ImageCache.images() |> Data.Image.as_ids()

    assert Data.ArticleCache.get_dated()
           |> Enum.filter(fn
             {_name, %Data.Article{images: imgs}} when is_list(imgs) or is_nil(imgs) ->
               false

             {_name, %Data.Article{images: route_id}} when not is_ref(route_id) ->
               !Enum.member?(route_ids, "#{route_id}")

             _ ->
               false
           end)
           |> Enum.map(fn {name, %Data.Article{images: route_id}} ->
             "#{name} refers to images of a route with ID '#{route_id}', but no such route is known. Known: #{
               Enum.join(route_ids, ", ")
             }"
           end)
           |> Enum.sort() == []
  end

  test "all articles have mandatory params" do
    Data.ArticleCache.get()
    |> Enum.each(fn {name, a} ->
      have = a |> Map.keys() |> MapSet.new()
      want = Data.Article.required_params() |> MapSet.new()
      missing = MapSet.difference(want, have)

      assert length(MapSet.to_list(missing)) == 0,
             "#{name} is missing some of the required keys. Missing: #{inspect(missing)}"
    end)
  end

  test "all articles' contents are valid HTML" do
    Data.ArticleCache.get()
    |> Enum.each(fn {name, a} ->
      beauty =
        a.text
        |> Floki.parse_fragment()
        |> elem(1)
        |> Floki.raw_html()

      beauty = Regex.replace(~r/<\/p><p>/, beauty, "</p>\n\n<p>")

      expected = Regex.replace(~r/<([a-z0-9]+)([^>]*?)\/>/, a.text, "<\\1\\2></\\1>")
      expected = Regex.replace(~r/\s+/, expected, "")
      expected = String.replace(expected, "<br>", "<br/>")
      expected = String.replace(expected, "<br/></br>", "<br/>")
      expected = HtmlEntities.decode(expected)

      got = Regex.replace(~r/\s+/, beauty, "")
      got = HtmlEntities.decode(got)

      if got != expected, do: IO.puts("Article #{name} has invalid HTML")

      assert got == expected
    end)
  end

  test "all dated articles have a bounding box" do
    assert Data.ArticleCache.get_dated()
           |> Enum.filter(fn {_name, %Data.Article{bbox: bbox}} -> is_nil(bbox) end)
           |> Enum.map(fn {name, _art} ->
             "Article #{name} has no bounding box. Is there a matching entry in the map?"
           end)
           |> Enum.sort() == []
  end

  test "all dated articles have a start_image" do
    assert Data.ArticleCache.get_dated()
           |> Enum.filter(fn {_name, %Data.Article{start_image: x}} -> is_nil(x) end)
           |> Enum.map(fn {name, _art} -> "Article #{name} has no start_image." end)
           |> Enum.sort() == []
  end
end
