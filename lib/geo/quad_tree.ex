defmodule Geo.QuadTree do
  @moduledoc """
  Creates a QuadTree for fast lookup of neighbors for a given query point.
  """

  @params [:bbox, :points, :count, :capacity, :nw, :ne, :sw, :se]
  @enforce_keys @params

  @type t() ::
          %__MODULE__{
            bbox: Geo.BoundingBox.t(),
            capacity: pos_integer(),
            points: [Geo.Point.like()],
            count: non_neg_integer(),
            nw: nil,
            ne: nil,
            sw: nil,
            se: nil
          }
          | %__MODULE__{
              bbox: Geo.BoundingBox.t(),
              capacity: pos_integer(),
              points: nil,
              count: nil,
              nw: t(),
              ne: t(),
              sw: t(),
              se: t()
            }

  defstruct @params

  # Max points before subdividing
  @capacity 50

  @doc """
  Creates a new QuadTree either from the given bounding box, or from the
  coordinates, which are automatically inserted into the QuadTree.
  """
  @spec new(Geo.BoundingBox.t() | [Geo.Point.like()], pos_integer()) :: t()
  def new(bbox_or_coords, capacity \\ @capacity)

  def new(%Geo.BoundingBox{} = bbox, capacity) when capacity > 0 do
    %__MODULE__{
      bbox: bbox,
      points: [],
      count: 0,
      capacity: capacity,
      nw: nil,
      ne: nil,
      sw: nil,
      se: nil
    }
  end

  def new(coords, capacity) when capacity > 0 do
    {minLat, maxLat} = Enum.min_max_by(coords, & &1.lat)
    {minLon, maxLon} = Enum.min_max_by(coords, & &1.lon)

    bbox = %Geo.BoundingBox{
      minLon: minLon.lon,
      minLat: minLat.lat,
      maxLon: maxLon.lon,
      maxLat: maxLat.lat
    }

    %__MODULE__{
      bbox: bbox,
      points: [],
      count: 0,
      capacity: capacity,
      nw: nil,
      ne: nil,
      sw: nil,
      se: nil
    }
    |> insert_many(coords)
  end

  @doc "Inserts a list of point into the QuadTree"
  @spec insert_many(t(), [Geo.Point.like()]) :: t()
  def insert_many(%__MODULE__{} = qt, coords) do
    Enum.reduce(coords, qt, &insert(&2, &1))
  end

  @doc "Inserts a point into the QuadTree"
  @spec insert(t(), Geo.Point.like()) :: t()
  def insert(%__MODULE__{points: nil, nw: nw, ne: ne, sw: sw, se: se} = qt, %{} = point) do
    case {point.lat >= nw.bbox.minLat, point.lon >= ne.bbox.minLon} do
      {true, true} -> %{qt | ne: insert(ne, point)}
      {true, false} -> %{qt | nw: insert(nw, point)}
      {false, true} -> %{qt | se: insert(se, point)}
      {false, false} -> %{qt | sw: insert(sw, point)}
    end
  end

  def insert(%__MODULE__{} = qt, %{} = point) when qt.count < qt.capacity do
    %{qt | points: [point | qt.points], count: qt.count + 1}
  end

  def insert(%__MODULE__{} = qt, %{} = point) do
    if can_subdivide(qt.bbox) do
      qt |> subdivide() |> insert(point)
    else
      # set a large negative number as count so we "never" check again if we
      # need to subdivide this
      %{qt | points: [point | qt.points], count: -1_000_000_000_000}
    end
  end

  @epsilon 10 ** -10
  defp can_subdivide(%{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}) do
    abs(maxLon - minLon) >= @epsilon && abs(maxLat - minLat) >= @epsilon
  end

  @doc """
  Similar to Enum.reduce, but doesn't implement the full blown interface

  iex> qt = Geo.QuadTree.new(Geo.QuadTreeTest.example_coords(), 10)
  ...> Geo.QuadTree.reduce(qt, 0, fn _point, count -> count + 1 end)
  14
  """
  @spec reduce(t(), Enum.acc(), (Geo.Point.like(), Enum.acc() -> Enum.acc())) :: Enum.acc()
  def reduce(%{points: nil} = qt, acc, fun) do
    acc = reduce(qt.nw, acc, fun)
    acc = reduce(qt.ne, acc, fun)
    acc = reduce(qt.sw, acc, fun)
    acc = reduce(qt.se, acc, fun)
    acc
  end

  def reduce(%{points: points}, acc, fun) do
    Enum.reduce(points, acc, fun)
  end

  @doc """
  Returns all coordinates in the QuadTree as an unordered list.
  """
  @spec to_list(t()) :: [Geo.Point.like()]
  def to_list(qt) do
    reduce(qt, [], fn point, acc -> [point | acc] end)
  end

  @doc """
  Finds the closest point to a given query coordinate.

  iex> qt = Geo.QuadTree.new(Geo.QuadTreeTest.example_coords(), 10)
  ...> Geo.QuadTree.nearest_neighbor(qt, %{lat: 53.70455377642, lon: 10.13885199755})
  {%{lat: 53.70455060572, lon: 10.13880370975, extra: "data"}, 3.219994054478164}
  """
  @typep nearest :: {Geo.Point.like(), distance_in_m :: float()} | {nil, :infinity}
  @spec nearest_neighbor(t(), Geo.Point.like()) :: nearest()
  def nearest_neighbor(%__MODULE__{} = qt, %{lat: _, lon: _} = query) do
    search_nearest(qt, query, {nil, :infinity})
  end

  @spec search_nearest(t(), Geo.Point.like(), nearest()) :: nearest()
  defp search_nearest(%{points: nil} = qt, query, {best_point, best_dist}) do
    Enum.reduce(
      [qt.nw, qt.ne, qt.sw, qt.se],
      {best_point, best_dist},
      fn
        sub_qt, {nil, :infinity} ->
          search_nearest(sub_qt, query, {nil, :infinity})

        sub_qt, {bp, bd} ->
          if within_buffered_bbox?(sub_qt, bd, query),
            do: search_nearest(sub_qt, query, {bp, bd}),
            else: {bp, bd}
      end
    )
  end

  defp search_nearest(%{points: points}, query, {best_point, best_dist})
       when is_list(points) do
    Enum.reduce(points, {best_point, best_dist}, fn p, {bp, bd} ->
      d = Geo.CheapRuler.point2point_dist(p, query)
      if is_nil(bp) || d < bd, do: {p, d}, else: {bp, bd}
    end)
  end

  @doc """
  Finds all coordinates within the giving radius in meters around the query
  point. The returned points are not ordered in any particular fashion.

  iex> qt = Geo.QuadTree.new(Geo.QuadTreeTest.example_coords(), 10)
  ...> Geo.QuadTree.neighbors_within(qt, %{lat: 53.70455377642, lon: 10.13885199755}, 15.0)
  [
    {%{lat: 53.70455060572, lon: 10.13880370975, extra: "data"}, 3.219994054478164},
    {%{lat: 53.70465222041, lon: 10.13895391345},                12.871625736883217}
  ]
  """
  @spec neighbors_within(t(), Geo.Point.like(), float()) :: [nearest()]
  def neighbors_within(%__MODULE__{} = qt, %{lat: _, lon: _} = query, distance_in_meters)
      when distance_in_meters > 0.0 do
    search_neighbors(qt, query, distance_in_meters, [])
  end

  @spec search_neighbors(t(), Geo.Point.like(), float(), [nearest()]) :: [nearest()]
  defp search_neighbors(%{points: points}, query, max_dist, acc) when is_list(points) do
    Enum.reduce(points, acc, fn point, acc ->
      dist = Geo.CheapRuler.point2point_dist(point, query)
      if dist <= max_dist, do: [{point, dist} | acc], else: acc
    end)
  end

  defp search_neighbors(qt, query, dist, acc) do
    Enum.reduce([qt.nw, qt.ne, qt.sw, qt.se], acc, fn sub_qt, acc ->
      if within_buffered_bbox?(sub_qt, dist, query),
        do: search_neighbors(sub_qt, query, dist, acc),
        else: acc
    end)
  end

  @spec subdivide(t()) :: t()
  defp subdivide(qt) do
    # TODO: meridian?
    midLat = (qt.bbox.minLat + qt.bbox.maxLat) / 2.0
    midLon = (qt.bbox.minLon + qt.bbox.maxLon) / 2.0

    nw = new(%{qt.bbox | maxLon: midLon, minLat: midLat}, qt.capacity)
    ne = new(%{qt.bbox | minLon: midLon, minLat: midLat}, qt.capacity)
    sw = new(%{qt.bbox | maxLon: midLon, maxLat: midLat}, qt.capacity)
    se = new(%{qt.bbox | minLon: midLon, maxLat: midLat}, qt.capacity)

    div = %{qt | nw: nw, ne: ne, sw: sw, se: se, points: nil}

    Enum.reduce(qt.points, div, fn point, div ->
      case {point.lat >= div.nw.bbox.minLat, point.lon >= div.ne.bbox.minLon} do
        {true, true} ->
          %{div | ne: %{div.ne | count: div.ne.count + 1, points: [point | div.ne.points]}}

        {true, false} ->
          %{div | nw: %{div.nw | count: div.ne.count + 1, points: [point | div.nw.points]}}

        {false, true} ->
          %{div | se: %{div.se | count: div.ne.count + 1, points: [point | div.se.points]}}

        {false, false} ->
          %{div | sw: %{div.sw | count: div.ne.count + 1, points: [point | div.sw.points]}}
      end
    end)
  end

  defp within_buffered_bbox?(qt, buffer, query) do
    padded = Geo.CheapRuler.buffer_bbox(qt.bbox, buffer)
    Geo.CheapRuler.inside_bbox?(query, padded)
  end
end
