defmodule VelorouteWeb.ArticleViewTest do
  use ExUnit.Case, async: true

  alias VelorouteWeb.ArticleView

  test "all articles can be rendered" do
    Data.articles()
    |> Map.keys()
    |> Enum.each(&ArticleView.render(&1, []))
  end

  test "only valid routes are referenced" do
    Data.articles()
    |> Map.values()
    |> Enum.each(fn art ->
      art
      |> Map.fetch!(:text)
      |> Floki.parse_fragment!()
      |> Floki.find(~s(a[href^="/"]))
      |> Enum.map(fn {"a", attr, children} ->
        href = ArticleView.find_attribute(attr, "href")
        m = ArticleView.parse_map_link(href)

        if m, do: %{route: m["route"], img: m["img"], href: href, text: Floki.text(children)}
      end)
      |> Enum.reject(&is_nil/1)
      |> Enum.each(fn
        %{route: r, img: _img, href: href, text: text} ->
          if r != "" do
            assert nil != Data.Map.find_relation_by_tag(Data.map(), :id, r),
                   """
                   #{art.name}.yaml: link "#{text}" refers to route '#{r}',
                   but that route is not defined on the map (href: #{href})
                   """
          end
      end)
    end)
  end
end
