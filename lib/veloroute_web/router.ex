defmodule VelorouteWeb.Router do
  use VelorouteWeb, :router
  use Plug.ErrorHandler
  use Sentry.Plug

  import Phoenix.LiveView.Router
  import Plug.BasicAuth
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {VelorouteWeb.LayoutView, :app}
  end

  pipeline :admins_only do
    plug :basic_auth,
      username: Credentials.dashboard_user(),
      password: Credentials.dashboard_password()
  end

  scope "/" do
    pipe_through [:browser, :admins_only]

    if is_binary(Credentials.dashboard_password()) && Credentials.dashboard_password() != "",
      do: live_dashboard("/dashboard", metrics: VelorouteWeb.Telemetry)
  end

  scope "/", VelorouteWeb do
    get "/updates.atom", FeedController, :feed
    get "/routes/geo/updates.atom", FeedController, :legacy

    get "/blog/:article", PageController, :blog
    get "/quality/:article", PageController, :quality
    get "/article/0000-00-00-:page", PageController, :article_vs_page
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
