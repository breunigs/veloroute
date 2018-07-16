#!/usr/bin/env ruby

# required: /usr/bin/ogr2ogr from package gdal-bin
# sudo apt install gdal-bin jq

require "open-uri"
require "json"
require "fileutils"
require "base64"
require_relative "route"
require_relative "relation"

Dir.chdir(__dir__)

def geo_route_name(route)
  "geo_tmp/route#{route.name}.geojson"
end

def geo_icon_name(route)
  "geo_tmp/route#{route}.svg"
end

def html_name
  "geo_tmp/path_render.html"
end

def update!(routes)
  collisions = Relation.build_collision_lookup(routes.map(&:relation))

  routes.each do |route|
    File.write(geo_route_name(route), route.relation.to_geojson(collisions))
  end
end

def resolve_names!(routes)
  places = routes.flat_map(&:places).uniq
  lock = Mutex.new
  results = {}

  places.map do |place|
    url = "https://nominatim.openstreetmap.org/search/"
    url << URI.escape(place)
    url << "?format=json&viewbox=9.5732117,53.3825092,10.4081726,53.794973&bounded=1&limit=1"
    puts "Querying: #{url}"

    resp = JSON.parse(open(url).string)
    bbox = resp.dig(0, "boundingbox")&.map(&:to_f)
    warn "No entry found for #{place}" if not bbox

    results[place] = bbox
  end

  File.write("geo_tmp/places.json", results.to_json)
end

def render_route!(routes)
  # build route connection lookup
  place2route = {}
  routes.each do |route|
    route.places.each do |place|
      place2route[place] ||= []
      place2route[place] << route
    end
  end

  routes.map do |route|
    svg = route.to_svg(place2route)
    File.write(geo_icon_name(route.name), svg)

    html = route.to_html(place2route)
    open(html_name, 'a') { |f| f << html }
  end
end

SCSS_MUTEX = Mutex.new

# cleanup temp dir
FileUtils.rm_rf("geo_tmp")
FileUtils.mkdir_p "geo_tmp"

routes = JSON.parse(File.read("../routes.json"))
routes = routes.map { |route, details| Route.new(route, details) }

threads = []
threads << Thread.new { update!(routes) }
threads << Thread.new { resolve_names!(routes) }
threads << Thread.new { render_route!(routes) }
threads.each(&:join)

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
