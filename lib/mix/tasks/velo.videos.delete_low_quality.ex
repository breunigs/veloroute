defmodule Mix.Tasks.Velo.Videos.DeleteLowQuality do
  use Mix.Task
  import Guards
  @requirements ["app.start"]

  @shortdoc "Remove low quality versions for given hash"
  def run([hash]) when valid_hash(hash) do
    Video.Dir.must_exist!()

    %{update: update, delete: delete} =
      Video.RenderedTools.keep_highest_quality_video_only_actions(hash)

    IO.puts("Would update these files:")
    Enum.each(update, fn {path, _val} -> IO.puts("  " <> path) end)

    IO.puts("Would DELETE these files:")
    Enum.each(delete, fn path -> IO.puts("  " <> path) end)

    if Cli.confirm("Make these modifications?", false) do
      Enum.each(update, fn {path, val} -> :ok = File.write(path, val) end)
      Enum.each(delete, fn path -> :ok = File.rm(path) end)
      IO.puts("Done\n")
    else
      IO.puts("Skipped\n")
    end
  end

  def run(args) do
    IO.puts(:stderr, """
    Specify a hash of the video where you want low quality variants to be removed.
    If you are not sure which hash, try

      mix velo.videos.unused

    instead. The following arguments were given:

      #{inspect(args)}
    """)
  end
end
