#!/usr/bin/env ruby

require "base64"
require "fileutils"
require "json"
require "parallel"
require "webcache"

CACHE = WebCache.new.tap { |c| c.life = 24*60*60 }

require_relative "geojson"
require_relative "relation"
require_relative "route"

Dir.chdir(__dir__)

REPLACE_NAMES = {
  'Hafen' => 'Reiherdamm',
  'Altona' => 'Altona-Altstadt',
  'Langenhorn' => 'Langenhorn Markt',
}

def build_map_geojsons(routes)
  collisions = Relation.build_collision_lookup(routes.map(&:relation))

  geojsons = routes.flat_map do |route|
    route.to_geojson(collisions)
  end
  File.write("geo_tmp/routes.geojson", GeoJSON.join(geojsons).to_json)

  markers = routes.flat_map(&:named_markers)
  File.write("geo_tmp/markers.json", markers.to_json)
end

def place_to_nominatim_query(place)
  search_name = REPLACE_NAMES[place] || place
  return search_name.gsub(/[()]/, '') if search_name.include?('(')
  search_name + ' Hamburg'
end

def resolve_names(routes)
  places = routes.flat_map(&:places_with_dir).uniq

  results = Parallel.map(places, in_processes: 4) do |place|
    url = "https://nominatim.openstreetmap.org/search/"
    url << URI.escape(place_to_nominatim_query(place))
    url << "?format=json&viewbox=9.7,53.3825092,10.3,53.7&bounded=1&limit=5"
    puts "Querying: #{url}"

    resp = JSON.parse(CACHE.get(url).to_s)
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

def render_abstract_routes(routes)
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

def build_image_lists(routes)
  images = routes.map do |route|
    [route.name, route.to_image_export]
  end.to_h.to_json
  File.write("geo_tmp/images.json", images)
end

SCSS_MUTEX = Mutex.new

# cleanup temp dir
FileUtils.rm_rf("geo_tmp")
FileUtils.mkdir_p "geo_tmp"

routes = JSON.parse(File.read("../routes.json"))
routes = routes.map { |route, details| Route.new(route, details) }

threads = []
threads << Thread.new { build_map_geojsons(routes) }
threads << Thread.new { resolve_names(routes) }
threads << Thread.new { render_abstract_routes(routes) }
threads << Thread.new { build_image_lists(routes) }
threads.each(&:join)

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
