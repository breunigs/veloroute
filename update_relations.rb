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

ROUTE_ICONS = File.read("route-icon.scss.tmpl").freeze
SCSS_MUTEX = Mutex.new

# cleanup temp dir
FileUtils.rm_rf("geo_tmp")
FileUtils.mkdir_p "geo_tmp"

routes = JSON.parse(File.read("routes.json"))
update!(routes)
combine_details!(routes)

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
