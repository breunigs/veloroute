import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :veloroute, VelorouteWeb.Endpoint,
  http: [port: 4002],
  server: false

config :veloroute,
  map_matcher: Basemap.MapMatcher.NoOp,
  disk_preload: false

# Print only warnings and errors during test
# config :logger, level: :debug
config :logger, level: :warning
