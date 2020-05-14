defmodule VelorouteWeb.Router do
  use VelorouteWeb, :router

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {VelorouteWeb.LayoutView, :app}
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  scope "/", VelorouteWeb do
    get "/updates.atom", FeedController, :feed
    get "/routes/geo/updates.atom", FeedController, :legacy

    get "/blog/:article", PageController, :blog
  end

  scope "/", VelorouteWeb do
    pipe_through :browser

    live "/article/:article", FrameLive, as: :article
    live "/:page", FrameLive, as: :page
    live "/", FrameLive, as: :startpage
  end
end
