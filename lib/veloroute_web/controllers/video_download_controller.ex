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

    segment_infos = Video.FMP4.Stream.segment_infos(segments, variant_idx)

    # Use a mutable ref to thread conn through the streaming callback
    conn_ref = :erlang.make_ref()
    Process.put(conn_ref, conn)

    Video.FMP4.Stream.stream_segments(segment_infos, fn data ->
      conn = Process.get(conn_ref)

      case chunk(conn, data) do
        {:ok, conn} ->
          Process.put(conn_ref, conn)
          :ok

        {:error, reason} ->
          {:error, reason}
      end
    end)

    conn = Process.get(conn_ref)
    halt(conn)
  end

  defp download_title(rendered) do
    date = Video.RenderedTools.most_recent_recording_month(rendered, "de")
    "#{rendered.name()}_bis_#{date}" |> String.replace(~r/[^a-zA-ZäüößÄÜÖẞ0-9_.-]+/u, "_")
  end
end
