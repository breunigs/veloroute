defmodule Mix.Tasks.UpdateImages do
  use Mix.Task

  @imgpath File.cwd!() <> "/data/cache/images.osm"

  @shortdoc "Converts Mapillary sequence lists in data/images/ for viewing while editing"
  def run(_) do
    Mix.Task.run("app.start")

    osm =
      Data.ImageCache.images()
      |> Data.Image.as_osm()

    :ok = File.write(@imgpath, osm)
    IO.puts("Wrote #{@imgpath}")
    :ok
  end

  def imgpath, do: @imgpath
end
