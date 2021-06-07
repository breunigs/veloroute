defmodule Cache.ArticlesTest do
  use ExUnit.Case, async: true

  import Mapillary.Types, only: [is_ref: 1]
  alias VelorouteWeb.VariousHelpers

  test "articles only refer to known route IDs" do
    route_ids = Route.List.all() |> Route.List.groups()

    assert Cache.Articles.get_dated()
           |> Enum.filter(fn
             {_name, %Article{images: imgs}} when is_list(imgs) or is_nil(imgs) ->
               false

             {_name, %Article{images: route_id}} when not is_ref(route_id) ->
               !Enum.member?(route_ids, "#{route_id}")

             _ ->
               false
           end)
           |> Enum.map(fn {name, %Article{images: route_id}} ->
             "#{name} refers to images of a route with ID '#{route_id}', but no such route is known. Known: #{Enum.join(route_ids, ", ")}"
           end)
           |> Enum.sort() == []
  end

  test "all articles have mandatory params" do
    Cache.Articles.get()
    |> Enum.each(fn {name, a} ->
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
      |> Enum.map(fn {name, link} ->
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

  test "all image refs in links are valid" do
    errors =
      all_articles_element_select("a[img]")
      |> Enum.map(fn {name, link} ->
        imgs = Floki.attribute(link, "img")
        prefix = "#{name}, link “#{Floki.text(link)}”"

        cond do
          length(imgs) != 1 ->
            "#{prefix}: expected attribute img just once"

          !is_ref(hd(imgs)) ->
            "#{prefix}: expected proper Mapillary image reference, but '#{hd(imgs)}' doesn't appear to be one"

          true ->
            nil
        end
      end)
      |> Enum.reject(&is_nil/1)

    assert [] == errors
  end

  test "all articles' contents are valid HTML" do
    Cache.Articles.get()
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

  test "all dated articles have a start_image" do
    assert Cache.Articles.get_dated()
           |> Enum.filter(fn {_name, %Article{start_image: x}} -> is_nil(x) end)
           |> Enum.map(fn {name, art} ->
             "Article #{name} has no start_image (bbox: #{inspect(art.bbox)})."
           end)
           |> Enum.sort() == []
  end

  defp all_articles_element_select(selector) do
    Cache.Articles.get()
    |> Enum.map(fn {name, a} ->
      {:ok, html} = a.text |> Floki.parse_fragment()
      {name, html}
    end)
    |> Enum.flat_map(fn {name, html} ->
      Floki.find(html, selector) |> Enum.map(fn link -> {name, link} end)
    end)
  end
end
