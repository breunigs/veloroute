defmodule Video.Timestamp do
  @second_in_ms 1000
  @minute_in_ms 60 * @second_in_ms
  @hour_in_ms 60 * @minute_in_ms

  import Guards

  # 12*8=96
  @type t :: <<_::96>>
  def valid?(str) do
    valid_timestamp(str) && Regex.match?(~r/^\d{2}:\d{2}:\d{2}\.\d{3}$/, str)
  end

  def zero(), do: "00:00:00.000"

  @spec as_html(integer() | t()) :: binary()
  def as_html(duration_in_ms) when is_integer(duration_in_ms) do
    {hours, minutes, seconds, _ms} = duration_split(duration_in_ms)

    if hours > 0,
      do: "#{hours}:#{pad_left(minutes)}:#{pad_left(seconds)}",
      else: "#{minutes}:#{pad_left(seconds)}"
  end

  def as_html(timestamp) when valid_timestamp(timestamp) do
    timestamp |> in_milliseconds() |> as_html()
  end

  @doc """
  Takes a duration in millisecond and returns it as an ffmpeg formatted timestamp

    iex> Video.Timestamp.from_milliseconds(1337)
    "00:00:01.337"

    iex> Video.Timestamp.from_milliseconds(4171008)
    "01:09:31.008"
  """
  @spec from_milliseconds(integer()) :: t()
  def from_milliseconds(duration_in_ms) do
    {hours, minutes, seconds, milliseconds} = duration_split(duration_in_ms)
    "#{pad_left(hours)}:#{pad_left(minutes)}:#{pad_left(seconds)}.#{pad_left(milliseconds, 3)}"
  end

  @doc """
  Takes a timed point and returns the ffmpeg timestamp

    iex> %Video.TimedPoint{time_offset_ms: 1337, lat: 0, lon: 0}
    ...> |> Video.Timestamp.from_timed_point()
    "00:00:01.337"
  """
  @spec from_timed_point(Video.TimedPoint.t()) :: t()
  def from_timed_point(%Video.TimedPoint{time_offset_ms: duration_in_ms}),
    do: from_milliseconds(duration_in_ms)

  @doc """
  Takes an ffmpeg timestamp and returns the value in milliseconds

    iex> Video.Timestamp.in_milliseconds("00:00:01.337")
    1337
  """
  @spec in_milliseconds(t()) :: integer()
  def in_milliseconds(timestamp) when valid_timestamp(timestamp) do
    <<hours::binary-size(2), ":", minutes::binary-size(2), ":", seconds::binary-size(2), ".",
      milliseconds::binary-size(3)>> = timestamp

    String.to_integer(hours) * @hour_in_ms +
      String.to_integer(minutes) * @minute_in_ms +
      String.to_integer(seconds) * @second_in_ms +
      String.to_integer(milliseconds)
  end

  def in_seconds(timestamp), do: in_milliseconds(timestamp) / 1000.0

  @spec add_milliseconds(t() | :start | :end, integer()) :: t()
  @doc """
  Add milliseconds to the timestamp in ffmpeg format, and return it again
  in ffmpeg format. Negative milliseconds are allowed, but the time will
  be clamped to 0.

      iex> Video.Timestamp.add_milliseconds("00:00:01.337", 42)
      "00:00:01.379"

      iex> Video.Timestamp.add_milliseconds("00:00:01.337", -31337)
      "00:00:00.000"
  """
  def add_milliseconds(:start, ms_to_add), do: add_milliseconds(zero(), ms_to_add)

  def add_milliseconds(:end, ms_to_add) when ms_to_add < 0 do
    "-" <> add_milliseconds(zero(), -1 * ms_to_add)
  end

  def add_milliseconds(timestamp, ms_to_add) when is_integer(ms_to_add) do
    timestamp
    |> in_milliseconds()
    |> Kernel.+(ms_to_add)
    |> Kernel.max(0)
    |> from_milliseconds()
  end

  defp pad_left(int, num \\ 2), do: String.pad_leading("#{int}", num, "0")

  @doc """
  Try to parse a timestamp. It returns the timestamp on success, or nil
  otherwise. The 2nd argument will be printed on error for identification
  purposes.

    iex> Video.Timestamp.valid_or_nil("00:00:01.337", "wat")
    "00:00:01.337"
  """
  @spec valid_or_nil(any(), any()) :: t() | nil
  def valid_or_nil(nil, _ident), do: nil

  def valid_or_nil(timestamp, ident) do
    if valid?(timestamp) do
      timestamp
    else
      IO.puts(
        :stderr,
        "Warning: timestamp '#{timestamp}' given, but it is not a valid ffmpeg timestamp (#{inspect(ident)})"
      )

      nil
    end
  end

  @second_in_ms 1000
  @minute_in_ms 60 * @second_in_ms
  @hour_in_ms 60 * @minute_in_ms
  @spec duration_split(integer()) :: {integer(), integer(), integer(), integer()}
  defp duration_split(duration_in_ms) when is_integer(duration_in_ms) do
    hours = div(duration_in_ms, @hour_in_ms)
    duration_in_ms = rem(duration_in_ms, @hour_in_ms)

    minutes = div(duration_in_ms, @minute_in_ms)
    duration_in_ms = rem(duration_in_ms, @minute_in_ms)

    seconds = div(duration_in_ms, @second_in_ms)
    milliseconds = rem(duration_in_ms, @second_in_ms)

    {hours, minutes, seconds, milliseconds}
  end
end
