defmodule VelorouteWeb.ConnectionTracker do
  use Phoenix.Tracker

  @topic "connected_users"

  def track(socket) do
    if Phoenix.LiveView.connected?(socket) do
      Phoenix.Tracker.track(__MODULE__, self(), @topic, socket.id, %{ip: remote_ip(socket)})
    end
  end

  defp remote_ip(socket) do
    x_headers = Phoenix.LiveView.get_connect_info(socket, :x_headers) || []
    peer = Phoenix.LiveView.get_connect_info(socket, :peer_data)

    case List.keyfind(x_headers, "x-forwarded-for", 0) do
      {_, forwarded} -> forwarded |> String.split(",") |> List.first() |> String.trim()
      nil -> if peer, do: peer.address |> :inet.ntoa() |> to_string(), else: "unknown"
    end
  end

  def count() do
    length(Phoenix.Tracker.list(__MODULE__, @topic))
  end

  def list_ips() do
    Phoenix.Tracker.list(__MODULE__, @topic)
    |> Enum.map(fn {_id, meta} -> meta.ip end)
    |> Enum.frequencies()
  end

  def start_link(opts) do
    opts = Keyword.merge([name: __MODULE__], opts)
    Phoenix.Tracker.start_link(__MODULE__, opts, opts)
  end

  def init(opts) do
    server = Keyword.fetch!(opts, :pubsub_server)
    {:ok, %{pubsub_server: server, node_name: Phoenix.PubSub.node_name(server)}}
  end

  def handle_diff(_diff, state) do
    {:ok, state}
  end
end
