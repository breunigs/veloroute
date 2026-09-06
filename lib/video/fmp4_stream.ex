defmodule Video.FMP4.Stream do
  @moduledoc false
  require Logger

  @doc """
  Builds segment info maps from a list of segments and a variant index.
  """
  @spec segment_infos([Video.Segment.t()], non_neg_integer()) :: [map()]
  def segment_infos(segments, variant_idx) do
    Enum.map(segments, fn seg ->
      basename = Video.Segment.basename(seg)

      %{
        m4s_path: Video.Path.segment_file(basename, variant_idx),
        m3u8_path: Video.Path.segment_m3u8(basename, variant_idx)
      }
    end)
  end

  @doc """
  Streams concatenated fMP4 segments through a write function.

  Each segment_info must have `:m4s_path` and `:m3u8_path` keys.
  The write_fn receives binary chunks and should return `:ok` or `{:error, term()}`.

  For the first segment, ftyp+moov headers are preserved and the timescale is
  extracted. Subsequent segments have their ftyp+moov stripped. All segments
  get their moof sequence numbers and tfdt timestamps patched for continuity.
  """
  @spec stream_segments([map()], (binary() -> :ok | {:error, term()})) :: :ok | {:error, term()}
  def stream_segments(segment_infos, write_fn) do
    result =
      Enum.reduce_while(segment_infos, {1, 0, nil}, fn info, {seq, base_time, timescale} ->
        with {:ok, data} <- File.read(info.m4s_path),
             {:ok, durations} <- extinf_durations(info.m3u8_path) do
          {timescale, data, seq, base_time} =
            if timescale == nil do
              {:ok, ts} = Video.FMP4.extract_timescale(data)
              dur_units = Video.FMP4.durations_to_timescale(durations, ts)

              {data, next_seq, next_base} =
                Video.FMP4.fix_timestamps(data, seq, base_time, dur_units)

              {ts, data, next_seq, next_base}
            else
              stripped = skip_to_moof(data)
              dur_units = Video.FMP4.durations_to_timescale(durations, timescale)

              {patched, next_seq, next_base} =
                Video.FMP4.fix_timestamps(stripped, seq, base_time, dur_units)

              {timescale, patched, next_seq, next_base}
            end

          case write_fn.(data) do
            :ok -> {:cont, {seq, base_time, timescale}}
            {:error, _} = err -> {:halt, err}
          end
        else
          {:error, reason} ->
            Logger.error("Failed to process segment #{info.m4s_path}: #{inspect(reason)}")
            {:halt, {:error, reason}}
        end
      end)

    case result do
      {_seq, _base_time, _timescale} -> :ok
      {:error, _} = err -> err
    end
  end

  defp extinf_durations(m3u8_path) do
    case M3U8.Tokenizer.read_file(m3u8_path) do
      {:ok, tokens} ->
        durations = for {:extinf, %{duration: d}} <- tokens, do: d
        {:ok, durations}

      {:error, _} = err ->
        err
    end
  end

  # Skips ftyp/moov boxes in a fragmented MP4 to reach the first moof box.
  defp skip_to_moof(binary), do: skip_to_moof(binary, 0)

  defp skip_to_moof(binary, offset) when offset + 8 <= byte_size(binary) do
    <<_::binary-size(^offset), size::32-big, type::binary-size(4), _::binary>> = binary

    cond do
      type == "moof" ->
        binary_part(binary, offset, byte_size(binary) - offset)

      size == 1 and offset + 16 <= byte_size(binary) ->
        <<_::binary-size(^offset), _::64, extended_size::64-big, _::binary>> = binary
        skip_to_moof(binary, offset + extended_size)

      size > 0 ->
        skip_to_moof(binary, offset + size)

      true ->
        binary
    end
  end

  defp skip_to_moof(binary, _offset), do: binary
end
