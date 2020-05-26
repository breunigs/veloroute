# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

import_config "../data/phoenix_credentials.exs"

# Configures the endpoint
config :veloroute, VelorouteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: PhoenixCredentials.secret_key_base(),
  render_errors: [view: VelorouteWeb.ErrorView, accepts: ~w(html json)],
  live_view: [signing_salt: PhoenixCredentials.live_view_signing_salt()],
  pubsub_server: Veloroute.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ex_aws, json_codec: Jason

# very verbose HTTP output. Needs: mix deps.compile tesla --force
config :tesla, Tesla.Middleware.Logger, debug: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
