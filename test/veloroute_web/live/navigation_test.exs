defmodule VelorouteWeb.LiveNavigationTest do
  use VelorouteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  @endpoint VelorouteWeb.Endpoint

  @video_hashes Data.Article.Static.Alltagsroute4.tracks()
                |> Enum.into(%{}, fn t -> {t.direction, Video.Generator.get(t).hash()} end)
  @video_starts %{forward: 364_931, backward: 231_234}
  @video_direction :forward

  test "viewing non-existent redirects", %{conn: conn} do
    assert {:error, {:live_redirect, _whatever}} = live(conn, "/DoesNotExist")
  end

  test "canonical URL is the same for different routes", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/freizeitroute-3")
    assert_attribute(html, "link[rel=canonical]", "href", "/freizeitroute-3")

    {:ok, _view, html} = live(conn, "/FR3")
    assert_attribute(html, "link[rel=canonical]", "href", "/freizeitroute-3")
  end

  test "clicking on route icon navigates to overview page", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    view
    |> element("a", "Rahlstedt / Jenfeld")
    |> render_click() =~ "Artikel zu Veloroute 7"
  end

  test "initial render selects video near the start", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    # i.e. from 0 ms to 19999ms
    assert view |> element("progress") |> render() =~ ~r{value="1?\d?\d?\d?\d"}
  end

  test "initial render starts video at 0 even on articles", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/alltagsroute-6")
    assert html =~ ~s|<span id="current" title="Videoposition">0:00</span>|
  end

  test "initial render honors bounds param even on blog articles", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/article/2018-04-08-4-kleekamp?bounds=1-2-3-4")
    assert html =~ ~s|/map/___static/2.0,3.0|
  end

  test "initial render uses article bounding box when no bounds param present", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/article/2018-04-08-4-kleekamp")
    assert html =~ ~s|/map/___static/10.025547,53.63463,15|
  end

  test "initial render can load video without position timestamp", %{conn: conn} do
    {:ok, _view, _html} =
      live(conn, "/article/2018-04-08-4-kleekamp?video=d763295b172404e6733296718edd6740")
  end

  test "picks video near point of interest", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/lexikon/fahrbahn-und-nebenflaechen")

    html =
      view
      |> element("a", "Direktes und Indirektes Abbiegen")
      |> render_click()

    assert_attribute(
      html,
      "#videoRoute",
      "title",
      fn title -> String.contains?(title, "Holstenplatz") end
    )
  end

  test "map click on article renders article and sets video pos", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    refute html =~ "Kleekamp"

    html = render_hook(view, "map-click", %{"article" => "2018-04-08-4-kleekamp"})

    assert html =~ "<h3 itemprop=\"headline\">Kleekamp"

    assert_push_event(view, :video_meta, %{
      "hash" => unquote(@video_hashes[@video_direction]),
      "start" => unquote(@video_starts[@video_direction])
    })

    vanity = @video_hashes[@video_direction] |> Video.Generator.get() |> Video.Rendered.vanity()

    assert_patched(
      view,
      "/article/2018-04-08-4-kleekamp?bounds=9.724553-53.454363-10.21779-53.715809&pos_sec=#{@video_starts[@video_direction] / 1000.0}&video=#{vanity}"
    )
  end

  test "map click on article without (related) videos doesn't change video", %{conn: conn} do
    assert art =
             Article.List.category("Blog")
             |> Stream.filter(&Article.Decorators.bbox_self/1)
             |> Stream.filter(fn art -> Article.Decorators.related_tracks(art) == [] end)
             |> Enum.at(0)

    {:ok, view, _html} = live(conn, "/")
    # consume any initial push event
    assert_push_event(view, :video_meta, _payload)

    art_center = Article.Decorators.geo_center(art)

    render_hook(view, "map-click", %{
      "article" => art.name(),
      "lat" => art_center.lat,
      "lon" => art_center.lon,
      "route" => [],
      "zoom" => 16
    })

    # check there was no further push event
    %{proxy: {ref, _topic, _}} = view
    refute_receive {^ref, {:push_event, :video_meta, _payload}}
  end

  test "link on article in sidebar renders article and sets video pos", %{conn: conn} do
    {:ok, view, html} = live(conn, "/changes")
    assert html =~ ~s|<h3 id="lastChanges">|

    html =
      view
      |> element("a", "Kleekamp")
      |> render_click()

    assert html =~ "<h3 itemprop=\"headline\">Kleekamp"

    assert_push_event(view, :video_meta, %{
      "hash" => unquote(@video_hashes[@video_direction]),
      "start" => unquote(@video_starts[@video_direction])
    })

    assert_patched(view, "/article/2018-04-08-4-kleekamp")
  end

  test "link on article in sidebar with own tracks sets video pos near article center", %{
    conn: conn
  } do
    {:ok, view, html} = live(conn, "/changes")
    assert html =~ ~s|<h3 id="lastChanges">|

    view
    |> element("a", "Bramfelder Straße (Barmbeker Markt bis Krausestraße")
    |> render_click()

    assert_push_event(view, :video_meta, %{
      "hash" => "5995942c8e2bf76dd2e56339c6942566",
      "start" => 50_492
    })
  end

  test "clicking on route twice reverses image", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/alltagsroute-5")

    click_pos = %{
      route: "5",
      lon: 10.0457982,
      lat: 53.588579,
      zoom: 16
    }

    assert_attribute(
      render_hook(view, "map-click", click_pos),
      "#videoRoute",
      "title",
      "Du folgst: Alltagsroute 5 aus der Innenstadt nach Duvenstedt"
    )

    assert_attribute(
      render_hook(view, "map-click", click_pos),
      "#videoRoute",
      "title",
      "Du folgst: Alltagsroute 5 von Duvenstedt in die Innenstadt"
    )
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

    before = shown_route(html)
    html = render_hook(view, "map-click", %{article: "bau"})
    now = shown_route(html)

    assert before == now
  end

  test "map click sets correct route on article click", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    html = render_hook(view, "map-click", %{article: "2018-10-13-3-paul-sorge-strasse"})
    assert html =~ "Du folgst: Alltagsroute 3"
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

  test "honors bounds param from URL", %{conn: conn} do
    {:ok, _view, html} =
      live(
        conn,
        "/?bounds=9.894765-53.552683-9.901446-53.554215&pos_sec=269.04&video=34379-alltagsroute-1"
      )

    # i.e. map preview is center of bounds
    assert html =~ "/map/___static/9.8981055,53.553449,16"
  end

  test "honors video and pos_sec params from URL", %{conn: conn} do
    {:ok, _view, html} =
      live(
        conn,
        "/?bounds=9.894765-53.552683-9.901446-53.554215&pos_sec=269.04&video=34379-alltagsroute-1"
      )

    assert_attribute(
      html,
      "video",
      "poster",
      "/images/thumbnails/343799351ddb76ccb212673cffe25934/269040"
    )
  end

  test "clicking on article with tracks selects video close to click position", %{conn: conn} do
    article = "2023-04-15-bramfelder-strasse-bis-krausestrasse"
    forward_video_hash = "bef5fb6f0cd3ce7a30ade62e6325904b"
    forward_video_abbrev = String.slice(forward_video_hash, 0, Video.Rendered.vanity_id_length())
    pos_sec = 10.642

    {:ok, view, _html} = live(conn, "/")

    render_hook(view, "map-click", %{
      article: article,
      route: nil,
      lon: 10.044114389514988,
      lat: 53.58192508895843,
      zoom: 15.493022774735785
    })

    path = assert_patch(view)
    assert path =~ ~r{/article/#{article}}
    assert path =~ ~r{video=#{forward_video_abbrev}}
    assert path =~ ~r{pos_sec=#{pos_sec}}

    html = render_patch(view, path)

    # hack: don't quite know how to assert that URL didn't change, so we use the
    # page's video thumbnail as alternative that should have the same content
    assert_attribute(
      html,
      ~s(meta[property="og:image"),
      "content",
      &String.ends_with?(&1, "/images/thumbnails/#{forward_video_hash}/#{round(pos_sec * 1000)}")
    )
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
    # layer selector
    assert_layers(html, ~w(Artikel Freizeitrouten))

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
    # layer selector
    assert_layers(html, ~w(Artikel Alltagsrouten))
  end

  test "switches routes when new article has different route", %{conn: conn} do
    {:ok, view, html} = live(conn, "/alltagsroute-4")
    route_initial = shown_route(html)

    # going to startpage should not change the video
    html =
      view
      |> element("a.header")
      |> render_click()

    assert route_initial == shown_route(html)

    # going to different route page should switch
    html =
      view
      |> element("a[href^=\"/alltagsroute-3\"]")
      |> render_click()

    assert route_initial != shown_route(html)
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

    assert_layers(html, ~w(Artikel Alltagsrouten Bezirksrouten Freizeitrouten))

    html =
      view
      |> element("a", "Wegbeziehung der Freizeitroute")
      |> render_click()

    assert_layers(html, ~w(Artikel Alltagsrouten Bezirksrouten  Freizeitrouten))
  end

  test "article without route group shows :alltag", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/lexikon/kopenhagener-loesung")

    assert_layers(html, ~w(Artikel Alltagsrouten))
  end

  test "article without specific videos uses map og:image", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")

    assert_attribute(
      html,
      ~s(meta[property="og:image"),
      "content",
      &String.contains?(&1, "/map/___static")
    )
  end

  test "articles use correct image preview", %{conn: conn} do
    [
      {"article with specific video", "/alltagsroute-1", "/images/thumbnails/"},
      {"article with related video", "/article/2018-04-08-4-kleekamp", "/images/thumbnails/"},
      {"article without videos", "/", "/map/___static"}
    ]
    |> Enum.each(fn {_desc, path, expected} ->
      {:ok, _view, html} = live(conn, path)

      assert_attribute(
        html,
        ~s(meta[property="og:image"),
        "content",
        &String.contains?(&1, expected)
      )
    end)
  end

  test "can render incorrect URLs", %{conn: conn} do
    [
      {"malformed video vanity", "/?video=21db2-br-wandsbek-w7|",
       "21db20586cc50256d79176bdb195c29a"}
    ]
    |> Enum.each(fn {_desc, path, expected} ->
      {:ok, _view, html} = live(conn, path)
      assert html =~ expected
    end)
  end

  defp assert_attribute(html, selector, attribute, expected) do
    [actual] = Floki.parse_document!(html) |> Floki.attribute(selector, attribute)
    actual = if is_list(expected), do: actual |> String.split(",") |> Enum.sort(), else: actual

    cond do
      is_function(expected) -> assert expected.(actual)
      is_binary(expected) -> assert expected == actual
    end
  end

  defp assert_layers(html, want_layers) do
    have_layers =
      html
      |> Floki.parse_document!()
      |> Floki.attribute("#layerSwitcher button.layer.active", "value")

    assert Enum.sort(want_layers) == Enum.sort(have_layers)
  end

  defp shown_route(html) do
    Floki.parse_document!(html) |> Floki.attribute("#videoRoute", "title")
  end
end
