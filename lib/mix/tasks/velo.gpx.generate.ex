defmodule Mix.Tasks.Velo.Gpx.Generate do
  use Mix.Task

  @out File.cwd!() <> "/priv/static/geo/"

  @shortdoc "Generate GPX files for the articles that have a matching relation in the map"
  def run(_) do
    Mix.Task.run("app.start")
    File.mkdir_p!(@out)

    Cache.Map.relations()
    |> Enum.flat_map(fn {_id, rel} ->
      case Map.Route.from_relation(rel) do
        {:ok, routes} ->
          routes

        {:error, msg} ->
          IO.puts(:stderr, "WARNING: #{msg}")
          []
      end
    end)
    |> Enum.group_by(fn route -> route.name end)
    |> Enum.each(fn {_name, routes} -> write(routes) end)
  end

  defp write(routes)
  defp write([]), do: nil

  defp write(routes) do
    routes_gpx = Enum.map(routes, &as_gpx_track/1)
    routes_kml = Enum.map(routes, &as_kml_track/1)

    base = Path.join(@out, hd(routes).name)
    File.write!("#{base}.gpx", gpx_wrapper(hd(routes), routes_gpx))
    File.write!("#{base}.kml", kml_wrapper(hd(routes), routes_kml))
  end

  defp kml_wrapper(route, routes_kml) do
    """
    <?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
      <Document>
      <name>#{route.group_title} – #{Settings.page_title_long()}</name>
      <visibility>1</visibility>
      <open>1</open>
      <atom:author xml:lang="de">
        <atom:name>#{Settings.feed_author()}</atom:name>
        <atom:uri>#{Settings.url()}</atom:uri>
      </atom:author>
      #{routes_kml |> Enum.join("\n\n")}
      </Document></kml>
    """
    |> String.trim()
  end

  defp gpx_wrapper(route, routes_gpx) do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <gpx xmlns="http://www.topografix.com/GPX/1/1" version="1.1">
    <metadata>
      <name>#{route.group_title} – #{Settings.page_title_long()}</name>
      <author>
        <name>#{Settings.feed_author()}</name>
        <link href="#{Settings.url()}"><text>#{Settings.page_title_long()}</text></link>
      </author>
      <link href="#{Settings.url()}/#{route.name}"><text>Detailseite zu dieser Veloroute</text></link>
      <time>#{DateTime.utc_now() |> DateTime.to_iso8601()}</time>
    </metadata>
    #{routes_gpx |> Enum.join("\n\n")}
    </gpx>
    """
    |> String.trim()
  end

  defp as_kml_track(%{route_title: name, nodes: nodes}) do
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

  defp as_gpx_track(%{route_title: name, nodes: nodes}) do
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
