defmodule Maptiler do
  require Logger

  # mix runs from root directory
  @root_dir File.cwd!()
  @cache_path String.to_atom(@root_dir <> "/data/geocode.cache")

  use Tesla

  defp key(), do: Data.credentials().maptiler_api_key

  plug Tesla.Middleware.BaseUrl, "https://api.maptiler.com"

  plug Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Cache-Control", "no-cache"}
  ]

  plug Tesla.Middleware.Query, key: key()
  plug Tesla.Middleware.JSON

  def bounds(query, save: save) do
    geocode(query, save: save) |> Map.fetch!("features") |> hd() |> Map.fetch!("bbox")
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
    center = "#{Settings.center() |> List.first()},#{Settings.center() |> List.last()}"

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
