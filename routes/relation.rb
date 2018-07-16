require "open-uri"
require "nokogiri"
require "json"

class Relation

  INTERESTING_KEYS = %w[cycleway cycleway:both cycleway:both:smoothness cycleway:both:surface cycleway:both:width cycleway:left cycleway:left:smoothness cycleway:left:surface cycleway:left:width cycleway:right cycleway:right:smoothness cycleway:right:surface cycleway:right:width cycleway:smoothness cycleway:surface cycleway:width highway lit maxspeed oneway smoothness surface width].freeze

  COORDINATE_PRECISION = 6

  def initialize(id, xml = nil)
    @id = id
    @xml = ::Nokogiri::HTML(xml) if xml
  end

  def url
    "https://www.openstreetmap.org/api/0.6/relation/#{@id}/full"
  end

  def ways
    xml.xpath('//way').map do |way|
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

  def to_geojson
    oneways = to_coord_array(ways.select { |way| way[:oneway] })
    bothways = to_coord_array(ways.select { |way| !way[:oneway] })

    oneways = to_geojson_feature(oneways, oneway: true, pattern: '▶')
    bothways = to_geojson_feature(bothways)

    {
      type: "FeatureCollection",
      features: [oneways, bothways]
    }.to_json
  end

  private

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
    ways.each do |way|
      prev_end = concatted.last&.last
      new_start = way[:coords].first
      if prev_end == new_start
        concatted[-1] = concatted.last + way[:coords][1..-1]
      else
        concatted << way[:coords]
      end
    end
    concatted
  end

  def xml
    @xml ||= begin
      x = ::Nokogiri::HTML(open(url))
      puts "XML loaded: #{url}"
      x
    end
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
