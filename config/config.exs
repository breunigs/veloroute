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
  disk_preload: true,
  env: Mix.env()

config :os_mon,
  start_cpu_sup: false,
  start_disksup: false,
  start_memsup: false,
  start_os_sup: false

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

# Configures Elixir's Logger
config :logger, :default_formatter,
  # format: "$date $time [$level] $metadata $message\n",
  format: {LogFormatter, :format},
  metadata: [:request_id, :file, :line]

config :logger, truncate: :infinity

config :phoenix, :json_library, JSON

config :phoenix,
  static_compressors: [PhoenixBakery.Gzip, PhoenixBakery.Brotli, Basemap.IgnorePbfDigester],
  gzippable_exts: ~w(.js .map .css .txt .text .html .json .svg .eot .ttf .gpx .kml)

config :tesla, adapter: Tesla.Adapter.Hackney

config :reverse_proxy_plug, :http_client, ReverseProxyPlug.HTTPClient.Adapters.Tesla

config :esbuild,
  version: "0.27.2",
  default: [
    args:
      ~w(js/app.ts js/liveview.ts js/mbgl2.ts js/map.js js/map_image.ts js/map_image_stub.ts js/video_player.js js/link_helper.ts --bundle --target=chrome117,firefox115,safari17,edge140 --outdir=../priv/static/assets --color=true),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :dart_sass,
  version: "1.97.1",
  default: [
    args: ~w(assets/css/app.scss priv/static/assets/app.css),
    cd: Path.expand("..", __DIR__)
  ]

config :mime, :types, %{
  "application/x-protobuf" => ["pbf"]
}

# https://hexdocs.pm/tesla/v1-macro-migration.html
config :tesla, disable_deprecated_builder_warning: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

import_config "settings.exs"
