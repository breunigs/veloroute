defmodule Mix.Tasks.UpdateImages do
  use Mix.Task

  @imgpath File.cwd!() <> "/data/cache/images.osm"

  @shortdoc "Updates map.osm from images/ (using Mapillary)"
  def run(_) do
    osm =
      Data.images()
      |> Data.Image.as_osm()

    :ok = File.write(@imgpath, osm)
    IO.puts("Wrote #{@imgpath}")
  end
end
