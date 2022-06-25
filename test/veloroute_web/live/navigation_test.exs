defmodule VelorouteWeb.LiveNavigationTest do
  use VelorouteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  @endpoint VelorouteWeb.Endpoint

  @regexHash ~r/data-video-hash=\"([^\s]+)\"/
  @regexStart ~r/data-video-start=[^\s]+/

  @video_hashes Data.Article.Static.Alltagsroute4.tracks()
                |> Enum.map(fn %Video.Track{direction: dir} = t -> {dir, Video.Track.hash(t)} end)
                |> Enum.into(%{})
  @video_starts %{forward: 425_307}

  test "viewing non-existent redirects", %{conn: conn} do
    assert {:error, {:live_redirect, _whatever}} = live(conn, "/DoesNotExist")
  end

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
    assert html =~ ~s|data-video-hash="#{@video_hashes[:forward]}"|
    assert html =~ ~s|data-video-start="#{@video_starts[:forward]}"|

    assert_patched(
      view,
      "/article/2018-04-08-4-kleekamp?bounds=9.724553%2C53.454363%2C10.21779%2C53.715809&pos=#{@video_starts[:forward]}&video=#{@video_hashes[:forward]}"
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
    assert html =~ ~s|data-video-hash="#{@video_hashes[:forward]}"|
    assert html =~ ~s|data-video-start="#{@video_starts[:forward]}"|

    assert_patched(view, "/article/2018-04-08-4-kleekamp")
  end

  test "clicking on route twice reverses image", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/alltagsroute-3")

    click_pos = %{
      route: "3",
      lon: 10.024947118265771,
      lat: 53.63658286414295,
      zoom: 16
    }

    a = Regex.run(@regexHash, render_hook(view, "map-click", click_pos))
    b = Regex.run(@regexHash, render_hook(view, "map-click", click_pos))

    renderA = a |> Enum.at(1) |> Video.Rendered.get()
    renderB = b |> Enum.at(1) |> Video.Rendered.get()

    assert renderA.name() != renderB.name()
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

  test "with an article shown, clicking on the related route keeps article", %{conn: conn} do
    {:ok, view, html} = live(conn, "/article/2019-01-06-10-zum-dubben")
    assert html =~ ~s|Zum Dubben (neue Führung|

    html =
      render_hook(view, "map-click", %{
        route: "10",
        lon: 9.90103646729878,
        lat: 53.473335309162394,
        zoom: 16
      })

    assert html =~ ~s|Zum Dubben (neue Führung|
  end

  test "with an article shown, clicking on UNrelated route, switches", %{conn: conn} do
    {:ok, view, html} = live(conn, "/article/2019-01-06-10-zum-dubben")
    assert html =~ ~s|Zum Dubben (neue Führung|

    html =
      render_hook(view, "map-click", %{
        route: "1GR",
        lon: 9.90103646729878,
        lat: 53.473335309162394,
        zoom: 16
      })

    assert html =~ ~s|1. Grüner Ring|
  end

  test "hides freizeit routes when clicking on a alltag route", %{conn: conn} do
    {:ok, view, html} = live(conn, "/freizeitroute-7")
    # article
    assert html =~ ~s|Freizeitroute 7 – Harburger Berge|
    # video
    assert html =~ ~s|Du folgst: Harburger Berge (FR7)|
    # control
    assert html =~ ~s|data-visible-types="articles,freizeit"|

    html =
      render_hook(view, "map-click", %{
        route: "10",
        article: nil,
        lon: 9.88432366062463,
        lat: 53.473286913579784,
        zoom: 12.484740216464493
      })

    # article
    assert html =~ ~s|<h3>Alltagsroute 10</h3>|
    # video
    assert html =~ ~s|Du folgst: Alltagsroute 10|
    # control
    assert html =~ ~s|data-visible-types="articles,alltag"|
  end

  test "switches routes when new article has different route", %{conn: conn} do
    {:ok, view, html} = live(conn, "/alltagsroute-4")
    assert html =~ ~s|aus der Innenstadt zum Ochsenzoll|

    html =
      view
      |> element("a", "Radwege rund um die Binnenalster")
      |> render_click()

    assert html =~ ~s|aus der Innenstadt nach Niendorf|
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

  test "article with multiple route group shows all, even after selecting video", %{conn: conn} do
    {:ok, view, html} = live(conn, "/article/2021-11-09-u-farmsen")

    assert_attribute(html, "#control", "data-visible-types", ~w(alltag articles freizeit))

    html =
      view
      |> element("a", "Wegbeziehung der Freizeitroute")
      |> render_click()

    assert_attribute(html, "#control", "data-visible-types", ~w(alltag articles freizeit))
  end

  test "article without route group shows :alltag", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/lexikon/kopenhagener-loesung")

    assert_attribute(html, "#control", "data-visible-types", ~w(alltag articles))
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

  defp assert_attribute(html, selector, attribute, expected) do
    [actual] = Floki.parse_document!(html) |> Floki.attribute(selector, attribute)
    actual = if is_list(expected), do: actual |> String.split(",") |> Enum.sort(), else: actual
    assert expected == actual
  end
end
