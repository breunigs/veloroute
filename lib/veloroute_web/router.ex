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

  # scope "/", VelorouteWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  scope "/", VelorouteWeb do
    pipe_through :browser

    live "/", FrameLive, as: :startpage
    live "/blog/:article", FrameLive
    live "/article/:article", FrameLive, as: :article
    live "/:page", FrameLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", VelorouteWeb do
  #   pipe_through :api
  # end
end
