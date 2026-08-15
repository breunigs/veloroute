defmodule Mix.Tasks.Velo.Videos.Preview do
  use Mix.Task
  @requirements ["app.start"]

  import Guards

  @shortdoc "Preview not yet rendered videos. Call without arguments for a list and help."
  def run(args) do
    Video.Dir.must_exist!()
    if args == [], do: list(), else: preview(args)
  end

  defp list do
    IO.puts("""

    ##############################################################################################
    Help
    ##############################################################################################

    You can specify not-yet-generated videos by name and index. The article can be given as a module
    name, file path, filename, or basename. For example, these are all equivalent:
    mix velo.videos.preview Data.Article.Static.Alltagsroute12 0
    mix velo.videos.preview data/articles/static/alltagsroute-12.ex 0
    mix velo.videos.preview alltagsroute-12.ex 0
    mix velo.videos.preview alltagsroute-12 0

    You can also preview later parts of the videos by specifying a timestamp like so:
    mix velo.videos.preview alltagsroute-12 0 00:05:00.000
    mix velo.videos.preview b02ba2966179568a3307afb13cac6783  00:05:00.000

    Below any generated, but not rendered videos will be shown. If there are none, try running:
    mix velo.videos.generate new

    ##############################################################################################
    Options (environment variables)
    ##############################################################################################

    VELO_BLUR=1                 also preview the detected blurs. Recommended off, since it is slow.
    VELO_DEWARP=0               Turn off fisheye lense dewarp for faster preview. Default on.
    VELO_BURN=0                 burn in filename of segment. Default on.
    VELO_HOST_FFMPEG=1          use ffmpeg executable from host. This is faster than running
                                ffmpeg in docker, but might fail depending on your ffmpeg build.
                                Recommended on if it works for you.
    VELO_PREVIEW_TOOL=<shell>   By default "mpv" is used. You can specify any shell command here
                                that can handle the video stream being piped to it. To save the
                                video into a file, use VELO_PREVIEW_TOOL="cat > somefile"
                                Recommendation is to install "mpv".

    ##############################################################################################
    Previews
    ##############################################################################################
    """)

    Video.Generator.pending()
    |> Enum.sort_by(& &1.name())
    |> Enum.each(fn rendered ->
      IO.puts("""
      # #{rendered.name()}
      mix velo.videos.preview #{rendered.hash()}
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

  defp preview([in_art, in_index | tail] = args) do
    with art when is_module(art) <- Article.List.resolve(in_art) || :not_found,
         {index, ""} when index >= 0 <- Integer.parse(in_index),
         track when is_struct(track, Video.Track) <- Enum.at(art.tracks(), index),
         mod when is_module(mod) <- Video.Generator.dynamic_compile(track) do
      stream_video(mod, tail)
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
      "cannot find video to preview from params. Expected a [video_hash], or [article, index]. Got: #{inspect(args)}"
    )

    exit({:shutdown, 1})
  end

  defp stream_video(rendered, args) when is_module(rendered) do
    blur = System.get_env("VELO_BLUR", nil) == "1"
    dewarp = System.get_env("VELO_DEWARP", "1") == "1"
    burn = System.get_env("VELO_BURN", "1") == "1"
    start_from = List.first(args)
    start_from_text = start_from || "the start"
    info = "previewing #{rendered.hash()} – #{rendered.name()} from #{start_from_text}"
    IO.puts(:stderr, info)
    cmd = Video.Renderer.preview_cmd(rendered, blur, dewarp, burn, start_from)

    if System.get_env("VELO_HOST_FFMPEG") == "1" do
      exec_pipe(cmd, info)
    else
      full_ref = {"preview video", Video.Renderer.ffmpeg_image()}

      with :ok <- Util.Docker.build(full_ref) do
        try do
          full_ref
          |> Util.Docker.run_docker_cli(%{
            mount_videos_in_dir: "/workdir",
            command_args: cmd,
            docker_args: ["--attach=STDERR", "--attach=STDOUT"]
          })
          |> exec_pipe(info)
        after
          Util.Docker.stop(full_ref)
        end
      else
        {:error, reason} -> IO.puts(:stderr, reason)
      end
    end
  end

  @spec exec_pipe([binary()], binary()) :: any
  defp exec_pipe(cmd, info) do
    default_player = Util.default_player_cmd(info) |> Util.cli_printer()
    player = System.get_env("VELO_PREVIEW_TOOL", default_player)

    Util.Cmd2.exec(["sh", "-c", "#{Util.cli_printer(cmd)} | #{player}"],
      slow_warn_message: false,
      stdout: :passthrough,
      stderr: :passthrough
    )
  end
end
