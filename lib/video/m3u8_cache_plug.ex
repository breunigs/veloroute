defmodule Video.M3U8CachePlug do
  @serve_path Settings.video_serve_path()

  @behaviour Plug

  import Plug.Conn

  @impl true
  def init(opts), do: opts

  @impl true
  def call(
        %Plug.Conn{method: "GET", request_path: "/#{@serve_path}/" <> hash_and_filename} = conn,
        _opts
      ) do
    hash_and_filename
    |> Cache.M3U8.get()
    |> case do
      nil ->
        conn

      content ->
        conn
        |> put_resp_content_type("application/vnd.apple.mpegurl")
        |> put_resp_header("vary", "Accept-Encoding")
        |> put_resp_header("cache-control", "public, max-age=31536000, immutable")
        |> serve(content, accept_gzip?(conn))
        |> halt()
    end
  end

  def call(conn, _opts), do: conn

  defp accept_gzip?(conn) do
    conn
    |> get_req_header("accept-encoding")
    |> Enum.any?(fn accept ->
      accept |> Plug.Conn.Utils.list() |> Enum.any?(&String.contains?(&1, ["gzip", "*"]))
    end)
  end

  defp serve(conn, content, serve_gzip)
  defp serve(conn, {raw, _gzip}, false), do: send_resp(conn, 200, raw)

  defp serve(conn, {_raw, gzip}, true),
    do: conn |> put_resp_header("content-encoding", "gzip") |> send_resp(200, gzip)
end
