# require_relative "route"
# require "json"
# routes = JSON.parse(File.read("../routes.json")); nil
# route = Route.new("1", routes["1"])
# File.write("icon/wtf.svg", route.to_svg)

require_relative "svg_pather"

class Route
  def initialize(name, parsed_json)
    @name = name
    @parsed_json = parsed_json.freeze
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

  def to_html(place2route = {})
    html = <<~EOF
    <div id="desc#{name}" class="desc">
      <table class="routing">
        <tr>
          <td></td>
          <td rowspan="#{route_max_length}" class="bg#{name}"><span class="icon icon#{name}">#{name}</span></td>
          <td></td>
        </tr>
    EOF

    route_array.each.with_index do |row, idx|
      right, left = *row # switch order

      left_conns = get_conn(place2route, left).map(&:to_html_icon).sort.join(" ")
      right_conns = get_conn(place2route, right).map(&:to_html_icon).sort.join(" ")

      html << <<~EOF
        <tr>
          <td #{is_dir?(left) ? %|class="dir"| : ""}>#{left_conns} #{left}</td>
          <td #{is_dir?(right) ? %|class="dir"| : ""}>#{right} #{right_conns}</td>
        </tr>
      EOF
    end
    html << "</table></div>\n\n"
    html
  end

  def to_html_icon
    %|<a class="icon icon#{name}">#{name}</a>|
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
    candidates.select { |route| route != self }
  end

  def has_conn?(place2route, place)
    return false unless place
    get_conn(place2route, place).any?
  end

  def render_svg_part(svg, place2route, pos, dir, name, next_name)
    return if name.nil?
    svg.line(pos, is_dir?(name))
    svg.stop(pos) if next_name.nil? && !is_dir?(name)
    svg.conn(pos, dir) if has_conn?(place2route, name)
  end
end
