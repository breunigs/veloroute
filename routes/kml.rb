require 'time'

require_relative 'geo'

class KML
  def self.coords2trkseg(coords)
    trkpts = coords.map { |c| self.coord2trkpt(c) }
    <<~GPX
      <trkseg>
        #{trkpts.join("\n")}
      </trkseg>
    GPX
  end

  def self.coord2trkpt(coord)
    %|<trkpt lon="#{coord[0]}" lat="#{coord[1]}" />|
  end

  def self.from(track)
    header + metadata(track) + named_routes_gpx(track).join("\n") + footer
  end

  private

  def self.header
    <<~KML
      <?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
      <Document>
    KML
  end

  def self.footer
    "</Document></kml>"
  end

  def self.named_routes_gpx(track)
    track.named_routes.map do |nr|
      <<~KML
        <Placemark>
          <visibility>1</visibility>
          <open>1</open>
          <styleUrl>#route#{track.route.name}</styleUrl>
          <name>Veloroute #{track.route.name} #{nr[:text]}</name>
          <description>#{nr[:places].join(" → ")}</description>
          <LineString>
            <extrude>1</extrude>
            <tessellate>1</tessellate>
            <altitudeMode>clampToGround</altitudeMode>
            <coordinates>#{nr[:path].map { |c| c.join(",") }.join(" ")}</coordinates>
          </LineString>
        </Placemark>
      KML
    end
  end

  def self.metadata(track)
    route = track.route
    bounds = track.bounds
    # KML format: aabbggrr. Our format: #rrggbb
    color = 'FF' + route.color[1..-1].scan(/../).reverse.join.upcase
    <<~KML
      <name>#{track.name}</name>
      <description><![CDATA[<b>#{track.description}</b><br><br>Die Daten wurden aus der OpenStreetMap extrahiert und stehen unter der Open Database License (ODbL) zur Verfügung. Details: <a href="https://opendatacommons.org/licenses/odbl/summary/">https://opendatacommons.org/licenses/odbl/summary/</a>]]></description>
      <visibility>1</visibility>
      <open>1</open>
      <atom:author xml:lang="de">
         <atom:name>Stefan Breunig und OpenStreetMap Mitwirkende</atom:name>
         <atom:email>stefan-veloroute@breunig.xyz</atom:email>
         <atom:uri>https://veloroute.hamburg</atom:uri>
      </atom:author>
      <Style id="route#{track.route.name}">
        <LineStyle>
          <color>#{color}</color>
          <width>4</width>
        </LineStyle>
      </Style>
    KML
  end
end
