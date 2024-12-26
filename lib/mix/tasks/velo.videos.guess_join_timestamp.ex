defmodule Mix.Tasks.Velo.Videos.GuessJoinTimestamp do
  use Mix.Task
  # import Guards
  require Logger
  @requirements ["app.start"]

  @shortdoc "Determine good/exact timestamp when to join two given videos"
  def run(args) do
    opts = Joiner.Options.new()

    Joiner.OpenAIClip.ensure_started()
    Joiner.Preview.prepare()

    Video.Dir.must_exist!(fn ->
      Joiner.Pipeline.run(args, opts)
    end)
  end
end
