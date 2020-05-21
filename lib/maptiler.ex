defmodule Maptiler do
  require Logger

  @cache_path :"data/cache/geocode.dets"

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.maptiler.com"

  plug Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Cache-Control", "no-cache"}
  ]

  plug Tesla.Middleware.Query, key: Credentials.maptiler_api_key()
  plug Tesla.Middleware.JSON
  # for debugging help
  plug Tesla.Middleware.Logger

  def bounds(query, save: save) when query != "" do
    try do
      [minLon, minLat, maxLon, maxLat] =
        geocode(query, save: save)
        |> Map.fetch!("features")
        |> hd()
        |> Map.fetch!("bbox")

      %{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
    rescue
      _err ->
        Logger.warn("Failed to resolve #{query} on MapTiler")
        nil
    end
  end

  defp geocode(query, save: save) do
    :dets.lookup(cache(), query)
    |> case do
      [{^query, body}] ->
        body

      _ ->
        body = resolve(query)
        if save, do: :dets.insert_new(cache(), {query, body})
        body
    end
  end

  defp resolve(query) do
    bounds = Settings.bounds() |> Enum.map(&to_string/1) |> Enum.join(",")

    [lon1, lat1, lon2, lat2] = Settings.bounds()
    center = "#{(lat1 + lat2) / 2.0},#{(lon1 + lon2) / 2.0}"

    Logger.info("Resolving MapTiler GeoCode query: #{query}")

    query = URI.encode(query)

    {:ok, resp} =
      get("/geocoding/#{query}.json", query: [proximity: center, bbox: bounds, limit: 1])

    resp.body
  end

  defp cache do
    {:ok, table} = :dets.open_file(:maptiler_geocode, file: @cache_path, type: :set)
    table
  end
end
