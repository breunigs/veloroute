#!/usr/bin/env ruby

require 'json'
require 'open3'

warn "Paste GeoJSON below or pipe it in. Finish with CTRL+D or enough empty lines"


json = ""
empty = 0
ARGF.each_line do |l|
  if l == "\n"
    empty += 1
  else
    empty = 0
  end
  break if empty >= 4

  json << l.sub("\e[200~", '').sub("\e[201~", '')
end

coords = JSON.parse(json).dig("features", 0, "geometry", "coordinates")
coords << coords.first if coords.first != coords.last

as_polygon = {
  type: :Feature,
  geometry: {
    type: :Polygon,
    coordinates: [coords]
  }
}.to_json


GEOJSON_REWIND_PATH = File.expand_path(File.join(__dir__, "../node_modules/.bin/geojson-rewind"))
Open3.popen3(GEOJSON_REWIND_PATH) do |stdin, stdout, stderr, wait_thr|
  stdin.write(as_polygon)
  stdin.close

  warn stderr.read.strip

  json = stdout.read.strip
  coords = JSON.parse(json).dig("geometry", "coordinates", 0)
end

coords.map! { |c| "[#{c.first.round(6)},#{c.last.round(6)}]" }

puts
puts
puts
puts "[#{coords.join(",")}]"
