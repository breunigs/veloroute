defmodule Veloroute.MixProject do
  use Mix.Project

  def project do
    [
      app: :veloroute,
      version: "2.0.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:mix, :ex_unit]],
      releases: [
        prod: [
          include_executables_for: [:unix],
          steps: [:assemble, :tar]
        ]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Veloroute.Application, []},
      extra_applications: [:logger, :runtime_tools, :plug, :gpx]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "data", "test/support"]
  defp elixirc_paths(_), do: ["lib", "data"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:atomex, "0.3.0"},
      {:browser, "~> 0.4.4"},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:eflame, "~> 1.0", only: [:dev, :test]},
      {:ex_aws_s3, "~> 2.0", only: [:dev, :test]},
      {:ex_aws, "~> 2.1", only: [:dev, :test]},
      {:floki, ">= 0.0.0"},
      {:fuzzy_compare, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:gpx, "~> 0.1.0"},
      {:hackney, "~> 1.9"},
      {:jason, "~> 1.0"},
      {:libgraph, "~> 0.7"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_dashboard, "~> 0.1"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.14.7"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix, "~> 1.5.9"},
      {:plug_cowboy, "~> 2.0"},
      {:polyline, "~> 1.2"},
      {:saxy, "~> 1.0.0"},
      {:sentry, "~> 7.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:telemetry, "~> 0.4.2 or ~> 0.5"},
      {:temp, "~> 0.4", only: [:dev, :test]},
      {:tesla_cache, "~> 1.1.0"},
      {:tesla, "~> 1.3.0"},
      {:yaml_elixir, "~> 2.4"}
    ]
  end
end
