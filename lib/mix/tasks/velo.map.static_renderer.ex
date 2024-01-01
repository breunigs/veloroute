defmodule Mix.Tasks.Velo.Map.StaticRenderer do
  use Mix.Task
  require Logger

  @requirements ["app.start"]
  @shortdoc "Builds the static renderer executable"
  def run(_) do
    Logger.info("building static renderer")

    case Basemap.Static.Exe.ensure() do
      {:error, reason} -> Logger.error(reason)
      :ok -> :ok
    end
  end
end
