defmodule SourceVideo do
  @source_ending ".MP4"
  @gpx_ending ".gpx"
  @anonymized_ending ".MP4.anonymized.mkv"

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
        File.exists?(as_gpx(source_path)),
        File.exists?(as_anonymized(source_path))
      )
  end

  def new_from_path(source_path, known_files) when is_map(known_files) do
    error_unless_valid_source(source_path) ||
      new_from_path(
        source_path,
        MapSet.member?(known_files, as_gpx(source_path)),
        MapSet.member?(known_files, as_anonymized(source_path))
      )
  end

  defp error_unless_valid_source(source_path) do
    if is_source_path(source_path),
      do: nil,
      else: {:error, "Not a valid source path: #{source_path}"}
  end

  defp new_from_path(source_path, available_gpx, available_anonymized)
       when is_binary(source_path)
       when is_boolean(available_gpx)
       when is_boolean(available_anonymized) do
    unless available_gpx,
      do: IO.warn("#{source_path} has no associcated GPX, maybe try `gopro2gpx #{source_path}`")

    source_path =
      if source_path == as_base(source_path),
        do: source_path <> @source_ending,
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

  @doc ~S"""
  Finds the timestamps of the video that correspon to the given "from" and "to" coordinates
  """
  @spec time_range(t(), CheapRuler.point(), CheapRuler.point()) ::
          %{from: binary(), to: binary()} | {:error, binary()}
  def time_range(%__MODULE__{path_source: source, available_gpx: false}, _from, _to) do
    IO.warn("#{source} has no associcated GPX, maybe try `gopro2gpx #{source}`")
    {:error, "needs GPX to extract time range"}
  end

  def time_range(self, from, to) do
    line = parse_gpx(self)

    %{
      from: offset_for_point(line, from),
      to: offset_for_point(line, to)
    }
  end

  @second_in_ms 1000
  @minute_in_ms 60 * @second_in_ms
  @hour_in_ms 60 * @minute_in_ms
  defp offset_for_point(line, point) do
    start_time = hd(line).time
    point_time = time_for_point(line, point)
    diff = NaiveDateTime.diff(point_time, start_time, :millisecond)

    hours = div(diff, @hour_in_ms)
    minutes = div(diff - hours, @minute_in_ms)
    seconds = div(diff - hours - minutes, @second_in_ms)
    milliseconds = diff - hours - minutes - seconds

    "#{hours}:#{two_digits(minutes)}:#{two_digits(seconds)}.#{milliseconds}"
  end

  defp two_digits(int), do: String.pad_leading("#{int}", 2, "0")

  defp time_for_point(line, point) do
    %{index: idx, t: t} = CheapRuler.closest_point_on_line(line, point)
    [a, b] = line |> Enum.slice(idx..(idx + 1)) |> Enum.map(& &1.time)

    diff = NaiveDateTime.diff(b, a, :microsecond)
    NaiveDateTime.add(a, round(t * diff), :microsecond)
  end

  defp parse_gpx(%__MODULE__{path_gpx: gpx, available_gpx: true}) do
    {:ok, content} = File.read(gpx)
    Gpx.parse(content)
  end

  defp is_source_path(path) do
    cond do
      String.ends_with?(path, @anonymized_ending) -> false
      String.ends_with?(path, @source_ending) -> true
      !String.contains?(Path.basename(path), ".") -> true
      true -> false
    end
  end

  defp as_base(source_path) do
    String.replace_suffix(source_path, @source_ending, "")
  end

  defp as_gpx(source_path) do
    source_path |> as_base |> Kernel.<>(@gpx_ending)
  end

  defp as_anonymized(source_path) do
    source_path |> as_base |> Kernel.<>(@anonymized_ending)
  end

  defp date_from_path(source_path) do
    case Regex.run(~r/\b\d\d\d\d-\d\d-\d\d\b/, source_path) do
      nil -> "unknown"
      str -> str
    end
  end
end
