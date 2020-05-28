#!/usr/bin/env ruby

require 'rgeo'
require 'rgeo/geo_json'

path = File.dirname(__FILE__)

if ARGV.size != 2
  warn "Usage: #{__FILE__} lon lat"
  exit 1
end

factory = RGeo::Geographic.simple_mercator_factory
suburbs = RGeo::GeoJSON.decode(File.read(File.join(path, "stadtteile_hamburg.geojson")))

coord = factory.point(ARGV[0].to_f, ARGV[1].to_f)

matching = suburbs.select do |s|
  coord.within?(s.geometry)
end

if matching.size == 1
  puts matching.first.properties['name']
else
  warn "Found none or multiple matches:"
  matching.each { |m| puts m.properties['name'] }
  exit 1
end
