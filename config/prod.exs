use Mix.Config

import_config "../data/settings.ex"

parsed = URI.parse(Settings.url())
port = String.to_integer(System.get_env("PORT") || "4000")

config :veloroute, VelorouteWeb.Endpoint,
  url: [host: parsed.host, port: parsed.port, scheme: parsed.scheme],
  cache_static_manifest: "priv/static/cache_manifest.json",
  http: [
    port: port,
    transport_options: [socket_opts: [:inet6]]
  ],
  server: true,
  force_ssl: [
    rewrite_on: [:x_forwarded_proto, :x_forwarded_host, :x_forwarded_port],
    # added by nginx
    hsts: false
  ]

# Do not print debug messages in production
config :logger, level: :info
