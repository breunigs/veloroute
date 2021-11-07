defmodule VelorouteWeb.LiveNavigationTest do
  use VelorouteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  @endpoint VelorouteWeb.Endpoint

  @regexHash ~r/data-video-hash=[^\s]+/
  @regexStart ~r/data-video-start=[^\s]+/

  test "clicking on route icon navigates to overview page", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> element("a", "Rahlstedt / Jenfeld")
    |> render_click() =~ "Artikel zu Veloroute 7"
  end

  test "initial render sets video", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    refute html =~ ~s|data-video-hash=""|
    refute html =~ ~s|data-video-start="0"|
  end

  test "map click on article renders article and sets video pos", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    refute html =~ "Kleekamp"

    html = render_hook(view, "map-click", %{"article" => "2018-04-08-4-kleekamp"})

    assert html =~ "<h3>Kleekamp"
    assert html =~ ~s|data-video-hash="e4cffabc1e73519e643f87466f40155d"|
    assert html =~ ~s|data-video-start="421785"|

    assert_patched(
      view,
      "/article/2018-04-08-4-kleekamp?bounds=9.724553%2C53.454363%2C10.21779%2C53.715809&pos=421785&video=e4cffabc1e73519e643f87466f40155d"
    )
  end

  test "link on article in sidebar renders article and sets video pos", %{conn: conn} do
    {:ok, view, html} = live(conn, "/changes")
    assert html =~ ~s|<h3 id="lastChanges">|

    html =
      view
      |> element("a", "Kleekamp")
      |> render_click()

    assert html =~ "<h3>Kleekamp"
    assert html =~ ~s|data-video-hash="e4cffabc1e73519e643f87466f40155d"|
    assert html =~ ~s|data-video-start="421785"|

    assert_patched(view, "/article/2018-04-08-4-kleekamp")
  end

  test "clicking on route twice reverses image", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

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
    {:ok, view, _html} = live(conn, "/")

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
    {:ok, view, _html} = live(conn, "/")

    html = render_hook(view, "map-click", %{article: "2018-10-13-3-paul-sorge-strasse"})
    assert html =~ "Du folgst: Alltagsroute 3"
  end

  test "converts from old hash style", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    html =
      render_hook(view, "convert-hash", %{hash: "19/53.59194/10.13825/TKH8zxPJnPClAmTIjD8bdA"})

    assert html =~ ~s(data-bounds="10.137565,53.591532,10.138935,53.592348")
  end

  test "handles route click after article without route", %{conn: conn} do
    {:ok, view, html} = live(conn, "/article/2019-01-06-10-zum-dubben")
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
    {:ok, view, html} = live(conn, "/article/2019-01-06-10-zum-dubben")
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

  test "with an article shown, clicking on just a route keeps article", %{conn: conn} do
    {:ok, view, html} = live(conn, "/article/2019-01-06-10-zum-dubben")
    assert html =~ ~s|Zum Dubben (neue Führung|

    html =
      render_hook(view, "map-click", %{
        lon: 9.90103646729878,
        lat: 53.473335309162394,
        zoom: 16
      })

    assert html =~ ~s|Zum Dubben (neue Führung|
  end

  test "click on video link with ref loads that track", %{conn: conn} do
    {:ok, view, html} = live(conn, "/lexikon/direktes-und-indirektes-abbiegen")
    refute html =~ ~s|äußere Ringroute|

    html =
      view
      |> element("a", "nur direktes Abbiegen")
      |> render_click()

    assert html =~ ~s|äußere Ringroute|
  end

  test "all articles can be rendered in the frame", %{conn: conn} do
    render_issues =
      Article.List.all()
      |> Enum.map(fn art ->
        try do
          path = Article.Decorators.path(art)
          {:ok, _view, html} = live(conn, path)

          if path =~ "/article/" && !(html =~ art.title()) do
            "#### #{art} ####\n\ndoes not include title in HTML, even though it's on /article/"
          end
        rescue
          err -> "#### #{art} ####\n\n#{Exception.format(:error, err, __STACKTRACE__)}"
        end
      end)
      |> Util.compact()

    assert [] == render_issues, Enum.join(render_issues, "\n\n\n")
  end
end
