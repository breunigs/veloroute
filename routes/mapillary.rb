require "json"
require "webcache"
require_relative "geojson"

CACHE ||= WebCache.new

module Mapillary
  API_URL = "https://a.mapillary.com/v3"
  API_KEY = "MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2"

  class StitchedSequence
    def initialize(list)
      @list = list
      prefetch
    end

    attr_reader :list

    def to_geojson
      GeoJSON.join(sequences.map(&:to_geojson).compact)
    end

    def to_json_export
      {
        keys: image_keys,
        loc: coords.zip(bearings).map(&:flatten)
      }
    end

    def image_keys
      sequences.flat_map(&:image_keys)
    end

    def bearings
      # XXX: these are not the corrected/auto-determined angles, so slightly
      # less accurate
      sequences.flat_map(&:bearings).map { |angle| angle.round }
    end

    def coords
      sequences.flat_map(&:coords)
    end

    private

    def prefetch
      sequences.map(&:url).uniq.each do |url|
        puts "Querying: #{url}"
        CACHE.get(url)
      end
    end

    def sequences
      @sequences ||= begin
        list.map do |entry|
          Sequence.new(entry["seq"], entry["from"], entry["to"])
        end
      end
    end
  end

  class Sequence
    def initialize(sequence_id, from, to)
      @id = sequence_id
      @from = from
      @to =  to
    end

    attr_reader :id, :from, :to

    def image_keys
      all_images[first_index..last_index]
    end

    def bearings
      all_bearings[first_index..last_index]
    end

    def coords
      GeoJSON.round_coords([all_coords[first_index..last_index]]).first
    end

    def to_geojson
      features = [line_as_geojson, first_marker, last_marker].compact
      return nil if features.empty?
      GeoJSON.to_feature_collection(features)
    end

    def url
      "#{API_URL}/sequences/#{id}?client_id=#{API_KEY}"
    end

    private

    def line_as_geojson
      return nil if coords.size <= 1
      {
        type: "Feature",
        properties: {sequence_id: id},
        geometry: {
          type: "LineString",
          coordinates: coords
        }
      }
    end

    def first_marker
      return nil if coords.empty?
      marker_as_geojson(first_index)
    end

    def last_marker
      return nil if coords.size <= 1
      marker_as_geojson(last_index)
    end

    def marker_as_geojson(index)
     {
        type: "Feature",
        properties: {
          sequence_id: id,
          index_in_seq: index,
          image_key: all_images[index],
          url: "https://www.mapillary.com/app/?pKey=#{all_images[index]}"
        },
        geometry: {
          type: "Point",
          coordinates: all_coords[index]
        }
      }
    end

    def all_images
      data.dig("properties", "coordinateProperties", "image_keys")
    end

    def all_bearings
      data.dig("properties", "coordinateProperties", "cas")
    end

    def all_coords
      data.dig("geometry", "coordinates")
    end

    def first_index
      all_images.index(from)
    end

    def last_index
      all_images.index(to)
    end

    def data
      @data ||= JSON.parse(CACHE.get(url).to_s)
    rescue JSON::ParserError => e
      warn "URL #{url} failed to parse: #{e}"
      raise e
    end
  end
end
