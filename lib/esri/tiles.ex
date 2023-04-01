defmodule Esri.Tiles do
  @base "https://server.arcgisonline.com"
  @maps %{
    "___esri_hillshade" => "/arcgis/rest/services/Elevation/World_Hillshade/MapServer/tile/",
    "___esri_satellite" => "/ArcGIS/rest/services/World_Imagery/MapServer/tile/"
  }

  @attribution [
    {"___esri_hillshade", "https://static.arcgis.com/attribution/Elevation/World_Hillshade",
     "https://www.arcgis.com/home/item.html?id=1b243539f4514b6ba35e7d995890db1d"},
    {"___esri_satellite", "https://static.arcgis.com/attribution/World_Imagery",
     "https://www.arcgis.com/home/item.html?id=10df2279f9684e4a9f6a7f08febac2a9"}
  ]

  def attribution(:from_api) do
    client = Tesla.client([])
    bounds = Settings.bounds() |> Geo.BoundingBox.parse()

    Parallel.map(@attribution, fn {key, url, source} ->
      {:ok, %{status: 200, body: body}} = Tesla.get(client, url, query: [f: "json"])
      body = with "\uFEFF" <> no_bom <- body, do: no_bom, else: (_ -> body)
      {:ok, json} = Jason.decode(body)

      text =
        json["contributors"]
        |> Enum.map(fn %{"attribution" => text, "coverageAreas" => covs} ->
          visible =
            Enum.any?(covs, fn %{"bbox" => [minLat, minLon, maxLat, maxLon]} ->
              bbox = %Geo.BoundingBox{
                minLat: minLat,
                minLon: minLon,
                maxLat: maxLat,
                maxLon: maxLon
              }

              Geo.CheapRuler.overlap?(bbox, bounds)
            end)

          if visible do
            score = Enum.max_by(covs, & &1["score"])["score"]
            minZoom = Enum.min_by(covs, & &1["zoomMin"])["zoomMin"]
            maxZoom = Enum.max_by(covs, & &1["zoomMax"])["zoomMax"]
            %{text: text, score: score, zoom: minZoom..maxZoom}
          end
        end)
        |> Util.compact()
        |> Enum.sort_by(& &1.score, :desc)
        |> Enum.map(& &1.text)
        |> Enum.join(", ")

      {key, ~s(<a href="#{source}">Esri, #{text}</a>)}
    end)
    |> Enum.into(%{})
  end

  def attribution(:from_tiles) do
    client = Tesla.client([])

    Parallel.map(@maps, fn {key, path} ->
      url = @base <> String.replace(path, "/tile/", "")
      {:ok, %{status: 200, body: body}} = Tesla.get(client, url, query: [f: "json"])
      {:ok, json} = Jason.decode(body)

      {key, Map.fetch!(json, "copyrightText")}
    end)
    |> Enum.into(%{})
  end

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
      url = "#{@base}#{@maps[name]}#{z}/#{y}/#{x}.jpeg?token=#{Credentials.arcgis_api_key()}"

      with {:ok, %{status: 200, body: body}} <- Tesla.get(client, url) do
        conn
        |> Plug.Conn.put_resp_content_type("image/jpeg")
        |> Plug.Conn.put_resp_header("cache-control", "public, max-age=31536000, immutable")
        |> Plug.Conn.send_resp(200, body)
        |> Plug.Conn.halt()
      else
        {:ok, %{status: status}} ->
          Logger.warn("got unexpected status=#{status} from #{url}")
          # do not let frontend follow redirects
          status = if status >= 300 and status <= 399, do: 500, else: status
          fallback(conn, status)

        {:error, error} ->
          Logger.warn("failed to read #{url} – #{inspect(error)}")
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
