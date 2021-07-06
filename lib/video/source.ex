defmodule Video.Source do
  @gpx_ending ".gpx"
  # TODO use from Video.Path
  @anonymized_suffix ".anonymized.mkv"
  @source_endings [".MP4", ".mkv"]

  @known_params [
    :path_source,
    :path_anonymized,
    :path_gpx,
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
        source_path |> as_gpx() |> make_abs() |> File.exists?(),
        source_path |> as_anonymized() |> make_abs() |> File.exists?()
      )
  end

  def new_from_path(source_path, known_files) do
    error_unless_valid_source(source_path) ||
      new_from_path(
        source_path,
        MapSet.member?(known_files, as_gpx(source_path)),
        MapSet.member?(known_files, as_anonymized(source_path))
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
    if is_source_path(source_path),
      do: nil,
      else: {:error, "Not a valid source path: #{source_path}"}
  end

  defp new_from_path(source_path, available_gpx, available_anonymized)
       when is_binary(source_path) and is_boolean(available_gpx) and
              is_boolean(available_anonymized) do
    source_path = make_relative(source_path)

    # support paths to just the base name by adding default extension
    source_path =
      if source_path == as_base(source_path),
        do: source_path <> ".MP4",
        else: source_path

    %__MODULE__{
      path_source: source_path,
      path_anonymized: as_anonymized(source_path),
      path_gpx: as_gpx(source_path),
      available_anonymized: available_anonymized,
      available_gpx: available_gpx,
      date: date_from_path(source_path)
    }
  end

  @doc """
  Parse the GPX and returned the coordinates with timestamps relative to the video
  """
  @spec timed_points(t()) :: [Video.TimedPoint.t()] | {:error, binary()}
  def timed_points(%__MODULE__{path_source: source, available_gpx: false}) do
    {:error,
     "#{source} has no GPX file available to extract time range from, try `gopro2gpx #{make_abs(source)}`?"}
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
    end
  end

  defp parse_gpx(%__MODULE__{path_gpx: gpx_path, available_gpx: true}) do
    try do
      with {:ok, content} <- File.read(make_abs(gpx_path)),
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

  defp is_source_path(path) do
    ext = file_extension(path)

    cond do
      String.ends_with?(ext, @anonymized_suffix) -> false
      Enum.any?(@source_endings, &String.ends_with?(ext, &1)) -> true
      ext == "" -> true
      true -> false
    end
  end

  defp file_extension(path) do
    Path.basename(path)
    |> String.split(".", parts: 2)
    |> case do
      [_name] -> ""
      [_name, extension] -> "." <> extension
    end
  end

  defp as_base(source_path) do
    String.replace_suffix(source_path, file_extension(source_path), "")
  end

  defp as_gpx(source_path) do
    source_path |> as_base() |> Kernel.<>(@gpx_ending)
  end

  defp as_anonymized(source_path) do
    source_path |> Kernel.<>(@anonymized_suffix)
  end

  defp date_from_path(source_path) do
    case Regex.run(~r/\b\d\d\d\d-\d\d-\d\d\b/, source_path) do
      nil -> "unknown"
      str -> str
    end
  end

  defp make_relative("/" <> _rest = path),
    do: Path.relative_to(path, Settings.video_source_dir_abs())

  defp make_relative(path), do: path

  defp make_abs("/" <> _rest = path), do: path
  defp make_abs(path), do: Path.join(Settings.video_source_dir_abs(), path)
end
