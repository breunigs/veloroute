defmodule VelorouteWeb.ImageExtractController do
  use VelorouteWeb, :controller
  require Logger

  @extract_from_file "stream_0.m4s"
  @fallback_image_path "/images/video_poster.svg"

  import Video.Track, only: [valid_hash: 1]

  def image(conn, %{"hash" => hash, "timestamp" => ts}) when valid_hash(hash) do
    with {ts_in_ms, ""} <- Integer.parse(ts),
         ren when not is_nil(ren) <- Video.Rendered.get(hash),
         true <- ren.length_ms() >= ts_in_ms,
         webp <- supports_webp?(conn),
         {img, 0} <- ffmpeg(hash, ts_in_ms, webp) do
      conn
      |> put_resp_content_type(if(webp, do: "image/webp", else: "image/jpeg"))
      |> put_resp_header("x-robots-tag", "noindex")
      |> put_resp_header("cache-control", "public, max-age=31536000, immutable")
      |> send_resp(200, img)
      |> halt
    else
      resp ->
        Logger.debug("failed to extract image for #{hash} @ #{ts}: #{inspect(resp)}")
        image(conn, nil)
    end
  end

  def image(conn, _params) do
    conn
    |> put_status(302)
    |> redirect(to: @fallback_image_path)
    |> halt
  end

  defp supports_webp?(conn) do
    with ["" <> accept] <- get_req_header(conn, "accept") do
      String.contains?(accept, "image/webp")
    else
      _ -> false
    end
  end

  defp ffmpeg(hash, ts, webp) do
    ts = Video.Timestamp.from_milliseconds(ts)
    path = Path.join([Settings.video_target_dir_abs(), hash, @extract_from_file])

    System.cmd(
      "ffmpeg",
      [
        "-hide_banner",
        "-loglevel",
        "error",
        "-ss",
        ts,
        "-noaccurate_seek",
        "-i",
        path,
        "-qscale:v",
        if(webp, do: "20", else: "8"),
        "-frames:v",
        "1",
        "-f",
        if(webp, do: ["webp", "-preset", "photo"], else: "mjpeg"),
        "-"
      ]
      |> List.flatten()
    )
  end
end
