defmodule Geo.Export do
  def gpx_poly(coords) do
    coords |> Enum.map(&{&1.lon, &1.lat}) |> Polyline.encode(6) |> Polyline.decode(6) |> gpx()
  end

  @spec gpx([Geo.Point.like()] | Video.Rendered.polyline()) :: binary
  def gpx(coords) do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <gpx xmlns="http://www.topografix.com/GPX/1/1" version="1.1">
     <trk>
       <trkseg>#{as_gpx_track_points(coords)}</trkseg>
     </trk>
    </gpx>
    """
    |> String.trim()
  end

  defp as_gpx_track_points(coords) when is_list(coords) do
    Enum.map_join(coords, "\n", &coord2gpx/1)
  end

  defp as_gpx_track_points(%{polyline: poly, precision: precision}) do
    Enum.map_join(Polyline.decode(poly, precision), "\n", &coord2gpx/1)
  end

  defp coord2gpx(%{lat: lat, lon: lon}) do
    ~s(<trkpt lat="#{lat}" lon="#{lon}"></trkpt>)
  end

  defp coord2gpx({lon, lat}) do
    ~s(<trkpt lat="#{lat}" lon="#{lon}"></trkpt>)
  end
end
