defmodule VelorouteWeb.VideoDownloadController do
  use VelorouteWeb, :controller
  require Logger

  import Guards

  def download(conn, %{"hash" => hash}) when valid_hash(hash) do
    case Video.Generator.get(hash) do
      nil ->
        conn |> send_resp(404, "Video not found") |> halt()

      rendered ->
        if rendered.renderer() >= 7 do
          stream_v7(conn, hash, rendered)
        else
          redirect_v6(conn, hash)
        end
    end
  end

  def download(conn, _params) do
    conn |> send_resp(404, "Video not found") |> halt()
  end

  defp redirect_v6(conn, hash) do
    path = Video.RenderedTools.highest_quality_video_file(hash)
    url = Path.join(["/#{Settings.r(:video_serve_path)}", path])

    conn
    |> redirect(to: url)
    |> halt()
  end

  defp stream_v7(conn, hash, rendered) do
    variant_idx = Video.RenderedTools.best_variant_index(hash)
    segments = Video.Segment.segments(rendered)
    title = download_title(rendered)

    conn =
      conn
      |> put_resp_content_type("video/mp4")
      |> put_resp_header(
        "content-disposition",
        ~s(attachment; filename="veloroute.hamburg_video_#{title}.mp4")
      )
      |> put_resp_header("cache-control", "public, max-age=31536000, immutable")
      |> send_chunked(200)

    segment_infos =
      Enum.map(segments, fn seg ->
        basename = Video.Segment.basename(seg)

        %{
          m4s_path: Video.Path.segment_file(basename, variant_idx),
          m3u8_path: Video.Path.segment_m3u8(basename, variant_idx)
        }
      end)

    {conn, _seq, _base_time, _timescale} =
      Enum.reduce_while(segment_infos, {conn, 1, 0, nil}, fn info,
                                                             {conn, seq, base_time, timescale} ->
        with {:ok, data} <- File.read(info.m4s_path),
             {:ok, durations} <- extinf_durations(info.m3u8_path) do
          {timescale, data, seq, base_time} =
            if timescale == nil do
              # First segment: extract timescale, keep ftyp+moov
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

          case chunk(conn, data) do
            {:ok, conn} -> {:cont, {conn, seq, base_time, timescale}}
            {:error, _reason} -> {:halt, {conn, seq, base_time, timescale}}
          end
        else
          {:error, reason} ->
            Logger.error("Failed to process segment #{info.m4s_path}: #{inspect(reason)}")
            {:halt, {conn, seq, base_time, timescale}}
        end
      end)

    halt(conn)
  end

  defp extinf_durations(m3u8_path) do
    case M3U8.Tokenizer.read_file(m3u8_path) do
      {:ok, tokens} ->
        durations =
          for {:extinf, %{duration: d}} <- tokens, do: d

        {:ok, durations}

      {:error, _} = err ->
        err
    end
  end

  # Skips ftyp/moov boxes in a fragmented MP4 to reach the first moof box.
  # Used when concatenating segments: only the first segment should include
  # the init section (ftyp+moov), subsequent segments start at moof.
  defp skip_to_moof(binary), do: skip_to_moof(binary, 0)

  defp skip_to_moof(binary, offset) when offset + 8 <= byte_size(binary) do
    <<_::binary-size(^offset), size::32-big, type::binary-size(4), _::binary>> = binary

    cond do
      type == "moof" ->
        binary_part(binary, offset, byte_size(binary) - offset)

      # Extended size: when size == 1, the next 8 bytes contain the real 64-bit size
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

  defp download_title(rendered) do
    date = Video.RenderedTools.most_recent_recording_month(rendered, "de")
    "#{rendered.name()}_bis_#{date}" |> String.replace(~r/[^a-zA-ZäüößÄÜÖẞ0-9_.-]+/u, "_")
  end
end
