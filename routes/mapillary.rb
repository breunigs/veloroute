require_relative "geo"
require_relative "geojson"
require_relative "web"

require 'digest/md5'

module Mapillary
  API_URL = "https://a.mapillary.com/v3"
  API_KEY = "MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2"

  def self.query_private_api(query)
    escaped = URI.encode_www_form(client_id: API_KEY, paths: query, method: :get)
    get("#{API_URL}/model.json?#{escaped}", max_retries: 2)
  end

  def self.get_corrected_image_data(img_keys)
    res = query_private_api(%|[["imageByKey",#{img_keys.to_json},["cca","cl"]]]|)
    img_keys.map do |key|
      entry = res.dig("jsonGraph", "imageByKey", key)
      bearing = entry.dig("cca", "value")
      lonLat = [entry.dig("cl", "value", "lon"), entry.dig("cl", "value", "lat")]

      # most likely the image has been deleted in the meantime, but their cache is stale
      next if bearing.nil? || lonLat.any?(&:nil?)

      {key: key, bearing: bearing, lonLat: lonLat}
    end
  end

  def self.image_url(img_key)
    "https://d1cuyjsrcm0gby.cloudfront.net/#{img_key}/thumb-2048.jpg"
  end

  class ManualSequence
    def initialize(image_keys)
      @image_keys = image_keys
    end

    attr_reader :image_keys

    def to_json_export
      {
        keys: image_keys,
        loc: coords.zip(bearings).map(&:flatten)
      }
    end

    def bearings
      corrected_data.map { |c| c[:bearing].round }
    end

    def coords
      @coords ||= corrected_data.map { |c| GeoJSON.round_coord(c[:lonLat]) }
    end

    def ==(other)
      hash == other.hash
    end
    alias eql? ==

    def hash
      image_keys.map(&:hash).reduce { |h, x| h ^ x }
    end

    private

    def corrected_data
      @corrected_data ||= begin
        ::Mapillary.get_corrected_image_data(image_keys)
      end
    end
  end

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
      sequences.flat_map(&:bearings)
    end

    def coords
      sequences.flat_map(&:coords)
    end

    def closest_img(lonLat)
      dist = Float::INFINITY
      img = nil
      sequences.each do |s|
        newImg, newDist = s.closest_img(lonLat)
        next if newDist > dist
        dist = newDist
        img = newImg
      end

      return img, dist
    end

    def ==(other)
      hash == other.hash
    end
    alias eql? ==

    def hash
      list.map(&:hash).reduce { |h, x| h ^ x }
    end

    def sequences
      @sequences ||= begin
        list.map do |entry|
          Sequence.new(entry["seq"], entry["from"], entry["to"], reverse: entry["reverse"] || false)
        end
      end
    end
  end

  class Sequence
    def initialize(sequence_id, from, to, reverse:)
      @id = sequence_id
      @from = from
      @to =  to
      @reverse = reverse

      fetch_image_keys
    end

    attr_reader :id, :from, :to, :reverse

    def image_keys
      corrected_data.map { |d| d[:key] }
    end

    def bearings
      corrected_data.map { |d| d[:bearing].round }
    end

    def coords
      @coords ||= corrected_data.map { |d| GeoJSON.round_coord(d[:lonLat]) }
    end

    def closest_img(lonLat)
      closest, idx = Geo.closest_point_on_line(coords, lonLat)
      dist = Geo.point2point_dist(lonLat1: closest, lonLat2: lonLat)
      return image_keys[idx], dist
    end

    def details
      image_keys.zip(coords, bearings)
    end

    def to_geojson
      features = [line_as_geojson, first_marker, last_marker].compact
      return nil if features.empty?
      GeoJSON.to_feature_collection(features)
    end

    def public_url
      "#{API_URL}/sequences/#{id}?client_id=#{API_KEY}"
    end

    # format SE lonLat, NW lonLat as a single array
    def bbox
      @bbox ||= Geo.bbox(coords)
    end

    def ==(other)
      hash == other.hash
    end
    alias eql? ==

    def hash
      id.hash ^ from.hash ^ to.hash
    end

    private

    def line_as_geojson
      return nil if corrected_data.size <= 1
      rng = Random.new(Digest::MD5.hexdigest(id).to_i(16))
      {
        type: "Feature",
        properties: {
          sequence_id: id,
          color: '#' << ("%06x" % (rng.rand * 0xffffff))
        },
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
        id: rand(10000000000),
        properties: {
          sequence_id: id,
          image_key: image_keys.public_send(which),
          which: which
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
          ::Mapillary.get_corrected_image_data(img_keys)
        end.compact
      end
    end

    def image_keys_in_range
      from_idx = all_image_keys.index(from)
      to_idx = all_image_keys.index(to)
      raise "Sequence #{id} does not contain starting image #{from}" if from_idx.nil?
      raise "Sequence #{id} does not contain ending image #{to}" if to_idx.nil?
      raise "Sequence #{id} is out of order #{from} (#{from_idx}) is after #{to} (#{to_idx})" if from_idx > to_idx
      all_image_keys[from_idx..to_idx]
    end

    def fetch_image_keys
      data = get(public_url, max_retries: 2)
      @all_image_keys = data.dig("properties", "coordinateProperties", "image_keys")
      @all_image_keys = @all_image_keys.dup.reverse if reverse
      @all_image_keys
    rescue JSON::ParserError => e
      raise e unless e.message.downcase.include?("not found")
      # public API lags behind the private API for some days sometimes
      puts "…falling back to private API"
      res = Mapillary.query_private_api(%|[["sequenceByKey","#{id}",["keys"]]]|)
      @all_image_keys = res.dig("jsonGraph", "sequenceByKey", id, "keys", "value")
      raise "Private API doesn't know this sequence: #{id}" if @all_image_keys.nil? || @all_image_keys.empty?
    end
  end
end
