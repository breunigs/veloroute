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

    The final output is suitable for use in Video.Track.videos.

    Example:

        mix velo.videos.guess_merges 2020-01-01/GX0123 2020-01-01/GX0124 2020-01-01/GX0125
    """)
  end

  def run(args) do
    opts = Joiner.Options.new()

    Joiner.OpenAIClip.ensure_started()
    Joiner.Preview.prepare()

    Video.Dir.must_exist!(fn ->
      Joiner.Pipeline.run(args, opts)
    end)
  end
end
