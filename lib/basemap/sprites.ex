defmodule Basemap.Sprites do
  @dockerfile Path.join(__DIR__, "Dockerfile.spritezero")

  @ratios [1, 2]
  @icon_source "assets/map/icons"

  use Basemap.Renderable
  use Basemap.Servable

  @impl Basemap.Renderable
  def stale?() do
    stale_auto_generated?() || stale_icons?() ||
      Util.IO.stale?(assets_path("sprite.json"), [target(:cache)])
  end

  defp stale_icons? do
    Util.IO.stale?(target(:cache), [@icon_source])
  end

  defp stale_auto_generated?, do: missing_auto_generated() != []

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

    Enum.each(missing_auto_generated(), fn {path, icon} ->
      File.write!(path, icon)
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

  defp generate_icon(:alltag, "#" <> _rest = color) do
    # circle
    """
    <svg viewBox="0 0 460.185 460.177" width="19.142" height="19.142" xmlns="http://www.w3.org/2000/svg"><circle style="opacity:1;fill:#{color};stroke:#fff;stroke-width:18.2788;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" cx="230.092" cy="230.088" r="220.953"/></svg>
    """
  end

  defp generate_icon(:bezirk, "#" <> _rest = color) do
    # crest
    """
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 460.177 460.177" width="25" height="22"><path fill="#{color}" stroke="#fff" stroke-width="23.006" d="M41.03 60.394h378.09v171.798c0 90.833-99.024 168.04-189.045 168.04-90.022 0-189.045-77.207-189.045-168.04z"/></svg>
    """
  end

  defp generate_icon(_group, _color), do: nil

  defp missing_auto_generated do
    Enum.reject(auto_generated_icons(), fn {path, _icon} -> File.exists?(path) end)
  end

  defp auto_generated_icons do
    Article.List.all()
    |> Enum.map(&{&1.route_group(), &1.color()})
    |> Enum.uniq()
    |> Enum.map(fn {group, color} ->
      path = Path.join(target(:cache), "#{group}_#{color}.svg")
      icon = generate_icon(group, color)
      {path, icon}
    end)
    |> Enum.reject(fn {_path, icon} -> is_nil(icon) end)
  end
end
