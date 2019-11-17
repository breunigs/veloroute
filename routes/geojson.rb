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

  def calc_collisions
    groups = Hash.new{|h,k| h[k] = [] }
    relation.ways.each do |way|
      groups[bucket_name(way)] << way
    end
    groups
  end

  def to_full_feature_list
    features = []
    qe = route.to_quality_export[:id2details]
    calc_collisions.each do |offset, ways|
      ways.each do |way|
        q = qe[way[:id]]

        props = {
          type: :route,
          color: route.color,
          name: route.name,
          oneway: only_used_as_oneway?(way),
          offset: offset,
          id: way[:id].to_s,
          # **q, # way quality details, currently not used
        }
        props.merge!(color: "#000", offset: 0) if offset == "overflow"

        features << {
          type: "Feature",
          properties: props,
          geometry: {
            type: "LineString",
            coordinates: way[:coords]
          }
        }
      end
    end
    self.class.to_feature_collection(features)
  end

  def to_geojson
    features = []

    # handle one ways
    calc_collisions.each do |offset, ways|
      oneways, bothways = *ways.partition { |way| only_used_as_oneway?(way) }

      features << to_geojson_feature(to_coord_array(oneways, reversable: false), offset: offset, oneway: true)
      features << to_geojson_feature(to_coord_array(bothways, reversable: true), offset: offset)
    end

    self.class.to_feature_collection(features)
  end

  def compare(our_id, all_ids)
    return 0 if all_ids.nil?
    case all_ids.size
    when 1 then 0
    when 2 then
      all_ids.min == our_id ? -1 : 1
    when 3 then
      return -2 if all_ids.min == our_id
      return 0 if all_ids.max == our_id
      2
    end
  end

  def only_used_as_oneway?(way)
    way[:oneway] && collisions.fetch(way[:id]).fetch(:only_oneway)
  end

  def bucket_name(way)
    coll = collisions.fetch(way[:id]).fetch(:relation_ids)
    # Manage clutter around Rathausmarkt with many overlapping routes, but mostly
    # only for short parts and not really in a meaningful way.
    return "overflow" if coll&.size >= 3 || way[:attrs]["name"] == "Rathausmarkt"
    compare(relation.id, coll) || raise("invalid comparison for offset/bucket name")
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
