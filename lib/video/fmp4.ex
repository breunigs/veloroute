defmodule Video.FMP4 do
  @moduledoc false

  @doc """
  Extracts the timescale from a fragmented MP4 binary by navigating
  moov → trak → mdia → mdhd.
  """
  @spec extract_timescale(binary()) :: {:ok, pos_integer()} | :error
  def extract_timescale(data) do
    with {:ok, moov_off, moov_size} <- find_box(data, "moov"),
         body_off = moov_off + box_header_size(data, moov_off),
         {:ok, trak_off, trak_size} <- find_box(data, "trak", body_off, moov_off + moov_size),
         body_off = trak_off + box_header_size(data, trak_off),
         {:ok, mdia_off, mdia_size} <- find_box(data, "mdia", body_off, trak_off + trak_size),
         body_off = mdia_off + box_header_size(data, mdia_off),
         {:ok, mdhd_off, _mdhd_size} <- find_box(data, "mdhd", body_off, mdia_off + mdia_size) do
      parse_mdhd_timescale(data, mdhd_off)
    end
  end

  @doc """
  Patches mfhd sequence numbers and tfdt baseMediaDecodeTime in all moof boxes.

  Takes the segment binary (after ftyp+moov have been stripped for non-first segments),
  a starting sequence number, a starting base decode time (in timescale units),
  and a list of per-fragment durations (in timescale units, one per moof).

  Returns `{patched_binary, next_seq_num, next_base_decode_time}`.
  """
  @spec fix_timestamps(binary(), pos_integer(), non_neg_integer(), [non_neg_integer()]) ::
          {binary(), pos_integer(), non_neg_integer()}
  def fix_timestamps(data, seq_num, base_time, durations) do
    patch_moofs(data, 0, seq_num, base_time, durations)
  end

  @doc """
  Converts EXTINF durations (in seconds) to timescale units.
  """
  @spec durations_to_timescale([float()], pos_integer()) :: [non_neg_integer()]
  def durations_to_timescale(extinf_durations, timescale) do
    Enum.map(extinf_durations, &round(&1 * timescale))
  end

  # --- Box navigation ---

  defp find_box(data, type, offset \\ 0, limit \\ nil) do
    limit = limit || byte_size(data)
    scan_for_box(data, type, offset, limit)
  end

  defp scan_for_box(data, type, offset, limit) when offset + 8 <= limit do
    case read_box_header(data, offset) do
      {:ok, ^type, _hdr_size, box_size} ->
        {:ok, offset, box_size}

      {:ok, _other_type, _hdr_size, box_size} when box_size > 0 ->
        scan_for_box(data, type, offset + box_size, limit)

      _ ->
        :error
    end
  end

  defp scan_for_box(_data, _type, _offset, _limit), do: :error

  defp read_box_header(data, offset) when offset + 8 <= byte_size(data) do
    <<_::binary-size(^offset), size::32-big, type::binary-size(4), _::binary>> = data

    cond do
      size == 1 and offset + 16 <= byte_size(data) ->
        <<_::binary-size(^offset), _::64, extended::64-big, _::binary>> = data
        {:ok, type, 16, extended}

      size >= 8 ->
        {:ok, type, 8, size}

      true ->
        :error
    end
  end

  defp read_box_header(_data, _offset), do: :error

  defp box_header_size(data, offset) do
    <<_::binary-size(^offset), size::32-big, _::binary>> = data
    if size == 1, do: 16, else: 8
  end

  # --- mdhd parsing ---

  defp parse_mdhd_timescale(data, box_offset) do
    hdr_size = box_header_size(data, box_offset)
    content_offset = box_offset + hdr_size

    case data do
      <<_::binary-size(^content_offset), 0::8, _flags::24, _created::32, _modified::32,
        timescale::32-big, _::binary>> ->
        {:ok, timescale}

      <<_::binary-size(^content_offset), 1::8, _flags::24, _created::64, _modified::64,
        timescale::32-big, _::binary>> ->
        {:ok, timescale}

      _ ->
        :error
    end
  end

  # --- moof patching ---

  defp patch_moofs(data, offset, seq_num, base_time, durations)
       when offset < byte_size(data) do
    case read_box_header(data, offset) do
      {:ok, "moof", _hdr_size, box_size} ->
        {dur, remaining_durs} =
          case durations do
            [d | rest] -> {d, rest}
            [] -> {0, []}
          end

        data = patch_single_moof(data, offset, box_size, seq_num, base_time)
        next_offset = offset + box_size

        # Skip the mdat that follows
        next_offset =
          case read_box_header(data, next_offset) do
            {:ok, "mdat", _hdr, mdat_size} -> next_offset + mdat_size
            _ -> next_offset
          end

        patch_moofs(data, next_offset, seq_num + 1, base_time + dur, remaining_durs)

      {:ok, _type, _hdr_size, box_size} when box_size > 0 ->
        patch_moofs(data, offset + box_size, seq_num, base_time, durations)

      _ ->
        {data, seq_num, base_time}
    end
  end

  defp patch_moofs(data, _offset, seq_num, base_time, _durations) do
    {data, seq_num, base_time}
  end

  defp patch_single_moof(data, moof_offset, moof_size, seq_num, base_time) do
    hdr_size = box_header_size(data, moof_offset)
    body_start = moof_offset + hdr_size
    moof_end = moof_offset + moof_size

    data = patch_mfhd(data, body_start, moof_end, seq_num)
    patch_tfdt_in_moof(data, body_start, moof_end, base_time)
  end

  defp patch_mfhd(data, search_start, search_end, seq_num) do
    case find_box(data, "mfhd", search_start, search_end) do
      {:ok, mfhd_off, _size} ->
        # mfhd is a fullbox: version(1) + flags(3) + sequence_number(4)
        content_off = mfhd_off + box_header_size(data, mfhd_off)
        seq_off = content_off + 4
        patch_u32(data, seq_off, seq_num)

      :error ->
        data
    end
  end

  defp patch_tfdt_in_moof(data, search_start, search_end, base_time) do
    case find_box(data, "traf", search_start, search_end) do
      {:ok, traf_off, traf_size} ->
        traf_body = traf_off + box_header_size(data, traf_off)
        traf_end = traf_off + traf_size
        patch_tfdt(data, traf_body, traf_end, base_time)

      :error ->
        data
    end
  end

  defp patch_tfdt(data, search_start, search_end, base_time) do
    case find_box(data, "tfdt", search_start, search_end) do
      {:ok, tfdt_off, _size} ->
        content_off = tfdt_off + box_header_size(data, tfdt_off)

        <<_::binary-size(^content_off), version::8, _::binary>> = data

        case version do
          0 -> patch_u32(data, content_off + 4, base_time)
          1 -> patch_u64(data, content_off + 4, base_time)
          _ -> data
        end

      :error ->
        data
    end
  end

  # --- Binary patching helpers ---

  defp patch_u32(data, offset, value) do
    <<before::binary-size(^offset), _::32, after_::binary>> = data
    <<before::binary, value::32-big, after_::binary>>
  end

  defp patch_u64(data, offset, value) do
    <<before::binary-size(^offset), _::64, after_::binary>> = data
    <<before::binary, value::64-big, after_::binary>>
  end
end
