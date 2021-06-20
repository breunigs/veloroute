defmodule Video.TrimmedSource do
  @known_params [
    :anonymized_path_rel,
    :source_path_rel,
    :cut_history,
    :from,
    :to,
    :original_duration,
    :coords
  ]

  @type t :: %__MODULE__{
          anonymized_path_rel: binary(),
          from: binary(),
          to: binary(),
          cut_history: [any()],
          coords: [Video.TimedPoint.t()]
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
      last = coords |> List.last() |> Video.Timestamp.from_timed_point()

      %__MODULE__{
        anonymized_path_rel: source.path_anonymized,
        source_path_rel: source.path_source,
        coords: coords,
        cut_history: [],
        from: coords |> hd() |> Video.Timestamp.from_timed_point(),
        to: last,
        original_duration: last
      }
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
    from_adjusters =
      if prev_tsv && prev_tsv.source_path_rel == tsv.source_path_rel,
        do: [adjuster_bearing(from_bearing), adjuster_connection(prev_tsv.to)],
        else: [adjuster_bearing(from_bearing)]

    to_adjusters = [adjuster_bearing(to_bearing), adjuster_traveled()]

    with from <- Geo.CheapRuler.closest_point_on_line(tsv.coords, from, from_adjusters),
         suffix <- Enum.slice(tsv.coords, from.index..-1),
         to <- Geo.CheapRuler.closest_point_on_line(suffix, to, to_adjusters),
         true <- valid_order(from.point, to.point) do
      from_idx = from.index + 1
      to_idx = from.index + to.index
      coords = Enum.slice(tsv.coords, from_idx..to_idx)
      coords = [from.point] ++ coords ++ [to.point]

      %{
        tsv
        | coords: coords,
          cut_history: ["cut approx idx #{from_idx}→#{to_idx}" | tsv.cut_history],
          from: Video.Timestamp.from_timed_point(from.point),
          to: Video.Timestamp.from_timed_point(to.point)
      }
    end
  end

  @doc """
  Extract a part of the video as denoted by the timestamps.
  """
  @spec extract(t(), Video.Timestamp.t() | number(), Video.Timestamp.t() | number()) ::
          t() | {:error, binary()}
  def extract(tsv, "" <> from, to), do: extract(tsv, Video.Timestamp.in_milliseconds(from), to)
  def extract(tsv, from, "" <> to), do: extract(tsv, from, Video.Timestamp.in_milliseconds(to))

  def extract(%__MODULE__{} = tsv, from_ms, to_ms) when is_number(from_ms) and is_number(to_ms) do
    with true <- valid_order(from_ms, to_ms) do
      rev_coords =
        tsv.coords
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

      coords = Enum.reverse(rev_coords)

      %{
        tsv
        | coords: coords,
          cut_history: ["extract #{from_ms}→#{to_ms}" | tsv.cut_history],
          from: Video.Timestamp.from_timed_point(hd(coords)),
          to: Video.Timestamp.from_timed_point(hd(rev_coords))
      }
    end
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

  defp valid_order(%{time_offset_ms: from} = a, %{time_offset_ms: to} = b) when from >= to do
    {:error, "Invalid time range requested: from #{inspect(a)} >= to #{inspect(b)}"}
  end

  defp valid_order(from, to) when is_number(from) and is_number(to) and from >= to do
    {:error, "Invalid time range requested: from #{from} >= to #{to}"}
  end

  defp valid_order(_a, _b), do: true

  def matchiness(%__MODULE__{} = tsv, coord, bearing, prev_tsv) when is_number(bearing) do
    adjusters = [adjuster_bearing(bearing), adjuster_connection(prev_tsv)]
    %{dist: dist} = Geo.CheapRuler.closest_point_on_line(tsv.coords, coord, adjusters)

    same_video = prev_tsv && prev_tsv.source_path_rel == tsv.source_path_rel
    bonus = if same_video, do: -10, else: 0

    dist + bonus
  end

  @position_penalty 0.1
  defp adjuster_traveled() do
    fn _prev, _next, idx, _dist -> idx * @position_penalty end
  end

  def adjuster_noop, do: fn _prev, _next, _idx, _dist -> 0 end

  defp adjuster_connection(previous_video_or_timestamp)
  defp adjuster_connection(nil), do: adjuster_noop()
  defp adjuster_connection(%__MODULE__{to: to}), do: adjuster_connection(to)

  defp adjuster_connection("" <> timestamp) do
    ms = Video.Timestamp.in_milliseconds(timestamp)

    fn _prev, next, _idx, _dist ->
      diff_ms = next.time_offset_ms - ms

      if diff_ms >= 0,
        # 1.5s of video roughly equals 1m of penalty
        do: diff_ms / 1500,
        # avoid points behind the previous one ("repetitions")
        else: 10 + -1 * diff_ms / 1500
    end
  end

  defp adjuster_bearing(desired)
  defp adjuster_bearing(nil), do: adjuster_noop()

  @weight_bearing 0.7
  defp adjuster_bearing(desired) when is_number(desired) do
    fn prev, next, _idx, _dist ->
      bearing = Geo.CheapRuler.bearing(prev, next)
      diff = Geo.CheapRuler.bearing_diff(bearing, desired)
      @weight_bearing * diff
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
    tsv_length = orig.to |> Video.Timestamp.in_milliseconds()
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
  @spec simplify([t()], number(), number()) :: [t()]
  def simplify([], _join_threshold_ms, _discard_threshold_ms), do: []

  def simplify([head | tail], join_threshold_ms, discard_threshold_ms) do
    Enum.reduce(tail, [head], fn next, [prev | rest] ->
      same_video = prev && prev.source_path_rel == next.source_path_rel

      cond do
        same_video && close_enough?(prev, next, join_threshold_ms) ->
          joined = %__MODULE__{
            anonymized_path_rel: prev.anonymized_path_rel,
            source_path_rel: prev.source_path_rel,
            cut_history: [{:joined, prev.cut_history, next.cut_history}],
            from: prev.from,
            to: next.to,
            original_duration: prev.original_duration,
            coords: join_coords(prev, next)
          }

          [joined | rest]

        duration_ms(next) < discard_threshold_ms ->
          [prev | rest]

        true ->
          [remove_unknown_params(next), prev | rest]
      end
    end)
    |> Enum.reverse()
  end

  @doc """
  Returns the duration in milliseconds from the current cut-off points
  """
  def duration_ms(%__MODULE__{from: from, to: to}) do
    Video.Timestamp.in_milliseconds(to) - Video.Timestamp.in_milliseconds(from)
  end

  defp remove_unknown_params(%__MODULE__{} = tsv) do
    Map.take(tsv, [:__struct__] ++ @known_params)
  end

  defp close_enough?(prev, next, join_threshold_ms)
  defp close_enough?(%__MODULE__{to: x}, %__MODULE__{from: x}, _), do: true

  defp close_enough?(%__MODULE__{to: ends}, %__MODULE__{from: begins}, join_threshold_ms) do
    ends_ms = Video.Timestamp.in_milliseconds(ends)
    begins_ms = Video.Timestamp.in_milliseconds(begins)

    abs(begins_ms - ends_ms) < join_threshold_ms
  end

  # join coordinates, removing any slight overlaps by only taking coordinates if
  # they are after the previous one
  defp join_coords(prev, next) when prev.source_path_rel == next.source_path_rel do
    [prev.coords, next.coords]
    |> List.flatten()
    |> Enum.reduce([], fn coord, acc ->
      prev = List.first(acc)

      if !prev || prev.time_offset_ms < coord.time_offset_ms,
        do: [coord | acc],
        else: acc
    end)
    |> Enum.reverse()
  end

  def to_str(%__MODULE__{anonymized_path_rel: p, from: f, to: t}), do: "#{p} #{f} #{t}"

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
