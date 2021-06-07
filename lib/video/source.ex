defmodule Video.Source do
  @gpx_ending ".gpx"
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

  @doc ~S"""
  Extracts a portion of the GPX track for the given start and end time. It
  returns a list of coordinates with the time offset in milliseconds since the
  start of the track.
  """
  @spec time_range(t(), Geo.CheapRuler.point(), Geo.CheapRuler.point()) ::
          [%{:lat => float(), :lon => float(), time_offset_ms: integer()}] | {:error, binary()}
  def time_range(%__MODULE__{path_source: source, available_gpx: false}, _from, _to) do
    {:error,
     "#{source} has no GPX file available to extract time range from, try `gopro2gpx #{make_abs(source)}`?"}
  end

  def time_range(self, from, to) do
    line = parse_gpx(self)
    start_time = hd(line).time

    from = interpolate_closest_point(line, from)
    to = interpolate_closest_point(line, to)

    coords = Enum.slice(line, (from.prev_index + 1)..to.prev_index)

    ([from] ++ coords ++ [to])
    |> Enum.map(fn point ->
      %{
        time_offset_ms: NaiveDateTime.diff(point.time, start_time, :millisecond),
        lat: point.lat,
        lon: point.lon
      }
    end)
  end

  defp interpolate_closest_point(line, point) do
    %{index: idx, t: t, lat: lat, lon: lon} = Geo.CheapRuler.closest_point_on_line(line, point)

    cond do
      t < 0 or t > 1 ->
        # clamp to track if point is outside of track
        line
        |> Enum.at(idx)
        |> Map.take([:lat, :lon, :time])
        |> Map.put(:prev_index, max(0, idx - 1))

      t >= 0 and t <= 1 ->
        # interpolate time to match interpolated point
        [a, b] = line |> Enum.slice(idx..(idx + 1)) |> Enum.map(& &1.time)
        diff = NaiveDateTime.diff(b, a, :microsecond)
        point_time = NaiveDateTime.add(a, round(t * diff), :microsecond)

        %{lat: lat, lon: lon, time: point_time, prev_index: idx}
    end
  end

  defp parse_gpx(%__MODULE__{path_gpx: gpx, available_gpx: true}) do
    {:ok, content} = File.read(make_abs(gpx))
    Gpx.parse(content)
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
    source_path |> as_base |> Kernel.<>(@gpx_ending)
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
