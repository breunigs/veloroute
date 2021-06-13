defmodule Video.Rendered do
  @known_params [
    :hash,
    :coords,
    :length_ms
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{
          hash: binary(),
          coords: [Video.TimedPoint.t()],
          length_ms: integer()
        }

  def all_from_map(%Map.Parsed{} = map) do
    map
    |> Video.TrimmedSourceSequence.list_from_map()
    |> Enum.filter(&Video.TrimmedSourceSequence.already_rendered?/1)
    |> Enum.map(&new_from_tsv_seq/1)
    |> Enum.into(%{}, fn rendered -> {rendered.hash, rendered} end)
  end

  def new_from_tsv_seq(tsv_seq) do
    coords = Video.TrimmedSourceSequence.coords(tsv_seq)
    length_ms = coords |> List.last() |> Map.fetch!(:time_offset_ms)

    %__MODULE__{
      hash: tsv_seq.hash,
      coords: coords,
      length_ms: length_ms
    }
  end

  @doc """
  Outputs the timestamps and coordinates as an iolist, suitable to be passed to the
  frontend for displaying the video position. It returns a flat list with the values
  being time_in_seconds, lon, lat for each point, repeated for all coordinates. The
  caller must take care to iterate through this list by incrementing the index by 3.
  The individual values are floats separated by a space. The first three are the
  original values, thereafter it's the difference to the previous value.

  ## Examples

      iex> Video.Rendered.coord_io_list(Video.RenderedTest.example())
      '0.0 10.044 53.507 0.1 -0.002 0.001 0.1 -0.002 0.001 0.1 -0.002 0.001 0.1 -0.002 0.001'
  """
  @spec coord_io_list(t()) :: iolist()
  def coord_io_list(%__MODULE__{coords: coords}) do
    coords
    |> Enum.reduce(
      {%Video.TimedPoint{lon: 0, lat: 0, time_offset_ms: 0}, ''},
      fn curr, {prev, acc} ->
        lon = curr.lon - prev.lon
        lat = curr.lat - prev.lat
        ms = curr.time_offset_ms - prev.time_offset_ms

        coord = [
          ' ',
          :erlang.float_to_list(ms / 1000.0, [{:decimals, 3}, :compact]),
          ' ',
          :erlang.float_to_list(lon, [{:decimals, 5}, :compact]),
          ' ',
          :erlang.float_to_list(lat, [{:decimals, 5}, :compact])
        ]

        {curr, [acc | coord]}
      end
    )
    |> elem(1)
    |> List.flatten()
    |> tl()
  end

  @spec start_from(t(), Geo.Point.like() | nil) :: %{
          lat: float(),
          lon: float(),
          bearing: float(),
          time_offset_ms: integer()
        }
  @doc """
  Find the closest point for the video that roughly corresponds to the given
  point. If the point is not valid, it returns the start of the video.

  ## Examples

      iex> Video.Rendered.start_from(Video.RenderedTest.example(), %{lat: 53.5085, lon: 10.041})
      %{bearing: 310.0161346069299, lat: 53.5085, lon: 10.041000000000002, time_offset_ms: 150}

      iex> last_coord = Video.RenderedTest.example().coords |> List.last()
      iex> Video.Rendered.start_from(Video.RenderedTest.example(), last_coord)
      %{bearing: 310.01613460713037, lat: last_coord.lat, lon: last_coord.lon, time_offset_ms: last_coord.time_offset_ms}
  """
  def start_from(rendered_video, point)
  def start_from(%__MODULE__{coords: coords}, nil), do: hd(coords)

  def start_from(%__MODULE__{coords: coords}, point) do
    %{lon: lon, lat: lat, t: t, index: idx} = Geo.CheapRuler.closest_point_on_line(coords, point)

    {idx, time} =
      if idx == length(coords) - 1 do
        {idx - 1, Enum.at(coords, idx).time_offset_ms}
      else
        {idx, nil}
      end

    [prev, next] = Enum.slice(coords, idx..(idx + 1))
    bearing = Geo.CheapRuler.bearing(prev, next)
    time = time || prev.time_offset_ms + t * (next.time_offset_ms - prev.time_offset_ms)

    %{
      lon: lon,
      lat: lat,
      bearing: bearing,
      time_offset_ms: round(time)
    }
  end
end
