defmodule M3U8.Utils do
  import Guards

  @type variant :: %{
          url: binary(),
          bandwidth: pos_integer(),
          width: pos_integer(),
          height: pos_integer(),
          codec: binary()
        }

  @spec peak_bandwidth_bps([M3U8.Tokenizer.valid_token()]) :: pos_integer()
  def peak_bandwidth_bps(tokens) do
    byte_ranges(tokens)
    |> Enum.flat_map(fn {_url, ranges} -> ranges end)
    |> Enum.map(fn %{byte: byte, timestamp: ts} ->
      round((byte.last - byte.first + 1) * 8 * 1000 / (ts.last - ts.first))
    end)
    |> Enum.max()
  end

  @spec duration_ms([M3U8.Tokenizer.valid_token()]) :: non_neg_integer()
  def duration_ms(tokens) do
    tokens
    |> Enum.reduce(0.0, fn
      {:extinf, %{duration: in_s}}, sum -> sum + in_s
      _other, sum -> sum
    end)
    |> Kernel.*(1000)
    |> Kernel.round()
  end

  @spec variants([M3U8.Tokenizer.valid_token()]) :: [variant()]
  def variants(tokens) do
    tokens
    |> Enum.reduce({[], nil}, fn
      {:url, url}, {variants, stream} ->
        variant = %{url: url, bandwidth: stream["BANDWIDTH"], codec: stream["CODECS"]}
        variant = Map.merge(stream["RESOLUTION"], variant)
        {[variant | variants], nil}

      {:stream, stream}, {variants, _} ->
        {variants, stream}

      _other, acc ->
        acc
    end)
    |> elem(0)
    |> Enum.reverse()
  end

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

  @doc """
  For playlists with discontinuities (segmented videos), resolves a timestamp
  to the specific segment file and local offset within that segment.

  Returns `{segment_url, local_offset_ms}` or `:not_found`.
  For playlists without discontinuities, returns `:not_found`.
  """
  @spec segment_for_timestamp([M3U8.Tokenizer.valid_token()], non_neg_integer()) ::
          {binary(), non_neg_integer()} | :not_found
  def segment_for_timestamp(tokens, timestamp_ms) when is_integer(timestamp_ms) do
    tokens
    |> Enum.reduce_while({0, nil}, fn
      {:map, %{"URI" => uri}}, {cumulative_ms, _segment_url} ->
        {:cont, {cumulative_ms, uri}}

      {:extinf, %{duration: dur}}, {cumulative_ms, segment_url} ->
        dur_ms = to_ms(dur)

        if segment_url != nil and timestamp_ms < cumulative_ms + dur_ms do
          {:halt, {:found, segment_url, cumulative_ms}}
        else
          {:cont, {cumulative_ms + dur_ms, segment_url}}
        end

      _other, acc ->
        {:cont, acc}
    end)
    |> case do
      {:found, segment_url, segment_start_ms} ->
        {segment_url, timestamp_ms - segment_start_ms}

      _ ->
        :not_found
    end
  end

  defp to_ms(in_s), do: round(in_s * 1000)
end
