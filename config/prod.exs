import Config

port = String.to_integer(System.get_env("PORT") || "4000")

config :veloroute, VelorouteWeb.Endpoint,
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
  ],
  use_url_from_settings: true

# Do not print debug messages in production
config :logger, level: :info
