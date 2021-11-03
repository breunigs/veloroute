defmodule Article.RenderTest do
  use ExUnit.Case, async: true

  test "all articles can be rendered" do
    render_issues =
      Article.List.all()
      |> Enum.map(fn art ->
        # try do
        _content = Article.Decorators.html(art, %{__changed__: %{}, type: :html})
        nil
        # rescue
        #   err -> {art, err}
        # end
      end)
      |> Util.compact()

    assert [] == render_issues
  end

  # test "link bound attributes are valid" do
  #   wrong_links =
  #     Article.List.all()
  #     |> Enum.map(fn art ->
  #       content = Article.Decorators.html(art, %{__changed__: %{}, type: :html})
  #     end)
  # end

  #   defp validate!(:bounds, val, attr) do
  #   case VelorouteWeb.VariousHelpers.parse_bounds(val) do
  #     %Geo.BoundingBox{} -> true
  #     _ -> raise "bounds='#{val}' is not proper. Full attributes: #{inspect(attr)}"
  #   end
  # end

  # defp validate!(:dir, "forward", _attr), do: true
  # defp validate!(:dir, "backward", _attr), do: true

  # defp validate!(:dir, val, attr),
  #   do: raise("dir='#{val}' not supported. Full attributes: #{inspect(attr)}")

  # defp validate!(key, val, attr) when key in [:lat, :lon] do
  #   IO.warn("I run in prod")

  #   case Float.parse(val) do
  #     {_parsed, ""} -> true
  #     _ -> raise "#{key}='#{val}' is not a float. Full attributes: #{inspect(attr)}"
  #   end
  # end
end

#   test "exact position links are complete" do
#     errors =
#       all_articles_element_select("a[lat], a[lon], a[dir], a[route]")
#       |> Parallel.flat_map(fn {name, art, link} ->
#         prefix = "#{name}, link “#{Floki.text(link)}”"

#         [
#           if(Floki.attribute(link, "lat") == [], do: "#{prefix} is missing the “lat” attribute"),
#           if(Floki.attribute(link, "lon") == [], do: "#{prefix} is missing the “lon” attribute"),
#           if(Floki.attribute(link, "dir") == [], do: "#{prefix} is missing the “dir” attribute"),
#           if(
#             Floki.attribute(link, "route") == [] &&
#               Floki.attribute(link, "article") == [] &&
#               art.tracks == [] &&
#               Article.related_routes(art) == [],
#             do: "#{prefix} is missing the “route” or “article” attribute"
#           )
#         ]
#       end)
#       |> Enum.reject(&is_nil/1)

#     assert [] == errors
#   end

#   test "all articles' contents are valid HTML" do
#     Cache.Articles.get()
#     |> Parallel.each(fn {name, a} ->
#       beauty =
#         a.text
#         |> Floki.parse_fragment()
#         |> elem(1)
#         |> Floki.raw_html()

#       beauty = Regex.replace(~r/<\/p><p>/, beauty, "</p>\n\n<p>")

#       expected = Regex.replace(~r/<([a-z0-9]+)([^>]*?)\/>/, a.text, "<\\1\\2></\\1>")
#       expected = Regex.replace(~r/\s+/, expected, "")
#       expected = String.replace(expected, "<br>", "<br/>")
#       expected = String.replace(expected, "<br/></br>", "<br/>")
#       expected = String.replace(expected, "></img>", "/>")
#       expected = String.replace(expected, "></input>", "/>")
#       expected = HtmlEntities.decode(expected)

#       got = Regex.replace(~r/\s+/, beauty, "")
#       got = HtmlEntities.decode(got)

#       if got != expected, do: IO.puts("Article #{name} has invalid HTML")

#       assert got == expected
#     end)
#   end

#   test "all dated articles have a bounding box" do
#     assert Cache.Articles.get_dated()
#            |> Enum.filter(fn {_name, %Article{bbox: bbox}} -> is_nil(bbox) end)
#            |> Enum.map(fn {name, _art} ->
#              "Article #{name} has no bounding box. Is there a matching entry in the map?"
#            end)
#            |> Enum.sort() == []
#   end

#   defp all_articles_element_select(selector) do
#     Cache.Articles.get()
#     |> Enum.map(fn {name, a} ->
#       {:ok, html} = a.text |> Floki.parse_fragment()
#       {name, a, html}
#     end)
#     |> Enum.flat_map(fn {name, a, html} ->
#       Floki.find(html, selector) |> Enum.map(fn link -> {name, a, link} end)
#     end)
#   end
# end
