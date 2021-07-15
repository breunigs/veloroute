defmodule Video.Source do
  import SweetXml

  @known_params [
    :source,
    :available_anonymized,
    :available_gpx,
    :date
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{}

  def new_from_path(source_path) do
    error_unless_valid_source(source_path) ||
      new_from_path(
        source_path,
        source_path |> Video.Path.gpx() |> File.exists?(),
        source_path |> Video.Path.anonymized() |> File.exists?()
      )
  end

  def new_from_path(source_path, known_files) do
    error_unless_valid_source(source_path) ||
      new_from_path(
        source_path,
        MapSet.member?(known_files, Video.Path.gpx(source_path)),
        MapSet.member?(known_files, Video.Path.anonymized(source_path))
      )
  end

  @doc """
  Recursively finds all valid source videos within the given folder
  """
  def new_from_folder(source_folder) do
    all_files = IOUtil.tree(source_folder) |> MapSet.new()

    all_files
    |> Enum.map(&new_from_path(&1, all_files))
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

  defp new_from_path(source_path, available_gpx, available_anonymized)
       when is_binary(source_path) and is_boolean(available_gpx) and
              is_boolean(available_anonymized) do
    %__MODULE__{
      source: Video.Path.source_base(source_path),
      available_anonymized: available_anonymized,
      available_gpx: available_gpx,
      date: date_from_path(source_path)
    }
  end

  @doc """
  Parse the GPX and returned the coordinates with timestamps relative to the video
  """
  @spec timed_points(t()) :: [Video.TimedPoint.t()] | {:error, binary()}
  def timed_points(%__MODULE__{source: source, available_gpx: false}) do
    {:error,
     "#{Video.Path.source_base(source)} has no GPX file available to extract time range from, try `gopro2gpx #{Video.Path.gpx(source)}`?"}
  end

  def timed_points(%__MODULE__{} = self) do
    with line when is_list(line) <- parse_gpx(self) do
      start_time = hd(line).time

      Enum.map(line, fn point ->
        %Video.TimedPoint{
          time_offset_ms: NaiveDateTime.diff(point.time, start_time, :millisecond),
          lat: point.lat,
          lon: point.lon
        }
      end)
      |> assert_monotonic_increase(self)
    end
  end

  defp assert_monotonic_increase(line, %__MODULE__{source: source}) do
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
         text when is_list(text) <- SweetXml.xpath(content, ~x"//desc/text()"),
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
    IO.puts(:stderr, "quering video to determine length of #{source}")
    path = Video.Path.source_rel_to_cwd(source)
    {ms, 0} = System.cmd("mediainfo", ["--Inform=Video;%Duration%", path])
    ms = ms |> String.trim() |> String.to_integer()

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

  @doc """
  Read the raw GPS points for this source from disk
  """
  @spec parse_gpx(t()) :: [Gpx.Point.t()] | {:error, binary()}
  def parse_gpx(%__MODULE__{source: source, available_gpx: true}) do
    gpx_path = Video.Path.gpx(source)

    try do
      with {:ok, content} <- File.read(gpx_path),
           gpx when is_list(gpx) <- Gpx.parse(content) do
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

  defp date_from_path(source_path) do
    case Regex.run(~r/\b\d\d\d\d-\d\d-\d\d\b/, source_path) do
      nil -> "unknown"
      str -> str
    end
  end
end
