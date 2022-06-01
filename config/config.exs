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
  render_errors: [view: VelorouteWeb.ErrorView, accepts: ~w(html json)],
  live_view: [signing_salt: PhoenixCredentials.live_view_signing_salt()],
  pubsub_server: Veloroute.PubSub

config :veloroute,
  env: Mix.env()

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

config :logger, backends: [:console]

config :reverse_proxy_plug, :http_client, ReverseProxyPlug.HTTPClient.Adapters.Tesla

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
