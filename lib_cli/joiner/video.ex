defmodule Joiner.Video do
  @type t :: %__MODULE__{
          ident: binary(),
          source: Video.Source.t(),
          meta: Video.Metadata.t(),
          polyline: [Video.TimedPoint.t()],
          start: Video.TimedPoint.t(),
          stop: Video.TimedPoint.t()
        }

  @enforce_keys [:ident, :source, :meta, :polyline, :start, :stop]
  defstruct @enforce_keys

  @spec load(binary()) :: {:ok, t()} | {:error, binary()}
  def load(ident_or_path) do
    path = Video.Path.source(ident_or_path)

    with %Video.Source{} = source <- Video.Source.new_from_path(path),
         {:ok, meta} <- Video.Metadata.for(source),
         polyline when is_list(polyline) <- Video.Source.timed_points_with_gpx(source) do
      polyline = match_video_length(polyline, meta)

      {:ok,
       %__MODULE__{
         ident: ident_or_path,
         source: source,
         meta: meta,
         polyline: polyline,
         start: hd(polyline),
         stop: List.last(polyline)
       }}
    end
  end

  defp match_video_length(polyline, meta) do
    mod = hd(polyline).__struct__
    stop_ms = meta.duration * 1000 - Video.Metadata.frame_duration_ms(meta)
    cut_rev = polyline |> Enum.reverse() |> Enum.drop_while(&(&1.time_offset_ms > stop_ms))
    [last1, last2 | rest] = cut_rev

    t = 1.0 - (last1.time_offset_ms - stop_ms) / (last1.time_offset_ms - last2.time_offset_ms)

    if t > 1.0 do
      [mod.extrapolate(last2, last1, t) | cut_rev]
    else
      [mod.interpolate(last2, last1, t), last2 | rest]
    end
    |> Enum.reverse()
  end

  @spec merge(t(), t()) :: t()
  def merge(v1, v2) when v1.source == v2.source do
    start = if v1.start.time_offset_ms < v2.start.time_offset_ms, do: v1.start, else: v2.start
    stop = if v1.stop.time_offset_ms > v2.stop.time_offset_ms, do: v1.stop, else: v2.stop

    polyline = (v1.polyline ++ v2.polyline) |> Enum.uniq() |> Enum.sort_by(& &1.time_offset_ms)

    %{v1 | start: start, stop: stop, polyline: polyline}
  end

  @spec overlap?(t(), t()) :: boolean()
  def overlap?(v1, v2) when v1.source != v2.source, do: false

  def overlap?(v1, v2) do
    start1 = v1.start.time_offset_ms
    stop1 = v1.stop.time_offset_ms
    start2 = v2.start.time_offset_ms
    stop2 = v2.stop.time_offset_ms
    start1 <= stop2 && start2 <= stop1
  end

  @spec offset_start_timestamp(t(), number(), atom()) :: Video.Timestamp.t()
  def offset_start_timestamp(video, value, unit)

  def offset_start_timestamp(video, frames, :frames) do
    ms = Video.Metadata.frame_duration_ms(video.meta, frames)
    Video.Timestamp.from_milliseconds(video.start.time_offset_ms + ms)
  end

  @spec at_start?(t()) :: boolean()
  def at_start?(video) do
    video.start.time_offset_ms == 0
  end

  @spec at_end?(t()) :: boolean()
  def at_end?(video) do
    frame_dur = frame_duration_ms(video)
    dur_ms = round(video.meta.duration * 1000) - frame_dur
    stop_ms = video.stop.time_offset_ms
    abs(stop_ms - dur_ms) < frame_dur
  end

  @doc """
  Move the "start" point by the given amount. It shortens the polyline as
  needed.
  """
  @spec advance_start(t(), non_neg_integer(), :frames | :milliseconds) :: t()
  def advance_start(video, value, unit)

  def advance_start(video, 0, :frames), do: video

  def advance_start(video, frames, :frames) when is_integer(frames) and frames > 0 do
    ms = Video.Metadata.frame_duration_ms(video.meta, frames)
    advance_start(video, ms, :milliseconds)
  end

  def advance_start(video, ms, :milliseconds) do
    target_ms = video.start.time_offset_ms + ms

    interpol =
      Enum.reduce_while(video.polyline, hd(video.polyline), fn
        coord, _prev when coord.time_offset_ms == target_ms -> {:halt, coord}
        coord, _prev when coord.time_offset_ms < target_ms -> {:cont, coord}
        coord, prev -> {:halt, interpol(prev, coord, target_ms)}
      end)

    polyline = Enum.drop_while(video.polyline, &(&1.time_offset_ms <= target_ms))

    %{video | start: interpol, polyline: [interpol | polyline]}
  end

  @spec frame_duration_ms(t(), non_neg_integer()) :: non_neg_integer()
  def frame_duration_ms(video, frame_count \\ 1) do
    Video.Metadata.frame_duration_ms(video.meta, frame_count)
  end

  @doc """
  Move the "stop" point to match the duration from the start point. It shortens
  the polyline as needed.
  """
  @spec set_duration(t(), number(), atom()) :: t()
  def set_duration(video, value, units)

  def set_duration(video, frames, :frames) do
    ms = Video.Metadata.frame_duration_ms(video.meta, frames)
    set_duration(video, ms, :milliseconds)
  end

  def set_duration(video, ms, :milliseconds) do
    target_ms = video.start.time_offset_ms + ms

    polyline_rev =
      Enum.reduce_while(tl(video.polyline), [hd(video.polyline)], fn
        coord, prev when coord.time_offset_ms == target_ms -> {:halt, [coord | prev]}
        coord, prev when coord.time_offset_ms < target_ms -> {:cont, [coord | prev]}
        coord, prev -> {:halt, [interpol(hd(prev), coord, target_ms) | prev]}
      end)

    %{video | stop: hd(polyline_rev), polyline: Enum.reverse(polyline_rev)}
  end

  @spec duration_ms(t()) :: integer()
  def duration_ms(%{start: %{time_offset_ms: from}, stop: %{time_offset_ms: to}}), do: to - from

  @spec avg_speed_kmh(t()) :: float()
  def avg_speed_kmh(%{start: start, stop: stop, polyline: polyline, meta: meta}) do
    len = Geo.CheapRuler.line_distance(polyline)
    dur = stop.time_offset_ms - start.time_offset_ms

    # convert meters per millisecond into km/h, correcting for time lapse
    len * 60.0 * 60.0 / (dur * meta.time_lapse)
  end

  @spec avg_position(t()) :: Geo.Point.t()
  def avg_position(%{polyline: polyline}) do
    {sum_lat, sum_lon} =
      Enum.reduce(polyline, {0.0, 0.0}, fn %{lat: lat, lon: lon}, {slat, slon} ->
        {lat + slat, lon + slon}
      end)

    len = length(polyline)

    %Geo.Point{lat: sum_lat / len, lon: sum_lon / len}
  end

  defp interpol(prev, next, target_ms) do
    t = (target_ms - prev.time_offset_ms) / (next.time_offset_ms - prev.time_offset_ms)
    Video.TimedPointWithGPX.interpolate(prev, next, t)
  end
end
