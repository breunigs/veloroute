defmodule VelorouteWeb.Router do
  use VelorouteWeb, :router
  use Plug.ErrorHandler
  use Sentry.Plug

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {VelorouteWeb.LayoutView, :app}
  end

  scope "/", VelorouteWeb do
    get "/updates.atom", FeedController, :feed
    get "/routes/geo/updates.atom", FeedController, :legacy

    get "/blog/:article", PageController, :blog
    get "/quality/:article", PageController, :quality
    get "/article/0000-00-00-:page", PageController, :article_vs_page
    get "/routes/geo/route:suffix", PageController, :old_route_links
    post "/js_errors", PageController, :js_errors
  end

  scope "/", VelorouteWeb do
    pipe_through :browser

    live "/article/:article", FrameLive, as: :article
    live "/:page", FrameLive, as: :page
    live "/", FrameLive, as: :startpage

    live "/*path", FrameLive
  end
end
