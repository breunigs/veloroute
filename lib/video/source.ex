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

  # for some videos the absolute GPX timestamps do not match the video duration,
  # therefore we just stretch them to fit.
  @spec maybe_stretch_to_video([Video.TimedPoint.t()], t()) :: [Video.TimedPoint.t()]
  defp maybe_stretch_to_video(timed_points, %__MODULE__{} = self) do
    if String.ends_with?(self.source, ".mkv") || String.ends_with?(self.source, "_stabilized.MP4") do
      IO.puts("stretching GPX for #{self.source}")
      vid_len_ms = Video.Metadata.length_ms!(self)
      gpx_len_ms = List.last(timed_points).time_offset_ms

      Enum.map(timed_points, fn pt ->
        ratio = pt.time_offset_ms / gpx_len_ms
        %{pt | time_offset_ms: round(vid_len_ms * ratio)}
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

    with "ExifTool" <> _rest <- parsed.creator do
      [dur_str, _] = String.split(parsed.desc, " ", parts: 2)
      {video_dur_s, ""} = Float.parse(dur_str)
      {speedup, ""} = Integer.parse(parsed.speedup)
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
        new_time = NaiveDateTime.add(head.time, offset_ms, :millisecond)
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
