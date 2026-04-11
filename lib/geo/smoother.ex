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
    |> Geo.Nif.nif_equi_time_interval_encode(interval_ms / 1, precision)
  end

  @spec auto([Geo.Point.like()]) :: [Video.TimedPoint.t()]
  @doc """
  Smooth the given polyline with sensible settings.
  """
  def auto(coords) do
    coords
    |> cut_corners(3)
    |> average_in_distance(10.0)
    |> remove_overlaps()
  end

  @spec remove_overlaps([Video.TimedPoint.t()]) :: [Video.TimedPoint.t()]
  @doc """
  Removes any overlaps within the GPS track where there's a U-Turn within a very
  short distance.

  ## Examples

      iex> Geo.Smoother.remove_overlaps([
      ...>   %Video.TimedPoint{lat: 53.5525911, lon: 10.0125893, time_offset_ms: 20},
      ...>   %Video.TimedPoint{lat: 53.5525899, lon: 10.0124563, time_offset_ms: 30},
      ...>   %Video.TimedPoint{lat: 53.5526008, lon: 10.0125561, time_offset_ms: 40},
      ...>   %Video.TimedPoint{lat: 53.5525944, lon: 10.0124142, time_offset_ms: 50},
      ...> ])
      [
        %Video.TimedPoint{lat: 53.5525911, lon: 10.0125893, time_offset_ms: 20},
        %Video.TimedPoint{lat: 53.5525899, lon: 10.0124563, time_offset_ms: 30},
        %Video.TimedPoint{lat: 53.5525944, lon: 10.0124142, time_offset_ms: 50},
      ]
  """
  @max_overlap_length_m 5
  @min_heading_change_deg 170
  def remove_overlaps(coords) when length(coords) >= 3 do
    Geo.Nif.nif_remove_overlaps(
      coords,
      @max_overlap_length_m,
      @min_heading_change_deg,
      Geo.CheapRuler.kx(),
      Geo.CheapRuler.ky()
    )
  end

  def remove_overlaps(coords), do: coords

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
    Geo.Nif.nif_equi_time_interval(coords, interval_in_ms / 1)
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
  def average_in_distance(coords, range_in_meters) do
    Geo.Nif.nif_average_in_distance(
      coords,
      range_in_meters,
      Geo.CheapRuler.kx(),
      Geo.CheapRuler.ky()
    )
  end

  @spec cut_corners([Video.TimedPoint.t()], non_neg_integer()) :: [Video.TimedPoint.t()]
  @doc """
  A single iteration replaces every point with two new ones. These points are
  placed before and after the original point along the polyline using linear
  interpolation. Like cutting a corner on a piece of paper. Repeating this a
  couple of times yields a smoothed approximation of the original polyline.

  ## Examples

  iex> Geo.Smoother.cut_corners([
  ...>   %Video.TimedPoint{lat: 1.0, lon: 1.0, time_offset_ms: 0},
  ...>   %Video.TimedPoint{lat: 2.0, lon: 2.0, time_offset_ms: 100}
  ...> ], 1)
  [
    %Video.TimedPoint{lat: 1.0, lon: 1.0, time_offset_ms: 0},
    %Video.TimedPoint{lat: 1.25, lon: 1.25, time_offset_ms: 25},
    %Video.TimedPoint{lat: 1.75, lon: 1.75, time_offset_ms: 75},
    %Video.TimedPoint{lat: 2.0, lon: 2.0, time_offset_ms: 100}
  ]
  """
  # we place new points on both sides, so the valid range is (0, 0.5]. This
  # value was experimentally chosen and gives good results.
  @cut_corner_dist 0.25
  def cut_corners(coords, iterations) do
    Geo.Nif.nif_cut_corners(coords, iterations, @cut_corner_dist)
  end
end
