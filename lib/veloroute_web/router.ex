defmodule VelorouteWeb.Router do
  use VelorouteWeb, :router

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {VelorouteWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LangPlug
  end

  scope "/", VelorouteWeb do
    get "/updates.atom", FeedController, :feed
    get "/sitemap.xml", SitemapController, :sitemap
    get "/routes/geo/updates.atom", FeedController, :legacy

    for num <- 1..14 do
      get "/#{num}", PageController, :redir_plain_veloroute
    end

    get "/favicon.ico", PageController, :redir_favicon
    get "/apple-touch-icon.png", PageController, :redir_favicon
    get "/apple-touch-icon-precomposed.png", PageController, :redir_favicon

    get "/blog/:article", PageController, :blog
    post "/plausible/event", PageController, :event
    get "/quality/:article", PageController, :quality
    get "/article/0000-00-00-:page", PageController, :article_vs_page
    get "/routes/geo/route:suffix", PageController, :old_route_links

    get "/erweiterte-funktionen", PageController, :old_export_link

    get "/images/thumbnails/:hash/:timestamp", ImageExtractController, :image

    post "/js_errors", PageController, :js_errors
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
