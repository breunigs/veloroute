defmodule Basemap.Plug do
  @moduledoc """
  Serves basemap specific assets, providing a valid but empty fallback for fonts
  and tiles. This avoids breaking the map if a file is missing.
  """

  use Plug.Builder
  require Logger

  @path Basemap.Servable.serve_path("/")
  @font_path Basemap.Fonts.serve_path("/")
  @tile_path Basemap.Tiles.serve_path("/")

  # replace the hardcoded production URL in map assets with dynamic localhost one
  if Mix.env() != :prod, do: plug(Basemap.RelativePath)

  plug Plug.Static,
    at: @path,
    from: {:veloroute, Path.join("priv/static", @path)},
    brotli: true,
    gzip: true,
    headers: %{"cache-control" => "public, max-age=3600, immutable"}

  plug :fallback

  def fallback(%{request_path: @font_path <> _rest} = conn, _opts),
    do: serve(conn, Basemap.Fonts.fallback())

  def fallback(%{request_path: @tile_path <> _rest} = conn, _opts),
    do: serve(conn, Basemap.Tiles.fallback())

  def fallback(%{request_path: @path <> _rest} = conn, _opts), do: not_found(conn)
  def fallback(conn, _opts), do: conn

  defp serve(conn, pbf_fallback) do
    Logger.warning("requested basemap file #{conn.request_path} not found")

    if Path.extname(conn.request_path) == ".pbf" && pbf_fallback do
      conn
      |> put_resp_content_type("application/x-protobuf")
      |> send_resp(200, pbf_fallback)
      |> halt()
    else
      not_found(conn)
    end
  end

  defp not_found(conn) do
    Logger.warning("requested basemap file #{conn.request_path} not found")

    conn
    |> send_resp(404, "file not found, try the homepage at #{Settings.url()}} ? ")
    |> halt()
  end
end
