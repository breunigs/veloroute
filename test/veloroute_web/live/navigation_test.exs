defmodule VelorouteWeb.LiveNavigationTest do
  use VelorouteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  @endpoint VelorouteWeb.Endpoint

  test "broken images with extra characters can be recovered", %{conn: conn} do
    {:ok, _view, html} = conn |> get("/?img=ktvIxR_DaQOLNWRBDShxfA).") |> live()
    html =~ "ktvIxR_DaQOLNWRBDShxfA"
  end

  test "broken images with missing characters get dropped", %{conn: conn} do
    {:ok, _view, html} = conn |> get("/?img=ktvIxR_DaQOLNW") |> live()
    html =~ Settings.image()
  end

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

    assert_patched(
      view,
      "/article/2018-04-08-4-kleekamp?bounds=9.724553%2C53.454363%2C10.21779%2C53.715809&img=j7B3ZUn2dsw-clYblrn0Bw"
    )
  end

  test "prefers route image over article image", %{conn: conn} do
    {:ok, view, html} = conn |> get("/article/2018-04-08-4-kleekamp") |> live()
    assert html =~ ~s(data-img="j7B3ZUn2dsw-clYblrn0Bw")

    refute render_hook(view, "map-click", %{
             route: "4",
             article: "2018-04-08-4-kleekamp",
             lon: 10.024947118265771,
             lat: 53.63658286414295,
             zoom: 16
           }) =~ ~s(data-img="j7B3ZUn2dsw-clYblrn0Bw")
  end

  test "map click loads mly on route click", %{conn: conn} do
    {:ok, view, html} = conn |> get("/") |> live()
    assert html =~ ~s(data-mly-js="")

    assert render_hook(view, "map-click", %{
             route: "4",
             lon: 10.024947118265771,
             lat: 53.63658286414295,
             zoom: 16
           }) =~ ~s(data-mly-js="/)
  end

  test "map click loads mly on article click", %{conn: conn} do
    {:ok, view, html} = conn |> get("/") |> live()
    assert html =~ ~s(data-mly-js="")

    assert render_hook(view, "map-click", %{article: "2018-04-08-4-kleekamp"}) =~
             ~s(data-mly-js="/)
  end

  test "map click sets correct route on article click", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    html = render_hook(view, "map-click", %{article: "2018-10-13-3-paul-sorge-strasse"})
    assert html =~ "Du folgst: Alltagsroute 3"
  end

  test "converts from old hash style", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    html =
      render_hook(view, "convert-hash", %{hash: "19/53.59194/10.13825/TKH8zxPJnPClAmTIjD8bdA"})

    assert html =~ ~s(data-img="TKH8zxPJnPClAmTIjD8bdA")
    assert html =~ ~s(data-bounds="10.137565,53.591532,10.138935,53.592348")
  end

  test "slideshow sticks with current route, even other articles", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/article/2018-04-08-4-kleekamp") |> live()
    expected_route = "Du folgst: Alltagsroute 5"

    html =
      render_hook(view, "map-click", %{
        route: "5",
        lon: 10.086236642889446,
        lat: 53.627742238425384,
        zoom: 16
      })

    assert html =~ ~s(data-mly-js="/)
    assert html =~ expected_route

    assert render_click(element(view, "button", "〉")) =~ expected_route

    # force URL update
    send(view.pid, :check_updates)
    assert render(view) =~ expected_route
  end

  test "handles route click after article without route", %{conn: conn} do
    {:ok, view, html} = conn |> get("/article/2019-01-06-10-zum-dubben") |> live()
    assert html =~ ~s(Zum Dubben)

    html =
      render_hook(view, "map-click", %{
        route: "5",
        lon: 10.086236642889446,
        lat: 53.627742238425384,
        zoom: 16
      })

    assert html =~ "Du folgst: Alltagsroute 5"
  end

  test "handles article click after article without route", %{conn: conn} do
    {:ok, view, html} = conn |> get("/article/2019-01-06-10-zum-dubben") |> live()
    assert html =~ ~s|Zum Dubben (neue Führung|

    html =
      render_hook(view, "map-click", %{
        article: "2018-11-09-10-cuxhavener-strasse",
        lon: 9.90103646729878,
        lat: 53.473335309162394,
        zoom: 16
      })

    assert html =~ ~s(Cuxhavener Straße bis zum Dubben)
  end

  # TODO: rather slow, how to parallelize?
  for {art_name, art} <- Data.ArticleCache.get() do
    @art_name art_name
    @art art
    test "article #{@art_name} can be rendered", %{conn: conn} do
      path =
        case @art_name do
          "0000-00-00-" <> page -> "/#{page}"
          art_name -> "/article/#{art_name}"
        end

      {:ok, _view, html} = conn |> get(path) |> live()
      if path =~ "/article/", do: assert(html =~ @art.title)
    end
  end

  test "supports going back to default route after using back button", %{conn: conn} do
    path = "/?img=" <> Settings.image()

    {:ok, view, html} = live(conn, path)
    assert html =~ ~s|id="mlyPlaceholder"|
    assert html =~ ~s|/#{Settings.image()}/|

    html =
      view
      |> element(".icon", "7")
      |> render_click()

    assert html =~ ~s|Du folgst: Alltagsroute 7|
    assert html =~ ~s|data-mly-js="/|
    assert html =~ ~r/data-sequence="[a-zA-Z0-9_-]{22} /

    html =
      view
      |> render_patch(path)

    assert html =~ ~s|Du folgst: Alltagsroute 4|
  end
end
