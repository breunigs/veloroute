defmodule Util.LiveView do
  @doc """
  Extracts the client's remote IP from a LiveView socket, respecting X-Forwarded-For headers
  set by reverse proxies.
  """
  @spec remote_ip(Phoenix.LiveView.Socket.t()) :: binary()
  def remote_ip(socket) do
    x_headers = Phoenix.LiveView.get_connect_info(socket, :x_headers) || []
    peer = Phoenix.LiveView.get_connect_info(socket, :peer_data)

    case List.keyfind(x_headers, "x-forwarded-for", 0) do
      {_, forwarded} -> forwarded |> String.split(",") |> List.first() |> String.trim()
      nil -> if peer, do: peer.address |> :inet.ntoa() |> to_string(), else: "unknown"
    end
  end
end
