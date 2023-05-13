defmodule Basemap.Static.Plug do
  require Logger
  @behaviour Plug

  @impl Plug
  def init(_opts) do
    []
  end

  @seconds_per_day 24 * 60 * 60

  @impl Plug
  def call(conn = %{path_info: ["map", "___static", bounds, dimension]}, _opts) do
    with bbox when is_struct(bbox) <- Geo.BoundingBox.parse(bounds),
         {width, height} <- parse_dimension(dimension),
         %{params: params, method: "GET"} <- Plug.Conn.fetch_query_params(conn) do
      %{bounds: bbox, width: width, height: height}
      |> add_optional_params(params)
      |> Basemap.Static.Runner.render()
      |> case do
        {:ok, png} ->
          conn
          |> Plug.Conn.put_resp_content_type("image/png")
          |> Plug.Conn.put_resp_header(
            "cache-control",
            "public, max-age=#{@seconds_per_day}, immutable"
          )
          |> Plug.Conn.send_resp(200, png)
          |> Plug.Conn.halt()

        {:error, reason} ->
          Logger.warn("failed static render: #{reason}")
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

  defp add_optional_params(parsed, params) do
    parsed
    |> Map.put(:pixelRatio, int_param(params, "r", 1))
    |> Map.put(:highlightRoute, Map.get(params, "highlightRoute", "_"))
  end

  defp int_param(params, key, default) do
    with str when is_binary(str) <- Map.get(params, key),
         {val, ""} <- Integer.parse(str) do
      val
    else
      _ -> default
    end
  end

  defp parse_dimension(dim) do
    with [w, h] <- String.split(dim, "x"),
         {width, ""} <- Integer.parse(w),
         {height, ""} <- Integer.parse(h) do
      {width, height}
    else
      _ -> nil
    end
  end

  @empty_gif <<71, 73, 70, 56, 57, 97, 1, 0, 1, 0, 0, 0, 0, 44, 0, 0, 0, 0, 1, 0, 1, 0, 0>>
  defp fallback(conn, code) do
    conn
    |> Plug.Conn.put_resp_content_type("image/gif")
    |> Plug.Conn.send_resp(code, @empty_gif)
    |> Plug.Conn.halt()
  end
end