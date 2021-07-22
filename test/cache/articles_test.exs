defmodule Cache.ArticlesTest do
  use ExUnit.Case, async: true

  alias VelorouteWeb.VariousHelpers

  test "all articles have mandatory params" do
    Cache.Articles.get()
    |> Parallel.each(fn {name, a} ->
      have = a |> Map.keys() |> MapSet.new()
      want = Article.required_params() |> MapSet.new()
      missing = MapSet.difference(want, have)

      assert length(MapSet.to_list(missing)) == 0,
             "#{name} is missing some of the required keys. Missing: #{inspect(missing)}"
    end)
  end

  test "all bounds in links are sensible" do
    errors =
      all_articles_element_select("a[bounds]")
      |> Parallel.map(fn {name, _art, link} ->
        bounds = Floki.attribute(link, "bounds")
        prefix = "#{name}, link “#{Floki.text(link)}”"

        cond do
          length(bounds) != 1 ->
            "#{prefix}: expected attribute bounds just once"

          String.contains?(hd(bounds), "%2C") ->
            "#{prefix}: bounds contains escape sequence %2C instead of a plain comma"

          VariousHelpers.parse_bounds(hd(bounds)) == nil ->
            "#{prefix}: failed to parse bounds '#{hd(bounds)}'"

          true ->
            nil
        end
      end)
      |> Enum.reject(&is_nil/1)

    assert [] == errors
  end

  test "exact position links are complete" do
    errors =
      all_articles_element_select("a[lat], a[lon], a[dir], a[route]")
      |> Parallel.flat_map(fn {name, art, link} ->
        prefix = "#{name}, link “#{Floki.text(link)}”"

        [
          if(Floki.attribute(link, "lat") == [], do: "#{prefix} is missing the “lat” attribute"),
          if(Floki.attribute(link, "lon") == [], do: "#{prefix} is missing the “lon” attribute"),
          if(Floki.attribute(link, "dir") == [], do: "#{prefix} is missing the “dir” attribute"),
          if(
            Floki.attribute(link, "route") == [] &&
              Floki.attribute(link, "article") == [] &&
              art.tracks == [] &&
              Article.related_routes(art) == [],
            do: "#{prefix} is missing the “route” or “article” attribute"
          )
        ]
      end)
      |> Enum.reject(&is_nil/1)

    assert [] == errors
  end

  test "all articles' contents are valid HTML" do
    Cache.Articles.get()
    |> Parallel.each(fn {name, a} ->
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
      expected = String.replace(expected, "></img>", "/>")
      expected = String.replace(expected, "></input>", "/>")
      expected = HtmlEntities.decode(expected)

      got = Regex.replace(~r/\s+/, beauty, "")
      got = HtmlEntities.decode(got)

      if got != expected, do: IO.puts("Article #{name} has invalid HTML")

      assert got == expected
    end)
  end

  test "all dated articles have a bounding box" do
    assert Cache.Articles.get_dated()
           |> Enum.filter(fn {_name, %Article{bbox: bbox}} -> is_nil(bbox) end)
           |> Enum.map(fn {name, _art} ->
             "Article #{name} has no bounding box. Is there a matching entry in the map?"
           end)
           |> Enum.sort() == []
  end

  defp all_articles_element_select(selector) do
    Cache.Articles.get()
    |> Enum.map(fn {name, a} ->
      {:ok, html} = a.text |> Floki.parse_fragment()
      {name, a, html}
    end)
    |> Enum.flat_map(fn {name, a, html} ->
      Floki.find(html, selector) |> Enum.map(fn link -> {name, a, link} end)
    end)
  end
end
