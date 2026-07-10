defmodule Video.FMP4Test do
  use ExUnit.Case, async: true

  # Build minimal ISO BMFF boxes for testing
  defp box(type, content) when byte_size(type) == 4 do
    size = byte_size(content) + 8
    <<size::32-big, type::binary-size(4), content::binary>>
  end

  defp fullbox(type, version, flags, content) when byte_size(type) == 4 do
    box(type, <<version::8, flags::24, content::binary>>)
  end

  defp extended_box(type, content) when byte_size(type) == 4 do
    real_size = byte_size(content) + 16
    <<1::32-big, type::binary-size(4), real_size::64-big, content::binary>>
  end

  # Build a minimal moov with a known timescale
  defp moov_with_timescale(timescale, version) do
    mdhd =
      case version do
        0 ->
          fullbox("mdhd", 0, 0, <<
            0::32,
            0::32,
            timescale::32-big,
            0::32
          >>)

        1 ->
          fullbox("mdhd", 1, 0, <<
            0::64,
            0::64,
            timescale::32-big,
            0::64
          >>)
      end

    minf = box("minf", <<0::64>>)
    mdia = box("mdia", mdhd <> minf)
    tkhd = fullbox("tkhd", 0, 0, <<0::672>>)
    trak = box("trak", tkhd <> mdia)
    mvhd = fullbox("mvhd", 0, 0, <<0::768>>)
    box("moov", mvhd <> trak)
  end

  defp ftyp_box do
    box("ftyp", <<"isom", 0::32, "isom", "iso5">>)
  end

  # Build a moof with given sequence_number and baseMediaDecodeTime
  defp moof(seq_num, base_time, tfdt_version \\ 0) do
    mfhd = fullbox("mfhd", 0, 0, <<seq_num::32-big>>)

    tfhd = fullbox("tfhd", 0, 0, <<1::32-big>>)

    tfdt =
      case tfdt_version do
        0 -> fullbox("tfdt", 0, 0, <<base_time::32-big>>)
        1 -> fullbox("tfdt", 1, 0, <<base_time::64-big>>)
      end

    trun = fullbox("trun", 0, 0, <<0::32>>)
    traf = box("traf", tfhd <> tfdt <> trun)
    box("moof", mfhd <> traf)
  end

  defp mdat(content \\ <<0, 1, 2, 3>>) do
    box("mdat", content)
  end

  # --- extract_timescale tests ---

  test "extracts timescale from v0 mdhd" do
    data = ftyp_box() <> moov_with_timescale(90_000, 0)
    assert {:ok, 90_000} = Video.FMP4.extract_timescale(data)
  end

  test "extracts timescale from v1 mdhd" do
    data = ftyp_box() <> moov_with_timescale(48_000, 1)
    assert {:ok, 48_000} = Video.FMP4.extract_timescale(data)
  end

  test "returns error when moov is missing" do
    data = ftyp_box() <> box("free", <<0::64>>)
    assert :error = Video.FMP4.extract_timescale(data)
  end

  # --- fix_timestamps tests ---

  test "patches sequence number in single moof" do
    data = moof(1, 0) <> mdat()
    {patched, next_seq, _next_time} = Video.FMP4.fix_timestamps(data, 42, 0, [90_000])

    assert next_seq == 43
    # Verify patched sequence number by re-parsing
    assert {:ok, 42} = read_mfhd_seq(patched, 0)
  end

  test "patches baseMediaDecodeTime in single moof (v0)" do
    data = moof(1, 0, 0) <> mdat()
    {patched, _seq, next_time} = Video.FMP4.fix_timestamps(data, 1, 900_000, [90_000])

    assert next_time == 990_000
    assert {:ok, 900_000} = read_tfdt_time(patched, 0)
  end

  test "patches baseMediaDecodeTime in single moof (v1)" do
    data = moof(1, 0, 1) <> mdat()
    {patched, _seq, next_time} = Video.FMP4.fix_timestamps(data, 1, 900_000, [90_000])

    assert next_time == 990_000
    assert {:ok, 900_000} = read_tfdt_time(patched, 0)
  end

  test "patches multiple moof+mdat pairs" do
    data = moof(1, 0) <> mdat() <> moof(2, 1000) <> mdat() <> moof(3, 2000) <> mdat()

    {patched, next_seq, next_time} =
      Video.FMP4.fix_timestamps(data, 10, 100_000, [30_000, 30_000, 30_000])

    assert next_seq == 13
    assert next_time == 190_000

    # Verify each moof was patched correctly
    assert {:ok, 10} = read_mfhd_seq(patched, 0)
    assert {:ok, 100_000} = read_tfdt_time(patched, 0)

    offset1 = byte_size(moof(1, 0)) + byte_size(mdat())
    assert {:ok, 11} = read_mfhd_seq(patched, offset1)
    assert {:ok, 130_000} = read_tfdt_time(patched, offset1)

    offset2 = offset1 + byte_size(moof(2, 0)) + byte_size(mdat())
    assert {:ok, 12} = read_mfhd_seq(patched, offset2)
    assert {:ok, 160_000} = read_tfdt_time(patched, offset2)
  end

  test "handles data with leading non-moof boxes" do
    prefix = box("free", <<0::128>>)
    data = prefix <> moof(1, 0) <> mdat()

    {patched, next_seq, _} = Video.FMP4.fix_timestamps(data, 5, 0, [90_000])
    assert next_seq == 6

    assert {:ok, 5} = read_mfhd_seq(patched, byte_size(prefix))
  end

  test "durations_to_timescale converts correctly" do
    assert [90_000, 45_000] = Video.FMP4.durations_to_timescale([1.0, 0.5], 90_000)
    assert [2_700_000] = Video.FMP4.durations_to_timescale([30.0], 90_000)
  end

  test "handles extended box sizes" do
    # Create a moof with extended size
    mfhd_content = fullbox("mfhd", 0, 0, <<1::32-big>>)
    tfhd = fullbox("tfhd", 0, 0, <<1::32-big>>)
    tfdt = fullbox("tfdt", 0, 0, <<0::32-big>>)
    trun = fullbox("trun", 0, 0, <<0::32>>)
    traf = box("traf", tfhd <> tfdt <> trun)
    moof_content = mfhd_content <> traf

    moof_data = extended_box("moof", moof_content)
    data = moof_data <> mdat()

    {patched, next_seq, _} = Video.FMP4.fix_timestamps(data, 99, 500_000, [10_000])
    assert next_seq == 100

    # Verify the mfhd inside the extended-size moof was patched
    # Extended box header is 16 bytes, then mfhd starts
    # mfhd box header (8) + version/flags (4) + seq_num (4)
    seq_offset = 16 + 8 + 4
    <<_::binary-size(^seq_offset), patched_seq::32-big, _::binary>> = patched
    assert patched_seq == 99
  end

  # --- Helpers to read back patched values ---

  defp read_mfhd_seq(data, moof_offset) do
    # Navigate: moof header -> mfhd -> version/flags -> sequence_number
    <<_::binary-size(^moof_offset), size::32-big, "moof", _::binary>> = data
    hdr_size = if size == 1, do: 16, else: 8
    body_start = moof_offset + hdr_size

    scan_for_type(data, "mfhd", body_start, moof_offset + box_total_size(data, moof_offset))
    |> case do
      {:ok, off} ->
        content_off = off + 8 + 4
        <<_::binary-size(^content_off), seq::32-big, _::binary>> = data
        {:ok, seq}

      :error ->
        :error
    end
  end

  defp read_tfdt_time(data, moof_offset) do
    moof_end = moof_offset + box_total_size(data, moof_offset)
    hdr_size = box_hdr_size(data, moof_offset)

    with {:ok, traf_off} <- scan_for_type(data, "traf", moof_offset + hdr_size, moof_end),
         traf_end = traf_off + box_total_size(data, traf_off),
         traf_hdr = box_hdr_size(data, traf_off),
         {:ok, tfdt_off} <- scan_for_type(data, "tfdt", traf_off + traf_hdr, traf_end) do
      content_off = tfdt_off + 8
      <<_::binary-size(^content_off), version::8, _::24, rest::binary>> = data

      case version do
        0 ->
          <<time::32-big, _::binary>> = rest
          {:ok, time}

        1 ->
          <<time::64-big, _::binary>> = rest
          {:ok, time}
      end
    end
  end

  defp scan_for_type(data, type, offset, limit) when offset + 8 <= limit do
    <<_::binary-size(^offset), _size::32, t::binary-size(4), _::binary>> = data

    if t == type do
      {:ok, offset}
    else
      scan_for_type(data, type, offset + box_total_size(data, offset), limit)
    end
  end

  defp scan_for_type(_, _, _, _), do: :error

  defp box_total_size(data, offset) do
    <<_::binary-size(^offset), size::32-big, _::binary>> = data

    if size == 1 do
      <<_::binary-size(^offset), _::64, ext::64-big, _::binary>> = data
      ext
    else
      size
    end
  end

  defp box_hdr_size(data, offset) do
    <<_::binary-size(^offset), size::32-big, _::binary>> = data
    if size == 1, do: 16, else: 8
  end
end
