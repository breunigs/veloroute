# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :veloroute, VelorouteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q9WS4hYE+S+mcKf9grulG5+oG7h68eQNIKUh/Wx0EWCvvbvtbUjg326EAPb73OIB",
  render_errors: [view: VelorouteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Veloroute.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "4UBQQb1H"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
