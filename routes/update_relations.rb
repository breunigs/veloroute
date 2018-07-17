#!/usr/bin/env ruby

# required: /usr/bin/ogr2ogr from package gdal-bin
# sudo apt install gdal-bin jq

require "open-uri"
require "json"
require "fileutils"
require "base64"
require "parallel"
require_relative "route"
require_relative "relation"
require_relative "geojson"

Dir.chdir(__dir__)

REPLACE_NAMES = {
  'Hafen' => 'Reiherdamm',
  'Altona' => 'Altona-Altstadt',
  'Langenhorn' => 'Langenhorn Markt',
}

def update!(routes)
  collisions = Relation.build_collision_lookup(routes.map(&:relation))

  geojsons = routes.flat_map do |route|
    route.to_geojson(collisions)
  end

  File.write("geo_tmp/routes.geojson", GeoJSON.join(geojsons).to_json)
end

def place_to_nominatim_query(place)
  search_name = REPLACE_NAMES[place] || place
  return search_name.gsub(/[()]/, '') if search_name.include?('(')
  search_name + ' Hamburg'
end

def resolve_names!(routes)
  places = routes.flat_map(&:places_with_dir).uniq

  results = Parallel.map(places, in_processes: 4) do |place|
    url = "https://nominatim.openstreetmap.org/search/"
    url << URI.escape(place_to_nominatim_query(place))
    url << "?format=json&viewbox=9.7,53.3825092,10.3,53.7&bounded=1&limit=5"
    puts "Querying: #{url}"

    resp = JSON.parse(open(url).string)
    importance = resp.map { |e| e["importance"] }.max

    # combine bboxes with the same importance
    important_results = resp.take_while { |e| e["importance"] == importance }
    bboxes = important_results.map { |e| e["boundingbox"].map(&:to_f) }
    bbox_0 = bboxes.map { |bbox| bbox[0] }.min
    bbox_1 = bboxes.map { |bbox| bbox[1] }.max
    bbox_2 = bboxes.map { |bbox| bbox[2] }.min
    bbox_3 = bboxes.map { |bbox| bbox[3] }.max

    # switch order to MapboxGL one
    bbox = [bbox_2, bbox_0, bbox_3, bbox_1]

    [place, bbox]
  end.to_h

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
    File.write("geo_tmp/route#{route.name}.svg", svg)

    html = route.to_html(place2route)
    open('geo_tmp/path_render.html', 'a') { |f| f << html }
    open('geo_tmp/icons.css', 'a') { |f| f << route.to_css }
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
