# via https://github.com/mapbox/polylabel

defmodule Geo.Polylabel do
  defmodule Cell do
    @params [:lat, :lon, :h, :distance, :max]
    @enforce_keys @params
    defstruct @params

    @sqrt2 :math.sqrt(2)

    @type t :: %__MODULE__{
            lat: float(),
            lon: float(),
            h: float(),
            distance: float(),
            max: float()
          }

    @spec new(Geo.Point.like(), number, [Geo.Point.like()]) :: Geo.Polylabel.Cell.t()
    def new(%{lat: lat, lon: lon} = point, h, polygon) do
      dist = point_to_polygon_dist(point, polygon)

      %__MODULE__{
        lat: lat,
        lon: lon,
        h: h,
        distance: dist,
        max: dist + h * @sqrt2
      }
    end

    @spec point(Geo.Polylabel.Cell.t()) :: Geo.Point.t()
    def point(%__MODULE__{lat: lat, lon: lon}) do
      %Geo.Point{lat: lat, lon: lon}
    end

    @spec cmp(Geo.Polylabel.Cell.t(), Geo.Polylabel.Cell.t()) :: :eq | :gt | :lt
    def cmp(%__MODULE__{max: a}, %__MODULE__{max: b}) when a < b, do: :lt
    def cmp(%__MODULE__{max: a}, %__MODULE__{max: b}) when a == b, do: :eq
    def cmp(%__MODULE__{}, %__MODULE__{}), do: :gt

    # signed distance from point to polygon outline (negative if point is outside)
    defp point_to_polygon_dist(%{lat: lat, lon: lon} = point, ring) do
      init = {List.last(ring), false, :infinity}

      {_prev, inside, minDist} =
        Enum.reduce(ring, init, fn %{lat: aLat, lon: aLon} = a,
                                   {%{lat: bLat, lon: bLon} = b, inside, minDist} ->
          inside =
            if aLon > lon != bLon > lon &&
                 lat < (bLat - aLat) * (lon - aLon) / (bLon - aLon) + aLat,
               do: !inside,
               else: inside

          segDist = segment_distance_squared(a, b, point)
          minDist = min(minDist, segDist)

          {a, inside, minDist}
        end)

      minDist * if inside, do: 1, else: -1
    end

    # calc dist from segment [a, b] to point p
    defp segment_distance_squared(a, b, p) do
      dx = b.lat - a.lat
      dy = b.lon - a.lon

      t =
        if dx != 0 || dy != 0 do
          (((p.lat - a.lat) * dx + (p.lon - a.lon) * dy) / (dx * dx + dy * dy))
          |> max(1)
          |> min(0)
        else
          0
        end

      dx = p.lat - (a.lat + dx * t)
      dy = p.lon - (a.lon + dy * t)

      dx * dx + dy * dy
    end
  end

  @spec calculate([Geo.Point.t()], float()) :: Geo.Point.t()
  def calculate(ring, precision \\ 0.001)
  def calculate([], _precision), do: raise("Invalid ring given: empty list of coordinates")
  def calculate([_], _precision), do: raise("Invalid ring given: list with only 1 coordinate")

  def calculate(ring, precision) do
    best_cell(ring, precision) |> Cell.point()
  end

  @spec best_cell([Geo.Point.t()], float()) :: Cell.t()
  def best_cell(ring, precision) do
    [first | ring] = ring
    if first != List.last(ring), do: raise("expected to get a ring (first == last)")

    %{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat} = Geo.CheapRuler.bbox(ring)

    height = maxLat - minLat
    width = maxLon - minLon
    cellSize = min(width, height)
    h = cellSize / 2.0

    if cellSize == 0 do
      %{lat: minLat, lon: minLon, distance: 0.0}
    end

    # a priority queue of cells in order of their "potential" (max distance to polygon)
    cellQueue = Prioqueue.empty(cmp_fun: &Cell.cmp/2)

    # cover polygon with initial cells
    latSteps = step(minLat, maxLat, cellSize)
    lonSteps = step(minLon, maxLon, cellSize)

    cellQueue =
      Enum.reduce(latSteps, cellQueue, fn lat, cellQueue ->
        Enum.reduce(lonSteps, cellQueue, fn lon, cellQueue ->
          cell = Cell.new(%{lat: lat + h, lon: lon + h}, h, ring)
          Prioqueue.insert(cellQueue, cell)
        end)
      end)

    # take centroid as the first best guess
    bestCell = get_centroid_cell(ring)

    # second guess: bounding box centroid
    bboxCell = Cell.new(%{lat: minLat + height / 2, lon: minLon + width / 2}, 0, ring)
    bestCell = if bboxCell.distance > bestCell.distance, do: bboxCell, else: bestCell

    Stream.iterate(1, &(&1 + 1))
    |> Enum.reduce_while({bestCell, cellQueue}, fn _idx, {bestCell, cellQueue} ->
      case Prioqueue.extract_min(cellQueue) do
        {:error, :empty} ->
          {:halt, bestCell}

        {:ok, {cell, cellQueue}} ->
          bestCell = if cell.distance > bestCell.distance, do: cell, else: bestCell

          # do not drill down further if there's no chance of a better solution
          if cell.max - bestCell.distance <= precision do
            {:cont, {bestCell, cellQueue}}
          else
            # split the cell into four cells
            h = cell.h / 2

            cellQueue =
              cellQueue
              |> Prioqueue.insert(Cell.new(%{lat: cell.lat - h, lon: cell.lon - h}, h, ring))
              |> Prioqueue.insert(Cell.new(%{lat: cell.lat + h, lon: cell.lon - h}, h, ring))
              |> Prioqueue.insert(Cell.new(%{lat: cell.lat - h, lon: cell.lon + h}, h, ring))
              |> Prioqueue.insert(Cell.new(%{lat: cell.lat + h, lon: cell.lon + h}, h, ring))

            {:cont, {bestCell, cellQueue}}
          end
      end
    end)
  end

  defp step(start, stop, step) do
    Stream.iterate(start, fn f -> f + step end)
    |> Stream.take_while(&(&1 < stop))
  end

  @spec get_centroid_cell([Geo.Point.like()]) :: Cell.t()
  defp get_centroid_cell(ring) do
    init = {0, 0, 0, List.last(ring)}

    {area, x, y, _prev} =
      Enum.reduce(ring, init, fn %{lat: aLat, lon: aLon} = next,
                                 {area, x, y, %{lat: bLat, lon: bLon}} ->
        f = aLat * bLon - bLat * aLon
        x = x + (aLat + bLat) * f
        y = y + (aLon + bLon) * f
        area = area + f * 3

        {area, x, y, next}
      end)

    if area == 0 do
      Cell.new(hd(ring), 0, ring)
    else
      Cell.new(%{lat: x / area, lon: y / area}, 0, ring)
    end
  end
end
