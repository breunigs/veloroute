defmodule Geo.Smoother do
  @typep coord_dist :: [Geo.Point.like()]

  @doc """
  Smooth the given polyline with sensible settings and encode it as binary
  polyline suitable for passing to the frontend.
  """
  @spec polyline([Geo.Point.like()], float(), pos_integer()) :: binary()
  def polyline(coords, interval_ms, precision) when is_list(coords) do
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
  the preceeding/following coordinates within `range_in_meters` until the cutoff
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
        %{lat: 53.550935402185864, lon: 9.993853659506811},
        %{lat: 53.550913319343586, lon: 9.993889060855963},
        %{lat: 53.55087641183799, lon: 9.993944100086667},
        %{lat: 53.55083124900452, lon: 9.994007224526493},
        %{lat: 53.55080706000847, lon: 9.994040496573183},
        %{lat: 53.55079534011066, lon: 9.99405624638512},
        %{lat: 53.55079115826207, lon: 9.994061873356417},
        %{lat: 53.55079028159536, lon: 9.994063080640775},
        %{lat: 53.55079010151522, lon: 9.994063321860299},
        %{lat: 53.550788163250914, lon: 9.994066085984363},
        %{lat: 53.550780844634836, lon: 9.994077002907744},
        %{lat: 53.55076735405407, lon: 9.994097127443393},
        %{lat: 53.55075232901658, lon: 9.994119545995215},
        %{lat: 53.55073993441643, lon: 9.99413870892748},
        %{lat: 53.55072684539607, lon: 9.994159412578323}
       ]
  """
  def average_in_distance(coords, range_in_meters) do
    Enum.map_reduce(coords, {[], coords}, fn
      coord, {prev, [coord | next]} ->
        # find neighbars in range and smooth over them
        prev_in_range = take_while_in_range(coord, prev, range_in_meters)
        next_in_range = take_while_in_range(coord, next, range_in_meters)
        smoothed = weighted_average(coord, prev_in_range ++ next_in_range, range_in_meters)
        # map the smoothed coordinate and move the original one from "next" to "prev"
        {smoothed, {[coord | prev], next}}
    end)
    |> elem(0)
  end

  @spec take_while_in_range(Geo.Point.like(), [Geo.Point.like()], float()) :: [coord_dist]
  defp take_while_in_range(from, coords, range_in_meters) do
    Enum.reduce_while(coords, [], fn coord, acc ->
      dist = Geo.CheapRuler.dist(coord, from)

      if dist > range_in_meters,
        do: {:halt, acc},
        else: {:cont, [{coord, dist} | acc]}
    end)
  end

  @spec weighted_average(Geo.Point.like(), [coord_dist], float) :: Geo.Point.like()
  defp weighted_average(coord, coord_dists, range_in_meters) do
    coord_dists = [{coord, 0}] ++ coord_dists

    {sum_lat, sum_lon, sum_weight} =
      Enum.reduce(coord_dists, {0, 0, 0}, fn {coord, dist}, {sum_lat, sum_lon, sum_weight} ->
        weight = range_in_meters - dist
        {sum_lat + coord.lat * weight, sum_lon + coord.lon * weight, sum_weight + weight}
      end)

    %{coord | lat: sum_lat / sum_weight, lon: sum_lon / sum_weight}
  end

  @spec cut_corners([Geo.Point.like()], non_neg_integer()) :: [Geo.Point.like()]
  @doc """
  A single iteration replaces every point with two new ones. These points are
  placed before and after the original point along the polyline using linear
  interpolation. Like cutting a corner on a piece of paper. Repeating this a
  couple of times yields a smoothed approximation of the original polyline.

  ## Examples

      iex> Geo.Smoother.cut_corners([%{lat: 1, lon: 1}, %{lat: 2, lon: 2}], 1)
      [%{lat: 1, lon: 1}, %{lat: 1.25, lon: 1.25}, %{lat: 1.75, lon: 1.75}, %{lat: 2, lon: 2}]
  """
  # we place new points on both sides, so the valid range is (0, 0.5]. This
  # value was experimentally chosen and gives good results.
  @cut_corner_dist 0.25
  def cut_corners(coords, iterations)
  def cut_corners(coords, 0), do: coords

  def cut_corners(coords, iterations) when iterations > 0 do
    cut =
      coords
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.flat_map(fn [prev, next] ->
        [
          Geo.Interpolate.point(prev, next, @cut_corner_dist),
          Geo.Interpolate.point(prev, next, 1 - @cut_corner_dist)
        ]
      end)

    cut = [hd(coords) | cut] ++ [List.last(coords)]

    cut_corners(cut, iterations - 1)
  end
end
