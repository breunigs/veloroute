defmodule Esri.Search do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://geocode-api.arcgis.com"
  plug Tesla.Middleware.JSON

  @path "/arcgis/rest/services/World/GeocodeServer/findAddressCandidates"
  @language "de"
  @bbox_str Settings.bounds() |> VelorouteWeb.VariousHelpers.to_string_bounds()

  @spec search(binary | nil, nil | maybe_improper_list | map) :: [SearchResult.t()]
  def search(query, bounds)
  def search(nil, _), do: []
  def search("", _), do: []
  def search(query, nil), do: search(query, Settings.initial())

  def search(query, bounds) do
    bounds = Geo.BoundingBox.parse(bounds)

    center = Geo.CheapRuler.center(bounds)
    query = URI.encode(query)

    {:ok, response} =
      get(@path,
        query: [
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
      )

    Enum.map(response.body["candidates"], fn feat ->
      attr = feat["attributes"]

      bbox = Geo.BoundingBox.parse(feat["extent"])
      lon = feat["location"]["x"]
      lat = feat["location"]["y"]

      %SearchResult{
        name: first([attr["ShortLabel"], attr["PlaceName"], feat["address"]]),
        subtext: join([attr["StAddr"], attr["City"], attr["Region"]]),
        relevance: feat["score"] / 100.0,
        bounds: bbox,
        center: %Geo.Point{lon: lon, lat: lat},
        type: first([attr["Type"], attr["Addr_type"], attr["StType"]])
      }
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
        %{hd(list) | relevance: relevance, bounds: bounds, center: center}
    end)
  end

  defp first(list) do
    Enum.find(list, fn x -> x && x != "" end)
  end

  defp join(list) do
    list |> Enum.filter(fn x -> x && x != "" end) |> Enum.uniq() |> Enum.join(", ")
  end
end
