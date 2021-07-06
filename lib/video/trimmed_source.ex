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
    end
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

  @spec coords(t(), integer(), integer()) :: coords_ret() | {:error, binary()}
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

    if rev_coords == [] do
      {:error,
       "Cutting #{tsv.source_path_rel} from #{from_ms}ms to #{to_ms}ms yields an empty video"}
    else
      last = hd(rev_coords)
      coords = Enum.reverse(rev_coords)
      first = hd(coords)
      %{coords: coords, first: first, last: last}
    end
  end

  @doc """
  Extract a part of the video as denoted by the timestamps.
  """
  @spec extract(
          t(),
          Video.Timestamp.t() | integer() | :start,
          Video.Timestamp.t() | integer() | :end
        ) ::
          t() | {:error, binary()}

  def extract(%__MODULE__{} = tsv, :start, to),
    do: extract(tsv, 0, to)

  def extract(%__MODULE__{} = tsv, from, :end),
    do: extract(tsv, from, tsv.duration_ms_uncut)

  def extract(%__MODULE__{} = tsv, "" <> from, to),
    do: extract(tsv, Video.Timestamp.in_milliseconds(from), to)

  def extract(%__MODULE__{} = tsv, from, "" <> to),
    do: extract(tsv, from, Video.Timestamp.in_milliseconds(to))

  def extract(%__MODULE__{} = tsv, from, to)
      when is_integer(from) and is_integer(to) and from <= to do
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

  defp assert_valid(%__MODULE__{} = tsv) do
    {from_ms, to_ms} = in_ms(tsv)

    if from_ms <= to_ms,
      do: tsv,
      else: {:error, "Invalid time range requested: from #{from_ms} >= to #{to_ms}"}
  end

  @doc """
  Returns the duration in milliseconds from the current cut-off points
  """
  @spec duration_ms(t()) :: integer()
  def duration_ms(%__MODULE__{} = tsv) do
    {from_ms, to_ms} = in_ms(tsv)
    to_ms - from_ms
  end

  def source(%__MODULE__{} = tsv) do
    {from, to} = in_ms(tsv)
    from = Video.Timestamp.from_milliseconds(from)
    to = Video.Timestamp.from_milliseconds(to)

    {Video.Path.source_base(tsv.source_path_rel), from, to}
  end

  def hash_ident(%__MODULE__{source_path_rel: p, coord_from: f, coord_to: t}),
    do: "#{Video.Path.source_base(p)} #{f.time_offset_ms} #{inspect(t.time_offset_ms)}"
end
