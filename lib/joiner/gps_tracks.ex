defmodule Joiner.GpsTracks do
  @compile {:inline, within_dist?: 3, within_bearing?: 3}

  @doc """
  Returns the potential candidates where a join might make sense. They're
  ordered by most suitable to least suitable. The returned list might be empty.
  """
  @spec candidates(Joiner.Segment.t(), Joiner.Options.t()) :: [Joiner.Segment.t()]
  def candidates(segment, %Joiner.Options{} = opts) do
    o = overlapping(segment, opts)
    s = start_end(segment, opts)

    if(s, do: [s | o], else: o)
    |> merge_overlaps(opts)
    |> Enum.reject(&(&1.duration_ms < opts.fade_duration_ms))
    |> Enum.sort_by(& &1.duration_ms, :desc)
  end

  @doc """
  Creates a segment that contains the end of polyline1 and the start of
  polyline2.
  """
  @spec start_end(Joiner.Segment.t(), Joiner.Options.t()) :: Joiner.Segment.t() | nil
  def start_end(%{from: %{polyline: poly1} = v1, to: %{polyline: poly2}} = segment, opts) do
    poly_rev1 = Enum.reverse(poly1)

    if Geo.CheapRuler.point2point_dist(hd(poly_rev1), hd(poly2)) <= opts.geo_max_dist_m do
      mid = Video.TimedPoint.interpolate(hd(poly_rev1), hd(poly2), 0.5)

      prev = min_duration_within(poly_rev1, mid, opts)
      next = min_duration_within(poly2, mid, opts)

      from = %{segment.from | start: prev, stop: match_video_length(v1, poly_rev1)}
      to = %{segment.to | start: hd(poly2), stop: next}
      Joiner.Segment.set_from_to(segment, from, to)
    end
  end

  @spec match_video_length(Joiner.Video.t(), [Geo.Point.like()]) :: Geo.Point.like()
  defp match_video_length(video, rev_polyline)

  defp match_video_length(video, [stop, prev | _rest]) do
    stop_ms = video.meta.duration * 1000
    t = (stop_ms - prev.time_offset_ms) / (stop.time_offset_ms - prev.time_offset_ms)
    mod = stop.__struct__

    cond do
      t < 1.0 -> mod.interpolate(prev, stop, t)
      t > 1.0 -> mod.extrapolate(prev, stop, t)
      true -> stop
    end
  end

  defp match_video_length(_video, [stop]), do: stop

  @doc """
  Given two GPS tracks, it will return segments where the two tracks are close
  to each other and aim in roughly the same direction (similar bearing).
  """
  @spec overlapping(Joiner.Segment.t(), Joiner.Options.t()) :: [Joiner.Segment.t()]
  def overlapping(%{from: %{polyline: poly1}, to: %{polyline: poly2}} = segment, opts) do
    # this is n*m, so not suitable for really long tracks
    Enum.reduce(with_bearing(poly1), [], fn p1, matches ->
      Enum.reduce(with_bearing(poly2), matches, fn p2, matches ->
        # i.e. find all matching points
        if within_dist?(p1, p2, opts) && within_bearing?(p1, p2, opts) do
          [{p1, p2} | matches]
        else
          matches
        end
      end)
    end)
    |> Enum.reduce([], fn
      # i.e. combine consecutive within distance into segments
      {a1, a2}, [] ->
        [{[a1], [a2]}]

      {a1, a2}, [{[b1 | _] = l1, [b2 | _] = l2} | rest] ->
        if within_dist?(a1, b2, opts) || within_dist?(a2, b1, opts) do
          segment = {[a1 | l1], [a2 | l2]}
          [segment | rest]
        else
          [{[a1], [a2]}, {l1, l2} | rest]
        end
    end)
    |> Enum.map(fn {l1, l2} ->
      {l1s, l1e} = {hd(l1), List.last(l1)}
      {l2s, l2e} = {hd(l2), List.last(l2)}

      l1s = Map.delete(l1s, :bearing)
      l1e = Map.delete(l1e, :bearing)
      l2s = Map.delete(l2s, :bearing)
      l2e = Map.delete(l2e, :bearing)

      from = %{segment.from | start: l1s, stop: l1e}
      to = %{segment.to | start: l2s, stop: l2e}
      Joiner.Segment.set_from_to(segment, from, to)
    end)
  end

  @spec merge_overlaps([Joiner.Segment.t()], Joiner.Options.t()) :: [Joiner.Segment.t()]
  defp merge_overlaps(segments, opts, merged \\ [])
  defp merge_overlaps([], _opts, merged), do: merged

  defp merge_overlaps([seg | segments], opts, merged) do
    {merged, had_merges} =
      Enum.reduce_while(merged, {[], false}, fn merge, {merged, had_merges} ->
        case Joiner.Segment.maybe_merge(seg, merge) do
          {:ok, mmm} -> {:halt, {[mmm | merged], true}}
          _ -> {:cont, {[merge | merged], had_merges}}
        end
      end)

    if had_merges do
      merge_overlaps(segments, opts, merged)
    else
      merge_overlaps(segments, opts, [seg | merged])
    end
  end

  @doc """
  Calculate bearing for each coordinate by looking at the previous/next
  coordinate that is not too close.
  """
  @spec with_bearing([Video.TimedPoint.t()], float()) :: [Geo.Point.like()]
  def with_bearing(coords, eps_m \\ 10.0) do
    coords
    |> Enum.reduce({[], coords}, fn cur, {prev, next} ->
      prev_far = prev |> Enum.reject(&within_dist?(cur, &1, eps_m)) |> List.first()
      next_far = next |> Enum.reject(&within_dist?(cur, &1, eps_m)) |> List.first()
      prev_far = prev_far || List.last(prev) || cur
      next_far = next_far || List.last(next) || cur
      cur = Map.put(cur, :bearing, Geo.CheapRuler.bearing(prev_far, next_far))

      {[cur | prev], Enum.drop(next, 1)}
    end)
    |> elem(0)
    |> Enum.reverse()
  end

  defp within_dist?(p1, p2, %{geo_max_dist_m: dist_m}), do: within_dist?(p1, p2, dist_m)
  defp within_dist?(p1, p2, dist_m), do: Geo.CheapRuler.point2point_dist(p1, p2) <= dist_m

  defp within_bearing?(p1, p2, opts),
    do: Geo.CheapRuler.bearing_diff(p1.bearing, p2.bearing) <= opts.geo_max_bearing_deg

  defp min_duration_within([first | _] = list, comparison_point, opts) do
    Enum.split_while(list, fn point ->
      abs(point.time_offset_ms - first.time_offset_ms) < opts.fade_duration_ms
    end)
    |> case do
      # i.e. duration is shorter than desired
      {min, []} -> List.last(min)
      # i.e. first point in extra is longer than desired duration. Find furthest
      # within distance.
      {_min, extra} -> furthest_within(extra, comparison_point, opts)
    end
  end

  defp furthest_within([first | rest], comparison_point, opts) do
    # this assumes that first is definitely within distance
    Enum.reduce_while(rest, first, fn point, best ->
      if within_dist?(point, comparison_point, opts), do: {:cont, point}, else: {:halt, best}
    end)
  end
end
