defmodule Mix.Tasks.Velo.Docker.BuildDevel do
  use Mix.Task

  @shortdoc "Builds the image to run commands in. Only needs to be done once."
  def run(_) do
    Docker.build_devel_image()
  end
end

defmodule Mix.Tasks.Velo.Docker.BuildDetector do
  use Mix.Task

  @shortdoc "Builds the image to run the anonymization detector"
  def run(_) do
    Docker.build_detector_image()
  end
end

defmodule Mix.Tasks.Velo.Docker.Mix do
  use Mix.Task

  @shortdoc "Runs a mix command in Docker context"
  def run(args) do
    Docker.mix(args)
  end
end
