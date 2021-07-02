defmodule Video.TrimmedSource do
  @known_params [
    :anonymized_path_rel,
    :source_path_rel,
    :coord_from,
    :coord_to,
    :duration_ms_uncut,
    :coords_uncut
  ]

  @type t :: %__MODULE__{
          anonymized_path_rel: binary(),
          source_path_rel: binary(),
          coord_from: Video.TimedPoint.t(),
          coord_to: Video.TimedPoint.t(),
          duration_ms_uncut: Video.Timestamp.t(),
          coords_uncut: [Video.TimedPoint.t()]
        }

  @enforce_keys @known_params
  defstruct @known_params

  @spec new_from_way(Map.Way.t(), atom()) :: t()
  def new_from_way(%Map.Way{tags: tags = %{video_forward: name}, nodes: [hd | tail]}, :forward) do
    from = Video.Timestamp.valid_or_nil(tags[:video_forward_start], tags) || hd
    to = Video.Timestamp.valid_or_nil(tags[:video_forward_end], tags) || List.last(tail)
    new_from_path(name) |> extract(from, to)
  end

  def new_from_way(%Map.Way{tags: tags = %{video_backward: name}, nodes: [hd | tail]}, :backward) do
    from = Video.Timestamp.valid_or_nil(tags[:video_backward_start], tags) || List.last(tail)

    to = Video.Timestamp.valid_or_nil(tags[:video_backward_end], tags) || hd
    new_from_path(name) |> extract(from, to)
  end

  def new_from_path(name) when is_binary(name) do
    name
    |> Video.Source.new_from_path()
    |> new_from_source
  end

  def new_from_source(%Video.Source{} = source) do
    with coords when is_list(coords) <- Video.Source.timed_points(source) do
      coord_from = coords |> hd()
      coord_to = coords |> List.last()

      %__MODULE__{
        anonymized_path_rel: source.path_anonymized,
        source_path_rel: source.path_source,
        coords_uncut: coords,
        coord_from: coord_from,
        coord_to: coord_to,
        duration_ms_uncut: coord_to.time_offset_ms
      }
      |> assert_valid()
    else
      e ->
        IO.warn("Cannot read source from #{source.path_source}: #{inspect(e)}")
    end
  end

  @doc """
  Find suitable cut points and extract the video between the cutpoints. It requires
  two coordinates as input, can take two bearings for better matching of the start/end
  point respectively. It also optionally takes the previous TrimmedSource and prefers
  a continuation of that if sensible.
  """
  @typep cutpoint :: Video.Timestamp.t() | Geo.Point.like()
  @typep nil_num :: number() | nil
  @spec cut(t(), cutpoint(), cutpoint(), nil_num(), nil_num(), t() | nil) ::
          t() | {:error, binary()}
  def cut(%__MODULE__{} = tsv, %{} = from, %{} = to, from_bearing, to_bearing, prev_tsv) do
    %{coords: subset} = coords(tsv)

    from_adjusters =
      if prev_tsv && prev_tsv.source_path_rel == tsv.source_path_rel,
        do: [adjuster_bearing(from_bearing), adjuster_duration(prev_tsv)],
        else: [adjuster_bearing(from_bearing)]

    new_from = Geo.CheapRuler.closest_point_on_line(subset, from, from_adjusters)

    to_adjusters = [
      adjuster_bearing(to_bearing),
      adjuster_traveled(),
      adjuster_deny_index_below(new_from.index + 1)
    ]

    new_to = Geo.CheapRuler.closest_point_on_line(subset, to, to_adjusters)

    # if prev_tsv && String.contains?(prev_tsv.source_path_rel, "GX011630") &&
    #      String.contains?(tsv.source_path_rel, "GX011630") && from.lat == 53.5484661 do
    #   IO.inspect(from)
    #   require IEx
    #   IEx.pry()
    # end

    # if new_to.point.time_offset_ms == 2343 do
    #   require IEx
    #   IEx.pry()
    # end

    %{tsv | coord_from: new_from.point, coord_to: new_to.point} |> assert_valid()

    # with subset <- coords(tsv.coords),
    #      from <- Geo.CheapRuler.closest_point_on_line(subset, from, from_adjusters),
    #      from_idx <- from.index + 1,
    #      suffix <- Enum.slice(tsv.coords, from_idx..-1),
    #      to <- Geo.CheapRuler.closest_point_on_line(suffix, to, to_adjusters) do
    #   %{
    #     tsv
    #     | cut_history: ["cut approx idx #{from_idx}→#{from_idx + to.index}" | tsv.cut_history],
    #       from: Video.Timestamp.from_timed_point(from.point),
    #       to: Video.Timestamp.from_timed_point(to.point)
    #   }
    # end
  end

  @doc """
  Extract the coordinates for the configured time frame. It also returns the
  interpolated points that are closest to the given timestamps as convenience.
  """
  @typep coords_ret() :: %{
           coords: [Video.TimedPoint.t()],
           first: Video.TimedPoint.t(),
           last: Video.TimedPoint.t()
         }
  @spec coords(t()) :: coords_ret()
  def coords(%__MODULE__{} = tsv) do
    {from_ms, to_ms} = in_ms(tsv)
    coords(tsv, from_ms, to_ms)
  end

  @spec coords(t(), integer(), integer()) :: coords_ret()
  def coords(%__MODULE__{} = tsv, from_ms, to_ms)
      when is_integer(from_ms) and is_integer(to_ms) do
    rev_coords =
      tsv.coords_uncut
      |> Enum.reduce_while(%{prev: nil, acc: []}, fn coord, %{prev: prev, acc: acc} ->
        cond do
          # i.e. before start
          coord.time_offset_ms < from_ms ->
            {:cont, %{prev: coord, acc: []}}

          # i.e. first coordinate after start, insert interpolated start
          coord.time_offset_ms <= to_ms && prev && acc == [] ->
            t = calc_t(from_ms, prev, coord)
            interp = Video.TimedPoint.interpolate(prev, coord, t)
            {:cont, %{prev: coord, acc: [coord, interp]}}

          # i.e. between start/stop
          coord.time_offset_ms <= to_ms ->
            {:cont, %{prev: coord, acc: [coord | acc]}}

          # i.e. first coordinate after stop, insert interpolated end
          true ->
            t = calc_t(to_ms, prev, coord)
            interp = Video.TimedPoint.interpolate(prev, coord, t)
            {:halt, %{prev: coord, acc: [interp | acc]}}
        end
      end)
      |> Map.get(:acc)
      |> Enum.uniq()

    last = hd(rev_coords)
    coords = Enum.reverse(rev_coords)
    first = hd(coords)
    %{coords: coords, first: first, last: last}
  end

  @doc """
  Extract a part of the video as denoted by the timestamps.
  """
  @spec extract(t(), Video.Timestamp.t(), Video.Timestamp.t()) ::
          t() | {:error, binary()}

  def extract(%__MODULE__{} = tsv, "" <> from, to),
    do: extract(tsv, Video.Timestamp.in_milliseconds(from), to)

  def extract(%__MODULE__{} = tsv, from, "" <> to),
    do: extract(tsv, from, Video.Timestamp.in_milliseconds(to))

  def extract(%__MODULE__{} = tsv, from, to) when is_integer(from) and is_integer(to) do
    %{first: from_pt, last: to_pt} = coords(tsv, from, to)

    %{tsv | coord_from: from_pt, coord_to: to_pt} |> assert_valid()
  end

  defp calc_t(interp, prev, next),
    do: (interp - prev.time_offset_ms) / (next.time_offset_ms - prev.time_offset_ms)

  @doc """
  Recursively finds all valid source videos within the given folder, and converts
  them into trimmed source videos. No cutting is being done.
  """
  @spec new_from_folder(binary()) :: [t()]
  def new_from_folder(path) do
    path
    |> Video.Source.new_from_folder()
    |> Parallel.map(&new_from_source/1)
    |> Enum.reject(fn
      {:error, msg} -> IO.puts(:stderr, msg)
      _ -> false
    end)
  end

  defp in_ms(%__MODULE__{coord_from: %{time_offset_ms: from}, coord_to: %{time_offset_ms: to}}) do
    {from, to}
  end

  @doc """
  Returns true if we play the video to the end. Optionally pass a grace duration
  in ms how far we can be from the end to be still considered fully played. By
  default this value is zero, meaning it must be exactly at the end.
  """
  @spec reaches_end_of_video?(t(), pos_integer()) :: boolean()
  def reaches_end_of_video?(%__MODULE__{} = tsv, buffer_in_ms \\ 0) when buffer_in_ms >= 0,
    do: tsv.coord_to.time_offset_ms >= tsv.duration_ms_uncut - buffer_in_ms

  @doc """
  Returns true if the video is not cut (i.e. uses the original length)
  """
  @spec uncut?(t()) :: boolean()
  def uncut?(%__MODULE__{} = tsv),
    do: reaches_end_of_video?(tsv) && tsv.coord_from.time_offset_ms == 0

  @doc """
  Returns true if they refer to the same source video
  """
  @spec same?(t(), t()) :: boolean()
  def same?(%__MODULE__{source_path_rel: a}, %__MODULE__{source_path_rel: b}), do: a == b
  def same?(_a, _b), do: false

  @doc """
  Returns true if the first video was recorded right before the second one,
  using the filename as an indicator.
  """
  @spec consecutive?(t(), t()) :: boolean()
  def consecutive?(%__MODULE__{source_path_rel: a}, %__MODULE__{source_path_rel: b}) do
    with [num_a] <- Regex.run(~r/\d+/, Path.basename(a)),
         [num_b] <- Regex.run(~r/\d+/, Path.basename(b)) do
      String.to_integer(num_a) + 1 == String.to_integer(num_b)
    else
      _e -> false
    end
  end

  def consecutive?(_a, _b), do: false

  defp assert_valid(%__MODULE__{} = tsv) do
    {from_ms, to_ms} = in_ms(tsv)

    if from_ms <= to_ms,
      do: tsv,
      else: {:error, "Invalid time range requested: from #{from_ms} >= to #{to_ms}"}
  end

  # defp valid_order(%{time_offset_ms: from} = a, %{time_offset_ms: to} = b) when from >= to do
  #   {:error, "Invalid time range requested: from #{inspect(a)} >= to #{inspect(b)}"}
  # end

  # defp valid_order(from, to) when is_number(from) and is_number(to) and from >= to do
  #   {:error, "Invalid time range requested: from #{from} >= to #{to}"}
  # end

  # defp valid_order(_a, _b), do: true

  @doc """
  Returns the duration in milliseconds from the current cut-off points
  """
  @spec duration_ms(t()) :: integer()
  def duration_ms(%__MODULE__{} = tsv) do
    {from_ms, to_ms} = in_ms(tsv)
    to_ms - from_ms
  end

  # def matchiness(%__MODULE__{} = tsv, coord, bearing, prev_tsv) when is_number(bearing) do
  #   adjusters = [adjuster_bearing(bearing), adjuster_duration(tsv)]
  #   %{dist: dist} = Geo.CheapRuler.closest_point_on_line(tsv.coords, coord, adjusters)

  #   same_video = prev_tsv && prev_tsv.source_path_rel == tsv.source_path_rel
  #   read_to_end = prev_tsv && prev_tsv.to == prev_tsv.duration_ms_uncut
  #   # IO.puts("read to end: #{read_to_end}")
  #   bonus = if same_video && !read_to_end, do: -10, else: 0

  #   # if read_to_end do
  #   #   require IEx
  #   #   IEx.pry()
  #   # end

  #   # IO.puts("matchiness for #{tsv.source_path_rel}: #{dist + bonus}")

  #   dist + bonus
  # end

  # prefers points earlier in the segment. It uses the index of the
  # point as an approximation and doesn't consider the actual distance.
  @position_penalty 0.1
  defp adjuster_traveled() do
    fn _prev, _next, idx, _dist -> idx * @position_penalty end
  end

  # removes points from consideration by applying a huge malus to them (1000 km)
  defp adjuster_deny_index_below(first_index_to_keep) do
    fn _prev, _next, idx, _dist -> if idx < first_index_to_keep, do: 1_000_0000, else: 0 end
  end

  def adjuster_noop, do: fn _prev, _next, _idx, _dist -> 0 end

  # prefers points where less time passes compared to the given one.
  # It heavily discourages points before the previous one.
  # defp adjuster_duration(previous_video_or_timestamp)
  # defp adjuster_duration(nil), do: adjuster_noop()

  defp adjuster_duration(%{coord_to: %{time_offset_ms: ms}}) do
    fn _prev, next, _idx, _dist ->
      diff_ms = next.time_offset_ms - ms

      if diff_ms >= 0,
        # 1.5s of video roughly equals 1m of penalty
        do: diff_ms / 1500,
        # avoid points behind the previous one ("repetitions")
        else: 10 + -1 * diff_ms / 1500
    end
  end

  # prefers points with a similar bearing to the given one
  defp adjuster_bearing(desired)
  defp adjuster_bearing(nil), do: adjuster_noop()

  defp adjuster_bearing(desired) when is_number(desired) do
    fn prev, next, _idx, _dist ->
      bearing = Geo.CheapRuler.bearing(prev, next)
      diff = Geo.CheapRuler.bearing_diff(bearing, desired)
      Float.pow(0.2 * diff, 2)
    end
  end

  @doc """
  Returns a list of TSVs that are at most n seconds long. The splits are done
  equidistant, so you might end up with shorter segments than given.
  """
  @spec split_every(t(), number()) :: [t()]
  def split_every(%__MODULE__{} = orig, max_time_seconds)
      when is_number(max_time_seconds) do
    max_time_ms = max_time_seconds * 1000
    tsv_length = orig.duration_ms_uncut
    segments = ceil(tsv_length / max_time_ms)

    Enum.map(1..segments, fn idx ->
      from_ms = tsv_length * (idx - 1) / segments
      to_ms = tsv_length * idx / segments

      extract(orig, round(from_ms), round(to_ms))
    end)
  end

  @doc """
  Join all trimmed source videos which are adjacent, i.e. have been cut needlessly.
  """
  # automatically join two consecutive videos if the time gap is less than this.
  # If the two videos are from different files, the first one is extended to its
  # end, and the second one to its start.
  @auto_connect_threshold_ms 1_250
  # The distance is only checked for two consecutive videos, to prevent actual gaps
  # over huge distances from taking the full video.
  @auto_connect_threshold_distance_meters 30
  # discard video segments shorter than this
  @discard_threshold_ms 150
  @spec simplify([t()]) :: [t()]
  def simplify([]), do: []

  def simplify([head | tail]) do
    Enum.reduce(tail, [head], fn next, [prev | rest] ->
      cond do
        joinable?(prev, next) ->
          joined = %{prev | coord_to: next.coord_to}
          [joined | rest]

        bridgable_consecutive?(prev, next) ->
          prev = %{prev | coord_to: List.last(prev.coords_uncut)}
          next = %{next | coord_from: hd(next.coords_uncut)}
          [remove_unknown_params(next), prev | rest]

        duration_ms(next) < @discard_threshold_ms ->
          [prev | rest]

        true ->
          {prev, next} = optimize_join(prev, remove_unknown_params(next))
          [next, prev | rest]
      end
    end)
    |> Enum.reverse()
  end

  defp optimize_join(%__MODULE__{} = prev, %__MODULE__{} = next) do
    if small_dist_gap_between?(prev, next, 2 * @auto_connect_threshold_distance_meters) do
      closest_in_next =
        Geo.CheapRuler.closest_point_on_line(next.coords_uncut, prev.coord_to, [
          fn _a_pt, b_pt, _idx, _dist ->
            if b_pt.time_offset_ms > next.coord_from.time_offset_ms, do: 10_000, else: 0
          end
        ])

      # closest_in_prev =
      #   Geo.CheapRuler.closest_point_on_line(prev.coords_uncut, closest_in_next.point, [
      #     fn _a_pt, b_pt, _idx, _dist ->
      #       if b_pt.time_offset_ms < prev.coord_to.time_offset_ms, do: 10_000, else: 0
      #     end
      #   ])

      # closest_in_prev = closest_point(prev, next.coord_from)
      # closest_in_next = closest_point(next, prev.coord_to)

      # mid = Geo.Interpolate.point(closest_in_prev, closest_in_next, 0.5)

      # require IEx
      # IEx.pry()
      # IO.puts("yaaaaaaaaaaaaaaaaaaaaaaaaaay")
      {prev, %{next | coord_from: closest_in_next.point}}
    else
      {prev, next}
    end
  end

  # defp closest_point(%__MODULE__{} = tsv, coord) do
  #   tsv
  #   |> coords()
  #   |> Map.fetch!(:coords)
  #   |> Geo.CheapRuler.closest_point_on_line(coord)
  #   |> Map.fetch!(:point)
  # end

  defp remove_unknown_params(%__MODULE__{} = tsv) do
    Map.take(tsv, [:__struct__] ++ @known_params)
  end

  # true whenever the same video only has a small time gap between the two TSVs
  defp joinable?(%__MODULE__{} = prev, %__MODULE__{} = next) do
    if same?(prev, next) do
      {_, ends_ms} = in_ms(prev)
      {begins_ms, _} = in_ms(next)

      begins_ms - ends_ms < @auto_connect_threshold_ms
    else
      false
    end
  end

  # true whenever there's only a small gap between two consecutive videos, where
  # we reached the end of the first video and resume from the start of the
  # second.
  defp bridgable_consecutive?(%__MODULE__{} = prev, %__MODULE__{} = next) do
    consecutive?(prev, next) && small_time_gap_between?(prev, next) &&
      small_dist_gap_between?(prev, next)
  end

  defp small_time_gap_between?(%__MODULE__{} = prev, %__MODULE__{} = next) do
    gap_end = prev.duration_ms_uncut - prev.coord_to.time_offset_ms
    gap_start = next.coord_from.time_offset_ms
    time_diff = gap_end + gap_start
    time_diff < @auto_connect_threshold_ms
  end

  defp small_dist_gap_between?(
         %__MODULE__{} = prev,
         %__MODULE__{} = next,
         dist \\ @auto_connect_threshold_distance_meters
       ) do
    %{last: last} = coords(prev)
    %{first: first} = coords(next)
    dist_diff = Geo.CheapRuler.dist(last, first)
    dist_diff < dist
  end

  # join coordinates, removing any slight overlaps by only taking coordinates if
  # they are after the previous one
  # defp join_coords(prev, next) when prev.source_path_rel == next.source_path_rel do
  #   [prev.coords, next.coords]
  #   |> List.flatten()
  #   |> Enum.reduce([], fn coord, acc ->
  #     prev = List.first(acc)

  #     if !prev || prev.time_offset_ms < coord.time_offset_ms,
  #       do: [coord | acc],
  #       else: acc
  #   end)
  #   |> Enum.reverse()
  # end

  def to_str(%__MODULE__{anonymized_path_rel: p, coord_from: f, coord_to: t}),
    do: "#{p} #{inspect(f)} #{inspect(t)}"

  def abs_path(%__MODULE__{anonymized_path_rel: "/" <> _rest = r}), do: r

  def abs_path(%__MODULE__{anonymized_path_rel: r}),
    do: Path.join(Settings.video_source_dir_abs(), r)

  def abs_source_path(%__MODULE__{source_path_rel: "/" <> _rest = r}), do: r

  def abs_source_path(%__MODULE__{source_path_rel: r}),
    do: Path.join(Settings.video_source_dir_abs(), r)

  def cwd_to_source_path(%__MODULE__{} = tsv) do
    Path.relative_to(abs_source_path(tsv), File.cwd!())
  end

  def cwd_to_anonymized_path(%__MODULE__{} = tsv) do
    Path.relative_to(abs_path(tsv), File.cwd!())
  end
end
