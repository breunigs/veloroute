defmodule Esri.Search do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://geocode-api.arcgis.com"
  plug Tesla.Middleware.JSON

  @path "/arcgis/rest/services/World/GeocodeServer/findAddressCandidates"
  @language "de"
  @bbox_str Settings.bounds() |> VelorouteWeb.VariousHelpers.to_string_bounds()

  @debug false

  @behaviour Search.Behaviour
  @impl Search.Behaviour
  def query(query, bounds) do
    center = Geo.CheapRuler.center(bounds)
    query = URI.encode(query)

    params = [
      f: "json",
      singleLine: query,
      token: Credentials.arcgis_api_key(),
      location: "#{center.lon},#{center.lat}",
      outFields: "StAddr,ShortLabel,PlaceName,City,Region,Type,Addr_type,StType",
      # outFields: "*",
      language: @language,
      searchExtent: @bbox_str,
      maxLocations: 10
    ]

    if @debug, do: IO.inspect({"QUERY PARAMS ESRI", params})

    {:ok, response} = get(@path, query: params)

    Enum.map(response.body["candidates"], fn feat ->
      attr = feat["attributes"]

      bbox = Geo.BoundingBox.parse(feat["extent"])
      lon = feat["location"]["x"]
      lat = feat["location"]["y"]

      result = %Search.Result{
        name: first([attr["ShortLabel"], attr["PlaceName"], feat["address"]]),
        subtext: join([attr["StAddr"], attr["City"], attr["Region"]]),
        relevance: feat["score"] / 100.0,
        bounds: bbox,
        center: %Geo.Point{lon: lon, lat: lat},
        type: first([attr["Type"], attr["Addr_type"], attr["StType"]])
      }

      if @debug do
        IO.inspect(%{source: feat, result: result}, limit: :infinity)
      end

      result
    end)
    |> Enum.reject(fn sr -> sr.type == "Parking" end)
    |> Enum.group_by(fn sr -> {sr.name, sr.subtext, sr.type} end)
    |> Enum.map(fn
      {_key, [result]} ->
        result

      {_key, list} ->
        relevance = Enum.sum(Enum.map(list, & &1.relevance)) / length(list)
        bounds = Enum.reduce(list, hd(list).bounds, &Geo.CheapRuler.union(&1.bounds, &2))

        center = Geo.CheapRuler.bounds_to_center_zoom(bounds)
        center = %Geo.Point{lon: center.lon, lat: center.lat}
        %Search.Result{hd(list) | relevance: relevance, bounds: bounds, center: center}
    end)
  end

  defp first(list) do
    Enum.find(list, fn x -> x && x != "" end)
  end

  defp join(list) do
    list |> Enum.filter(fn x -> x && x != "" end) |> Enum.uniq() |> Enum.join(", ")
  end
end

defmodule Esri.Search.NoStreets do
  @behaviour Search.Behaviour
  @impl Search.Behaviour
  def query(query, bounds) do
    Esri.Search.query(query, bounds)
    |> Enum.reject(fn %{type: type} -> type == "StreetName" end)
  end
end
