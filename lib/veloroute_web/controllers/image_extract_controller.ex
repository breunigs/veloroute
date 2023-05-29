defmodule VelorouteWeb.ImageExtractController do
  use VelorouteWeb, :controller
  require Logger
  @fallback_image_path "/images/video_poster.svg"

  import Guards

  def image(conn, %{"hash" => hash, "timestamp" => ts}) when valid_hash(hash) do
    with {ts_in_ms, ""} <- Integer.parse(ts),
         {:ok, ren} <- Video.Generator.get_error(hash),
         true <- ren.length_ms() >= ts_in_ms,
         {format, header} <- image_support(conn),
         {:ok, img} <- ffmpeg(hash, ts_in_ms, format) do
      conn
      |> put_resp_content_type(header)
      |> maybe_block_indexing()
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

  defp maybe_block_indexing(conn) do
    with ["" <> agent] <- get_req_header(conn, "user-agent"),
         agent <- String.downcase(agent),
         true <- String.contains?(agent, "google") do
      put_resp_header(conn, "x-robots-tag", "noindex")
    else
      _ -> conn
    end
  end

  @spec image_support(any) :: {:webp | :jpeg, binary()}
  defp image_support(conn) do
    with ["" <> accept] <- get_req_header(conn, "accept"),
         formats <- Regex.scan(~r|image/[a-z]+|, accept) do
      Enum.find_value(formats, fn
        # ["image/avif"] -> {:avif, "image/avif"}
        ["image/webp"] -> {:webp, "image/webp"}
        _other -> nil
      end)
    else
      _ -> nil
    end || {:jpeg, "image/jpeg"}
  end

  defp ffmpeg(hash, ts, format) do
    key = "#{hash} #{ts} #{format}"

    {cache_status, result} =
      Cachex.fetch(:image_extract_cachex, key, fn ->
        {elapsed, result} = :timer.tc(fn -> ffmpeg_no_cache(hash, ts, format) end)

        case result do
          {:ok, img} ->
            Logger.debug("thumbnailing '#{key}' took #{elapsed / 1_000}ms")
            {:commit, {:ok, img}}

          other ->
            Logger.info("thumbnailing '#{key}' failed: #{inspect(other)}")
            {:ignore, other}
        end
      end)

    # effectively make this a LRU
    if cache_status == :ok, do: Cachex.touch(:image_extract_cachex, key)

    result
  end

  @ffmpeg_path :os.find_executable('ffmpeg')
  @ffmpeg_timeout_ms 60_000
  defp ffmpeg_no_cache(hash, ts, format) do
    source = Video.RenderedTools.highest_quality_video_file(hash)
    source_abs = Path.join(Settings.video_target_dir_abs(), source)

    ffmpeg_args =
      List.flatten([
        "-hide_banner",
        ["-loglevel", "error"],
        ["-ss", Video.Timestamp.from_milliseconds(ts)],
        "-noaccurate_seek",
        ["-i", source_abs],
        ["-frames:v", "1"],
        ffmpeg_format_args(format),
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

  # defp ffmpeg_format_args(:avif) do
  #   [
  #     ["-c:v", "libsvtav1"],
  #     ["-preset", "13"],
  #     ["-f", "image2pipe"]
  #   ]
  # end

  defp ffmpeg_format_args(:webp) do
    [
      ["-qscale:v", "35"],
      ["-c:v", "webp"],
      ["-preset", "photo"],
      ["-f", "image2pipe"]
    ]
  end

  defp ffmpeg_format_args(:jpeg) do
    [
      ["-qscale:v", "8"],
      ["-c:v", "mjpeg"],
      ["-f", "image2pipe"]
    ]
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
