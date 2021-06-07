defmodule VelorouteWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :veloroute
  use Sentry.Phoenix.Endpoint

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_veloroute_key",
    signing_salt: "Un5Pt/51"
  ]

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  socket "/socket", VelorouteWeb.UserSocket,
    websocket: true,
    longpoll: false

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :veloroute,
    gzip: true,
    brotli: true,
    only: ~w(css images js geo favicons robots.txt)

  plug Plug.Static,
    at: "/",
    from: :veloroute,
    gzip: false,
    brotli: false,
    headers: %{
      "cache-control" => "public, max-age=31536000, immutable"
    },
    only: ~w(videos-rendered)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    # very slow with network mounts
    # plug Phoenix.CodeReloader
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug VelorouteWeb.Router
end
