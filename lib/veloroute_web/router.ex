defmodule VelorouteWeb.Router do
  use VelorouteWeb, :router
  use Sentry.PlugCapture

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {VelorouteWeb.LayoutView, :app}
    plug Sentry.PlugContext
  end

  scope "/", VelorouteWeb do
    get "/updates.atom", FeedController, :feed
    get "/routes/geo/updates.atom", FeedController, :legacy

    for num <- 1..14 do
      get "/#{num}", PageController, :redir_plain_veloroute
    end

    get "/blog/:article", PageController, :blog
    post "/plausible/event", PageController, :event
    get "/quality/:article", PageController, :quality
    get "/article/0000-00-00-:page", PageController, :article_vs_page
    get "/routes/geo/route:suffix", PageController, :old_route_links

    # note: must be manually adjusted in robots.txt
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
