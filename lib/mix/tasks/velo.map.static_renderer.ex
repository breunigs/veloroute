defmodule Mix.Tasks.Velo.Map.StaticRenderer do
  use Mix.Task

  @requirements ["app.start"]
  @shortdoc "Builds the static renderer executable"
  def run(_) do
    IO.puts(:stderr, "building static renderer")
    Basemap.Static.Exe.ensure()
  end
end
