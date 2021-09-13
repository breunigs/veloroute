defmodule Mapbox do
  use Tesla
  alias VelorouteWeb.VariousHelpers

  defp username, do: Credentials.mapbox_username()
  defp secret_token(), do: Credentials.mapbox_secret_token()

  @base "https://api.mapbox.com"
  plug Tesla.Middleware.BaseUrl, @base

  plug Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Cache-Control", "no-cache"}
  ]

  plug Tesla.Middleware.Telemetry
  plug Tesla.Middleware.Query, access_token: secret_token()
  plug Tesla.Middleware.JSON, decode_content_types: ["application/vnd.geo+json"]
  plug Tesla.Middleware.Cache, ttl: :timer.minutes(10)

  # for debugging help
  # plug Tesla.Middleware.Logger

  @spec static_map_url(map()) :: binary()
  def static_map_url(bounds) do
    polyline = Geo.CheapRuler.bounds_to_polyline(bounds)

    "#{@base}/styles/v1/breunigs/ck8hk6y7e0csv1ioh4oqdtybb/static/path-0(#{polyline})/auto/150x100?access_token=#{secret_token()}"
  end

  @search_query_bbox Settings.initial() |> VariousHelpers.to_string_bounds()
  @search_language "de"
  @search_types ["postcode", "place", "locality", "neighborhood", "address", "poi"]

  @spec search(binary | nil, nil | maybe_improper_list | map) :: [SearchResult.t()]
  def search(query, bounds)
  def search(nil, _), do: []
  def search("", _), do: []
  def search(query, nil), do: search(query, Settings.initial())

  def search(query, bounds) do
    bounds = VariousHelpers.parse_bounds(bounds)

    center = Geo.CheapRuler.center(bounds || Settings.initial())
    query = URI.encode(query)

    {:ok, response} =
      get(
        "/geocoding/v5/mapbox.places/#{query}.json",
        query: [
          proximity: "#{center.lon},#{center.lat}",
          language: @search_language,
          bbox: @search_query_bbox,
          types: @search_types
        ]
      )

    response.body["features"]
    |> Enum.map(fn feat ->
      type = feat["place_type"] |> hd

      place_name = feat["place_name_#{@search_language}"] || feat["place_name"] || ""
      text = feat["text_#{@search_language}"] || feat["text"] || place_name

      place_name_clean =
        String.replace_prefix(place_name, text, "")
        |> String.replace(~r/^[\s,]+/, "")
        |> String.replace(", Deutschland", "")

      [lon, lat] = feat["center"]

      %SearchResult{
        name: text,
        subtext: if(place_name_clean != "", do: place_name_clean),
        relevance: feat["relevance"] * 1.0,
        bounds: result_to_bounds(feat, type),
        center: %Geo.Point{lon: lon, lat: lat},
        type: type
      }
    end)
  end

  defp result_to_bounds(%{"bbox" => bbox}, _) when is_list(bbox) do
    VariousHelpers.parse_bounds(bbox)
  end

  defp result_to_bounds(%{"center" => [lon, lat]}, type) do
    zoom =
      case type do
        "poi" -> 18
        _ -> 16
      end

    Geo.CheapRuler.center_zoom_to_bounds(%{
      lon: lon,
      lat: lat,
      zoom: zoom
    })
  end

  def upload_file(path) do
    name = Path.basename(path, ".mbtiles")
    data = File.read!(path)

    {:ok, %{body: creds}} = get("/uploads/v1/#{username()}/credentials", query: [cache_for: name])

    cfg =
      ExAws.Config.new(:s3,
        access_key_id: creds["accessKeyId"],
        secret_access_key: creds["secretAccessKey"],
        security_token: creds["sessionToken"]
      )

    creds["bucket"]
    |> ExAws.S3.put_object(creds["key"], data)
    |> ExAws.request!(cfg)

    {:ok, _} =
      post("/uploads/v1/#{username()}", %{
        url: creds["url"],
        tileset: "breunigs.#{name}",
        name: name
      })

    name
  end
end
