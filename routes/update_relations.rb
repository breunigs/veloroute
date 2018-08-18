#!/usr/bin/env ruby

require "base64"
require "fileutils"
require "json"
require "parallel"

require_relative "geojson"
require_relative "gpx"
require_relative "relation"
require_relative "route"
require_relative "quality"
require_relative "web"

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

def build_quality(routes)
  quality_geojson = routes.flat_map(&:to_quality_geojson)
  File.write("geo_tmp/quality.geojson", GeoJSON.join(quality_geojson).to_json)

  quality_export = Parallel.map(routes) do |r|
    def print(*args); end # somehow segfaults when forked
    r.to_quality_export
  end.reduce {|a,b| Quality::GeoJSON.merge(a, b) }
  File.write("geo_tmp/quality_export.json", quality_export.to_json)
end

def place_to_nominatim_query(place)
  search_name = REPLACE_NAMES[place] || place
  return search_name.gsub(/[()]/, '') if search_name.include?('(')
  search_name + ' Hamburg'
end

def place2bbox(place)
  url = "https://nominatim.openstreetmap.org/search/"
  url << URI.escape(place_to_nominatim_query(place))
  url << "?format=json&viewbox=9.7,53.3825092,10.3,53.7&bounded=1&limit=5"

  resp = get(url)
  importance = resp.map { |e| e["importance"] }.max

  # combine bboxes with the same importance
  important_results = resp.take_while { |e| e["importance"] == importance }
  bboxes = important_results.map { |e| e["boundingbox"].map(&:to_f) }
  bbox_0 = bboxes.map { |bbox| bbox[0] }.min
  bbox_1 = bboxes.map { |bbox| bbox[1] }.max
  bbox_2 = bboxes.map { |bbox| bbox[2] }.min
  bbox_3 = bboxes.map { |bbox| bbox[3] }.max

  # switch order to MapboxGL one
  [bbox_2, bbox_0, bbox_3, bbox_1]
end

def resolve_names(routes)
  places = routes.flat_map(&:place_names_with_dir).uniq

  threads = []
  slice_size = (places.size / 2.0).ceil
  places.each_slice(slice_size) do |slice|
    threads << Thread.new do
      slice.map { |place| [place, place2bbox(place)] }
    end
  end.to_h
  results = threads.flat_map(&:value)

  File.write("geo_tmp/places.json", results.to_json)
end

def render_abstract_routes(routes)
  # build route connection lookup
  place2route = {}
  routes.each do |route|
    route.place_names.each do |place|
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
  debug = []
  images = routes.map do |route|
    debug << route.to_image_debug
    [route.name, route.to_image_export]
  end.to_h
  File.write("geo_tmp/images.json", images.to_json)
  File.write("geo_tmp/images_debug.geojson", GeoJSON.join(debug).to_json)
end

def check_relation_connected(routes)
  routes.each do |route|
    ok, err = route.relation.connected?
    next if ok
    warn "Route #{route.name} not connected apparently: #{err}"
  end
end

def write_gpx_files(routes)
  routes.each do |route|
    gpx = GPX.new(route).to_s
    File.write("geo_tmp/route#{route.name}.gpx", gpx)
  end
  out = `cd geo_tmp && zip -q -9 routen.zip *.gpx 2>&1`
  raise "failed to zip routes: #{out}" if $?.exitstatus != 0
end

SCSS_MUTEX = Mutex.new

# cleanup temp dir
FileUtils.rm_rf("geo_tmp")
FileUtils.mkdir_p "geo_tmp"

routes = JSON.parse(File.read("../routes.json"))
# run only for one route when just testing (mostly on Travis)
if ENV['TEST'] == 'yes' && ENV['PRODUCTION'] != 'yes'
  test_route = routes.keys.sample
  routes.select! { |k, _v| k == test_route }
end
routes = routes.map { |route, details| Route.new(route, details) }

tasks = %i[
  build_quality
  build_map_geojsons
  resolve_names
  render_abstract_routes
  build_image_lists
  check_relation_connected
  write_gpx_files
]
Parallel.each(tasks) do |task|
  def print(*args); end # somehow segfaults when forked
  send(task, routes)
end

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
