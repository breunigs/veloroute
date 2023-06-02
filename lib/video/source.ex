defmodule Video.Source do
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

  @spec new_from_folder(binary) :: list(t())
  @doc """
  Recursively finds all valid source videos within the given folder
  """
  def new_from_folder(source_folder) do
    all_files = Util.IO.tree(source_folder) |> MapSet.new()

    all_files
    |> Parallel.map(&new_from_path(&1, all_files))
    |> Enum.reject(fn
      {:error, _reason} -> true
      _video -> false
    end)
  end

  defp error_unless_valid_source(source_path) do
    if Video.Path.is_source_path(source_path),
      do: nil,
      else: {:error, "Not a valid source path: #{source_path}"}
  end

  @spec new_from_path(binary(), boolean(), boolean()) :: t()
  defp new_from_path(source_path, available_gpx, available_detections)
       when is_binary(source_path) and is_boolean(available_gpx) and
              is_boolean(available_detections) do
    %__MODULE__{
      source: Video.Path.source_base(source_path),
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
     "#{Video.Path.source_base(source)} has no GPX file available to extract time range from, try `gopro2gpx -s #{Video.Path.source(source)}`?"}
  end

  def timed_points_with_gpx(%__MODULE__{} = self) do
    with line when is_list(line) <- parse_gpx(self) do
      start_time = hd(line).time

      Enum.map(line, fn point ->
        %Video.TimedPointWithGPX{
          time_offset_ms: NaiveDateTime.diff(point.time, start_time, :millisecond),
          lat: point.lat,
          lon: point.lon,
          gpx_ele: point.ele,
          gpx_time: point.time
        }
      end)
      |> assert_monotonic_increase(self)
      |> maybe_stretch_to_video(self)
      |> remove_unnecessary_points()
    else
      {:error, error} -> {:error, "failed to parse GPX for #{self.source}:\n#{inspect(error)}"}
      error -> {:error, "failed to parse GPX for #{self.source}:\n#{inspect(error)}"}
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
    if String.ends_with?(self.source, ".mkv") do
      vid_len_ms = video_length_ms(self)
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
    Enum.reduce_while(line, 0, fn
      %{time_offset_ms: next}, prev when prev <= next ->
        {:cont, next}

      point, _prev ->
        IO.puts(:stderr, """
          #{source}'s GPX file is invalid, the timestamps reset within the GPX file (around #{inspect(point)}). Check if it's a long video that was split up at 4 GB, where the GPX of the first video contains both parts anyway. The next segment of the video increases its most significant digit."
        """)

        {:halt, nil}
    end)

    line
  end

  @doc """
  reads the length of a video. The result will be cached in the "desc" field of
  the matching GPX of the video if it exists. Otherwise it will be calculated
  from the video file (slow).
  """
  @spec video_length_ms(t()) :: integer()
  def video_length_ms(%__MODULE__{} = self) do
    video_length_ms_fast(self) || video_length_ms_slow(self)
  end

  @spec video_length_ms_fast(t()) :: integer() | nil
  defp video_length_ms_fast(%__MODULE__{source: source, available_gpx: true}) do
    gpx_path = Video.Path.gpx_rel_to_cwd(source)

    with {:ok, content} <- File.read(gpx_path),
         text when is_list(text) <- SweetXml.xpath(content, ~x"//trk/desc/text()"),
         text <- List.to_string(text),
         {duration, ""} <- Integer.parse(text) do
      duration
    else
      _ -> nil
    end
  end

  defp video_length_ms_fast(%__MODULE__{}), do: nil

  @spec video_length_ms_slow(t()) :: integer()
  @dialyzer {:nowarn_function, video_length_ms_slow: 1}
  defp video_length_ms_slow(%__MODULE__{source: source}) do
    IO.puts(:stderr, "querying video to determine length of #{source}")
    path = Video.Path.source_rel_to_cwd(source)
    {:ok, meta} = Video.Metadata.for(path)
    ms = round(meta.duration * 1000)

    gpx_path = Video.Path.gpx_rel_to_cwd(source)

    with {:ok, content} <- File.read(gpx_path),
         {:ok, _len} <- File.copy(gpx_path, "#{gpx_path}_backup_without_time"),
         content <-
           String.replace(
             content,
             "<trk>",
             "<trk><!-- desc == length of video in ms --><desc>#{ms}</desc>",
             global: false
           ),
         :ok <- File.write(gpx_path, content) do
      :ok
    else
      err ->
        IO.puts(:stderr, "failed to write GPX file with video time for #{source}: #{err}")
    end

    ms
  end

  @typep gpx_point :: %{lat: float(), lon: float(), time: NaiveDateTime.t(), ele: float() | nil}
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
    xml
    |> xpath(~x"//trkseg/trkpt"l)
    |> Enum.map(fn trkpt ->
      %{
        lat: trkpt |> xpath(~x"./@lat"f),
        lon: trkpt |> xpath(~x"./@lon"f),
        time: trkpt |> xpath(~x"./time/text()"s) |> parse_gpx_date(),
        ele: trkpt |> xpath(~x"./ele/text()"s) |> parse_gpx_ele()
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
        if NaiveDateTime.compare(next.time, prev.time) == :lt,
          do: {:halt, list},
          else: {:cont, [next | list]}
    end)
    |> Enum.reverse()
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

  @spec parse_gpx_ele(binary()) :: float | nil
  defp parse_gpx_ele(ele) do
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
