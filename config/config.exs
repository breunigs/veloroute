# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

creds_path = Path.expand("../data/phoenix_credentials.exs", __DIR__)

if File.exists?(creds_path),
  do: import_config(creds_path),
  else:
    (defmodule(PhoenixCredentials) do
       def secret_key_base, do: "run 'mix velo.setup'"
       def live_view_signing_salt, do: "run 'mix velo.setup'"
     end)

# Configures the endpoint
config :veloroute, VelorouteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: PhoenixCredentials.secret_key_base(),
  render_errors: [
    formats: [html: VelorouteWeb.ErrorHTML],
    layout: false
  ],
  live_view: [signing_salt: PhoenixCredentials.live_view_signing_salt()]

config :veloroute,
  map_matcher: Basemap.MapMatcher.OSRM,
  env: Mix.env()

config :os_mon,
  start_cpu_sup: false,
  start_disksup: false,
  start_memsup: false,
  start_os_sup: false

# Configures Elixir's Logger
config :logger, :default_formatter,
  format: "$date $time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix,
  static_compressors: [PhoenixBakery.Gzip, PhoenixBakery.Brotli, Basemap.IgnorePbfDigester],
  gzippable_exts: ~w(.js .map .css .txt .text .html .json .svg .eot .ttf .gpx .kml)

config :tesla, adapter: Tesla.Adapter.Hackney

config :logger, backends: [:console]

config :reverse_proxy_plug, :http_client, ReverseProxyPlug.HTTPClient.Adapters.Tesla

config :esbuild,
  version: "0.17.14",
  default: [
    args:
      ~w(js/app.js js/liveview.ts js/mbgl2.ts js/map.js js/video_player.js js/link_helper.ts --bundle --target=chrome80,firefox80,safari13,edge80 --outdir=../priv/static/assets --color=true),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :dart_sass,
  version: "1.63.6",
  default: [
    args: ~w(css/:../priv/static/assets/),
    cd: Path.expand("../assets", __DIR__)
  ]

config :mime, :types, %{
  "application/x-protobuf" => ["pbf"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
