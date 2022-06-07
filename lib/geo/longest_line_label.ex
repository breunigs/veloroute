defmodule Geo.LongestLineLabel do
  # A higher number means finer grained vertical steps, but requires more
  # compute
  @vertical_steps 10

  @doc """
  Try to find a visual center of a polygon. The algorithm places horizontal
  scanlines into the polygon and returns the center of the longest.
  """
  def calculate(polyline) do
    bbox = Geo.CheapRuler.bbox(polyline)
    # vertical positions of the scanlines
    lats =
      Enum.map(1..(@vertical_steps - 1), fn t ->
        (bbox.minLat * t + bbox.maxLat * (@vertical_steps - t)) / @vertical_steps
      end)

    centroid = centroid(polyline)
    segments = Enum.chunk_every(polyline, 2, 1, :discard)
    scan_mids = Enum.flat_map(lats, &scaline_mid(segments, &1))

    # find maximum by considering scanline length and distance from centroid
    Enum.max_by(scan_mids, fn %{dist: dist, mid: mid} ->
      dist - :math.pow(Geo.CheapRuler.dist(centroid, mid), 1.3)
    end).mid
  end

  # find scanline midpoints for the polygon at the given latitude. We assume we
  # will always find an even amount of intersections (except for degenerated
  # polygons that have no volume), and by sorting them by longitude we ensure
  # that the scanlines are within the polygon.
  defp scaline_mid(segments, lat) do
    segments
    |> Enum.flat_map(fn [p1, p2] -> intersect(p1, p2, lat) end)
    |> Enum.sort_by(& &1.lon)
    |> Enum.chunk_every(2, 2, :discard)
    |> Enum.map(fn [p1, p2] ->
      %{dist: Geo.CheapRuler.dist(p1, p2), mid: Geo.Interpolate.point(p1, p2, 0.5)}
    end)
  end

  defp intersect(%{lat: l1}, %{lat: l2}, cmp) when cmp > l1 and cmp > l2, do: []
  defp intersect(%{lat: l1}, %{lat: l2}, cmp) when cmp < l1 and cmp < l2, do: []
  defp intersect(%{lat: ll}, %{lat: ll}, _cmp), do: []

  defp intersect(p1, p2, cmp_lat) do
    t = abs((cmp_lat - p1.lat) / (p1.lat - p2.lat))
    [Geo.Interpolate.point(p1, p2, t)]
  end

  defp centroid(polyline) do
    {lats, lons, count} =
      Enum.reduce(polyline, {0.0, 0.0, 0}, fn %{lat: lat, lon: lon}, {lats, lons, count} ->
        {lats + lat, lons + lon, count + 1}
      end)

    %{lat: lats / count, lon: lons / count}
  end
end
