require 'time'

require_relative 'geo'

class Track
  def self.coords2trkseg(coords)
    trkpts = coords.map { |c| self.coord2trkpt(c) }
    <<~GPX
      <trkseg>
        #{trkpts.join("\n")}
      </trkseg>
    GPX
  end

  def self.coord2trkpt(coord)
    %|<trkpt lon="#{coord[0]}" lat="#{coord[1]}" />|
  end

  def initialize(route)
    @route = route
    index_relation
  end

  attr_reader :route

  def named_routes
    @named_routes ||= route.gpx.flat_map do |info|
      normal = find_path(from: info[:from], to: info[:to])
      reverse = find_path(from: info[:to], to: info[:from])

      raise "failed to find path for route=#{route.name} (#{info}). Is the relation complete?" unless normal && normal.size > 0
      raise "failed to find reverse path for route=#{route.name} (#{info}). Is the relation complete?" unless reverse && reverse.size > 0

      [
        {text: info[:text],     path: normal,  places: info[:places]},
        {text: info[:rev_text], path: reverse, places: info[:places].reverse}
      ]
    end
  end

  def name
    %|Veloroute #{route.name} Hamburg|
  end

  def description
    %|Genaue Wegführung der Veloroute #{route.name}, getrennt nach Fahrtrichtung. Es handelt sich um eine Alltagsroute, die auf gute Verbindungen in der Stadt abzielen (im Gegensatz zu Freizeitrouten, die mehr Wert auf touristische Orte entlang der Route legen).|
  end

  def bounds
    @bounds ||= begin
      bb = {maxlat: 0, minlat: 99, maxlon: 0, minlon: 99}
      named_routes.flat_map { |nr| nr[:path] }.each do |coord|
        bb[:minlon] = coord[0] if coord[0] < bb[:minlon]
        bb[:maxlon] = coord[0] if coord[0] > bb[:maxlon]
        bb[:minlat] = coord[1] if coord[1] < bb[:minlat]
        bb[:maxlat] = coord[1] if coord[1] > bb[:maxlat]
      end
      bb
    end
  end

  private

  def find_path(from:, to:)
    paths = find_paths(from: from, to: to)
    shortest_dist = Float::INFINITY
    shortest_path = nil
    paths.each do |path|
      dist = Geo.line_distance(path)
      next if dist >= shortest_dist
      shortest_dist = dist
      shortest_path = path
    end
    shortest_path
  end

  # DFS
  def find_paths(from:, to:, path: [], seen_ways: {}, found: [])
    return found << path if path.last == to

    candidates = @coord2way[from].reject do |cand|
      seen_ways[cand.fetch(:id)]
    end

    subtrees = candidates.each do |cand|
      seen_tmp = seen_ways.dup
      seen_tmp[cand.fetch(:id)] = true

      ccs = cand[:coords]
      if roundabout?(cand)
        # ensure coords start where we enter the roundabout
        ccs = ccs.rotate(ccs.index(from))
        # increase arc in size until we considered every possible exit
        (1...ccs.size).each do |num|
          arc = ccs[0..num]
          find_paths(from: arc.last, to: to, path: path + arc, seen_ways: seen_tmp, found: found)
        end
      elsif ccs.first == from
        find_paths(from: ccs.last,  to: to, path: path + ccs, seen_ways: seen_tmp, found: found)
      elsif ccs.last == from && !cand[:oneway]
        find_paths(from: ccs.first, to: to, path: path + ccs.reverse, seen_ways: seen_tmp, found: found)
      end
    end

    found
  end

  def index_relation
    @coord2way = Hash.new { |h, k| h[k] = [] }
    route.relation.ways.each do |way|
      if roundabout?(way)
        way.fetch(:coords).each do |coord|
          @coord2way[coord] << way
        end
      else
        @coord2way[way.fetch(:coords).first] << way
        @coord2way[way.fetch(:coords).last] << way unless way.fetch(:oneway)
      end
    end
  end

  def roundabout?(way)
    way[:attrs]["junction"] == "roundabout"
  end
end


# copy&paste to run in pry:
# require_relative 'route'
# require_relative 'gpx'
# routes = JSON.parse(File.read("../routes.json"));nil
# r = Route.new("1", routes.first[1]);nil
# g = GPX.new(r);nil
# g.named_routes
# g.send(:paths_from, g.send(:starting_points).first)
