defmodule Veloroute.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    ensure_videos_are_mounted()
    preprocess_search_terms()

    # List all child processes to be supervised
    children = [
      VelorouteWeb.Telemetry,
      # Start the endpoint when the application starts
      VelorouteWeb.Endpoint,
      Supervisor.child_spec(
        {Cachex, name: :tesla_cache_cachex, limit: Settings.map_cache_entry_limit()},
        id: :tesla_cache_cachex
      ),
      Supervisor.child_spec(
        {Cachex, [name: :image_extract_cachex, limit: Settings.thumbnail_cache_entry_limit()]},
        id: :image_extract_cachex
      ),
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

  defp preprocess_search_terms do
    Enum.each(Article.List.all(), &Article.Search.article_terms(&1))
  end

  defp ensure_videos_are_mounted do
    if File.dir?(Settings.video_dir_abs()) do
      rendered_path = Path.join(Settings.video_dir_abs(), "rendered")
      asset_path = Path.join([:code.priv_dir(:veloroute), "static", Settings.video_serve_path()])

      unless File.dir?(asset_path) do
        IO.puts("Setting up video dir for serving through Phoenix")
        File.rm(asset_path)
        File.mkdir_p!(Path.dirname(asset_path))
        File.ln_s!(rendered_path, asset_path)
      end
    else
      IO.puts(
        :stderr,
        """
        Video directory does not appear to be mounted.
        Expected #{Settings.video_dir_abs()} is not a directory.
        Mount the videos into the docker container, or ensure they
        and the thumbnails are served outside of this container.
        """
      )
    end
  end
end
