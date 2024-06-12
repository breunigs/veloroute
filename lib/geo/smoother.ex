defmodule Geo.Smoother do
  @doc """
  Smooth the given polyline with sensible settings and encode it as binary
  polyline suitable for passing to the frontend. The JS implementation only
  supports precisions up to 7.
  """
  @spec polyline([Geo.Point.like()], float(), pos_integer()) :: binary()
  def polyline(coords, interval_ms, precision) when is_list(coords) and precision <= 7 do
    coords
    |> auto()
    |> equi_time_interval(interval_ms)
    |> Enum.map(&{&1.lon, &1.lat})
    |> Polyline.encode(precision)
  end

  @spec auto([Geo.Point.like()]) :: [Video.TimedPoint.t()]
  @doc """
  Smooth the given polyline with sensible settings.
  """
  def auto(coords) do
    coords
    |> cut_corners(3)
    |> average_in_distance(10.0)
  end

  @spec equi_time_interval([Video.TimedPoint.t()], float()) :: [Video.TimedPoint.t()]
  @doc """
  Takes a polyline and returns one with interpolated points exactly every
  interval milliseconds. The starting point is conserved, but the new polyline
  will be a bit shorter if the next interval exceeds the original polyline.

  ## Examples

      iex> Geo.Smoother.equi_time_interval([
      ...>   %Video.TimedPoint{lat: 1.0, lon: 1.0, time_offset_ms: 0},
      ...>   %Video.TimedPoint{lat: 2.0, lon: 2.0, time_offset_ms: 10}
      ...> ], 5.0)
      [
        %Video.TimedPoint{lat: 1.0, lon: 1.0, time_offset_ms: 0},
        %Video.TimedPoint{lat: 1.5, lon: 1.5, time_offset_ms: 5},
        %Video.TimedPoint{lat: 2.0, lon: 2.0, time_offset_ms: 10}
      ]
  """
  def equi_time_interval(coords, interval_in_ms) when interval_in_ms > 0 do
    equi_time_interval(coords, [], 0, interval_in_ms) |> Enum.reverse()
  end

  defp equi_time_interval([_only_one], output, _offset, _interval), do: output

  defp equi_time_interval([prev, next | _rest] = input, output, offset, interval)
       when prev.time_offset_ms == next.time_offset_ms,
       do: equi_time_interval(tl(input), output, offset, interval)

  defp equi_time_interval([prev, next | _rest] = input, output, offset, interval) do
    t = (offset - prev.time_offset_ms) / (next.time_offset_ms - prev.time_offset_ms)

    cond do
      t > 1 ->
        equi_time_interval(tl(input), output, offset, interval)

      t >= 0 ->
        interpolated = Video.TimedPoint.interpolate(prev, next, t)
        equi_time_interval(input, [interpolated | output], offset + interval, interval)

      true ->
        raise("algorithm error: didn't drop an input coord in an earlier iteration")
    end
  end

  @spec average_in_distance([Geo.Point.like()], float) :: [Geo.Point.like()]
  @doc """
  Takes a polyline and cutoff range in meters within which it will consider
  coordinates for smoothing. Put differently, it will smooth a coordinate using
  the preceding/following coordinates within `range_in_meters` until the cutoff
  is met. Larger values mean more smoothing, but less accuracy. The coordinates
  are weighted by their distance, i.e. close coordinates have more influence
  than the ones further away.

  ## Examples

      iex> Geo.Smoother.average_in_distance([%{lat: 1.0, lon: 1.0}, %{lat: 2.0, lon: 2.0}], 15.0)
      [%{lat: 1.0, lon: 1.0}, %{lat: 2.0, lon: 2.0}]

      iex> Geo.Smoother.average_in_distance([
      ...> %{lat: 53.550957, lon: 9.993817}, %{lat: 53.550923, lon: 9.993876},
      ...> %{lat: 53.550890, lon: 9.993928}, %{lat: 53.550856, lon: 9.993975},
      ...> %{lat: 53.550826, lon: 9.994023}, %{lat: 53.550804, lon: 9.994050},
      ...> %{lat: 53.550794, lon: 9.994055}, %{lat: 53.550792, lon: 9.994056},
      ...> %{lat: 53.550791, lon: 9.994055}, %{lat: 53.550787, lon: 9.994058},
      ...> %{lat: 53.550777, lon: 9.994084}, %{lat: 53.550755, lon: 9.994120},
      ...> %{lat: 53.550728, lon: 9.994151}, %{lat: 53.550713, lon: 9.994180},
      ...> %{lat: 53.550700, lon: 9.994205}], 15.0)
      [
        %{lat: 53.55093540218586, lon: 9.993853659506811},
        %{lat: 53.550913319343586, lon: 9.993889060855963},
        %{lat: 53.55087641183799, lon: 9.993944100086669},
        %{lat: 53.55083124900453, lon: 9.994007224526495},
        %{lat: 53.55080706000847, lon: 9.994040496573183},
        %{lat: 53.55079534011067, lon: 9.99405624638512},
        %{lat: 53.550791158262086, lon: 9.994061873356419},
        %{lat: 53.55079028159536, lon: 9.994063080640776},
        %{lat: 53.55079010151522, lon: 9.994063321860297},
        %{lat: 53.55078816325091, lon: 9.994066085984363},
        %{lat: 53.550780844634836, lon: 9.994077002907744},
        %{lat: 53.55076735405408, lon: 9.994097127443395},
        %{lat: 53.55075232901659, lon: 9.994119545995215},
        %{lat: 53.55073993441644, lon: 9.99413870892748},
        %{lat: 53.55072684539607, lon: 9.994159412578323}
      ]
  """
  @compile {:inline, sum_while_in_range: 4}
  def average_in_distance(coords, range_in_meters) do
    Enum.map_reduce(coords, {[], coords}, fn
      coord, {prev, [coord | next]} ->
        # move the current coord from "next" to "prev".
        prev = [coord | prev]

        # find neighbors in range and smooth over them.
        {sum_lats, sum_lons, sum_weights} =
          {0.0, 0.0, 0.0}
          |> sum_while_in_range(coord, prev, range_in_meters)
          |> sum_while_in_range(coord, next, range_in_meters)

        # map the smoothed coordinate
        smoothed = %{coord | lat: sum_lats / sum_weights, lon: sum_lons / sum_weights}
        {smoothed, {prev, next}}
    end)
    |> elem(0)
  end

  @typep sums() :: {float(), float(), float()}
  @spec sum_while_in_range(sums(), Geo.Point.like(), [Geo.Point.like()], float()) :: sums()
  defp sum_while_in_range(sums, from, coords, range_in_meters) do
    Enum.reduce_while(coords, sums, fn coord, {sum_lat, sum_lon, sum_weight} ->
      dist = Geo.CheapRuler.point2point_dist(coord, from)

      if dist > range_in_meters do
        {:halt, {sum_lat, sum_lon, sum_weight}}
      else
        weight = range_in_meters - dist
        {:cont, {sum_lat + coord.lat * weight, sum_lon + coord.lon * weight, sum_weight + weight}}
      end
    end)
  end

  require Integer
  @spec cut_corners([Geo.Point.like()], non_neg_integer()) :: [Geo.Point.like()]
  @doc """
  A single iteration replaces every point with two new ones. These points are
  placed before and after the original point along the polyline using linear
  interpolation. Like cutting a corner on a piece of paper. Repeating this a
  couple of times yields a smoothed approximation of the original polyline.

  ## Examples

  iex> Geo.Smoother.cut_corners([%{lat: 1, lon: 1}, %{lat: 2, lon: 2}], 1)
  [%{lat: 1, lon: 1}, %{lat: 1.25, lon: 1.25}, %{lat: 1.75, lon: 1.75}, %{lat: 2, lon: 2}]

  iex> Geo.Smoother.cut_corners([%{lat: 1, lon: 1}, %{lat: 2, lon: 2}], 3)
  [
    %{lat: 1, lon: 1},
    %{lat: 1.015625, lon: 1.015625},
    %{lat: 1.046875, lon: 1.046875},
    %{lon: 1.09375, lat: 1.09375},
    %{lon: 1.15625, lat: 1.15625},
    %{lon: 1.234375, lat: 1.234375},
    %{lon: 1.328125, lat: 1.328125},
    %{lon: 1.4375, lat: 1.4375},
    %{lon: 1.5625, lat: 1.5625},
    %{lon: 1.671875, lat: 1.671875},
    %{lon: 1.765625, lat: 1.765625},
    %{lon: 1.84375, lat: 1.84375},
    %{lon: 1.90625, lat: 1.90625},
    %{lon: 1.953125, lat: 1.953125},
    %{lon: 1.984375, lat: 1.984375},
    %{lat: 2, lon: 2}
  ]
  """
  # we place new points on both sides, so the valid range is (0, 0.5]. This
  # value was experimentally chosen and gives good results.
  @cut_corner_dist 0.25
  def cut_corners(coords, iterations),
    do: cut_corners(coords, iterations, Integer.is_odd(iterations))

  defp cut_corners(coords, 0, false), do: coords
  defp cut_corners(coords, 0, true), do: Enum.reverse(coords)

  defp cut_corners(coords, iterations, needs_reverse) when iterations > 0 do
    {cut, last_coord} =
      Enum.reduce(tl(coords), {[hd(coords)], hd(coords)}, fn next, {cut, prev} ->
        p1 = Geo.Interpolate.point(prev, next, @cut_corner_dist)
        p2 = Geo.Interpolate.point(prev, next, 1 - @cut_corner_dist)
        {[p2, p1 | cut], next}
      end)

    cut_corners([last_coord | cut], iterations - 1, needs_reverse)
  end
end
