#!/usr/bin/env ruby

# required: /usr/bin/ogr2ogr from package gdal-bin
#           /usr/bin/brotli from package brotli
# sudo apt install gdal-bin brotli

require "open-uri"
require "json"
require "fileutils"

def xml_name(route)
  "geo_tmp/route#{route}.xml.osm"
end

def geo_route_name(route)
  "geo_tmp/route#{route}.geojson"
end

def geo_details_name(route)
  "geo_tmp/details#{route}.geojson"
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
  `#{cmd} "#{geo_route_name(route)}" "#{xml_name(route)}" multilinestrings 2>&1`
  `#{cmd} "#{geo_details_name(route)}" "#{xml_name(route)}" lines 2>&1`
  `brotli --best "#{geo_route_name(route)}" "#{geo_details_name(route)}"`
  `gzip -k --best "#{geo_route_name(route)}" "#{geo_details_name(route)}"`
end

def update!
  routes = JSON.parse(File.read("routes.json"))
  routes.map do |route, details|
    Thread.new do
      download(route, details["relation_id"])
      convert(route)
    end
  end.each(&:join)
end

# cleanup temp dir
FileUtils.rm_rf("geo_tmp")
FileUtils.mkdir_p "geo_tmp"

update!

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
