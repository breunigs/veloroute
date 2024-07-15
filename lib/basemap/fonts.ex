defmodule Basemap.Fonts do
  use Basemap.Renderable
  use Basemap.Servable

  @source "assets/map/fonts"

  @impl Basemap.Renderable
  def staleness(), do: Util.IO.staleness(assets_path(), [@source])

  @impl Basemap.Renderable
  def render() do
    File.rm_rf!(assets_path())
    File.mkdir_p!(assets_path())
    File.cp_r!(@source, assets_path())
    create_font_index()
    File.cp_r!(@source, assets_path())

    Util.Compress.file_glob(assets_path("**/*.pbf"), "basemap fonts",
      keep_source: false,
      keep_large_compressed: true
    )
  end

  @impl Basemap.Servable
  def fallback(),
    do:
      <<10, 31, 10, 18, 77, 101, 116, 114, 111, 112, 111, 108, 105, 115, 32, 82, 101, 103, 117,
        108, 97, 114, 18, 9, 49, 53, 51, 54, 45, 49, 55, 57, 49>>

  # only needed for editor
  def create_font_index do
    fonts =
      Path.join(@source, "*")
      |> Path.wildcard()
      |> Enum.filter(&File.dir?/1)
      |> Enum.map(&Path.basename/1)
      |> Jason.encode!()

    File.write!(assets_path() <> ".json", fonts)
  end
end
