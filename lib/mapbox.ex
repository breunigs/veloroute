defmodule Mapbox do
  use Tesla

  @username Data.credentials().mapbox_username
  @secret_token Data.credentials().mapbox_secret_token

  plug Tesla.Middleware.BaseUrl, "https://api.mapbox.com"

  plug Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Cache-Control", "no-cache"}
  ]

  plug Tesla.Middleware.Query, access_token: @secret_token
  plug Tesla.Middleware.JSON

  def upload_file(path, name) do
    data = File.read!(path)

    {:ok, %{body: creds}} = get("/uploads/v1/#{@username}/credentials")

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
      post("/uploads/v1/#{@username}", %{
        url: creds["url"],
        tileset: "breunigs.#{name}",
        name: name
      })
  end
end
