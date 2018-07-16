require "open-uri"
require "nokogiri"
require "json"
require_relative "joiner"

class Relation

  INTERESTING_KEYS = %w[cycleway cycleway:both cycleway:both:smoothness cycleway:both:surface cycleway:both:width cycleway:left cycleway:left:smoothness cycleway:left:surface cycleway:left:width cycleway:right cycleway:right:smoothness cycleway:right:surface cycleway:right:width cycleway:smoothness cycleway:surface cycleway:width highway lit maxspeed oneway smoothness surface width].freeze

  COORDINATE_PRECISION = 6

  def self.build_collision_lookup(relations)
    collisions = Hash.new{|h,k| h[k] = [] }

    relations.each do |relation|
      relation.ways.each do |way|
        collisions[way[:id]] << relation.id
      end
    end

    collisions.delete_if { |_key, coll| coll.size <= 1 }
  end

  attr_reader :id

  def initialize(id)
    @id = id
    @xml_thread = Thread.new do
      x = ::Nokogiri::HTML(open(url))
      puts "XML loaded: #{url}"
      x
    end
  end

  def url
    "https://www.openstreetmap.org/api/0.6/relation/#{@id}/full"
  end

  def ways
    @ways ||= xml.xpath('//way').map do |way|
      {
        id: way.attr(:id),
        coords: coords(way),
        attrs: attrs(way),
        oneway: role(way) != ""
      }
    end
  end

  def nodes
    @nodes ||= begin
      h = {}
      xml.xpath('//node').each do |node|
        h[node.attr(:id)] = [node.attr(:lon).to_f, node.attr(:lat).to_f]
      end
      h
    end
  end

  def to_geojson(collisions = {})
    features = []

    # handle collisions
    groups = Hash.new{|h,k| h[k] = [] }
    ways.each do |way|
      coll = collisions[way[:id]]
      groups[compare(id, coll)] << way
    end

    # handle one ways
    groups.each do |offset, ways|
      oneways, bothways = *ways.partition { |way| way[:oneway] }

      features << to_geojson_feature(to_coord_array(oneways), offset: offset, oneway: true, pattern: '▶')
      features << to_geojson_feature(to_coord_array(bothways), offset: offset)
    end

    {
      type: "FeatureCollection",
      features: features
    }.to_json
  end

  private

  def compare(our_id, all_ids)
    return 0 if all_ids.nil? || all_ids.size >= 4
    offset = 0
    offset = -1 if all_ids.min == our_id
    offset = 1 if all_ids.max == our_id
    offset
  end

  def to_geojson_feature(arrOfCords, **properties)
    {
      type: "Feature",
      properties: properties,
      geometry: {
        type: "MultiLineString",
        coordinates: round_coords(arrOfCords)
      }
    }
  end

  def round_coords(arrOfCords)
    arrOfCords.map do |coords|
      coords.map do |coord|
        coord.map { |cc| cc.round(COORDINATE_PRECISION) }
      end
    end
  end

  def to_coord_array(ways)
    concatted = []
    arrOfCoords = ways.map { |w| w[:coords] }.freeze
    Joiner.join(arrOfCoords)
  end

  def xml
    @xml ||= @xml_thread.value
  end

  def role(way)
    xml.at_xpath("//relation/member[@ref=#{way.attr(:id)}]/@role").to_s
  end

  def reversed?(way)
    role(way) == "backward"
  end

  def coords(way)
    node_refs = way.xpath('nd')
    node_refs = reversed?(way) ? node_refs.reverse : node_refs
    coords = node_refs.map do |ref|
      nodes[ref.attr(:ref)]
    end
  end

  def attrs(way)
    way.xpath("tag").map do |tag|
      key = tag.attr(:k)
      next unless interesting_key?(key)
      [key, tag.attr(:v)]
    end.compact.to_h
  end


  def interesting_key?(key)
    INTERESTING_KEYS.include?(key)
  end
end
