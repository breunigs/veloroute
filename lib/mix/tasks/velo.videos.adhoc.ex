defmodule Mix.Tasks.Velo.Videos.Adhoc do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Print a bash script that renders an ad-hoc video the way production does"
  def run(args) do
    Video.Dir.must_exist!()
    if args == [], do: help(), else: generate(args)
  end

  defp help do
    IO.puts("""
    Specify which videos and desired parts like this:
    mix velo.videos.adhoc \\
      <video> <start> <end> \\
      <video> <start> <end> \\
      …

    e.g.
    mix velo.videos.adhoc \\
      2022-01-01/GX00001 start        00:00:16.683 \\
      2022-01-01/GX00002 00:00:01.123 end

    Prints a bash script. It renders one file per segment using the same
    filters, timings and frame rates the real renderer uses, then concatenates
    them, so the result matches what the site will play — including the variable
    frame rate of slowed stretches, which a single combined command cannot show.

    Pipe it to bash to run it:
      mix velo.videos.adhoc … | bash
    """)
  end

  defp generate(args) do
    sources =
      args
      |> Enum.chunk_every(3)
      |> Enum.map(fn [filename, start, stop] ->
        start =
          case start do
            "start" -> :start
            "seamless" -> :seamless
            o -> o
          end

        stop = if stop == "end", do: :end, else: stop
        {filename, start, stop}
      end)

    {dir, out, steps} = Video.Renderer.adhoc_cmds(sources)

    IO.puts(script(dir, out, steps))
  end

  defp script(dir, out, steps) do
    total = length(steps)

    renders =
      steps
      |> Enum.with_index(1)
      |> Enum.map_join("\n\n", fn {{label, _file, cmd}, idx} ->
        """
        echo '[#{idx}/#{total}] #{label}'
        #{Util.cli_printer(cmd)}\
        """
      end)

    list =
      Enum.map_join(steps, "\n", fn {_label, file, _cmd} -> "file '#{Path.basename(file)}'" end)

    """
    #!/bin/bash
    set -euo pipefail

    rm -rf #{dir} && mkdir -p #{dir}

    #{renders}

    cat > #{dir}/concat.txt <<'LIST'
    #{list}
    LIST

    echo '[concat] #{total} segments -> #{out}'
    #{Util.cli_printer(concat_cmd(dir, out))}

    echo
    echo 'done: #{out}'
    ffprobe -v error -select_streams v:0 \\
      -show_entries stream=avg_frame_rate,nb_frames,duration -of default=nw=1 #{out}
    """
  end

  # -c copy keeps the per segment timestamps, which is the whole point: a
  # re-encode here would resample the variable frame rate back to a constant one.
  defp concat_cmd(dir, out) do
    [
      "ffmpeg",
      "-hide_banner",
      "-loglevel",
      "error",
      "-f",
      "concat",
      "-safe",
      "0",
      "-i",
      "#{dir}/concat.txt",
      "-c",
      "copy",
      "-y",
      out
    ]
  end
end
