defmodule Mix.Tasks.UpdateGpx do
  use Mix.Task

  @out File.cwd!() <> "/assets/static/geo/"

  @shortdoc "Update GPX/KML tracks from map data."
  def run(_) do
    Mix.Task.run("app.start")

    Cache.Map.relations()
    |> Map.values()
    |> Enum.map(fn %Map.Relation{tags: tags} = rel ->
      art = Article.List.find_exact(tags[:name])

      if is_nil(art),
        do: raise("Relation either has no name, or nor article has that name: #{inspect(tags)}")

      {art, rel}
    end)
    |> Enum.map(fn {route, rel} ->
      tracks = TrackFinder.ordered(rel) |> TrackFinder.with_nodes()
      gpx_tracks = tracks |> Enum.map(&as_gpx_track(&1))
      kml_tracks = tracks |> Enum.map(&as_kml_track(&1))

      {route.name(), gpx_tracks, kml_tracks}
    end)
    |> Enum.group_by(&elem(&1, 0))
    |> Enum.map(fn {basename, routes} ->
      gpx_tracks = Enum.flat_map(routes, fn {_base, gpx_tracks, _kml} -> gpx_tracks end)
      kml_tracks = Enum.flat_map(routes, fn {_base, _gpx, kml_tracks} -> kml_tracks end)

      base = Path.join(@out, basename)
      File.write!("#{base}.gpx", gpx_wrapper(basename, gpx_tracks))
      File.write!("#{base}.kml", kml_wrapper(basename, kml_tracks))
    end)
  end

  defp kml_wrapper(basename, tracks) do
    """
    <?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
      <Document>
      <name>Route #{basename} – #{Settings.page_title_long()}</name>
      <visibility>1</visibility>
      <open>1</open>
      <atom:author xml:lang="de">
        <atom:name>#{Settings.feed_author()}</atom:name>
        <atom:uri>#{Settings.url()}</atom:uri>
      </atom:author>
      #{tracks |> Enum.join("\n\n")}
      </Document></kml>
    """
    |> String.trim()
  end

  defp gpx_wrapper(basename, tracks) do
    """
     <?xml version="1.0" encoding="UTF-8"?>
     <gpx xmlns="http://www.topografix.com/GPX/1/1" version="1.1">
     <metadata>
       <author>
         <name>#{Settings.feed_author()}</name>
         <link href="#{Settings.url()}"><text>#{Settings.page_title_long()}</text></link>
       </author>
       <link href="#{Settings.url()}/#{basename}"><text>Detailseite zu dieser Veloroute</text></link>
       <time>#{DateTime.utc_now() |> DateTime.to_iso8601()}</time>
     </metadata>
     #{tracks |> Enum.join("\n\n")}
     </gpx>
    """
    |> String.trim()
  end

  defp as_kml_track(%{full_name: name, nodes: nodes}) do
    """
      <Placemark>
        <visibility>1</visibility>
        <open>1</open>
        <name>#{name}</name>
        <LineString>
          <extrude>1</extrude>
          <tessellate>1</tessellate>
          <altitudeMode>clampToGround</altitudeMode>
          <coordinates>
            #{Enum.map(nodes, fn n -> "#{n.lon},#{n.lat}" end) |> Enum.join(" ")}
          </coordinates>
        </LineString>
      </Placemark>
    """
  end

  defp as_gpx_track(%{full_name: name, nodes: nodes}) do
    """
    <trk>
      <name>#{name}</name>
      <trkseg>#{as_gpx_track_points(nodes)}</trkseg>
    </trk>
    """
  end

  defp as_gpx_track_points(nodes) do
    nodes
    |> Enum.map(fn node ->
      ~s(<trkpt lat="#{node.lat}" lon="#{node.lon}"></trkpt>)
    end)
    |> Enum.join("\n")
  end
end
