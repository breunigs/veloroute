require "nokogiri"
require "json"
require "webcache"

CACHE ||= WebCache.new

class Relation
  INTERESTING_KEYS = %w[cycleway cycleway:both cycleway:both:smoothness cycleway:both:surface cycleway:both:width cycleway:left cycleway:left:smoothness cycleway:left:surface cycleway:left:width cycleway:right cycleway:right:smoothness cycleway:right:surface cycleway:right:width cycleway:smoothness cycleway:surface cycleway:width highway lit maxspeed oneway smoothness surface width].freeze


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
      x = ::Nokogiri::HTML(CACHE.get(url).to_s)
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

  private

  def xml
    @xml ||= @xml_thread.value
  end

  def role(way)
    @roles ||= begin
      xml.xpath('//relation/member').map do |member|
        [member.attr('ref'), member.attr('role')]
      end.to_h
    end
    @roles[way.attr('id')]
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
