# require_relative "route"
# require "json"
# routes = JSON.parse(File.read("../routes.json")); nil
# route = Route.new("1", routes["1"])
# File.write("icon/wtf.svg", route.to_svg)

require_relative "svg_pather"
require_relative "relation"
require_relative "geojson"


class Route
  def initialize(name, parsed_json)
    @name = name
    @parsed_json = parsed_json.freeze
    raise "only supports up to two route arms" if route_count > 2
  end

  attr_reader :name

  def relation
    @relation ||= Relation.new(relation_id)
  end

  def relation_id
    @parsed_json["relation_id"]
  end

  def color
    @parsed_json["color"]
  end

  def markers
    parsed_json["markers"].map do |mark|
      {lat: mark[0], lon: mark[1]}
    end.freeze
  end

  def places
    @parsed_json["places"].flatten.uniq.reject { |stop| is_dir?(stop) }.freeze
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

  def route_max_length
    @parsed_json["places"].map(&:size).max
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
        if is_dir?(left)
          # edge case: avoid splitting just to indicate a follow up location
          render_place_line(svg, :center, right, next_right)
          render_place_conn(svg, :center, place2route, :right, right)
          svg.conn(:center, :left)
        else
          svg.split
          dual = true

          svg.split_conn(:left) if has_conn?(place2route, left)
          svg.split_conn(:right) if has_conn?(place2route, right)
          svg.stop(:left) if next_left.nil? && !is_dir?(left)
          svg.stop(:right) if next_right.nil? && !is_dir?(right)
        end
      elsif dual
        render_place_line(svg, :left, left, next_left)
        render_place_conn(svg, :left, place2route, :left, left)

        render_place_line(svg, :right, right, next_right)
        render_place_conn(svg, :right, place2route, :right, right)
      elsif right
        render_place_line(svg, :center, right, next_right)
        # place conns on other side, since we have the space
        render_place_conn(svg, :center, place2route, :left, right)
      else
        render_place_line(svg, :center, left, next_left)
        # place conns on other side, since we have the space
        render_place_conn(svg, :center, place2route, :right, left)
      end

      svg.commit
    end
    svg.to_s
  end

  def to_html(place2route = {})
    html = <<~EOF
    <div id="desc#{name}" class="desc">
      <table class="routing">
        <tr>
          <td></td>
          <td rowspan="#{route_max_length+1}" style="background-image: url(routes/geo/route#{name}.svg)">
            <span class="icon icon#{name}">#{name}</span>
          </td>
          <td></td>
        </tr>
    EOF

    dual = false
    route_array.each.with_index do |row, idx|
      right, left = *row # switch order

      # edge case: avoid splitting just to indicate a follow up location
      dual ||= left && right unless is_dir?(left)

      left_conns = get_conn(place2route, left).map(&:to_html_icon).sort.join(" ")
      right_conns = get_conn(place2route, right).map(&:to_html_icon).sort.join(" ")

      # if we have the space, put crossing lines on the other side
      left_conns, right_conns = right_conns, "" if left.nil? && !dual
      right_conns, left_conns = left_conns, "" if right.nil? && !dual

      html << <<~EOF
        <tr>
          <td #{is_dir?(left) ? %|class="dir"| : ""}>#{left_conns} #{link left}</td>
          <td #{is_dir?(right) ? %|class="dir"| : ""}>#{link right} #{right_conns}</td>
        </tr>
      EOF
    end
    html << "</table></div>\n\n"
    html
  end

  def to_html_icon
    %|<a class="icon icon#{name}">#{name}</a>|
  end

  def to_css
    <<~CSS
      .icon#{name}, .route-icon#{name} {
        background: #{color};
      }
    CSS
  end

  def to_geojson(collisions)
    geojson = GeoJSON.new(relation: relation, route: self, collisions: collisions)
    geojson.to_geojson
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

  def get_conn(place2route, place)
    return [] unless place
    candidates = place2route[place] || []
    candidates = candidates.select { |route| route != self }
    # do not show connections for extremely well connected points (just Rathaus as of now)
    candidates.size >= 4 ? [] : candidates
  end

  def has_conn?(place2route, place)
    return false unless place
    get_conn(place2route, place).any?
  end

  def render_place_line(svg, pos, name, next_name)
    return if name.nil?
    svg.line(pos, is_dir?(name))
    svg.stop(pos) if next_name.nil? && !is_dir?(name)
  end

  def render_place_conn(svg, pos, place2route, dir, name)
    return unless has_conn?(place2route, name)
    svg.conn(pos, dir)
  end

  def link(name)
    return "" unless name
    %|<a>#{name}</a>|
  end
end
