defmodule Video.TrimmedSource do
  @known_params [
    :source,
    :date,
    :coord_from,
    :coord_to,
    :duration_ms_uncut,
    :coords_uncut,
    :coords_cut,
    :hash_ident
  ]

  @type t :: %__MODULE__{
          source: binary(),
          date: Date.t(),
          coord_from: Video.TimedPoint.t(),
          coord_to: Video.TimedPoint.t(),
          duration_ms_uncut: Video.Timestamp.t(),
          coords_uncut: [Video.TimedPoint.t()],
          coords_cut: [Video.TimedPoint.t()],
          hash_ident: binary()
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
        source: source.source,
        date: source.date,
        coords_uncut: coords,
        coords_cut: coords,
        coord_from: coord_from,
        coord_to: coord_to,
        duration_ms_uncut: Video.Source.video_length_ms(source),
        hash_ident: ""
      }
      |> update_hash_ident()
      |> assert_valid()
    end
  end

  # Extract the coordinates for the configured time frame. It also returns the
  # interpolated points that are closest to the given timestamps as convenience.
  @typep coords_ret() :: %{
           coords_cut: [Video.TimedPoint.t()],
           coord_from: Video.TimedPoint.t(),
           coord_to: Video.TimedPoint.t()
         }
  @spec coords(t(), integer(), integer(), keyword()) :: coords_ret() | {:error, binary()}
  defp coords(%__MODULE__{} = tsv, from_ms, to_ms, options)
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
      {:error, "Cutting #{tsv.source} from #{from_ms}ms to #{to_ms}ms yields an empty video"}
    else
      rev_coords =
        if Keyword.get(options, :extrapolate_end) && to_ms > hd(rev_coords).time_offset_ms do
          [last1, last2 | _rest] = rev_coords
          t = calc_t(to_ms, last2, last1)
          extrap = Video.TimedPoint.extrapolate(last2, last1, t)
          [extrap | rev_coords]
        else
          rev_coords
        end

      last = hd(rev_coords)
      coords = Enum.reverse(rev_coords)
      first = hd(coords)
      %{coords_cut: coords, coord_from: first, coord_to: last}
    end
  end

  @doc """
  Extract a part of the video as denoted by the timestamps.
  """
  @spec extract(
          t(),
          Video.Timestamp.t() | integer() | :start | :seamless,
          Video.Timestamp.t() | integer() | :end
        ) ::
          t() | {:error, binary()}

  def extract(tsv, from, to, options \\ [extrapolate_end: false])

  def extract(%__MODULE__{} = tsv, :start, to, options),
    do: extract(tsv, 0, to, options)

  def extract(%__MODULE__{} = tsv, :seamless, to, options),
    do: extract(tsv, 0, to, options)

  def extract(%__MODULE__{} = tsv, from, :end, options),
    do: extract(tsv, from, tsv.duration_ms_uncut, options)

  def extract(%__MODULE__{} = tsv, "" <> from, to, options),
    do: extract(tsv, Video.Timestamp.in_milliseconds(from), to, options)

  def extract(%__MODULE__{} = tsv, from, "" <> to, options),
    do: extract(tsv, from, Video.Timestamp.in_milliseconds(to), options)

  def extract(%__MODULE__{} = tsv, from, to, options)
      when is_integer(from) and is_integer(to) and from <= to do
    with upd when is_map(upd) <- coords(tsv, from, to, options) do
      struct(tsv, coords(tsv, from, to, options))
      |> update_hash_ident()
      |> assert_valid()
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

  @spec source(t()) :: {binary(), Video.Timestamp.t() | :start, Video.Timestamp.t() | :end}
  def source(%__MODULE__{} = tsv) do
    {from, to} = in_ms(tsv)
    from = if from == 0, do: :start, else: Video.Timestamp.from_milliseconds(from)
    to = if to == tsv.duration_ms_uncut, do: :end, else: Video.Timestamp.from_milliseconds(to)

    {Video.Path.source_base_with_ending(tsv.source), from, to}
  end

  defp update_hash_ident(%__MODULE__{source: p, coord_from: f, coord_to: t} = m) do
    path = Video.Path.source_base_with_ending(p)
    %{m | hash_ident: "#{path} #{f.time_offset_ms} #{inspect(t.time_offset_ms)}"}
  end
end
