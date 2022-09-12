defmodule VelorouteWeb.ImageExtractController do
  use VelorouteWeb, :controller
  require Logger

  @extract_fallback_file "stream_0.m4s"
  @fallback_image_path "/images/video_poster.svg"

  import Guards

  def image(conn, %{"hash" => hash, "timestamp" => ts}) when valid_hash(hash) do
    with {ts_in_ms, ""} <- Integer.parse(ts),
         {:ok, ren} <- Video.Rendered.get_error(hash),
         true <- ren.length_ms() >= ts_in_ms,
         webp <- supports_webp?(conn),
         {:ok, img} <- ffmpeg(hash, ts_in_ms, webp) do
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
    key = "#{hash} #{ts} #{webp}"

    {cache_status, result} =
      Cachex.fetch(:image_extract_cachex, key, fn ->
        {elapsed, result} = :timer.tc(fn -> ffmpeg_no_cache(hash, ts, webp) end)
        Logger.debug("thumbnailing #{key} took #{elapsed / 1_000}ms")

        case result do
          {:ok, img} -> {:commit, {:ok, img}}
          other -> {:ignore, other}
        end
      end)

    # effectively make this a LRU
    if cache_status == :ok, do: Cachex.touch(:image_extract_cachex, key)

    result
  end

  @ffmpeg_path :os.find_executable('ffmpeg')
  @ffmpeg_timeout_ms 60_000
  defp ffmpeg_no_cache(hash, ts, webp) do
    ffmpeg_args =
      List.flatten([
        "-hide_banner",
        ["-loglevel", "error"],
        ["-ss", Video.Timestamp.from_milliseconds(ts)],
        "-noaccurate_seek",
        ["-i", find_best_video(hash)],
        ["-qscale:v", if(webp, do: "35", else: "8")],
        ["-frames:v", "1"],
        ["-c:v", if(webp, do: "webp", else: "mjpeg")],
        if(webp, do: ["-preset", "photo"], else: []),
        ["-f", "image2pipe"],
        "-"
      ])

    port =
      Port.open({:spawn_executable, @ffmpeg_path}, [
        :stream,
        :binary,
        {:args, ffmpeg_args},
        :use_stdio,
        :exit_status,
        {:parallelism, true}
      ])

    {:os_pid, ospid} = Port.info(port, :os_pid)
    {:ok, timer} = :timer.send_after(@ffmpeg_timeout_ms, {:abort_ffmpeg, ospid})

    collect_from_port(port, timer)
  end

  defp find_best_video(hash) do
    base = Path.join(Settings.video_target_dir_abs(), hash)

    with path = Path.join(base, "stream.m3u8"),
         {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens) do
      best = Enum.max_by(variants, & &1.bandwidth)
      IO.inspect(best)
      Path.join(base, String.replace(best.url, ".m3u8", ".m4s"))
    else
      _ ->
        Path.join(base, @extract_fallback_file)
    end
  end

  defp collect_from_port(port, timer, prev_data \\ []) do
    receive do
      {^port, {:data, data}} ->
        collect_from_port(port, timer, [data | prev_data])

      {^port, {:exit_status, 0}} ->
        :timer.cancel(timer)
        {:ok, Enum.reverse(prev_data)}

      {^port, {:exit_status, status}} ->
        :timer.cancel(timer)
        {:error, "ffmpeg exited with status #{status}"}

      {:abort_ffmpeg, ospid} ->
        res = System.cmd("kill", ["-9", to_string(ospid)])
        {:error, "timeout after #{@ffmpeg_timeout_ms}ms. Killed #{ospid}: #{inspect(res)}"}
    end
  end
end
