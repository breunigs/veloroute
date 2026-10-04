defmodule Video.Source do
  require Logger
  import SweetXml

  @known_params [
    :source,
    :available_detections,
    :available_gpx,
    :date
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{
          source: binary(),
          available_detections: boolean(),
          available_gpx: boolean(),
          date: Date.t()
        }

  @spec new_from_path(binary) :: {:error, binary()} | t()
  def new_from_path(source_path) do
    error_unless_valid_source(source_path) ||
      new_from_path(
        source_path,
        source_path |> Video.Path.gpx() |> File.exists?(),
        source_path |> Video.Path.detections() |> File.exists?()
      )
  end

  @spec new_from_path(binary, MapSet.t()) :: {:error, binary()} | t()
  def new_from_path(source_path, known_files) do
    error_unless_valid_source(source_path) ||
      new_from_path(
        source_path,
        MapSet.member?(known_files, Video.Path.gpx(source_path)),
        MapSet.member?(known_files, Video.Path.detections(source_path))
      )
  end

  @spec new_from_folder(binary, Util.IO.descent_folder()) :: list(t())
  @doc """
  Recursively finds all valid source videos within the given folder
  """
  def new_from_folder(source_folder, descent_folder_fn \\ nil) do
    all_files = Util.IO.tree(source_folder, descent_folder_fn) |> MapSet.new()

    all_files
    |> Parallel.map(&new_from_path(&1, all_files))
    |> Enum.reject(fn
      {:error, _reason} -> true
      _video -> false
    end)
  end

  defp error_unless_valid_source(source_path) do
    if Video.Path.source_path?(source_path),
      do: nil,
      else: {:error, "Not a valid source path: #{source_path}"}
  end

  @spec new_from_path(binary(), boolean(), boolean()) :: t()
  defp new_from_path(source_path, available_gpx, available_detections)
       when is_binary(source_path) and is_boolean(available_gpx) and
              is_boolean(available_detections) do
    %__MODULE__{
      source: Video.Path.source(source_path),
      available_detections: available_detections,
      available_gpx: available_gpx,
      date: date_from_path(source_path)
    }
  end

  @doc """
  Parse the GPX and returned the coordinates with timestamps relative to the
  video, including GPS time and elevation.
  """
  @spec timed_points_with_gpx(t()) :: [Video.TimedPoint.t()] | {:error, binary()}
  def timed_points_with_gpx(%__MODULE__{source: source, available_gpx: false}) do
    {:error,
     "#{Video.Path.source_base_with_ending(source)} has no GPX file available to extract time range from, try `exiftool -extractEmbedded -ignoreMinorErrors -printFormat data/gpx_extended.fmt -binary -textOut gpx #{Video.Path.source(source)}`? Expected GPX at #{Video.Path.gpx(source)}"}
  end

  def timed_points_with_gpx(%__MODULE__{} = self) do
    with line when is_list(line) <- parse_gpx(self) do
      start_time = hd(line).gps_time

      Enum.map(line, fn point ->
        time_offset_ms =
          if point.video_time,
            do: round(point.video_time * 1000),
            else: NaiveDateTime.diff(point.gps_time, start_time, :millisecond)

        %Video.TimedPointWithGPX{
          time_offset_ms: time_offset_ms,
          lat: point.lat,
          lon: point.lon,
          gpx_ele: point.ele,
          gpx_time: point.gps_time
        }
      end)
      |> assert_monotonic_increase(self)
      |> maybe_stretch_to_video(self)
      |> remove_unnecessary_points()
    else
      {:error, error} -> {:error, "failed to parse GPX for #{self.source}:\n#{inspect(error)}"}
    end
  end

  @doc """
  Parse the GPX and returned the coordinates with timestamps relative to the
  video. Excluding GPS data.
  """
  @spec timed_points(t()) :: [Video.TimedPoint.t()] | {:error, binary()}
  def timed_points(%__MODULE__{} = source) do
    with list when is_list(list) <- timed_points_with_gpx(source) do
      Enum.map(list, &Video.TimedPointWithGPX.to_timed_point(&1))
    end
  end

  @typedoc "a coordinate on the source's own video timeline"
  @type video_point :: %{lat: float(), lon: float(), time_offset_ms: non_neg_integer()}

  @doc """
  Coordinates on this source's **video** timeline, i.e. the timeline `-ss`,
  `setpts` and `Video.TrimmedSource`'s coordinates all use.

  Deliberately not `timed_points_with_gpx/1`: that also drops points closer
  together than 300ms (see `@min_duration_between_points_ms`), which would
  coarsen a speed profile built from it. The offsets are computed identically,
  including the stretch for derived variants, so both end up on the same
  timeline.
  """
  @spec video_timeline_points(t()) :: [video_point()] | {:error, binary()}
  def video_timeline_points(%__MODULE__{available_gpx: false, source: source}),
    do: {:error, "#{source} has no GPX file, so it has no coordinates"}

  def video_timeline_points(%__MODULE__{} = self) do
    with points when is_list(points) <- parse_gpx(self) do
      start_time = hd(points).gps_time

      raw =
        Enum.map(points, fn point ->
          ms =
            if point.video_time,
              do: round(point.video_time * 1000),
              else: NaiveDateTime.diff(point.gps_time, start_time, :millisecond)

          %{lat: point.lat, lon: point.lon, time_offset_ms: ms}
        end)

      case gpx_stretch_factor(self, List.last(raw).time_offset_ms) do
        1.0 -> raw
        f -> Enum.map(raw, &%{&1 | time_offset_ms: round(&1.time_offset_ms * f)})
      end
    end
  end

  @doc """
  Real world speed over a sliding window, sampled every `step_s` of source time.
  Returns `{source_seconds, km_per_hour}` pairs.

  `window_s` and `step_s` are in **source/video** seconds. Real elapsed time is
  video time times `time_lapse`.

  Intervals faster than `Video.Constants.max_plausible_speed_kmh/0` are dropped
  with both their distance and their elapsed time, so a GPS jump cannot inflate
  the average — clamping the speed would still let the bogus distance through.
  """
  @spec speed_profile(t(), pos_integer(), float(), float()) ::
          [{float(), float()}] | {:error, binary()}
  def speed_profile(%__MODULE__{} = self, time_lapse, window_s, step_s)
      when is_integer(time_lapse) and time_lapse > 0 and window_s > 0 and step_s > 0 do
    with points when is_list(points) <- video_timeline_points(self) do
      max_kmh = Video.Constants.max_plausible_speed_kmh()

      intervals =
        points
        |> Enum.zip(tl(points))
        |> Enum.flat_map(fn {a, b} ->
          dt_ms = b.time_offset_ms - a.time_offset_ms
          dist_m = Geo.CheapRuler.point2point_dist(a, b)

          if dt_ms > 0 && kmh(dist_m, dt_ms, time_lapse) <= max_kmh do
            [{(a.time_offset_ms + b.time_offset_ms) / 2, dist_m, dt_ms}]
          else
            []
          end
        end)

      dur_ms = List.last(points).time_offset_ms
      whole = window_speed(intervals, 0, dur_ms, time_lapse)
      half_ms = window_s * 1000 / 2

      0..max(0, floor(dur_ms / (step_s * 1000)))
      |> Enum.map(fn idx ->
        at_ms = idx * step_s * 1000
        speed = window_speed(intervals, at_ms - half_ms, at_ms + half_ms, time_lapse) || whole
        {at_ms / 1000, speed}
      end)
    end
  end

  # nil when every interval in the window was rejected
  defp window_speed(intervals, from_ms, to_ms, time_lapse) do
    {dist_m, dt_ms} =
      Enum.reduce(intervals, {0.0, 0}, fn {mid_ms, dist_m, dt_ms}, {dist_acc, dt_acc} ->
        if mid_ms >= from_ms && mid_ms <= to_ms,
          do: {dist_acc + dist_m, dt_acc + dt_ms},
          else: {dist_acc, dt_acc}
      end)

    if dt_ms > 0, do: kmh(dist_m, dt_ms, time_lapse)
  end

  # meters per millisecond is km per second, so only the hour factor remains
  defp kmh(dist_m, dt_ms, time_lapse), do: dist_m * 3600.0 / (dt_ms * time_lapse)

  @doc """
  The real world duration the GPX covers, in seconds, read straight from the
  track point timestamps.

  Used to measure `time_lapse` for sources without a gpmd stream. Deliberately
  not derived from the GPX's `<speedup>` element: that is only written by the
  ExifTool exporter, so it is absent for exactly the derived variants whose
  `time_lapse` would otherwise be a guess.
  """
  @spec gpx_real_span_s(t()) :: {:ok, float()} | {:error, binary()}
  def gpx_real_span_s(%__MODULE__{available_gpx: false, source: source}),
    do: {:error, "#{source} has no GPX file to measure its time lapse from"}

  def gpx_real_span_s(%__MODULE__{source: source}) do
    gpx_path = Video.Path.gpx(source)

    try do
      with {:ok, content} <- File.read(gpx_path) do
        content
        |> xpath(~x"//trkseg/trkpt/time/text()"ls)
        |> Enum.map(&parse_gpx_date/1)
        |> truncate_at_reset()
        |> case do
          [first | rest] when rest != [] ->
            {:ok, NaiveDateTime.diff(List.last(rest), first, :millisecond) / 1000.0}

          _ ->
            {:error, "#{gpx_path} has too few track points to measure a time lapse"}
        end
      end
    rescue
      x -> {:error, "#{gpx_path} parsing error: #{inspect(x)}"}
    end
  end

  # same guard as parse_gpx_xml/1: a GPX split across videos repeats the first
  # video's points, and the timestamps reset when it does
  defp truncate_at_reset([]), do: []

  defp truncate_at_reset([first | rest]) do
    rest
    |> Enum.reduce_while([first], fn next, [prev | _] = acc ->
      if NaiveDateTime.compare(next, prev) == :lt,
        do: {:halt, acc},
        else: {:cont, [next | acc]}
    end)
    |> Enum.reverse()
  end

  @min_duration_between_points_ms 300
  @spec remove_unnecessary_points([Video.TimedPoint.t()]) :: [Video.TimedPoint.t()]
  defp remove_unnecessary_points(timed_points) do
    reduced =
      Enum.reduce(timed_points, [], fn
        first, [] ->
          [first]

        next, [prev | _rest] = acc ->
          diff = next.time_offset_ms - prev.time_offset_ms
          if diff < @min_duration_between_points_ms, do: acc, else: [next | acc]
      end)

    # ensure we don't accidentally trim the video
    last = List.last(timed_points)
    reduced = if hd(reduced) != last, do: [last | reduced], else: reduced

    Enum.reverse(reduced)
  end

  @doc """
  Whether the GPX timestamps of this source need to be stretched to match the
  video duration. True for derived variants, whose GPX belongs to the original.
  """
  @spec needs_gpx_stretch?(t()) :: boolean()
  def needs_gpx_stretch?(%__MODULE__{source: source}) do
    String.ends_with?(source, ".mkv") || String.ends_with?(source, "_stabilized.MP4")
  end

  @doc """
  The factor that maps raw GPX time onto this source's video timeline. 1.0
  unless the source is a derived variant. `gpx_len_ms` is the last raw GPX
  timestamp.

  Shared with `Video.Speedup` so the speed profile and the coordinates it is
  evaluated against cannot end up on different timelines.
  """
  @spec gpx_stretch_factor(t(), non_neg_integer()) :: float()
  def gpx_stretch_factor(%__MODULE__{} = self, gpx_len_ms) do
    if needs_gpx_stretch?(self) && gpx_len_ms > 0 do
      Video.Metadata.length_ms!(self) / gpx_len_ms
    else
      1.0
    end
  end

  # for some videos the absolute GPX timestamps do not match the video duration,
  # therefore we just stretch them to fit.
  @spec maybe_stretch_to_video([Video.TimedPoint.t()], t()) :: [Video.TimedPoint.t()]
  defp maybe_stretch_to_video(timed_points, %__MODULE__{} = self) do
    if needs_gpx_stretch?(self) do
      IO.puts("stretching GPX for #{self.source}")
      gpx_len_ms = List.last(timed_points).time_offset_ms
      factor = gpx_stretch_factor(self, gpx_len_ms)

      Enum.map(timed_points, fn pt ->
        %{pt | time_offset_ms: round(pt.time_offset_ms * factor)}
      end)
    else
      timed_points
    end
  end

  defp assert_monotonic_increase(line, %__MODULE__{source: source}) do
    # TODO: this can probably go now that we cut if this happens
    _ =
      Enum.reduce_while(line, 0, fn
        %{time_offset_ms: next}, prev when prev <= next ->
          {:cont, next}

        point, _prev ->
          Logger.error("""
            #{source}'s GPX file is invalid, the timestamps reset within the GPX file (around #{inspect(point)}). Check if it's a long video that was split up at 4 GB, where the GPX of the first video contains both parts anyway. The next segment of the video increases its most significant digit."
          """)

          {:halt, nil}
      end)

    line
  end

  @typep gpx_point :: %{
           lat: float(),
           lon: float(),
           gps_time: NaiveDateTime.t(),
           video_time: float() | nil,
           ele: float() | nil
         }
  @spec parse_gpx(t()) :: [gpx_point] | {:error, binary()}
  defp parse_gpx(%__MODULE__{source: source, available_gpx: true}) do
    gpx_path = Video.Path.gpx(source)

    try do
      with {:ok, content} <- File.read(gpx_path),
           gpx when is_list(gpx) <- parse_gpx_xml(content) do
        if length(gpx) <= 1,
          do: {:error, "#{gpx_path} is very short -- only #{length(gpx)} point"},
          else: gpx
      end
    rescue
      x -> {:error, "#{gpx_path} parsing error: #{inspect(x)}"}
    catch
      code, e -> {:error, "(caught #{code}) #{inspect(e)}"}
    end
  end

  @spec parse_gpx_xml(String.t()) :: list(gpx_point)
  defp parse_gpx_xml(xml) do
    parsed =
      xpath(xml, ~x"/gpx",
        creator: ~x"./@creator"s,
        name: ~x"./metadata/name/text()"s,
        desc: ~x"./metadata/desc/text()"s,
        speedup: ~x"./metadata/speedup/text()"s,
        video_frame_rate: ~x"./metadata/videoFrameRate/text()"s,
        media_create_time: ~x"./metadata/mediaCreateTime/text()"s,
        points: ~x"//trkseg/trkpt"l
      )

    points_rev =
      parsed.points
      |> Enum.map(fn trkpt ->
        %{
          lat: trkpt |> xpath(~x"./@lat"f),
          lon: trkpt |> xpath(~x"./@lon"f),
          gps_time: trkpt |> xpath(~x"./time/text()"s) |> parse_gpx_date(),
          ele: trkpt |> xpath(~x"./ele/text()"s) |> parse_gpx_float(),
          video_time: trkpt |> xpath(~x"./videoTime/text()"s) |> parse_gpx_float()
        }
      end)
      |> Enum.reduce_while([], fn
        # the GPX exporter has a bug where it exports all track points for the
        # first video, even if it is split across multiple videos that each have
        # their own GPX tracks. When this happens, the timestamps also reset
        # again. We detect this here and simply drop all remaining points, which
        # are duplicated anyway.
        next, [] ->
          {:cont, [next]}

        next, [prev | _rest] = list ->
          if NaiveDateTime.compare(next.gps_time, prev.gps_time) == :lt,
            do: {:halt, list},
            else: {:cont, [next | list]}
      end)

    points = Enum.reverse(points_rev)

    with "ExifTool" <> _rest <- parsed.creator,
         [dur_str, _] <- String.split(parsed.desc, " ", parts: 2),
         {video_dur_s, ""} <- Float.parse(dur_str),
         {speedup, ""} <- Integer.parse(parsed.speedup) do
      head = hd(points)
      start_time = head.gps_time

      # make gps timestamps diff be in video time, instead of real time. This is
      # because the old extractor was in video time.
      points =
        Enum.map(points, fn point ->
          dur_real_time = NaiveDateTime.diff(point.gps_time, start_time, :nanosecond)
          video_time = NaiveDateTime.add(start_time, round(dur_real_time / speedup), :nanosecond)
          %{point | gps_time: video_time}
        end)

      # ExifTool parsing has an offset for some reason. The GPS duration is
      # usually longer than the video duration, and cutting off this extra time
      # at the start fixes the offset (determined experimentally.)
      gps_start = hd(points).gps_time
      gps_stop = hd(points_rev).gps_time
      gps_dur_s = NaiveDateTime.diff(gps_stop, gps_start, :millisecond) / 1000.0
      offset_ms = round((gps_dur_s - video_dur_s * speedup) * 1000)

      if offset_ms > 0 do
        new_time = NaiveDateTime.add(head.gps_time, offset_ms, :millisecond)
        new_head = %{head | gps_time: new_time}
        new_tail = Enum.drop_while(tl(points), &NaiveDateTime.before?(&1.gps_time, new_time))
        [new_head | new_tail]
      else
        points
      end
    else
      _ -> points
    end
  end

  @spec parse_gpx_date(binary()) :: NaiveDateTime.t()
  defp parse_gpx_date(""), do: ~N[2000-01-01 00:00:00]

  defp parse_gpx_date(date) do
    {:ok, parsed} = NaiveDateTime.from_iso8601(date)

    # the GPX exporter has a bug where it sometimes the sub-second field works
    # out to 1000ms. Instead of incrementing the second it simply adds a 0 to
    # the ms field, which gets interpreted as 100ms. So we manually add the
    # missing 900ms here.
    parsed =
      if String.ends_with?(date, ".1000Z"),
        do: NaiveDateTime.add(parsed, 900, :millisecond),
        else: parsed

    parsed
  end

  @spec parse_gpx_float(binary()) :: float | nil
  defp parse_gpx_float(ele) do
    case Float.parse(ele) do
      {float, ""} -> float
      _other -> nil
    end
  end

  defp date_from_path(source_path) do
    with [str] <- Regex.run(~r/\b\d\d\d\d-\d\d-\d\d\b/, source_path),
         {:ok, date} <- Date.from_iso8601(str) do
      date
    else
      err ->
        {:error, "invalid date: #{inspect(err)}"}
    end
  end
end
