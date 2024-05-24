defmodule Video.Rendered do
  # TODO ideally this would be the type of a class implementing the behaviour
  @type t() :: module()

  @type polyline() :: %{polyline: binary(), interval: float(), precision: pos_integer()}
  @type vanity :: binary()

  @callback name() :: binary()
  @callback hash() :: binary()
  @callback length_ms() :: integer()
  @callback sources() :: Video.Track.plain()
  @callback coords() :: [Video.TimedPoint.t()]
  @callback polyline() :: polyline()
  @callback recording_dates() :: Video.Track.timed_info()
  @callback street_names() :: Video.Track.timed_info()
  @callback rendered?() :: boolean()
  @callback renderer() :: pos_integer()
  @callback bbox() :: Geo.BoundingBox.t()

  @doc """
  Binary length of the abbreviated hash used for vanity names
  """
  @vanity_id_length 5
  def vanity_id_length, do: @vanity_id_length

  @doc """
  Returns the vanity ID for this video
  """
  @spec vanity(t()) :: vanity()
  def vanity(rendered) do
    [vanity, _] = String.split(rendered.name(), ":", parts: 2)
    abbrev = rendered.hash() |> String.slice(0, @vanity_id_length)
    abbrev <> "-" <> vanity
  end

  @doc """
  Returns the recording data string for the given timestamp

  ## Examples

      iex> Video.Rendered.recording_date_for(Video.RenderedTest.Example, 11)
      "after ten ms"
  """
  @spec recording_date_for(t(), non_neg_integer()) :: binary()
  def recording_date_for(rendered, time_in_ms) when time_in_ms >= 0 do
    Enum.reduce_while(rendered.recording_dates(), "", fn %{timestamp: ts, text: binary}, prev ->
      if ts <= time_in_ms, do: {:cont, binary}, else: {:halt, prev}
    end)
  end

  @doc """
  Returns the street name for the given timestamp

  ## Examples

      iex> Video.Rendered.street_name_for(Video.RenderedTest.Example, 11)
      "after ten ms"
  """
  @spec street_name_for(t(), non_neg_integer()) :: binary()
  def street_name_for(rendered, time_in_ms) when time_in_ms >= 0 do
    Enum.reduce_while(rendered.street_names(), "", fn %{timestamp: ts, text: binary}, prev ->
      if ts <= time_in_ms, do: {:cont, binary}, else: {:halt, prev}
    end)
  end

  @type indicator :: %{
          lat: float(),
          lon: float(),
          bearing: float(),
          time_offset_ms: non_neg_integer()
        }

  @spec start_from(Video.Rendered.t(), Geo.Point.like() | integer() | nil) :: indicator()
  @doc """
  Find the closest point for the video that roughly corresponds to the given
  point or timestamp. If the point is not valid, it returns the start of the
  video.

  ## Examples

      iex> Video.Rendered.start_from(Video.RenderedTest.Example, %{lat: 53.5085, lon: 10.041})
      %{bearing: 310.0161346069299, lat: 53.5085, lon: 10.041000000000002, time_offset_ms: 150}

      iex> last_coord = Video.RenderedTest.Example.coords() |> List.last()
      iex> Video.Rendered.start_from(Video.RenderedTest.Example, last_coord)
      %{bearing: 310.01613460713037, lat: last_coord.lat, lon: last_coord.lon, time_offset_ms: last_coord.time_offset_ms}

      iex> Video.Rendered.start_from(Video.RenderedTest.Example, 124)
      %{bearing: 310.0161346069299, lat: 53.50824, lon: 10.04152, time_offset_ms: 124}
  """
  def start_from(rendered, point_or_time)

  def start_from(rendered, nil) do
    [a, b | _rest] = rendered.coords()
    Map.put(a, :bearing, Geo.CheapRuler.bearing(a, b))
  end

  def start_from(rendered, time) when is_integer(time) do
    cond do
      time <= 0 ->
        start_from(rendered, nil)

      time >= rendered.length_ms() ->
        [a, b] = rendered.coords() |> Enum.slice(-2..-1)
        Map.put(b, :bearing, Geo.CheapRuler.bearing(a, b))

      true ->
        rendered.coords()
        |> Stream.chunk_every(2, 1, :discard)
        |> Stream.filter(fn [a, b] -> time >= a.time_offset_ms && time <= b.time_offset_ms end)
        |> Enum.find_value(fn [a, b] ->
          t = calc_t(time, a, b)

          Video.TimedPoint.interpolate(a, b, t)
          |> Map.put(:bearing, Geo.CheapRuler.bearing(a, b))
          |> Map.delete(:__struct__)
        end)
    end || start_from(rendered, nil)
  end

  def start_from(rendered, point) do
    %{point: %{lon: lon, lat: lat}, t: t, index: idx} =
      Geo.CheapRuler.closest_point_on_line(rendered.coords(), point)

    {idx, time} =
      if idx == length(rendered.coords()) - 1 do
        {idx - 1, Enum.at(rendered.coords(), idx).time_offset_ms}
      else
        {idx, nil}
      end

    [prev, next] = Enum.slice(rendered.coords(), idx..(idx + 1))
    bearing = Geo.CheapRuler.bearing(prev, next)
    time = time || prev.time_offset_ms + t * (next.time_offset_ms - prev.time_offset_ms)

    %{
      lon: lon,
      lat: lat,
      bearing: bearing,
      time_offset_ms: round(time)
    }
  end

  defp calc_t(interp, prev, next),
    do: (interp - prev.time_offset_ms) / (next.time_offset_ms - prev.time_offset_ms)
end
