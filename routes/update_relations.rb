#!/usr/bin/env ruby

# required: /usr/bin/ogr2ogr from package gdal-bin
# sudo apt install gdal-bin jq

require "open-uri"
require "json"
require "fileutils"
require "base64"

def xml_name(route)
  "geo_tmp/route#{route}.xml.osm"
end

def geo_route_name(route)
  "geo_tmp/route#{route}.geojson"
end

def geo_details_name(route)
  "geo_tmp/details#{route}.geojson"
end

def scss_name
  "geo_tmp/route-icon.scss"
end

def download(route, relation_id)
  xml = open("https://www.openstreetmap.org/api/0.6/relation/#{relation_id}/full")
  IO.copy_stream(xml, xml_name(route))
rescue OpenURI::HTTPError
  puts "Skipping route #{route}, couldn't download XML"
end

def convert(route)
  return unless File.exist?(xml_name(route))
  cmd = "OSM_CONFIG_FILE=./osmconf.ini ogr2ogr -lco COORDINATE_PRECISION=7 -f GeoJSON"
  `#{cmd} "#{geo_route_name(route)}.tmp" "#{xml_name(route)}" multilinestrings 2>&1`
  `#{cmd} "#{geo_details_name(route)}" "#{xml_name(route)}" lines 2>&1`
  `jq -c . "#{geo_route_name(route)}.tmp" > "#{geo_route_name(route)}"`
  File.delete(geo_route_name(route) << ".tmp")
end

def build_icon_scss(route, color)
  scss = ROUTE_ICONS.dup.gsub("__REPLACE_ROUTE__", route)
    .gsub(/url\(([^)]+\.svg)\)/) do
      b64icon = Base64.strict_encode64(File.read($1).strip.gsub("#000", color))
      'url("data:image/svg+xml;base64,' << b64icon << '")'
    end
  SCSS_MUTEX.synchronize do
    File.open(scss_name, "a") { |f| f.puts scss }
  end
end

def update!(routes)
  routes.map do |route, details|
    Thread.new do
      download(route, details["relation_id"])
      convert(route)
      build_icon_scss(route, details["color"])
    end
  end.each(&:join)
end

def combine_details!(routes)
  features = []
  routes.keys.each do |route|
    json = JSON.parse(File.read(geo_details_name(route)))
    features += json["features"].map do |feat|
      next if feat.dig("geometry", "type") != "LineString"
      {
        tags: feat.dig("properties"),
        geometry: feat.dig("geometry", "coordinates")
      }
    end.compact
  end
  filename = "geo_tmp/quality.json"
  File.write(filename, features.to_json)
end

def resolve_names!(routes)
  places = routes.values.flat_map { |v| v["places"] }.flatten.uniq
  lock = Mutex.new
  results = {}

  places.map do |place|
    Thread.new do
      url = "https://nominatim.openstreetmap.org/search/"
      url << URI.escape(place)
      url << "?format=json&viewbox=9.5732117,53.3825092,10.4081726,53.794973&bounded=1&limit=1"

      resp = JSON.parse(open(url).string)
      bbox = resp.dig(0, "boundingbox")&.map(&:to_f)
      warn "No entry found for #{place}" if not bbox

      lock.synchronize do
        results[place] = bbox
      end
    end
  end.each(&:join)

  File.write("geo_tmp/places.json", results.to_json)
end

def render_route!(routes)
  place2route = {}
  routes.each do |route, details|
    details["places"].flatten.uniq.each do |place|
      place2route[place] ||= []
      next if place.start_with?("(") # ignore directional places
      place2route[place] << route
    end
  end

  routes.each do |route, details|
    render = []
    places = details["places"]
    places[0].each.with_index do |r1, idx|
      render[idx] ||= {}
      render[idx][:r1] = r1
      render[idx][:l1] = place2route[r1] - [route]
    end
    places[1].each.with_index do |r2, idx|
      next if render[idx][:r1] == r2
      render[idx][:r2] = r2
      render[idx][:l2] = place2route[r2] - [route]
    end if places[1]

    puts "Route #{route}"
    had_2nd_route = false
    render.each do |line|
      if line[:r2]
        print line[:r2]
        if line[:l2].size.between?(1, 5)
          print line[:l2].join(" ")
          print " ┫"
        else
          print " ┃"
        end
        had_2nd_route = true
      elsif had_2nd_route
        print " \t"
      end

      print "┃ "
      print line[:r1]
      print "  "
      print line[:l1].join(" ") if line[:l1 ].size < 5
      puts
    end

    # pp render
  end
end

ROUTE_ICONS = File.read("icon.scss.tmpl").freeze
SCSS_MUTEX = Mutex.new

# cleanup temp dir
FileUtils.rm_rf("geo_tmp")
FileUtils.mkdir_p "geo_tmp"

routes = JSON.parse(File.read("../routes.json"))
threads = []
# threads << Thread.new do
#   update!(routes)
#   combine_details!(routes)
# end
# threads << Thread.new { resolve_names!(routes) }
threads << Thread.new { render_route!(routes) }
threads.each(&:join)

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
