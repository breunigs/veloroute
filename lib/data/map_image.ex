defmodule Data.MapImage do
  use VelorouteWeb, :verified_routes

  @type attribution :: {name :: binary(), link :: binary()}

  @type plain :: {binary(), attribution()} | {binary(), [attribution()]}
  @typep either :: nil | plain()

  @spec attribution(either()) :: [attribution()]
  def attribution(nil), do: []
  def attribution({_pmtiles_name, attribs}), do: List.wrap(attribs)

  def attribution(map_images) do
    map_images
    |> List.wrap()
    |> Enum.flat_map(&List.wrap(&1.attribution))
    |> Enum.uniq()
  end

  @spec for_frontend(either()) :: %{map_images: [map()]}
  def for_frontend(nil), do: %{map_images: []}

  def for_frontend({pm_tiles, attrib}),
    do: %{
      map_images: [
        %{
          "attribution" => attrib_to_link(attrib),
          "url" => url_path("#{pm_tiles}.pmtiles"),
          "pmtiles" => ~p"/assets/pmtiles.js"
        }
      ]
    }

  defp attrib_to_link(list) when is_list(list) do
    list |> Enum.map(&attrib_to_link/1) |> Enum.join(" | ")
  end

  defp attrib_to_link({attr_name, attr_link}) do
    ~s|<a href="#{attr_link}">#{attr_name}</a>|
  end

  defp url_path(name) do
    [
      # a hack, but it works for now
      Settings.r(:video_serve_host),
      Settings.r(:video_serve_path),
      "map_images",
      name
    ]
    |> Util.compact()
    |> Path.join()
  end
end
