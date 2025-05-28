defmodule Veloroute.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    warn_if_videos_missing()

    # List all child processes to be supervised
    children = [
      Search.Meilisearch.Runner,
      Basemap.Static.Runner.cache_child_spec(),
      Basemap.Static.Runner,
      Video.DiskPreloader,
      # Start the endpoint when the application starts
      VelorouteWeb.Endpoint,
      TeslaCache.child_spec(),
      VelorouteWeb.ImageExtractController.cache_child_spec(),
      Appointments.CriticalMassUpdater,
      Appointments.CriticalMassUpdater.cache_child_spec()
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Veloroute.Supervisor]
    app = Supervisor.start_link(children, opts)
    Warmup.maybe()
    app
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    VelorouteWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp warn_if_videos_missing do
    if not File.dir?(Settings.r(:video_dir_abs)) do
      Logger.error("""
      Video directory does not appear to be mounted.
      Expected #{Settings.r(:video_dir_abs)} is not a directory.
      Mount the videos into the docker container, or ensure they
      and the thumbnails are served outside of this container.
      """)
    end
  end
end
