defmodule M3U8.Utils do
  import Guards

  @type byte_time_range :: %{byte: Range.t(), timestamp: Range.t()}

  @spec byte_range_for(
          [M3U8.Tokenizer.valid_token()],
          Video.Timestamp.t() | non_neg_integer()
        ) :: %{optional(binary) => Range.t() | nil}
  def byte_range_for(tokens, timestamp) when valid_timestamp(timestamp),
    do: byte_range_for(tokens, Video.Timestamp.in_milliseconds(timestamp))

  def byte_range_for(tokens, timestamp_ms) when is_integer(timestamp_ms) and timestamp_ms >= 0 do
    tokens
    |> byte_ranges()
    |> Enum.into(%{}, fn {url, ranges} ->
      {url,
       Enum.find_value(ranges, fn %{byte: byte, timestamp: ts} ->
         if timestamp_ms in ts, do: byte
       end)}
    end)
  end

  @spec byte_ranges([M3U8.Tokenizer.valid_token()]) :: %{optional(binary) => [byte_time_range()]}
  def byte_ranges(tokens) do
    Enum.reduce(tokens, {%{off: 0, dur: 0, len: 0}, %{}}, fn
      {:byte_range, %{length: len, offset: off}}, {prev, items} ->
        {%{prev | off: off, len: len}, items}

      {:extinf, %{duration: dur}}, {prev, items} ->
        {%{prev | dur: to_ms(dur)}, items}

      {:url, url}, {prev, items} ->
        {prev, note(items, url, prev)}

      {:map, %{"BYTERANGE" => %{length: len, offset: off}, "URI" => url}}, {prev, items} ->
        {prev, note(items, url, %{prev | len: len, off: off})}

      _other, acc ->
        acc
    end)
    |> elem(1)
    |> Enum.into(%{}, fn {url, %{ranges: ranges}} -> {url, Enum.reverse(ranges)} end)
  end

  defp note(items, url, prev) when not is_map_key(items, url) do
    items |> Map.put(url, %{offset: 0, timestamp: 0, ranges: []}) |> note(url, prev)
  end

  defp note(items, url, prev) do
    have = items[url]

    start_offset = prev.off || have.offset
    end_offset = start_offset + prev.len - 1
    start_ts = have.timestamp
    end_ts = have.timestamp + prev.dur

    ranges =
      if prev.dur > 0,
        do: [%{byte: start_offset..end_offset, timestamp: start_ts..end_ts} | have.ranges],
        else: have.ranges

    have = %{offset: end_offset, timestamp: end_ts, ranges: ranges}
    Map.put(items, url, have)
  end

  defp to_ms(in_s), do: round(in_s * 1000)
end
