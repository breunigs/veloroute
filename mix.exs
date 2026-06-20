defmodule Veloroute.MixProject do
  use Mix.Project

  def project do
    [
      app: :veloroute,
      version: "2.0.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        prod: [
          include_executables_for: [:unix],
          steps: [:assemble],
          strip_beams: true
        ]
      ],
      aliases: aliases(),
      listeners: [Phoenix.CodeReloader]
    ]
  end

  def cli do
    [preferred_envs: [test: :test, credo: :test, "velo.assets.prepare": :test]]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Veloroute.Application, []},
      extra_applications: [:logger, :runtime_tools, :plug, :os_mon] ++ extra_apps(Mix.env())
    ]
  end

  defp aliases() do
    [
      setup: [
        "deps.get",
        "deps.compile",
        "sass.install",
        "cmd --cd assets npm ci --progress=false --no-audit --loglevel=error",
        "cmd --cd assets npm run build:hls"
      ]
    ]
  end

  defp extra_apps(:test), do: [:tqdm]
  defp extra_apps(:dev), do: [:tqdm]
  defp extra_apps(_), do: []

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:dev), do: ["lib", "data", "lib_cli"]
  defp elixirc_paths(:test), do: ["lib", "data", "lib_cli", "test/support"]
  defp elixirc_paths(:prod), do: ["lib", "data"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    is_dev = Mix.env() == :dev
    is_test = Mix.env() == :test

    [
      {:atomex, "~> 0.5.1"},
      {:bandit, "~> 1.8"},
      {:brotli, "~> 0.3"},
      {:cachex, "~> 4.0"},
      {:dart_sass, "~> 0.5", runtime: is_dev},
      {:eflambe, "~> 0.3.0", only: [:dev, :test]},
      {:erlexec, "~> 2.0",
       runtime: is_dev || is_test,
       system_env: [{"LDFLAGS", "-static -static-libgcc -static-libstdc++"}]},
      {:esbuild, "~> 0.2", runtime: is_dev},
      {:file_system, "~> 1.0", runtime: is_dev || is_test},
      {:floki, ">= 0.30.0"},
      {:hackney, "~> 1.17"},
      {:libgraph, "~> 0.7"},
      {:memoize, "~> 1.4"},
      {:natural_order, "~> 0.3.0"},
      {:phoenix_bakery, "~> 1.0.0", runtime: false},
      {:phoenix_live_view, "~> 1.2"},
      {:phoenix, "~> 1.8.2"},
      {:lazy_html, ">= 0.0.0", only: :test},
      {:polyline, "~> 1.6"},
      {:recon, "~> 2.5"},
      {:reverse_proxy_plug, "~> 3.0"},
      {:saxy, "~> 1.0"},
      {:stream_split, "~> 0.1.0"},
      {:sweet_xml, "~> 0.7"},
      {:temp, "~> 0.4"},
      {:tesla, "~> 1.20.0"},
      {:tqdm, runtime: is_dev, git: "https://github.com/breunigs/tqdm_elixir", branch: "updates"},
      {:tz, "~> 0.28"},
      {:ua_parser, "~> 1.8"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      # auto video join
      {:ortex, "~> 0.1.10", only: [:dev, :test]},
      {:owl, "~> 0.12", only: [:dev, :test]},
      {:scholar, "~> 0.4.0", only: [:dev, :test]},
      {:rustler, "~> 0.38.0"}
    ]
  end
end
