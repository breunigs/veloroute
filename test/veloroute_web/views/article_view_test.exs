defmodule VelorouteWeb.ArticleViewTest do
  use VelorouteWeb.ConnCase, async: true

  alias VelorouteWeb.ArticleView

  test "all articles can be rendered" do
    Data.articles()
    |> Map.keys()
    |> Enum.each(fn name ->
      ArticleView.render(name, [])
    end)
  end
end
