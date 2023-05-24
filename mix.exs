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
      dialyzer: [plt_add_apps: [:mix, :ex_unit, :esbuild, :dart_sass]],
      releases: [
        prod: [
          include_executables_for: [:unix],
          steps: [:assemble, :tar]
        ]
      ],
      preferred_cli_env: [
        test: :test,
        dialyzer: :test,
        "velo.assets.prepare": :test
      ],
      aliases: aliases()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Veloroute.Application, []},
      extra_applications: [:logger, :runtime_tools, :plug] ++ extra_apps(Mix.env())
    ]
  end

  defp aliases() do
    [
      setup: [
        "deps.get",
        "deps.compile",
        "sass.install",
        "cmd --cd assets npm ci --progress=false --no-audit --loglevel=error"
      ]
    ]
  end

  defp extra_apps(:test), do: [:tqdm]
  defp extra_apps(:dev), do: [:tqdm]
  defp extra_apps(_), do: []

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "data", "test/support"]
  defp elixirc_paths(_), do: ["lib", "data"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:atomex, "~> 0.5.1"},
      {:cachex, "~> 3.4"},
      {:dart_sass, "~> 0.5", runtime: Mix.env() == :dev},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:eflame, "~> 1.0", only: [:dev, :test]},
      {:erlexec, "~> 2.0",
       only: [:dev, :test], system_env: [{"LDFLAGS", "-static -static-libgcc -static-libstdc++"}]},
      {:esbuild, "~> 0.2", runtime: Mix.env() == :dev},
      {:file_system, "~> 0.2", only: [:dev, :test]},
      {:floki, ">= 0.30.0"},
      {:hackney, "~> 1.17"},
      {:jason, "~> 1.1"},
      {:libgraph, "~> 0.7"},
      {:memoize, "~> 1.4"},
      {:natural_order, "~> 0.2.0"},
      {:phoenix_bakery, "~> 0.1.2", runtime: false},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.18"},
      {:phoenix, "~> 1.7.0"},
      {:plug_cowboy, "~> 2.3"},
      {:polyline, "~> 1.3"},
      {:reverse_proxy_plug, "~> 2.1"},
      {:saxy, "~> 1.0"},
      {:stream_split, "~> 0.1.0"},
      {:sweet_xml, "~> 0.6"},
      {:temp, "~> 0.4"},
      {:tesla, "~> 1.5.0"},
      {:tqdm, "~> 0.0.2", only: [:dev, :test]}
    ]
  end
end
