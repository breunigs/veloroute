#!/usr/bin/env ruby

require "base64"
require "digest"
require "fileutils"
require "json"
require "parallel"
require "yaml"

require 'i18n'
I18n.load_path << "translations.yml"
I18n.default_locale = :de

require_relative "geojson"
require_relative "mapillary"
require_relative "place"
require_relative "quality"
require_relative "relation"
require_relative "route"
require_relative "util"
require_relative "webpack_helper"

require_relative "gpx"
require_relative "kml"
require_relative "track"

Dir.chdir(__dir__)

CONTENT_HASHED_FILENAMES = {}
def write_with_hash(filename, content)
  hash = Digest::MD5.hexdigest(content)
  hashed_filename = filename.sub(/(\.[^.]+$)/, ".#{hash}.ch\\1")
  File.write("geo_tmp/#{hashed_filename}", content)
  CONTENT_HASHED_FILENAMES[filename] = hashed_filename
  hashed_filename
end

def build_map_geojsons(routes)
  collisions = Relation.build_collision_lookup(routes.map(&:relation))

  geojsons = routes.flat_map do |route|
    route.to_geojson(collisions)
  end
  write_with_hash("routes.geojson", GeoJSON.join(geojsons).to_json)

  markers = routes.flat_map(&:named_markers)
  File.write("geo_tmp/markers.json", markers.to_json)
end

def build_quality(routes)
  quality_geojson = routes.flat_map(&:to_quality_geojson)
  write_with_hash("quality.geojson", GeoJSON.join(quality_geojson).to_json)

  css = (1..5).map do |grade|
    <<~CSS
                  .shortcoming.grade#{grade} { background: #{Quality.grade2color(grade, :normal)} }
      .colorblind .shortcoming.grade#{grade} { background: #{Quality.grade2color(grade, :colorblind)} }
    CSS
  end.join("\n")
  File.write('geo_tmp/shortcomings.css', css)

  quality_export = Parallel.map(routes) do |r|
    def print(*args); end # somehow segfaults when forked
    r.to_quality_export
  end.reduce {|a,b| Quality::GeoJSON.merge(a, b) }
  File.write("geo_tmp/quality_export.json", quality_export.to_json)
end


def resolve_names(routes)
  shortcomings = YAML.load_file(File.join(__dir__, "..", "shortcomings.yaml"))
  places = shortcomings.values.flat_map do |s|
    _text, list = link_places(s["desc"])
    list
  end

  places += routes.flat_map(&:all_named_places)

  results = places.uniq.map do |place|
    [place.name, place.bbox]
  end.to_h
  File.write("geo_tmp/places.json", results.to_json)
end

def render_abstract_routes(routes)
  # build route connection lookup
  place2route = {}
  routes.each do |route|
    route.visited_places.map(&:to_s).each do |place|
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
  routes.each do |route|
    debug << route.to_image_debug
    data = route.to_image_export
    write_with_hash("images-#{route.name}.json", data.to_json)
  end

  quality = {}
  shortcomings = YAML.load_file(File.join(__dir__, "..", "shortcomings.yaml"))
  shortcomings.each do |name, details|
    quality[name] = Mapillary::ManualSequence.new(details["images"]).to_json_export
    details["desc"] = link_places(details["desc"])[0].to_s
  end
  write_with_hash("images-quality.json", quality.to_json)
  File.write('geo_tmp/shortcomings.json', shortcomings.to_json)
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
    File.write("geo_tmp/route#{route.name}.gpx", GPX.from(route.track))
    File.write("geo_tmp/route#{route.name}.kml", KML.from(route.track))
  end
  out = `cd geo_tmp && zip -q -9 routen.zip *.gpx *.kml 2>&1`
  raise "failed to zip routes: #{out}" if $?.exitstatus != 0
end

def write_rss(_routes)
  require_relative 'rss'
  File.write("geo_tmp/#{RSS::FILENAME}", RSS.build_atom)
  File.write("geo_tmp/recent_changes.html", RSS.build_html)
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

%i[
  build_quality
  build_map_geojsons
  resolve_names
  render_abstract_routes
  build_image_lists
  check_relation_connected
  write_gpx_files
  write_rss
].map do |task|
  Thread.new { send(task, routes) }
end.each(&:join)


preload_html = %|<link rel="preload" href="/routes/geo/#{CONTENT_HASHED_FILENAMES['routes.geojson']}" as="fetch" crossorigin="anonymous">|
(['quality'] + routes.map(&:name)).each do |name|
  fn = CONTENT_HASHED_FILENAMES["images-#{name}.json"]
  preload_html << only_if_current_route(name, %|<link rel="prefetch" href="/routes/geo/#{fn}">|)
end
File.write("geo_tmp/preload.html", preload_html)
File.write("geo_tmp/content_hashed_filenames.json", CONTENT_HASHED_FILENAMES.to_json)

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
