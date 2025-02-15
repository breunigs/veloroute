defmodule Mix.Tasks.Velo.Videos.GuessMerges do
  use Mix.Task
  # import Guards
  require Logger
  @requirements ["app.start"]

  @shortdoc "Automatically find good merge points for given videos"
  def run([]) do
    IO.puts("""

    ##############################################################################################
    Help
    ##############################################################################################

    List all videos that should be merged in order. Videos will be processed pairwise.

    It will automatically find good merging points where the GPS tracks overlap or are close to
    each other and the refine for exact merging timestamps visually. You will be prompted for each
    merge at the end.

    Optionally timestamps may be given between paths, to limit the preceding video name. The first one is interpreted as a start point, the second one as an end point. Time identifiers can be:
    * start (for a start timestamp)
    * end (for end timestamp)
    * a fully qualified timestamp like 01:02:03.456 (HH:MM:SS.mmm format)
    * a duration like 1m30s or 90s or 1h90s32ms

    The final output is suitable for use in Video.Track.videos.

    Example:

        mix velo.videos.guess_merges 2020-01-01/GX0123 2020-01-01/GX0124 2020-01-01/GX0125

        mix velo.videos.guess_merges 2020-01-01/GX0123 start        00:02:34.567 \
                                     2020-01-01/GX0124 00:01:11.111              \
                                     2020-01-01/GX0125 37s
    """)
  end

  @env Application.compile_env(:veloroute, :env)
  if @env != :prod do
    def run(args) do
      opts = Joiner.Options.new()
      opts = %{opts | preview_blur: System.get_env("VELO_BLUR", nil) == "1"}
      opts = %{opts | preview_player_custom: System.get_env("VELO_PREVIEW_TOOL")}
      opts = %{opts | preview_use_host_ffmpeg: System.get_env("VELO_HOST_FFMPEG") == "1"}

      Joiner.OpenAIClip.ensure_started()
      Joiner.Preview.prepare()

      Video.Dir.must_exist!(fn ->
        Joiner.Pipeline.run(args, opts)
      end)
    end
  else
    def run(_args) do
      raise "Feature not available in #{@env}, use another MIX_ENV"
    end
  end
end
