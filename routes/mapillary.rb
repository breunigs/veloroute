require "json"
require_relative "geojson"
require_relative "web"


module Mapillary
  API_URL = "https://a.mapillary.com/v3"
  API_KEY = "MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2"

  class StitchedSequence
    def initialize(list)
      @list = list
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
      sequences.flat_map(&:bearings).map { |angle| angle.round }
    end

    def coords
      sequences.flat_map(&:coords)
    end

    private

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

      fetch_image_keys
    end

    attr_reader :id, :from, :to

    def image_keys
      corrected_data.map { |d| d[:key] }
    end

    def bearings
      corrected_data.map { |d| d[:bearing] }
    end

    def coords
      corrected_data.map { |d| GeoJSON.round_coord(d[:lonLat]) }
    end

    def to_geojson
      features = [line_as_geojson, first_marker, last_marker].compact
      return nil if features.empty?
      GeoJSON.to_feature_collection(features)
    end

    def public_url
      "#{API_URL}/sequences/#{id}?client_id=#{API_KEY}"
    end

    private

    def query_private_api(query)
      escaped = URI.escape(query, %|[],":|)
      private_api_url = %|#{API_URL}/model.json?client_id=#{API_KEY}&paths=#{escaped}&method=get|
      get(private_api_url)
    end

    def line_as_geojson
      return nil if corrected_data.size <= 1
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
      return nil if corrected_data.empty?
      marker_as_geojson(:first)
    end

    def last_marker
      return nil if corrected_data.size <= 1
      marker_as_geojson(:last)
    end

    def marker_as_geojson(which)
     {
        type: "Feature",
        properties: {
          sequence_id: id,
          image_key: image_keys.public_send(which),
          url: "https://www.mapillary.com/app/?pKey=#{image_keys.public_send(which)}"
        },
        geometry: {
          type: "Point",
          coordinates: coords.public_send(which)
        }
      }
    end

    attr_reader :all_image_keys

    def corrected_data
      @corrected_data ||= begin
        image_keys_in_range.each_slice(100).flat_map do |img_keys|
          res = query_private_api(%|[["imageByKey",#{img_keys.to_json},["cca","cl"]]]|)
          img_keys.map do |key|
            entry = res.dig("jsonGraph", "imageByKey", key)
            bearing = entry.dig("cca", "value")
            lonLat = [entry.dig("cl", "value", "lon"), entry.dig("cl", "value", "lat")]

            # most likely the image has been deleted in the meantime, but their cache is stale
            next if bearing.nil? || lonLat.any?(&:nil?)

            {key: key, bearing: bearing, lonLat: lonLat}
          end
        end.compact
      end
    end

    def image_keys_in_range
      from_idx = all_image_keys.index(from)
      to_idx = all_image_keys.index(to)
      raise "Sequence #{id} does not contain starting image #{from}" if from_idx.nil?
      raise "Sequence #{id} does not contain ending image #{to}" if to_idx.nil?
      all_image_keys[from_idx..to_idx]
    end

    def fetch_image_keys
      data = get(public_url)
      @all_image_keys = data.dig("properties", "coordinateProperties", "image_keys")
    rescue JSON::ParserError => e
      raise e unless e.message.downcase.include?("not found")
      # public API lags behind the private API for some days sometimes
      puts "…falling back to private API"
      res = query_private_api(%|[["sequenceByKey","#{id}",["keys"]]]|)
      @all_image_keys = res.dig("jsonGraph", "sequenceByKey", id, "keys", "value")
      raise "Private API doesn't know this sequence: #{id}" if @all_image_keys.nil? || @all_image_keys.empty?
    end
  end
end
