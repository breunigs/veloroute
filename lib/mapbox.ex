defmodule Mapbox do
  use Tesla

  defp username, do: Credentials.mapbox_username()
  defp secret_token(), do: Credentials.mapbox_secret_token()

  @base "https://api.mapbox.com"
  plug Tesla.Middleware.BaseUrl, @base

  plug Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Cache-Control", "no-cache"}
  ]

  plug Tesla.Middleware.Query, access_token: secret_token()
  plug Tesla.Middleware.JSON

  @spec static_map_url(map()) :: binary()
  def static_map_url(bounds) do
    polyline = CheapRuler.bounds_to_polyline(bounds)

    "#{@base}/styles/v1/breunigs/ck8hk6y7e0csv1ioh4oqdtybb/static/path-0(#{polyline})/auto/150x100?access_token=#{
      secret_token()
    }"
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
