defmodule Joiner.FfmpegMetrics do
  @type metric :: :psnr | :ssim | :xpsnr
  require Logger

  @doc """
  Calculates the metric for every frame combination of the given videos. The
  videos are resized keeping the aspect ratio. On success, the output is
  formatted like this:

      {:ok, [
        [v1frame1 vs v2frame1, v1frame1 vs v2frame2, v1frame1 vs v2frame3, …]
        [v1frame2 vs v2frame1, v1frame2 vs v2frame2, v1frame2 vs v2frame3, …]
        …
      ]}
  """
  @spec calculate(Joiner.Segment.t(), Joiner.Options.t()) ::
          {:error, binary()} | {:ok, list(list(float()))}
  def calculate(segment, opts) do
    path1 = Joiner.Segment.video_path(segment, :from)
    path2 = Joiner.Segment.video_path(segment, :to)

    start2 = Joiner.Segment.start_timestamp(segment, :to)

    frames1 = Joiner.Segment.frame_count_between(segment, :from)
    frames2 = Joiner.Segment.frame_count_between(segment, :to)

    parallel({segment.from, path1, frames1}, {path2, start2, frames2}, opts)
  end

  @min_outer_video_loop 15

  # only XPSNR is parallelized because the other algorithms are SIMD optimized
  # and utilize the CPU perfectly
  defp parallel({video1, path1, frames1}, v2, %{visual_compare_metric: :xpsnr} = opts) do
    cpus = round(System.schedulers_online() / 2.0)
    interval = max(@min_outer_video_loop, ceil(frames1 / cpus))

    offsets = 0..frames1//interval |> Enum.reverse()
    Logger.debug("parallelizing metric calculation on #{length(offsets)} ffmpeg instances")

    offsets
    |> Parallel.map(fn offset ->
      substart1 = Joiner.Video.offset_start_timestamp(video1, offset, :frames)
      subframes1 = min(interval, frames1 - offset)
      ffmpeg({path1, substart1, subframes1}, v2, opts)
    end)
    |> Enum.reduce_while({:ok, []}, fn
      {:ok, part}, {:ok, whole} -> {:cont, {:ok, part ++ whole}}
      {:error, reason}, _whole -> {:halt, {:error, reason}}
    end)
  end

  defp parallel({video1, path1, frames1}, v2, opts) do
    start1 = Joiner.Video.offset_start_timestamp(video1, 0, :frames)
    ffmpeg({path1, start1, frames1}, v2, opts)
  end

  defp ffmpeg({path1, start1, frames1}, {path2, start2, frames2}, opts) do
    {mf, extra_frames} = metric_filters(opts)

    cmd =
      [
        "ffmpeg",
        "-hide_banner",
        "-an",
        ["-loglevel", "error"],
        ["-ss", start1],
        ["-i", path1],
        ["-ss", start2],
        ["-i", path2],
        "-filter_complex",
        Enum.join(
          [
            "[0:v]scale=-1:#{opts.visual_image_height},settb=1/30,setpts=N*#{frames2},fps=30#{mf}[v1]",
            "[1:v]scale=-1:#{opts.visual_image_height},settb=1/30,loop=loop=#{frames1 - 1}:size=#{frames2},setpts=N,fps=30#{mf}[v2]",
            "[v1][v2]#{opts.visual_compare_metric}=stats_file=-:shortest=1"
            # debug (remove metric calc above):
            # "[v1][v2]vstack"
          ],
          ";"
        ),
        ["-frames:v", "#{frames1 * frames2 + extra_frames}"],
        ["-f", "null"],
        "-"
        # debug (remove previous two output lines):
        # ["-c:v", "ffv1", "-y", "debug_guess_join_timestamp.mkv"]
      ]
      |> List.flatten()

    #  Logger.debug(Util.cli_printer(cmd))

    with %{result: :ok, stdout: stdout} <-
           Util.Cmd2.exec(cmd,
             stdout: "",
             stderr: "",
             name: "ffmpeg #{opts.visual_compare_metric}",
             slow_warn_message: false
           ) do
      results =
        stdout
        |> String.split("\n", trim: true)
        |> Enum.map(&parse_line(&1, opts.visual_compare_metric))
        |> Util.compact()
        |> Enum.chunk_every(frames2, frames2)

      {:ok, results}
    else
      %{stderr: stderr} when stderr != "" ->
        {:error, "ffmpeg error:\nCLI: #{Util.cli_printer(cmd)}\nSTDERR: #{stderr}"}

      output ->
        {:error,
         "unexpected ffmpeg output:\nCLI: #{Util.cli_printer(cmd)}\noutput #{inspect(output)}"}
    end
  end

  # XPSNR hack: XPSNR uses a temporal high pass filter that looks at the
  # previous frame (at <= 30fps) or previous two frames (at > 30fps).
  # Technically our loop with a slow video1 and a hot video2 results in
  # incorrect results, since we don't compare frames in the same order as they'd
  # appear in a real video. To account for the initial frame(s) getting
  # different results, we'd need to start the XPSNR algorithm from scratch for
  # every potential frame combination. Since this is effort to implement, and
  # the results seem to be "good enough" regardless, I opt to keep using the
  # filter incorrectly.
  #
  # This hack duplicates the very first frame(s), which we measure twice and
  # discard the first result. This ensures that the first frame gets similar
  # values as the other frames. It also allows parallelizing ffmpeg processing
  # by time splits, without the results being vastly different.
  defp metric_filters(%{visual_compare_metric: :xpsnr}), do: {",loop=loop=1:size=1:start=0", 1}
  defp metric_filters(_), do: {nil, 0}

  @spec parse_line(binary(), metric()) :: float()
  defp parse_line(line, :ssim) do
    line |> String.split() |> Enum.at(-2) |> String.slice(4..-1//1) |> String.to_float()
  end

  defp parse_line(line, :psnr) do
    line
    |> String.split(" ")
    |> Enum.find(&String.starts_with?(&1, "psnr_avg:"))
    |> String.slice(9, 10)
    |> String.to_float()
  end

  # Example (last line):
  # XPSNR average, 57360 frames  y: 4.4812
  defp parse_line("XPSNR average" <> _rest, :xpsnr), do: nil

  # Example (first line/comparison, see XPSNR HACK)
  # n:    1  XPSNR y: 16.1775  XPSNR u: 32.3777  XPSNR v: 33.9417
  defp parse_line("n:    1  XPSNR" <> _rest, :xpsnr), do: nil

  # Example (typical line):
  # n:    2  XPSNR y: 0.8254  XPSNR u: 16.6036  XPSNR v: 18.8158
  defp parse_line(line, :xpsnr) do
    Regex.scan(~r/XPSNR \w: (?<d>[0-9.]+)/, line, capture: ["d"])
    |> List.flatten()
    |> Enum.map(&String.to_float/1)
    |> Enum.sum()
  end
end
