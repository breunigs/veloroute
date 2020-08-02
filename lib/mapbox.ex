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

  plug Tesla.Middleware.Query, access_token: secret_token()
  plug Tesla.Middleware.JSON, decode_content_types: ["application/vnd.geo+json"]

  @spec static_map_url(map()) :: binary()
  def static_map_url(bounds) do
    polyline = CheapRuler.bounds_to_polyline(bounds)

    "#{@base}/styles/v1/breunigs/ck8hk6y7e0csv1ioh4oqdtybb/static/path-0(#{polyline})/auto/150x100?access_token=#{
      secret_token()
    }"
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

    center = CheapRuler.center(bounds)
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
      # IO.inspect(feat)

      %SearchResult{
        lon: feat["center"] |> Enum.at(0),
        lat: feat["center"] |> Enum.at(1),
        name: feat["place_name_#{@search_language}"] || feat["place_name"],
        relevance: feat["relevance"] * 1.0,
        type: feat["place_type"] |> hd
      }
    end)
  end

  def upload_file(path) do
    name = Path.basename(path, ".mbtiles")
    data = File.read!(path)

    {:ok, %{body: creds}} = get("/uploads/v1/#{username()}/credentials")

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
