defmodule CheapRuler do
  # via https://blog.mapbox.com/fast-geodesic-approximations-with-cheap-ruler-106f229ad016

  ref_lat =
    if Mix.env() == :test do
      53.551
    else
      [_, lat1, _, lat2] = Settings.bounds()
      (lat1 + lat2) / 2.0
    end

  @reference_lat ref_lat

  @cos1 :math.cos(@reference_lat * :math.pi() / 180)
  @cos2 2 * @cos1 * @cos1 - 1
  @cos3 2 * @cos1 * @cos2 - @cos1
  @cos4 2 * @cos1 * @cos3 - @cos2
  @cos5 2 * @cos1 * @cos4 - @cos3

  # get meters instead of km
  @m 1000
  @kx @m * (111.41513 * @cos1 - 0.09455 * @cos3 + 0.00012 * @cos5)
  @ky @m * (111.13209 - 0.56605 * @cos2 + 0.0012 * @cos4)

  @doc ~S"""
  Takes a list of coordinates and find their bounding box

  ## Examples

      iex> CheapRuler.bbox([
      ...>   %{lon: 1.2, lat: 3.4}, %{lon: 4.5, lat: 7.1}, %{lon: 0, lat: 0},
      ...> ])
      %{minLon: 0, minLat: 0, maxLon: 4.5, maxLat: 7.1}
  """
  def bbox(coords) when is_list(coords) do
    {%{lon: minLon}, %{lon: maxLon}} = coords |> Enum.min_max_by(fn %{lon: lon} -> lon end)
    {%{lat: minLat}, %{lat: maxLat}} = coords |> Enum.min_max_by(fn %{lat: lat} -> lat end)
    %{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  @doc ~S"""
  Unions two bounding boxes

  ## Examples

      iex> CheapRuler.union(
      ...>   %{minLon: 1, minLat: 0, maxLon: 1, maxLat: 2},
      ...>   %{minLon: 0, minLat: 1, maxLon: 2, maxLat: 1}
      ...> )
      %{minLon: 0, minLat: 0, maxLon: 2, maxLat: 2}
  """
  def union(nil, bbox2), do: bbox2
  def union(bbox1, nil), do: bbox1

  def union(bbox1, bbox2) do
    minLon = if bbox1.minLon < bbox2.minLon, do: bbox1.minLon, else: bbox2.minLon
    minLat = if bbox1.minLat < bbox2.minLat, do: bbox1.minLat, else: bbox2.minLat
    maxLon = if bbox1.maxLon > bbox2.maxLon, do: bbox1.maxLon, else: bbox2.maxLon
    maxLat = if bbox1.maxLat > bbox2.maxLat, do: bbox1.maxLat, else: bbox2.maxLat
    %{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  @doc ~S"""
  Returns true if the point is contained within the bounding box

  ## Examples

      iex> CheapRuler.inside_bbox?(
      ...>   %{lon: 1.3, lat: 4.5},
      ...>   %{minLon: 0, minLat: 0, maxLon: 4.5, maxLat: 7.1}
      ...> )
      true

  """
  def inside_bbox?(
        %{lon: lon, lat: lat},
        %{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
      ) do
    lon >= minLon &&
      lon <= maxLon &&
      lat >= minLat &&
      lat <= maxLat
  end

  @doc ~S"""
  Increases the bounding box by the given distance

  ## Examples

      iex> CheapRuler.buffer_bbox(
      ...>   1000,
      ...>   %{minLon: 0, minLat: 0, maxLon: 4.5, maxLat: 7.1}
      ...> )
      %{minLon: -0.015087116638538251,
        minLat: -0.008984923104452173,
        maxLon: 4.515087116638538,
        maxLat: 7.108984923104452}
  """
  def buffer_bbox(buffer, %{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat})
      when is_float(buffer) or is_integer(buffer) do
    v = buffer / @ky
    h = buffer / @kx

    %{minLon: minLon - h, minLat: minLat - v, maxLon: maxLon + h, maxLat: maxLat + v}
  end

  # as per https://wiki.openstreetmap.org/wiki/Zoom_levels#Distance_per_pixel_math
  @zoom_factor 40_075_016.686 * @cos1
  def center_zoom_to_bounds(%{lon: lon, lat: lat, zoom: zoom}) do
    buffer_bbox(@zoom_factor / :math.pow(2, zoom), %{
      minLon: lon,
      minLat: lat,
      maxLon: lon,
      maxLat: lat
    })
  end

  def meters_per_pixel(zoom) do
    @zoom_factor / :math.pow(2, zoom + 8)
  end

  @doc ~S"""
  Returns the distance between two points or from a line and a point

  ## Examples

      iex> CheapRuler.dist(
      ...>   [
      ...>     %{lon: 10.03971050427, lat: 53.58988354712},
      ...>     %{lon: 10.04383358673, lat: 53.58986207956},
      ...>     %{lon: 10.04026843693, lat: 53.58887260434}
      ...>   ],
      ...>   %{lon: 10.04289976489, lat: 53.59004976324}
      ...> )
      20.34681678169861

      iex> CheapRuler.dist(
      ...>   %{lon: 10.04383358673, lat: 53.58986207956},
      ...>   %{lon: 10.03971050427, lat: 53.58988354712}
      ...> )
      273.29543042145286
  """
  def dist(from, %{lon: _lon1, lat: _lat1} = to) when is_list(from) do
    closest_point_on_line(from, to) |> point2point_dist(to)
  end

  def dist(%{lon: _lon1, lat: _lat1} = from, %{lon: _lon2, lat: _lat2} = to),
    do: point2point_dist(from, to)

  @doc ~S"""
  It finds the closest point of a line to another given point

  ## Examples

      iex> CheapRuler.closest_point_on_line(
      ...>   [
      ...>     %{lon: 10.03971050427, lat: 53.58988354712},
      ...>     %{lon: 10.04383358673, lat: 53.58986207956},
      ...>     %{lon: 10.04026843693, lat: 53.58887260434}
      ...>   ],
      ...>   %{lon: 10.04289976489, lat: 53.59004976324}
      ...> )
      %{lon: 10.042897081160916, lat: 53.58986695564232}
  """
  def closest_point_on_line(line, %{lon: lon, lat: lat}) when is_list(line) do
    line
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(%{dist: nil}, fn [one, two], mins ->
      x = one.lon
      y = one.lat
      dx = (two.lon - x) * @kx
      dy = (two.lat - y) * @ky

      {x, y} =
        if dx == 0 && dy == 0 do
          {x, y}
        else
          (((lon - x) * @kx * dx + (lat - y) * @ky * dy) / (dx * dx + dy * dy))
          |> case do
            t when t > 1 -> {two.lon, two.lat}
            t when t > 0 -> {x + dx / @kx * t, y + dy / @ky * t}
            _ -> {x, y}
          end
        end

      dx = (lon - x) * @kx
      dy = (lat - y) * @ky

      sqDist = dx * dx + dy * dy

      if mins.dist && sqDist >= mins.dist,
        do: mins,
        else: %{dist: sqDist, lon: x, lat: y}
    end)
    |> Map.take([:lon, :lat])
  end

  @doc ~S"""
  Returns the total length of a line in meters

  ## Examples

      iex> CheapRuler.line_distance([
      ...>   %{lon: 10.03971050427, lat: 53.58988354712},
      ...>   %{lon: 10.04383358673, lat: 53.58986207956},
      ...>   %{lon: 10.04026843693, lat: 53.58887260434}
      ...> ])
      534.0011528314758
  """
  def line_distance(line) when is_list(line) do
    line
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [one, two], acc ->
      acc + point2point_dist(one, two)
    end)
  end

  @doc ~S"""
  Returns the distance in meters between two points

  ## Examples

      iex> CheapRuler.point2point_dist(
      ...>   %{lon: 10.04383358673, lat: 53.58986207956},
      ...>   %{lon: 10.03971050427, lat: 53.58988354712}
      ...> )
      273.29543042145286
  """
  def point2point_dist(%{lon: lon1, lat: lat1}, %{lon: lon2, lat: lat2}) do
    dx = (lon1 - lon2) * @kx
    dy = (lat1 - lat2) * @ky
    :math.sqrt(dx * dx + dy * dy)
  end

  @doc ~S"""
  Returns the bearing between two points in angles.

  ## Examples

      iex> CheapRuler.bearing(
      ...>   %{lon: 10.03971050427, lat: 53.58988354712},
      ...>   %{lon: 10.04383358673, lat: 53.58986207956}
      ...> )
      90.5009150905702
  """
  def bearing(%{lon: lon1, lat: lat1}, %{lon: lon2, lat: lat2}) do
    dx = (lon2 - lon1) * @kx
    dy = (lat2 - lat1) * @ky

    if dx == 0 && dy == 0 do
      0.0
    else
      bearing = to_deg(:math.atan2(dx, dy))
      if bearing < 0, do: bearing + 360, else: bearing
    end
  end

  defp to_deg(rad) do
    rad / :math.pi() * 180.0
  end
end
