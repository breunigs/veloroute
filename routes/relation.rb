require "json"
require_relative "web"

class Relation
  INTERESTING_KEYS = %w[cycleway cycleway:both cycleway:both:smoothness cycleway:both:surface cycleway:both:width cycleway:left cycleway:left:smoothness cycleway:left:surface cycleway:left:width cycleway:right cycleway:right:smoothness cycleway:right:surface cycleway:right:width cycleway:smoothness cycleway:surface cycleway:width highway junction lit maxspeed name oneway smoothness surface width].freeze


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
      get_xml(url)
    end
  end

  def url
    "https://www.openstreetmap.org/api/0.6/relation/#{@id}/full"
  end

  def ways
    @ways ||= xml.xpath('//way').map do |way|
      attrs = attrs(way)
      {
        id: way.attr(:id),
        coords: coords(way),
        attrs: attrs,
        role: role(way),
        oneway: role(way) != "" || attrs["junction"] == "roundabout"
      }
    end
  end

  def nodes
    @nodes ||= begin
      h = {}
      xml.xpath('//node').each do |node|
        h[node.attr(:id)] = [node.attr(:lon).to_f, node.attr(:lat).to_f].freeze
      end
      h
    end
  end

  def connected?
    ra_url = "http://ra.osmsurround.org/analyzeRelation?relationId=#{id}"
    html = get_xml(ra_url)
    return true, nil if html.xpath('//div[@class="alert alert-success"]').size >= 1
    return false, html.xpath('//div[@class="alert"]').text
  end

  private

  def xml
    @xml ||= @xml_thread.value
  end

  def role(way)
    @roles ||= begin
      h = {}
      xml.xpath('//relation/member').map do |member|
        ref = member.attr('ref')
        role = member.attr('role')
        # support case where ways appear multiple times with different roles
        if h.has_key?(ref)
          h[ref] = "" if h[ref] != role
        else
          h[ref] = role
        end
      end
      h
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
