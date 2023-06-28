defmodule Maptiler.Tiles do
  @base "https://api.maptiler.com"
  @maps %{
    "___maptiler_satellite" => "/tiles/satellite-v2/"
  }

  require Logger
  @behaviour Plug

  @impl Plug
  def init(_opts) do
    [client: Tesla.client([TeslaCache])]
  end

  @impl Plug
  def call(conn = %{path_info: ["map", name]}, client: client) when is_map_key(@maps, name) do
    with %{params: %{"x" => x, "y" => y, "z" => z}, method: "GET"} <-
           Plug.Conn.fetch_query_params(conn),
         {_x, ""} <- Integer.parse(x),
         {_y, ""} <- Integer.parse(y),
         {_z, ""} <- Integer.parse(z) do
      url = "#{@base}#{@maps[name]}#{z}/#{x}/#{y}.jpg?key=#{Credentials.maptiler_api_key()}"

      with {:ok, %{status: 200, body: body}} <- Tesla.get(client, url) do
        conn
        |> Plug.Conn.put_resp_content_type("image/jpeg")
        |> Plug.Conn.put_resp_header("cache-control", "public, max-age=31536000, immutable")
        |> Plug.Conn.send_resp(200, body)
        |> Plug.Conn.halt()
      else
        {:ok, %{status: status}} ->
          Logger.warning("got unexpected status=#{status} from #{url}")
          # do not let frontend follow redirects
          status = if status >= 300 and status <= 399, do: 500, else: status
          fallback(conn, status)

        {:error, error} ->
          Logger.warning("failed to read #{url} – #{inspect(error)}")
          fallback(conn, 500)
      end
    else
      _ ->
        fallback(conn, 404)
    end
  end

  def call(conn, _opts) do
    conn
  end

  @empty_gif <<71, 73, 70, 56, 57, 97, 1, 0, 1, 0, 0, 0, 0, 44, 0, 0, 0, 0, 1, 0, 1, 0, 0>>
  defp fallback(conn, code) do
    conn
    |> Plug.Conn.put_resp_content_type("image/gif")
    |> Plug.Conn.send_resp(code, @empty_gif)
    |> Plug.Conn.halt()
  end
end
