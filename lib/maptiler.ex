defmodule Maptiler do
  require Logger

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.maptiler.com"

  plug Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Cache-Control", "no-cache"}
  ]

  plug Tesla.Middleware.Query, key: Credentials.maptiler_api_key()
  plug Tesla.Middleware.JSON
  # for debugging help
  # plug Tesla.Middleware.Logger
  plug TeslaCache

  @bbox_str Settings.bounds() |> VelorouteWeb.VariousHelpers.to_string_bounds()
  @language "de"

  @spec search(binary | nil, nil | maybe_improper_list | map) :: [SearchResult.t()]
  def search(query, bounds)
  def search(nil, _), do: []
  def search("", _), do: []
  def search(query, nil), do: search(query, Settings.initial())

  def search(query, bounds) do
    center = bounds |> Geo.BoundingBox.parse() |> Geo.CheapRuler.center()
    center = "#{center.lon},#{center.lat}"

    query = URI.encode(query)

    {:ok, resp} =
      get("/geocoding/#{query}.json",
        query: [proximity: center, bbox: @bbox_str, limit: 10, language: @language]
      )

    Enum.map(resp.body["features"], fn feat ->
      [lon, lat] = feat["center"]
      bbox = Geo.BoundingBox.parse(feat["bbox"])

      subtext =
        feat["context"]
        |> Enum.map(& &1["text"])
        |> Enum.take(3)
        |> Kernel.--(["Deutschland"])
        |> Enum.join(", ")

      # subtext =
      #   feat["place_name"]
      #   |> String.replace(~r/^#{Regex.escape(feat["text"])}, /, "")
      #   |> String.replace(", Deutschland", "")

      %SearchResult{
        name: feat["text"],
        subtext: subtext,
        relevance: feat["relevance"],
        bounds: bbox,
        center: %Geo.Point{lon: lon, lat: lat},
        type: List.first(feat["place_type"])
      }
    end)
  end
end
