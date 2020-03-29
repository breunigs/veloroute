defmodule Veloroute.MixProject do
  use Mix.Project

  def project do
    [
      app: :veloroute,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Veloroute.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"},
      {:gettext, "~> 0.11"},
      {:hackney, "~> 1.9"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.16"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_pubsub, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:saxy, "~> 1.0.0"},
      {:temp, "~> 0.4", only: [:dev, :test]},
      {:tesla, "~> 1.3.0"},
      {:yaml_elixir, "~> 2.4"}
    ]
  end
end
