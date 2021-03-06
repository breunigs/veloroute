defmodule Overpass do
  require Logger

  alias VelorouteWeb.VariousHelpers
  use Tesla

  plug Tesla.Middleware.Retry,
    delay: 5_000,
    max_retries: 10,
    max_delay: 30_000,
    should_retry: fn
      {:ok, %{status: status}} when status >= 400 -> true
      {:ok, _} -> false
      {:error, _} -> true
    end

  plug Tesla.Middleware.Telemetry
  plug Tesla.Middleware.BaseUrl, "https://lz4.overpass-api.de/api/interpreter"
  plug Tesla.Middleware.JSON
  # for debugging help
  # plug Tesla.Middleware.Logger

  def bounds(query) when query != "" do
    try do
      query
      |> sanitize
      |> geocode()
      |> Map.get("elements", [])
      |> Enum.map(fn
        %{"bounds" => bounds} -> VariousHelpers.parse_bounds(bounds)
        %{"lat" => lat, "lon" => lon} -> Geo.CheapRuler.bbox([%{lat: lat, lon: lon}])
      end)
      |> Enum.reduce(nil, &Geo.CheapRuler.union/2)
    rescue
      e ->
        Logger.error("Failed to find bounding box for #{query}: #{inspect(e)}")
        nil
    end
  end

  defp geocode(query) do
    DiskCache.lazy(:overpass, query, fn -> resolve(query) end)
  end

  defp resolve(query) do
    %{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat} = Settings.initial()
    bounds = [minLat, minLon, maxLat, maxLon] |> Enum.map(&to_string/1) |> Enum.join(",")

    data =
      ~s|[out:json][timeout:5][bbox:#{bounds}];(node["name"="#{query}"]; way["name"="#{query}"];);out bb;|

    IO.puts("#{Time.utc_now()}: Resolving Overpass Query: #{query}")
    {:ok, %{status: 200} = resp} = get("", query: [data: data])

    resp.body
  end

  defp sanitize(str) do
    Regex.replace(~r/[^\w.-]+/ui, str, " ") |> String.trim()
  end
end
