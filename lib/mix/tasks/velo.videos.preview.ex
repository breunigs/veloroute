defmodule Mix.Tasks.Velo.Videos.Preview do
  use Mix.Task
  @requirements ["app.start"]

  import Guards

  @video_player [
    "mpv",
    "--pause",
    "--no-resume-playback",
    "--force-window=immediate",
    "--framedrop=no",
    "--audio=no",
    "--keep-open=yes",
    "--demuxer-max-bytes=10G",
    "--force-seekable=no",
    "-"
  ]

  @shortdoc "Print commands to preview videos that are still missing. Set BLUR=1 to include blurs."
  def run(args) do
    Video.Dir.must_exist!()
    if args == [], do: list(), else: preview(args)
  end

  defp list do
    IO.puts("""
    You can specify not-yet-generated videos by name and index. For example, this will preview the
    first track of the given article:
    BLUR=1 MIX_QUIET=1 mix velo.videos.preview Data.Article.Static.Alltagsroute12 0 | #{Util.cli_printer(@video_player)}

    You can also preview later parts of the videos by specifying a timestamp like so:
    BLUR=1 MIX_QUIET=1 mix velo.videos.preview Data.Article.Static.Alltagsroute12 0 00:05:00.000
    BLUR=1 MIX_QUIET=1 mix velo.videos.preview b02ba2966179568a3307afb13cac6783     00:05:00.000

    Below any generated, but not rendered videos will be shown. If there are none, try running:
    mix velo.videos.generate new

    """)

    Video.Generator.pending()
    |> Enum.sort_by(& &1.name)
    |> Enum.each(fn rendered ->
      IO.puts("""

      #{rendered.name}
      BLUR=1 MIX_QUIET=1 mix velo.videos.preview #{rendered.hash} | #{Util.cli_printer(@video_player)}
      """)
    end)
  end

  defp preview([hash | tail]) when valid_hash(hash) do
    rendered = Video.Generator.find_by_hash(hash)

    if rendered == nil do
      IO.puts(:stderr, "No video with ”#{hash}“ found. Maybe try “mix velo.videos.generate”?")
    else
      stream_video(rendered, tail)
    end
  end

  defp preview(["Data.Article." <> _rest = in_art, in_index | tail] = args) do
    with mod = String.to_atom("Elixir." <> in_art),
         {:module, art} <- Code.ensure_compiled(mod),
         {index, ""} when index >= 0 <- Integer.parse(in_index),
         track when is_struct(track, Video.Track) <- Enum.at(art.tracks(), index) do
      track
      |> Video.Generator.dynamic_compile()
      |> stream_video(tail)
    else
      error ->
        IO.puts(
          :stderr,
          "failed to resolve args: #{inspect(args)}. One of the parsing steps returned: #{inspect(error)}"
        )

        exit({:shutdown, 1})
    end
  end

  defp preview(args) do
    IO.puts(
      :stderr,
      "cannot find video to review from params. Expected a [video_hash], or [module, index]. Got: #{inspect(args)}"
    )

    exit({:shutdown, 1})
  end

  defp stream_video(rendered, args) do
    blur = System.get_env("BLUR", nil) == "1"
    start_from = List.first(args)
    start_from_text = start_from || "the start"
    IO.puts(:stderr, "previewing #{rendered.hash()}: #{rendered.name()} from #{start_from_text}")
    cmd = Video.Renderer.preview_cmd(rendered, blur, start_from)

    Docker.build_and_run("tools/ffmpeg/Dockerfile.ffmpeg", cmd, name: "preview #{rendered.hash()}")
  end
end
