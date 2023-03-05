defmodule Komoot do
  require Logger
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://photon.komoot.io/api/"
  plug Tesla.Middleware.JSON
  plug TeslaCache

  @language "de"

  @behaviour Search.Behaviour
  @impl Search.Behaviour
  def query(query, bounds) do
    center = Geo.CheapRuler.center(bounds)

    params = [
      q: query,
      lat: Float.round(center.lat, 3),
      lon: Float.round(center.lon, 3),
      lang: @language
    ]

    # IO.inspect({"QUERY PARAMS KOMOOT", params})

    {:ok, response} = get("/", query: params)

    response.body["features"]
    |> Enum.reject(fn
      %{"properties" => %{"osm_value" => val}} when val in ~w(bus_stop) -> true
      _ -> false
    end)
    |> Enum.reject(&outside_bounds?/1)
    |> Enum.map(fn feat ->
      props = feat["properties"]
      [lon, lat] = feat["geometry"]["coordinates"]
      name = name(props)

      result = %{
        name: name,
        subtext: subtext(props, name),
        group_by: {name, props["postcode"] || props["city"]},
        relevance: 1,
        bounds: bbox(feat),
        center: %Geo.Point{lon: lon, lat: lat},
        type: props["type"] || feat["type"]
      }

      # IO.inspect(%{source: feat, result: result}, limit: :infinity)

      result
    end)
    |> Enum.group_by(& &1.group_by)
    |> Enum.map(fn
      {_key, [result]} ->
        result

      {_key, list} ->
        relevance = Enum.sum(Enum.map(list, & &1.relevance)) / length(list)
        bounds = Enum.reduce(list, hd(list).bounds, &Geo.CheapRuler.union(&1.bounds, &2))
        center = Geo.CheapRuler.bounds_to_center_zoom(bounds)
        center = %Geo.Point{lon: center.lon, lat: center.lat}
        %{hd(list) | relevance: relevance, bounds: bounds, center: center}
    end)
    |> Enum.map(fn sr -> struct(Search.Result, Map.delete(sr, :group_by)) end)
  end

  defp bbox(%{"properties" => %{"extent" => extent, "type" => type}}) do
    buffer =
      case type do
        "house" -> 0
        "street" -> 500
        "city" -> 1000
        "region" -> 1000
        "country" -> 1000
        "locality" -> 0
        _ -> 500
      end

    Geo.CheapRuler.buffer_bbox(buffer, Geo.BoundingBox.parse(extent))
  end

  defp bbox(%{"geometry" => %{"coordinates" => [lon, lat]}}),
    do: %Geo.BoundingBox{minLat: lat, maxLat: lat, minLon: lon, maxLon: lon}

  # defp guess_zoom(%{"properties" => %{"type" => type}}) do
  #   case type do
  #     "house" -> 17
  #     "street" -> 15
  #     "city" -> 13
  #     "region" -> 12
  #     "country" -> 10
  #     "locality" -> 16
  #     _ -> 16
  #   end
  # end

  # defp bbox_from_zoom(%{"geometry" => %{"coordinates" => [lon, lat]}}, zoom),
  #   do: Geo.CheapRuler.center_zoom_to_bounds(%{lat: lat, lon: lon, zoom: zoom})

  defp name(props) do
    props["name"] || String.trim("#{props["street"]} #{props["housenumber"]}")
  end

  defp subtext(props, name) do
    [
      "#{props["street"]} #{props["housenumber"]}",
      props["locality"],
      if(props["city"] != props["district"], do: props["district"]),
      "#{props["postcode"]} #{props["city"]}"
    ]
    |> Util.compact()
    |> Enum.map(&String.trim/1)
    |> Enum.reject(fn x -> x == "" end)
    |> Enum.uniq()
    |> List.delete(name)
    |> Enum.join(", ")
  end

  @max_bounds Settings.bounds() |> Geo.BoundingBox.parse()
  defp outside_bounds?(%{"geometry" => %{"coordinates" => [lon, lat]}}) do
    !Geo.CheapRuler.inside_bbox?(%{lon: lon, lat: lat}, @max_bounds)
  end
end
