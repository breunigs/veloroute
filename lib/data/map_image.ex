defmodule Data.MapImage do
  use VelorouteWeb, :verified_routes
  import Guards

  @empty %{attribution: nil, url: nil, loader_url: nil, show: false, zoom: true}

  @type attribution :: {name :: binary(), link :: binary()}

  @type plain :: {binary(), attribution()} | {binary(), [attribution()]}
  @typep either :: nil | plain()

  @spec attribution(either()) :: [attribution()]
  def attribution(nil), do: []
  def attribution({_pmtiles_name, attribs}), do: List.wrap(attribs)

  @spec for_frontend(either() | Article.t(), boolean(), boolean()) :: %{
          attribution: binary() | nil,
          url: binary() | nil,
          loader_url: binary() | nil,
          show: boolean(),
          zoom: boolean()
        }
  def for_frontend(nil, show, zoom), do: %{@empty | show: show, zoom: zoom}
  def for_frontend(_any, false, zoom), do: %{@empty | show: false, zoom: zoom}

  def for_frontend(art, show, zoom) when is_module(art),
    do: for_frontend(art.map_image(), show, zoom)

  def for_frontend({pm_tiles, attrib}, show, zoom),
    do: %{
      attribution: attrib_to_link(attrib),
      url: url_path("#{pm_tiles}.pmtiles"),
      loader_url: ~p"/assets/map_image.js",
      show: show,
      zoom: zoom
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
