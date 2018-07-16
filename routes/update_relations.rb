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

def xml_name(route)
  "geo_tmp/route#{route}.xml.osm"
end

def geo_route_name(route)
  "geo_tmp/route#{route}.geojson"
end

def geo_icon_name(route)
  "geo_tmp/route#{route}.svg"
end

def geo_details_name(route)
  "geo_tmp/details#{route}.geojson"
end

def html_name
  "geo_tmp/path_render.html"
end

def download(route, relation_id)
  url = "https://www.openstreetmap.org/api/0.6/relation/#{relation_id}/full"
  puts "Querying: #{url}"
  xml = open(url)
  IO.copy_stream(xml, xml_name(route))
rescue OpenURI::HTTPError
  puts "Skipping route #{route}, couldn't download XML"
end

def glue(arr1, arr2)
  (arr1 + arr2[1..-1]).freeze
end

def gluable?(arr1, arr2)
  arr1.last == arr2.first
end

def naive_join(coords)
  concat = [coords.first.freeze]
  coords[1..-1].each do |line|
    prev = concat.last
    linerev = line.reverse

    if gluable?(prev, line)
      concat[-1] = glue(prev, line)
    elsif gluable?(line, prev)
      concat[-1] = glue(line, prev)
    elsif gluable?(prev, linerev)
      concat[-1] = glue(prev, linerev)
    elsif gluable?(linerev, prev)
      concat[-1] = glue(linerev, prev)
    else
      concat << line.freeze
    end
  end
  concat
end

MINIMAL_HEADER = %|{"type":"Feature","properties":{},"geometry":{"type":"MultiLineString","coordinates":|.freeze
MINIMAL_FOOTER = %|}}|.freeze
def simplify(geojson)
  parsed = JSON.parse(geojson)
  coords = parsed["features"][0]["geometry"]["coordinates"].freeze
  MINIMAL_HEADER + naive_join(coords).to_json + MINIMAL_FOOTER
end

def convert(route)
  return unless File.exist?(xml_name(route))
  cmd = "OSM_CONFIG_FILE=./osmconf.ini ogr2ogr -lco COORDINATE_PRECISION=6 -f GeoJSON"

  # extract relation as a single MultiLineString, then concat as much as possible
  rel = Relation.new(nil, File.read(xml_name(route)))
  File.write(geo_route_name(route), rel.to_geojson)

  # extract all OSM ways separately, including most of their features
  `#{cmd} "#{geo_details_name(route)}" "#{xml_name(route)}" lines 2>&1`
end

def update!(routes)
  routes.map do |route, details|
    download(route, details["relation_id"])
    convert(route)
  end
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

def resolve_names!(routes)
  places = routes.values.flat_map { |v| v["places"] }.flatten.uniq
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
  routes = routes.map { |route, details| Route.new(route, details) }

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
threads = []
threads << Thread.new do
  update!(routes)
  combine_details!(routes)
end
threads << Thread.new { resolve_names!(routes) }
threads << Thread.new { render_route!(routes) }
threads.each(&:join)

# swap old for new
FileUtils.mv "geo", "geo_old" if Dir.exist?("geo")
FileUtils.mv "geo_tmp", "geo"

# cleanup old
FileUtils.rm_rf("geo_old") if Dir.exist?("geo_old")
