defmodule Veloroute.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      VelorouteWeb.Telemetry,
      Data.ImageCache,
      # Start the endpoint when the application starts
      VelorouteWeb.Endpoint,
      {Phoenix.PubSub, [name: Veloroute.PubSub, adapter: Phoenix.PubSub.PG2]}
      # Starts a worker by calling: Veloroute.Worker.start_link(arg)
      # {Veloroute.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Veloroute.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    VelorouteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
