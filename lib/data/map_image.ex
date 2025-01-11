defmodule Data.MapImage do
  use VelorouteWeb, :verified_routes

  @enforce_keys [:coordinates, :attribution, :path]
  defstruct @enforce_keys

  @type attribution :: {name :: binary(), link :: binary()}

  @type t :: %__MODULE__{
          coordinates: {
            topLeft :: Geo.Point.t(),
            topRight :: Geo.Point.t(),
            bottomRight :: Geo.Point.t(),
            bottomLeft :: Geo.Point.t()
          },
          attribution: [attribution()],
          path: binary()
        }

  @type plain :: {binary(), attribution()} | {binary(), [attribution()]}
  @typep either :: nil | t() | [t()] | plain()

  @spec attribution(either()) :: [attribution()]
  def attribution(nil), do: []
  def attribution({_pmtiles_name, attribs}), do: List.wrap(attribs)

  def attribution(map_images) do
    map_images
    |> List.wrap()
    |> Enum.flat_map(&List.wrap(&1.attribution))
    |> Enum.uniq()
  end

  import Guards

  @spec new(
          Article.t(),
          attribution :: attribution() | [attribution()],
          index :: non_neg_integer() | binary() | nil,
          {topLeft :: Geo.Point.like(), topRight :: Geo.Point.like(),
           bottomRight :: Geo.Point.like(), bottomLeft :: Geo.Point.like()}
        ) :: t()
  def new(art, attribution, index \\ nil, coordinates)

  def new(art, attribution, index, {tl, tr, br, bl})
      when is_module(art) do
    %__MODULE__{
      coordinates: {
        Geo.Point.from_params(tl),
        Geo.Point.from_params(tr),
        Geo.Point.from_params(br),
        Geo.Point.from_params(bl)
      },
      attribution: List.wrap(attribution),
      path: url_path("#{art.name()}#{if index, do: "_#{index}"}.webp")
    }
  end

  @spec for_frontend(either()) :: %{map_images: [map()]}
  def for_frontend(nil), do: for_frontend([])

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

  def for_frontend(%__MODULE__{} = map_image), do: for_frontend([map_image])

  def for_frontend(list) when is_list(list) do
    %{map_images: Enum.map(list, &for_frontend_single/1)}
  end

  defp for_frontend_single(%__MODULE__{
         coordinates: {tl, tr, br, bl},
         attribution: attrib,
         path: path
       }) do
    %{
      "attribution" => attrib_to_link(attrib),
      "url" => path,
      "coordinates" => [
        [tl.lon, tl.lat],
        [tr.lon, tr.lat],
        [br.lon, br.lat],
        [bl.lon, bl.lat]
      ]
    }
  end

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
