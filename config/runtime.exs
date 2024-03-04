import Config

if config_env() == :prod do
  parsed = URI.new!(Settings.url())

  config :veloroute, VelorouteWeb.Endpoint,
    url: [host: parsed.host, port: parsed.port, scheme: parsed.scheme]
end
