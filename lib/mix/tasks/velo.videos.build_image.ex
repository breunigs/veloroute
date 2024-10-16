defmodule Mix.Tasks.Velo.Videos.BuildImage do
  use Mix.Task
  @requirements ["app.start"]
  require Logger

  @shortdoc "Builds the Docker image with the ffmpeg required to render videos "
  def run(_) do
    case Util.Docker.build(Video.Renderer.ffmpeg_image()) do
      :ok -> :ok
      {:error, reason} -> Logger.error(reason)
    end
  end
end
