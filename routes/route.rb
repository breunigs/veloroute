# require_relative "route"
# require "json"
# routes = JSON.parse(File.read("../routes.json")); nil
# route = Route.new("1", routes["1"])
# File.write("icon/wtf.svg", route.to_svg)

require_relative "svg_pather"

class Route
  def initialize(name, parsed_json)
    @name = name
    @parsed_json = parsed_json
    raise "only supports up to two route arms" if route_count > 2
  end

  attr_reader :name

  def relation_id
    @parsed_json["relation_id"]
  end

  def color
    @parsed_json["color"]
  end

  def markers
    parsed_json["markers"].map do |mark|
      {lat: mark[0], lon: mark[1]}
    end
  end

  def places
    @parsed_json["places"].flatten.uniq.reject { |stop| is_dir?(stop) }
  end

  def main_route
    @parsed_json["places"].first
  end

  def secondary_route
    @parsed_json["places"].last
  end

  def visits?(place)
    places.include?(place)
  end

  def route_count
    @parsed_json["places"].size
  end

  def route_array
    return main_route if route_count == 1
    main_route.zip(secondary_route).map do |row|
      row.first == row.last ? [row.first, nil] : row
    end
  end

  def to_svg(place2route = {})
    svg = SVGPather.new(color)
    dual = false
    route_array.each.with_index do |row, idx|
      right, left = *row # switch order
      next_right, next_left = *(route_array[idx + 1] || [nil, nil])
      if left && right && !dual
        svg.split
        dual = true

        svg.split_conn(:left) if has_conn?(place2route, left)
        svg.split_conn(:right) if has_conn?(place2route, right)
      elsif dual
        render_svg_part(svg, place2route, :left, :left, left, next_left)
        render_svg_part(svg, place2route, :right, :right, right, next_right)
      elsif right
        render_svg_part(svg, place2route, :center, :right, right, next_right)
      else
        render_svg_part(svg, place2route, :center, :left, left, next_left)
      end

      svg.commit
    end
    svg.to_s
  end

  def &(other_route)
    places & other_route.places
  end

  def ==(other_route)
    name == other_route.name
  end

  def is_dir?(place)
    place&.start_with?("(")
  end

  private

  def has_conn?(place2route, place)
    return false unless place
    candidates = place2route[place] || []
    candidates.any? { |route| route != self }
  end

  def render_svg_part(svg, place2route, pos, dir, name, next_name)
    return if name.nil?
    svg.line(pos, is_dir?(name))
    svg.stop(pos) if next_name.nil? && !is_dir?(name)
    svg.conn(pos, dir) if has_conn?(place2route, name)
  end
end
