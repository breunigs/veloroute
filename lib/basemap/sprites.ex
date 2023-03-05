defmodule Basemap.Sprites do
  @dockerfile Path.join(__DIR__, "Dockerfile.spritezero")

  @ratios [1, 2]
  @icon_source "assets/map/icons"

  use Basemap.Renderable
  use Basemap.Servable

  @impl Basemap.Renderable
  def stale?() do
    stale_circles?() || stale_icons?() ||
      Util.IO.stale?(assets_path("sprite.json"), [target(:cache)])
  end

  defp stale_icons? do
    Util.IO.stale?(target(:cache), [@icon_source])
  end

  defp stale_circles?, do: missing_circles() != []

  def list_for_lua() do
    list =
      Path.wildcard("assets/map/icons/**/*.svg")
      |> Enum.map(&Path.basename(&1, ".svg"))
      |> Enum.map(&"\"#{&1}\"")
      |> Enum.join(", ")

    "Set {#{list}}"
  end

  @impl Basemap.Renderable
  def render() do
    File.rm_rf!(target(:cache))
    File.cp_r!(@icon_source, target(:cache))

    Enum.each(missing_circles(), fn {color, path} ->
      File.write!(path, circle(color))
    end)

    Docker.build(@dockerfile)

    File.mkdir_p!(assets_path())

    Enum.each(@ratios, fn ratio ->
      %{result: :ok} =
        Docker.run(
          @dockerfile,
          [
            "/target/",
            "/source/",
            "--unique",
            "--ratio=#{ratio}"
          ],
          name: "generating map image sprites",
          mounts: %{target(:cache) => "/source", assets_path() => "/target"}
        )
    end)

    Util.Compress.file_glob(assets_path("**/*.json"), true, "basemap sprites")
  end

  defp missing_circles do
    colors()
    |> Enum.map(fn color -> {color, Path.join(target(:cache), "circle_#{color}.svg")} end)
    |> Enum.reject(fn {_color, path} -> File.exists?(path) end)
  end

  defp circle("#" <> _rest = color) do
    """
    <svg viewBox="0 0 460.185 460.177" width="19.142" height="19.142" xmlns="http://www.w3.org/2000/svg"><circle style="opacity:1;fill:#{color};stroke:#fff;stroke-width:18.2788;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" cx="230.092" cy="230.088" r="220.953"/></svg>
    """
  end

  defp colors do
    Article.List.all() |> Enum.map(& &1.color()) |> Util.compact() |> Enum.uniq()
  end
end
