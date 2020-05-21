defmodule VelorouteWeb.LiveNavigationTest do
  use VelorouteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  @endpoint VelorouteWeb.Endpoint

  test "clicking on route icon navigates to overview page", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    view
    |> element(".icon", "7")
    |> render_click() =~ "Artikel zu Veloroute 7"
  end

  test "map click on article renders article", %{conn: conn} do
    {:ok, view, html} = conn |> get("/") |> live()
    refute html =~ "Kleekamp"

    assert render_hook(view, "map-click", %{"article" => "2018-04-08-4-kleekamp"}) =~ "Kleekamp"
    assert_patched(view, "/article/2018-04-08-4-kleekamp")
  end

  test "prefers route image over article image", %{conn: conn} do
    {:ok, view, html} = conn |> get("/article/2018-04-08-4-kleekamp") |> live()
    assert html =~ ~s(data-img="j7B3ZUn2dsw-clYblrn0Bw")

    refute render_hook(view, "map-click", %{
             route: "4",
             article: "2018-04-08-4-kleekamp",
             lon: 10.024947118265771,
             lat: 53.63658286414295
           }) =~ ~s(data-img="j7B3ZUn2dsw-clYblrn0Bw")
  end

  test "map click loads mly on route click", %{conn: conn} do
    {:ok, view, html} = conn |> get("/") |> live()
    assert html =~ ~s(data-mly-js="")

    assert render_hook(view, "map-click", %{
             route: "4",
             lon: 10.024947118265771,
             lat: 53.63658286414295
           }) =~ ~s(data-mly-js="/)
  end

  test "map click loads mly on article click", %{conn: conn} do
    {:ok, view, html} = conn |> get("/") |> live()
    assert html =~ ~s(data-mly-js="")

    assert render_hook(view, "map-click", %{article: "2018-04-08-4-kleekamp"}) =~
             ~s(data-mly-js="/)
  end

  test "converts from old hash style", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    html =
      render_hook(view, "convert-hash", %{hash: "19/53.59194/10.13825/TKH8zxPJnPClAmTIjD8bdA"})

    assert html =~ ~s(data-img="TKH8zxPJnPClAmTIjD8bdA")
    assert html =~ ~s(data-bounds="10.137565,53.591532,10.138935,53.592348")
  end
end
