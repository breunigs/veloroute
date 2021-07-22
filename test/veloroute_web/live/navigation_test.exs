defmodule VelorouteWeb.LiveNavigationTest do
  use VelorouteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  @endpoint VelorouteWeb.Endpoint

  @regexHash ~r/data-video-hash=[^\s]+/
  @regexStart ~r/data-video-start=[^\s]+/

  test "clicking on route icon navigates to overview page", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    view
    |> element(".icon", "7")
    |> render_click() =~ "Artikel zu Veloroute 7"
  end

  test "initial render sets video", %{conn: conn} do
    {:ok, _view, html} = conn |> get("/") |> live()
    refute html =~ ~s|data-video-hash=""|
    refute html =~ ~s|data-video-start="0"|
  end

  test "map click on article renders article and sets video pos", %{conn: conn} do
    {:ok, view, html} = conn |> get("/") |> live()
    refute html =~ "Kleekamp"

    html = render_hook(view, "map-click", %{"article" => "2018-04-08-4-kleekamp"})

    assert html =~ "<h3>Kleekamp"
    assert html =~ ~s|data-video-hash="103d0f0e5a70650b87a10bf1b4930e82"|
    assert html =~ ~s|data-video-start="421049"|

    assert_patched(
      view,
      "/article/2018-04-08-4-kleekamp?bounds=9.724553%2C53.454363%2C10.21779%2C53.715809&pos=421049&video=103d0f0e5a70650b87a10bf1b4930e82"
    )
  end

  test "link on article in sidebar renders article and sets video pos", %{conn: conn} do
    {:ok, view, html} = conn |> get("/changes") |> live()
    assert html =~ ~s|<h3 id="lastChanges">|

    html =
      view
      |> element("a", "Kleekamp")
      |> render_click()

    assert html =~ "<h3>Kleekamp"
    assert html =~ ~s|data-video-hash="103d0f0e5a70650b87a10bf1b4930e82"|
    assert html =~ ~s|data-video-start="421049"|

    assert_patched(view, "/article/2018-04-08-4-kleekamp")
  end

  test "clicking on route twice reverses image", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    click_pos = %{
      route: "3",
      lon: 10.024947118265771,
      lat: 53.63658286414295,
      zoom: 16
    }

    a = Regex.run(@regexHash, render_hook(view, "map-click", click_pos))
    b = Regex.run(@regexHash, render_hook(view, "map-click", click_pos))

    assert a != b
  end

  test "clicking on article without tracks keeps the video as is", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    html =
      render_hook(view, "map-click", %{
        route: "3",
        lon: 10.024947118265771,
        lat: 53.63658286414295,
        zoom: 16
      })

    aHash = Regex.run(@regexHash, html)
    aStart = Regex.run(@regexStart, html)

    html = render_hook(view, "map-click", %{article: "2021-03-13-am-neumarkt"})

    bHash = Regex.run(@regexHash, html)
    bStart = Regex.run(@regexStart, html)

    assert aHash == bHash
    assert aStart == bStart
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

    assert html =~ ~s(data-bounds="10.137565,53.591532,10.138935,53.592348")
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
  for {art_name, art} <- Cache.Articles.get() do
    @art_name art_name
    @art art
    @tag timeout: :infinity
    test "article #{@art_name} can be rendered", %{conn: conn} do
      if String.contains?(@art_name, "kreuzung-am-alten-posthaus") do
        path = VelorouteWeb.VariousHelpers.article_path(%Article{name: @art_name})

        {:ok, _view, html} = conn |> get(path) |> live()
        if path =~ "/article/", do: assert(html =~ @art.title)
      end
    end
  end
end
