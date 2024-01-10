defmodule Geo.CheapRuler do
  # via https://blog.mapbox.com/fast-geodesic-approximations-with-cheap-ruler-106f229ad016

  @type point() :: %{:lat => float(), :lon => float(), optional(atom()) => any()}

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

      iex> Geo.CheapRuler.bbox([
      ...>   %{lon: 1.2, lat: 3.4}, %{lon: 4.5, lat: 7.1}, %{lon: 0, lat: 0},
      ...> ])
      %Geo.BoundingBox{minLon: 0, minLat: 0, maxLon: 4.5, maxLat: 7.1}
  """
  def bbox(coords) when is_list(coords) do
    head = hd(coords)

    bbox = %Geo.BoundingBox{
      minLon: head.lon,
      minLat: head.lat,
      maxLon: head.lon,
      maxLat: head.lat
    }

    Enum.reduce(tl(coords), bbox, fn %{lon: lon, lat: lat}, bbox ->
      %{
        bbox
        | minLon: min(lon, bbox.minLon),
          minLat: min(lat, bbox.minLat),
          maxLon: max(lon, bbox.maxLon),
          maxLat: max(lat, bbox.maxLat)
      }
    end)
  end

  def bbox(%{lon: lon, lat: lat}) do
    %Geo.BoundingBox{minLon: lon, minLat: lat, maxLon: lon, maxLat: lat}
  end

  @doc ~S"""
  Unions two bounding boxes

  ## Examples

      iex> Geo.CheapRuler.union(
      ...>   %Geo.BoundingBox{minLon: 1, minLat: 0, maxLon: 1, maxLat: 2},
      ...>   %Geo.BoundingBox{minLon: 0, minLat: 1, maxLon: 2, maxLat: 1}
      ...> )
      %Geo.BoundingBox{minLon: 0, minLat: 0, maxLon: 2, maxLat: 2}
  """
  def union(nil, bbox2), do: bbox2
  def union(bbox1, nil), do: bbox1

  def union(bbox1, bbox2) do
    minLon = min(bbox1.minLon, bbox2.minLon)
    minLat = min(bbox1.minLat, bbox2.minLat)
    maxLon = max(bbox1.maxLon, bbox2.maxLon)
    maxLat = max(bbox1.maxLat, bbox2.maxLat)
    %Geo.BoundingBox{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  @doc ~S"""
  Finds center of given geo object

  ## Examples

      iex> Geo.CheapRuler.center(
      ...>   %Geo.BoundingBox{minLon: 2, minLat: 3, maxLon: 1, maxLat: 2}
      ...> )
      %Geo.Point{lon: 1.5, lat: 2.5}
  """
  @spec center(Geo.BoundingBox.like()) :: Geo.Point.t()
  def center(bbox) do
    %Geo.Point{lon: (bbox.minLon + bbox.maxLon) / 2, lat: (bbox.minLat + bbox.maxLat) / 2}
  end

  @doc ~S"""
  Returns true if the point or bounding box is fully contained within the 2nd bounding box

  ## Examples

      iex> Geo.CheapRuler.inside_bbox?(
      ...>   %{lon: 1.3, lat: 4.5},
      ...>   %Geo.BoundingBox{minLon: 0, minLat: 0, maxLon: 4.5, maxLat: 7.1}
      ...> )
      true

      iex> Geo.CheapRuler.inside_bbox?(
      ...>   %Geo.BoundingBox{minLon: 1, minLat: 1, maxLon: 2, maxLat: 2},
      ...>   %Geo.BoundingBox{minLon: 0, minLat: 0, maxLon: 4.5, maxLat: 7.1}
      ...> )
      true

  """
  def inside_bbox?(
        %{lon: lon, lat: lat},
        %Geo.BoundingBox{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
      ) do
    lon >= minLon &&
      lon <= maxLon &&
      lat >= minLat &&
      lat <= maxLat
  end

  def inside_bbox?(%Geo.BoundingBox{} = inner, %Geo.BoundingBox{} = container) do
    container == union(inner, container)
  end

  @doc ~S"""
  Returns true if the two given bounding boxes overlap
  ## Examples
      iex> Geo.CheapRuler.overlap?(
      ...>   %Geo.BoundingBox{minLon: 9.98160, minLat: 53.55331, maxLon: 9.999764, maxLat: 53.56092},
      ...>   %Geo.BoundingBox{minLon: 9.99307, minLat: 53.55007, maxLon: 10.01124, maxLat: 53.55768}
      ...> )
      true

      iex> Geo.CheapRuler.overlap?(
      ...>   %Geo.BoundingBox{minLon:  9.98160, minLat: 53.55331, maxLon:  9.999764, maxLat: 53.56092},
      ...>   %Geo.BoundingBox{minLon: 10.01382, minLat: 53.54506, maxLon: 10.031987, maxLat: 53.55266}
      ...> )
      false

  """
  @spec overlap?(Geo.BoundingBox.like() | nil, Geo.BoundingBox.like() | nil) :: boolean()
  def overlap?(
        %Geo.BoundingBox{minLon: minLonA, minLat: minLatA, maxLon: maxLonA, maxLat: maxLatA},
        %Geo.BoundingBox{minLon: minLonB, minLat: minLatB, maxLon: maxLonB, maxLat: maxLatB}
      ) do
    maxLonA >= minLonB && maxLonB >= minLonA && maxLatA >= minLatB && maxLatB >= minLatA
  end

  def overlap?(bbox1, bbox2) when is_nil(bbox1) or is_nil(bbox2) do
    false
  end

  @doc ~S"""
  Increases the bounding box by the given distance

  ## Examples

      iex> Geo.CheapRuler.buffer_bbox(
      ...>   %Geo.BoundingBox{minLon: 0, minLat: 0, maxLon: 4.5, maxLat: 7.1},
      ...>   1000
      ...> )
      %Geo.BoundingBox{minLon: -0.015087116638538251,
        minLat: -0.008984923104452173,
        maxLon: 4.515087116638538,
        maxLat: 7.108984923104452}
  """
  def buffer_bbox(
        %Geo.BoundingBox{
          minLon: minLon,
          minLat: minLat,
          maxLon: maxLon,
          maxLat: maxLat
        },
        buffer
      )
      when is_float(buffer) or is_integer(buffer) do
    v = buffer / @ky
    h = buffer / @kx

    %Geo.BoundingBox{
      minLon: minLon - h,
      minLat: minLat - v,
      maxLon: maxLon + h,
      maxLat: maxLat + v
    }
  end

  # as per https://wiki.openstreetmap.org/wiki/Zoom_levels#Distance_per_pixel_math
  @zoom_factor 40_075_016.686 * @cos1
  @spec center_zoom_to_bounds(%{lat: number, lon: number, zoom: number}) :: Geo.BoundingBox.t()
  def center_zoom_to_bounds(%{lon: lon, lat: lat, zoom: zoom}) do
    buffer_bbox(
      %Geo.BoundingBox{
        minLon: lon,
        minLat: lat,
        maxLon: lon,
        maxLat: lat
      },
      @zoom_factor / :math.pow(2, zoom)
    )
  end

  @spec bounds_to_center_zoom(Geo.BoundingBox.like()) :: %{
          lat: float(),
          lon: float(),
          zoom: float()
        }
  def bounds_to_center_zoom(bbox) do
    dist =
      max(
        Geo.CheapRuler.dist(
          %{lat: bbox.minLat, lon: bbox.minLon},
          %{lat: bbox.minLat, lon: bbox.maxLon}
        ),
        Geo.CheapRuler.dist(
          %{lat: bbox.minLat, lon: bbox.minLon},
          %{lat: bbox.maxLat, lon: bbox.minLon}
        )
      )

    zoom = if dist == 0, do: 24, else: :math.log2(@zoom_factor / dist) |> max(1) |> min(24)

    %{lat: lat, lon: lon} = center(bbox)
    %{lat: lat, lon: lon, zoom: zoom}
  end

  @spec bounds_to_xyz(Geo.BoundingBox.like(), max_zoom :: pos_integer()) :: %{
          x: integer,
          y: integer,
          zoom: pos_integer(),
          str: binary()
        }
  @doc ~S"""
  Returns the tile most likely to be displayed at the center for the bounding box

  ## Examples

      iex> Geo.CheapRuler.bounds_to_xyz(
      ...>   %{maxLat: 53.715809, maxLon: 10.21779, minLat: 53.454363, minLon: 9.724553},
      ...>   14
      ...> )
      %{x: 330, y: 540, zoom: 10, str: "10/540/330"}
  """
  def bounds_to_xyz(bbox, max_zoom) do
    %{zoom: zoom, lat: lat, lon: lon} = bounds_to_center_zoom(bbox)
    zoom = min(max_zoom, round(zoom))
    factor = :math.pow(2, zoom)

    x =
      floor(
        (1 -
           :math.log(
             :math.tan(to_rad(lat)) +
               1 / :math.cos(to_rad(lat))
           ) / :math.pi()) /
          2 * factor
      )

    y = floor((lon + 180) / 360 * factor)

    %{x: x, y: y, zoom: zoom, str: "#{zoom}/#{y}/#{x}"}
  end

  @spec meters_per_pixel(number) :: float
  def meters_per_pixel(zoom) do
    @zoom_factor / :math.pow(2, zoom + 8)
  end

  @doc ~S"""
  Returns the distance between two line or from a line and a point

  ## Examples

      iex> Geo.CheapRuler.dist(
      ...>   [
      ...>     %{lon: 10.03971050427, lat: 53.58988354712},
      ...>     %{lon: 10.04383358673, lat: 53.58986207956},
      ...>     %{lon: 10.04026843693, lat: 53.58887260434}
      ...>   ],
      ...>   %{lon: 10.04289976489, lat: 53.59004976324}
      ...> )
      20.34681678169861

      iex> Geo.CheapRuler.dist(
      ...>   %{lon: 10.04383358673, lat: 53.58986207956},
      ...>   %{lon: 10.03971050427, lat: 53.58988354712}
      ...> )
      273.29543042145286
  """
  def dist(from, %{lon: _lon1, lat: _lat1} = to) when is_list(from) do
    closest_point_on_line(from, to) |> Map.fetch!(:dist)
  end

  def dist(%{lon: _lon1, lat: _lat1} = from, %{lon: _lon2, lat: _lat2} = to),
    do: point2point_dist(from, to)

  @doc ~S"""
  It finds the closest point of a line to another given point. Optionally you
  can pass the bearing and how strongly to consider it. Default is to ignore
  the bearing.

  ## Examples

  It interpolates the point in the format of the given line:

      iex> Geo.CheapRuler.closest_point_on_line(
      ...>   [
      ...>     %Video.TimedPoint{lon: 10,             lat: 53            , time_offset_ms: 100},
      ...>     %Video.TimedPoint{lon: 10.03971050427, lat: 53.58988354712, time_offset_ms: 200},
      ...>     %Video.TimedPoint{lon: 10.04383358673, lat: 53.58986207956, time_offset_ms: 300},
      ...>     %Video.TimedPoint{lon: 10.04026843693, lat: 53.58887260434, time_offset_ms: 400}
      ...>   ],
      ...>   %{lon: 10.04289976489, lat: 53.59004976324}
      ...> )
      %{index: 1, t: 0.7728627602842454, dist: 20.34681678169861,
        point: %Video.TimedPoint{lon: 10.042897081160916, lat: 53.58986695564232, time_offset_ms: 277}}

  It does not extend beyond line start/end points:

      iex> Geo.CheapRuler.closest_point_on_line(
      ...>   [
      ...>     %{lat: 53.550598, lon: 9.994402},
      ...>     %{lat: 53.550572, lon: 9.994393}
      ...>   ],
      ...>   %{lat: 53.5505342, lon: 9.9944973}
      ...> )
      %{index: 0, t: 1, dist: 8.092672677012276, point: %{lat: 53.550572, lon: 9.994393}}

  """
  @spec closest_point_on_line([Geo.Point.like()], Geo.Point.like()) :: %{
          point: Geo.Point.like(),
          index: integer(),
          dist: float(),
          t: float()
        }
  def closest_point_on_line(line, point)

  def closest_point_on_line(line, %{lon: lon, lat: lat})
      when is_list(line) and is_float(lon) and is_float(lat) do
    [head | tail] = line

    Enum.reduce(tail, %{prev: head, dist: nil, point: nil, i: 0, index: 0, t: 0}, fn next, acc ->
      x = acc.prev.lon
      y = acc.prev.lat
      dx = (next.lon - x) * @kx
      dy = (next.lat - y) * @ky

      {x, y, t} =
        if dx == 0 && dy == 0 do
          {x, y, 0}
        else
          (((lon - x) * @kx * dx + (lat - y) * @ky * dy) / (dx * dx + dy * dy))
          |> case do
            t when t > 1 -> {next.lon, next.lat, 1}
            t when t > 0 -> {x + dx / @kx * t, y + dy / @ky * t, t}
            _t -> {x, y, 0}
          end
        end

      dx = (lon - x) * @kx
      dy = (lat - y) * @ky
      dist = dx * dx + dy * dy

      next_acc = %{acc | i: acc.i + 1, prev: next}

      if acc.dist && dist >= acc.dist do
        next_acc
      else
        %{next_acc | dist: dist, point: {acc.prev, next}, index: acc.i, t: t}
      end
    end)
    |> Map.take([:point, :index, :dist, :t])
    |> Map.update!(:dist, &:math.sqrt(&1))
    |> case do
      %{point: nil} = m ->
        %{m | point: head}

      %{point: {prev, next}, t: t} = m ->
        point = Geo.Interpolate.point(prev, next, t)
        %{m | point: point}
    end
  end

  @doc ~S"""
  Returns the total length of a line in meters

  ## Examples

      iex> Geo.CheapRuler.line_distance([
      ...>   %{lon: 10.03971050427, lat: 53.58988354712},
      ...>   %{lon: 10.04383358673, lat: 53.58986207956},
      ...>   %{lon: 10.04026843693, lat: 53.58887260434}
      ...> ])
      534.0011528314758
  """
  def line_distance(line, len \\ 0)
  def line_distance([a, b | l], len), do: line_distance([b | l], len + point2point_dist(a, b))
  def line_distance([_], len), do: len
  def line_distance([], len), do: len

  @spec point2point_dist(%{lat: number, lon: number}, %{lat: number, lon: number}) :: float
  @doc ~S"""
  Returns the distance in meters between two line

  ## Examples

      iex> Geo.CheapRuler.point2point_dist(
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

  @doc """
  Given two bearings in degrees, calculates how far they are apart and returns
  the absolute value (also in degrees)
  """
  def bearing_diff(b1, b2) do
    case b2 - b1 do
      d when d < -180 -> d + 360
      d when d > 180 -> d - 360
      d -> d
    end
    |> abs()
  end

  @doc ~S"""
  Returns the bearing between two line in degrees.

  ## Examples

      iex> Geo.CheapRuler.bearing(
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
      bear = :math.atan2(dx, dy) |> to_deg()
      if bear < 0, do: bear + 360, else: bear
    end
  end

  @doc """
  Ensure that all segments in the given line are shorter than the given
  distance. If necessary, additional points will be inserted in between
  the too long segment.

      iex> Geo.CheapRuler.max_segment_length([
      ...>  %{lat: 53.49806818946, lon: 9.98100144757},
      ...>  %{lat: 53.49689925483, lon: 9.98101267651},
      ...>  %{lat: 53.49690593455, lon: 9.98334829625}
      ...> ], 75)
      [
        %{lat: 53.49806818946,     lon: 9.98100144757},
        %{lat: 53.497483722145,    lon: 9.98100706204},
        %{lat: 53.49689925483,     lon: 9.98101267651},
        %{lat: 53.496901481403334, lon: 9.981791216423334},
        %{lat: 53.496903707976664, lon: 9.982569756336666},
        %{lat: 53.49690593455,     lon: 9.98334829625}
      ]
  """
  def max_segment_length(polyline, max_dist) do
    polyline
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce([hd(polyline)], fn
      [a, a], line ->
        IO.warn("got duplicated point in #{inspect(polyline)}")
        # i.e. remove duplicated point
        line

      [a, b], line ->
        pieces = ceil(dist(a, b) / max_dist)
        segmented = Enum.map(pieces..1, fn n -> Geo.Interpolate.point(a, b, n / pieces) end)
        segmented ++ line
    end)
    |> Enum.reverse()
  end

  defp to_deg(rad) do
    rad / :math.pi() * 180.0
  end

  defp to_rad(deg) do
    deg * :math.pi() / 180.0
  end
end
