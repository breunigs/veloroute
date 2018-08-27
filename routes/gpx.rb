require 'time'

require_relative 'geo'

module GPX
  def self.from(track)
    header + metadata(track) + named_routes_gpx(track).join("\n") + footer
  end

  private

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


  def self.header
    <<~GPX
      <?xml version="1.0" encoding="UTF-8"?>
      <gpx xmlns="http://www.topografix.com/GPX/1/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd" version="1.1" creator="veloroute.hamburg">
    GPX
  end

  def self.footer
    "</gpx>"
  end

  def self.named_routes_gpx(track)
    track.named_routes.map do |nr|
      <<~GPX
        <trk>
          <name>Veloroute #{track.route.name} #{nr[:text]}</name>
          <desc>#{nr[:places].join(" → ")}</desc>
          <src>OpenStreetMap</src>
          <type>Alltagsroute</type>
          #{coords2trkseg(nr[:path])}
        </trk>
      GPX
    end
  end

  def self.metadata(track)
    route = track.route
    bounds = track.bounds
    <<~GPX
      <metadata>
        <name>#{track.name}</name>
        <desc>#{track.description}</desc>
        <author>
          <name>Stefan Breunig und OpenStreetMap Mitwirkende</name>
          <email>stefan-veloroute@breunig.xyz</email>
          <time>#{Time.now.utc.xmlschema}</time>
          <link href="https://veloroute.hamburg">
            <text>https://veloroute.hamburg</text>
            <type>text/html</type>
          </link>
        </author>
        <copyright author="Die Daten wurden aus der OpenStreetMap extrahiert und stehen unter der Open Database License (ODbL) zur Verfügung. Details: https://opendatacommons.org/licenses/odbl/summary/" />
        <keywords>Veloroute Alltagsroute Hamburg Fahrradroute</keywords>
        <bounds minlat="#{bounds[:minlat]}" minlon="#{bounds[:minlon]}" maxlat="#{bounds[:maxlat]}" maxlon="#{bounds[:maxlon]}"/>
      </metadata>
    GPX
  end
end
