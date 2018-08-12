require_relative "joiner"

class GeoJSON
  COORDINATE_PRECISION = 6

  def self.join(geojsons)
    features = geojsons.flat_map do |geojson|
      case geojson[:type]
      when "Feature"
        geojson
      when "FeatureCollection"
        geojson[:features]
      else raise "Cannot join, unknown GeoJSON type: #{geojson[:type]}"
      end
    end

    to_feature_collection(features)
  end

  def self.to_feature_collection(features)
    {
      type: "FeatureCollection",
      features: features
    }
  end

  def self.round_coords(arrOfCords)
    arrOfCords.map do |coords|
      coords.map do |coord|
        self.round_coord(coord)
      end
    end
  end

  def self.round_coord(coord)
    coord.map { |cc| cc.round(COORDINATE_PRECISION) }
  end

  def initialize(route:, relation:, collisions: {})
    @route = route
    @relation = relation
    @collisions = collisions
  end

  attr_accessor :collisions
  attr_reader :route, :relation

  def to_geojson
    features = []

    # handle collisions
    groups = Hash.new{|h,k| h[k] = [] }
    relation.ways.each do |way|
      groups[bucket_name(way)] << way
    end

    # handle one ways
    groups.each do |offset, ways|
      oneways, bothways = *ways.partition { |way| way[:oneway] }

      features << to_geojson_feature(to_coord_array(oneways, reversable: false), offset: offset, oneway: true, pattern: '▶')
      features << to_geojson_feature(to_coord_array(bothways, reversable: true), offset: offset)
    end

    self.class.to_feature_collection(features)
  end

  def compare(our_id, all_ids)
    return 0 if all_ids.nil?
    case all_ids.size
    when 2 then
      all_ids.min == our_id ? -1 : 1
    when 3 then
      return -2 if all_ids.min == our_id
      return 0 if all_ids.max == our_id
      2
    end
  end

  def bucket_name(way)
    coll = collisions[way[:id]]
    # Manage clutter around Rathausmarkt with many overlapping routes, but mostly
    # only for short parts and not really in a meaningful way.
    return "overflow" if coll&.size >= 4 || way[:attrs]["name"] == "Rathausmarkt"
    compare(relation.id, coll)
  end

  def to_geojson_feature(arrOfCords, **properties)
    props = {color: route.color, name: route.name}.merge(properties)
    props.merge!(color: "#000", offset: 0) if props[:offset] == "overflow"
    {
      type: "Feature",
      properties: props,
      geometry: {
        type: "MultiLineString",
        coordinates: self.class.round_coords(arrOfCords)
      }
    }
  end

  def to_coord_array(ways, reversable:)
    arrOfCoords = ways.map { |w| w[:coords] }.freeze
    Joiner.join(arrOfCoords, reversable: reversable)
  end
end
