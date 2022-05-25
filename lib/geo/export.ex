defmodule Geo.Export do
  def gpx_poly(coords) do
    Polyline.encode(coords, 6) |> Polyline.decode(6) |> gpx()
  end

  @spec gpx([Geo.Point.like()]) :: binary
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

  defp as_gpx_track_points(coords) do
    coords
    |> Enum.map(fn coord -> ~s(<trkpt lat="#{coord.lat}" lon="#{coord.lon}"></trkpt>) end)
    |> Enum.join("\n")
  end
end
