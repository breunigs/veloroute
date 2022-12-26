defmodule Mix.Tasks.Velo.Videos.Detect do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Detects regions to anonymize and stores the results alongside the videos"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run() do
    Docker.build_detector_image()
    Docker.boot_detector()
  end
end
