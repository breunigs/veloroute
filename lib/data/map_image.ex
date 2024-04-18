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
          {topLeft :: Geo.Point.like(), topRight :: Geo.Point.like(),
           bottomRight :: Geo.Point.like(), bottomLeft :: Geo.Point.like()}
        ) :: t()
  def new(art, {attr_name, attr_link}, {tl, tr, br, bl})
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
          art.name() <> ".webp"
        ]
        |> Util.compact()
        |> Path.join()
    }
  end

  @ident "map-image"

  @spec for_frontend(t()) :: map()
  def for_frontend(%__MODULE__{coordinates: {tl, tr, br, bl}, attribution: attrib, path: path}) do
    %{
      "ident" => @ident,
      "action" => "update",
      "attribution" => attrib,
      "source" => %{
        "type" => "image",
        "url" => path,
        "coordinates" => [
          [tl.lon, tl.lat],
          [tr.lon, tr.lat],
          [br.lon, br.lat],
          [bl.lon, bl.lat]
        ]
      },
      "layer" => %{
        "id" => @ident,
        "source" => @ident,
        "type" => "raster",
        "minzoom" => 14,
        "paint" => %{
          "raster-opacity" => ["interpolate", ["linear"], ["zoom"], 14, 0, 16, 1]
        }
      }
    }
  end

  def for_frontend(nil),
    do: %{
      "ident" => @ident,
      "action" => "delete"
    }
end
