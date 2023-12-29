defmodule Mix.Tasks.Velo.Map.StaticRenderer do
  use Mix.Task

  @requirements ["app.start"]
  @shortdoc "Builds the static renderer executable"
  def run(_) do
    IO.puts(:stderr, "building static renderer")

    case Basemap.Static.Exe.ensure() do
      {:error, reason} -> IO.puts(:stderr, reason)
      :ok -> :ok
    end
  end
end
