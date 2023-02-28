defmodule Mix.Tasks.Velo.Map.Ensure do
  use Mix.Task

  @requirements ["app.start"]
  @shortdoc "Ensures the basemap exists"
  def run(_) do
    IO.puts(:stderr, "ensuring map tiles exists")
    Basemap.Servable.ensure()
  end
end
