defmodule Data.MapImage do
  @enforce_keys [:coordinates, :attribution, :path]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
          coordinates: {
            topLeft :: Geo.Point.t(),
            topRight :: Geo.Point.t(),
            bottomRight :: Geo.Point.t(),
            bottomLeft :: Geo.Point.t()
          },
          attribution: binary(),
          path: binary()
        }

  import Guards

  @spec new(
          Article.t(),
          attribution :: {binary(), binary()},
          index :: non_neg_integer() | binary() | nil,
          {topLeft :: Geo.Point.like(), topRight :: Geo.Point.like(),
           bottomRight :: Geo.Point.like(), bottomLeft :: Geo.Point.like()}
        ) :: t()
  def new(art, attribution, index \\ nil, coordinates)

  def new(art, {attr_name, attr_link}, index, {tl, tr, br, bl})
      when is_module(art) do
    %__MODULE__{
      coordinates: {
        Geo.Point.from_params(tl),
        Geo.Point.from_params(tr),
        Geo.Point.from_params(br),
        Geo.Point.from_params(bl)
      },
      attribution: ~s|<a href="#{attr_link}">#{attr_name}</a>|,
      path:
        [
          # a hack, but it works for now
          Settings.video_serve_host(),
          Settings.video_serve_path(),
          "map_images",
          "#{art.name()}#{if index, do: "_#{index}"}.webp"
        ]
        |> Util.compact()
        |> Path.join()
    }
  end

  @spec for_frontend(nil | t() | [t()]) :: %{map_images: [map()]}
  def for_frontend(%__MODULE__{} = map_image), do: for_frontend([map_image])
  def for_frontend(nil), do: for_frontend([])

  def for_frontend(list) when is_list(list) do
    %{map_images: Enum.map(list, &for_frontend_single/1)}
  end

  defp for_frontend_single(%__MODULE__{
         coordinates: {tl, tr, br, bl},
         attribution: attrib,
         path: path
       }) do
    %{
      "attribution" => attrib,
      "url" => path,
      "coordinates" => [
        [tl.lon, tl.lat],
        [tr.lon, tr.lat],
        [br.lon, br.lat],
        [bl.lon, bl.lat]
      ]
    }
  end
end
