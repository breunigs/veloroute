defmodule VelorouteWeb.Router do
  use VelorouteWeb, :router

  import Phoenix.LiveView.Router

  defp read_cookies(conn, cookie_names) do
    conn = Plug.Conn.fetch_cookies(conn)

    Enum.reduce(cookie_names, conn, fn cookie_name, conn ->
      value = conn.cookies[to_string(cookie_name)]
      Plug.Conn.put_session(conn, cookie_name, value)
    end)
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :read_cookies, [:show_map_image, :lang]
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LangPlug
  end

  scope "/", VelorouteWeb do
    get "/updates.atom", FeedController, :feed
    get "/sitemap.xml", SitemapController, :sitemap
    get "/routes/geo/updates.atom", FeedController, :legacy

    get "/_health", PageController, :health
    get "/termine.geojson", PageController, :appointments_geojson

    for num <- 1..14 do
      get "/#{num}", PageController, :redir_plain_veloroute
    end

    get "/favicon.ico", PageController, :redir_favicon
    get "/apple-touch-icon.png", PageController, :redir_favicon
    get "/apple-touch-icon-precomposed.png", PageController, :redir_favicon
    get "/apple-touch-icon-152x152-precomposed.png", PageController, :redir_favicon
    get "/apple-touch-icon-152x152.png", PageController, :redir_favicon

    get "/export-all-gpx", PageController, :export_all_gpx

    get "/blog/:article", PageController, :blog
    post "/plausible/event", PageController, :event
    get "/quality/:article", PageController, :quality
    get "/article/0000-00-00-:page", PageController, :article_vs_page
    get "/routes/geo/route:suffix", PageController, :old_route_links

    get "/erweiterte-funktionen", PageController, :old_export_link

    get "/images/thumbnails/:hash/:timestamp", ImageExtractController, :image

    post "/js_errors", PageController, :js_errors

    get "/.well-known/*subpage", PageController, :well_known_404
    get "/wp-admin/*subpage", PageController, :tarpit
    get "/wp-content/*subpage", PageController, :tarpit
    get "/wp-includes/*subpage", PageController, :tarpit
    get "/wp/*subpage", PageController, :tarpit
    get "/wordpress/*subpage", PageController, :tarpit
  end

  scope "/", VelorouteWeb do
    pipe_through :browser

    live "/article/:article", FrameLive, as: :article
    live "/:subdir/:article", FrameLive, as: :subdir
    live "/:page", FrameLive, as: :page
    live "/", FrameLive, as: :startpage

    live "/*path", FrameLive
  end
end
