defmodule Video.Timestamp do
  @second_in_ms 1000
  @minute_in_ms 60 * @second_in_ms
  @hour_in_ms 60 * @minute_in_ms

  # 12*8=96
  @type t :: <<_::96>>
  def valid?(str) do
    is_binary(str) && byte_size(str) == 12 && Regex.match?(~r/^\d:\d{2}:\d{2}\.\d{4}$/, str)
  end

  @spec from_milliseconds(integer()) :: t()
  def from_milliseconds(duration_in_ms) do
    hours = div(duration_in_ms, @hour_in_ms)
    duration_in_ms = rem(duration_in_ms, @hour_in_ms)

    minutes = div(duration_in_ms, @minute_in_ms)
    duration_in_ms = rem(duration_in_ms, @minute_in_ms)

    seconds = div(duration_in_ms - hours - minutes, @second_in_ms)
    milliseconds = rem(duration_in_ms, @second_in_ms)

    "#{hours}:#{pad_left(minutes)}:#{pad_left(seconds)}.#{pad_left(milliseconds, 4)}"
  end

  def from_timed_point(%Video.TimedPoint{time_offset_ms: duration_in_ms}),
    do: from_milliseconds(duration_in_ms)

  @spec in_milliseconds(t()) :: integer()
  def in_milliseconds(timestamp) when is_binary(timestamp) and byte_size(timestamp) == 12 do
    <<hours::binary-size(1), ":", minutes::binary-size(2), ":", seconds::binary-size(2), ".",
      milliseconds::binary-size(4)>> = timestamp

    String.to_integer(hours) * @hour_in_ms +
      String.to_integer(minutes) * @minute_in_ms +
      String.to_integer(seconds) * @second_in_ms +
      String.to_integer(milliseconds)
  end

  defp pad_left(int, num \\ 2), do: String.pad_leading("#{int}", num, "0")

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
end
