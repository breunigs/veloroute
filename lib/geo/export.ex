defmodule Geo.Export do
  use Memoize

  @spec zip_all_gpx_kml() :: {:ok, filename :: binary(), zip :: binary()} | {:error, binary()}
  defmemo zip_all_gpx_kml() do
    meta = "#{Date.utc_today()}_#{Settings.r(:feed_author)}_all_gpx_kml"
    directory = Path.join([to_string(:code.priv_dir(:veloroute)), "static", "geo"])

    files =
      Path.join(directory, "*.{gpx,kml}")
      |> Path.wildcard()
      # ignore any cache busted asset compiles
      |> Enum.reject(&String.match?(&1, ~r/-[a-z0-9]{32}\.(kml|gpx)$/))
      |> Enum.map(&Path.basename/1)
      |> Enum.map(&to_charlist/1)

    zip_options = [
      :memory,
      {:comment, to_charlist(meta)},
      {:cwd, to_charlist(directory)}
    ]

    with {:ok, {_name, zip}} <- :zip.create(~c"#{meta}.zip", files, zip_options) do
      {:ok, "#{meta}.zip", zip}
    else
      {:error, reason} -> {:error, "#{inspect(reason)}"}
    end
  end

  def gpx_poly(coords) do
    coords |> Enum.map(&{&1.lon, &1.lat}) |> Polyline.encode(6) |> Polyline.decode(6) |> gpx()
  end

  @spec gpx([Geo.Point.like()] | Video.Rendered.polyline()) :: binary
  def gpx(coords) do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <gpx xmlns="http://www.topografix.com/GPX/1/1" version="1.1">
     <trk>
       <trkseg>#{as_gpx_track_points(coords)}</trkseg>
     </trk>
    </gpx>
    """
    |> String.trim()
  end

  defp as_gpx_track_points(coords) when is_list(coords) do
    Enum.map_join(coords, "\n", &coord2gpx/1)
  end

  defp as_gpx_track_points(%{polyline: poly, precision: precision}) do
    Enum.map_join(Polyline.decode(poly, precision), "\n", &coord2gpx/1)
  end

  defp coord2gpx(%{lat: lat, lon: lon}) do
    ~s(<trkpt lat="#{lat}" lon="#{lon}"></trkpt>)
  end

  defp coord2gpx({lon, lat}) do
    ~s(<trkpt lat="#{lat}" lon="#{lon}"></trkpt>)
  end
end
