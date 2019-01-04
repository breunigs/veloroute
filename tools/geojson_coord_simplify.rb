#!/usr/bin/env ruby

require 'json'

warn "Paste GeoJSON below or pipe it in. Finish with CTRL+D"

json = ARGF.read
coords = JSON.parse(json).dig("features", 0, "geometry", "coordinates")
coords.map! { |c| "[#{c.first.round(6)},#{c.last.round(6)}]" }

puts
puts
puts
puts "[#{coords.join(",")}]"
