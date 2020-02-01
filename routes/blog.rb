require 'singleton'
require 'rgeo'
require 'rgeo-geojson'

require_relative 'util'
require_relative 'rough_date'
require_relative 'mapillary'
require_relative 'route'

class Blog
  include Singleton

  def with_tags(tags)
    posts.select { |p| p.has_tag?(tags) }
  end

  def with_type(type)
    posts.select { |p| p.type == type.to_s }
  end

  def posts
    @posts ||= begin
      glob = File.join(__dir__, "..", "blog", "*.yaml")
      sort Dir.glob(glob).map { |path| Post.new(path) }
    end
  end

  private

  def sort(posts)
    posts.sort_by { |p| p.date }
  end
end

class Post
  attr_reader :name, :date, :path, :start, :end

  def initialize(path)
    @path = path
    @name = File.basename(path, ".yaml")

    @raw = YAML.load_file(path)
    @date = @raw["updated"] || Date.parse(name[0...10])

    @start = RoughDate.new(@raw["start"])
    @end = RoughDate.new(@raw["end"])
  end

  def url
    "/blog/#{name}"
  end

  def images
    @raw['images']
  end

  def image
    return images.first if images.is_a?(Array)
    return nil unless images.is_a?(Integer)
    @image ||= Route.find(images).close_image(center)
    @image ||= Route.find(images).close_image(center, cutOff: 200)
  end

  def hideFromMap?
    !!@raw['hideFromMap']
  end

  def ger_date
    date.strftime("%d.%m.%Y")
  end

  def duration
    return "Unbekannt" if @raw['start'].nil? && @raw['end'].nil?
    RoughDate.range(@start, @end)
  end

  def type
    @raw['type']
  end

  def type_text
    case type
      when 'construction' then 'Baustelle'
      when 'planned-construction' then 'Planung'
      when 'changed-routing' then 'Routenänderung'
      when 'bettelampel' then 'Bettelampel'
      when 'intent' then 'Vorhaben'
      when 'issue' then 'Problemstelle'
      when 'finished' then 'Bau abgeschlossen'
      else nil
    end
  end

  def full_title
    return title unless type_text
    "#{type_text}: #{title}"
  end

  def link
    %|<a href="#{url}">#{title}</a>|
  end

  def duration_with_link
    d = duration
    d ? %|<span class="duration">(#{d})</span> #{link}| : link
  end

  def has_tag?(tt)
    tt = [tt] unless tt.is_a?(Array)

    (tags & tt).any?
  end

  def tags
    @tags ||= @raw['tags'].map(&:downcase)
  end

  def title
    @raw['title']
  end

  def text
    @raw['text']
  end

  def geometry
    a = @raw['area']

    # legacy image only lists
    a ||= begin
      seq = Mapillary::ManualSequence.new(@raw["images"]).to_json_export
      coords = seq[:loc]
      coords += [@raw['loc']] if coords.size <= 1
      coords_to_buffered_poly(coords)
    end if @raw['images']

    if a && a.first.first.is_a?(Array)
      return  { type: "MultiPolygon", coordinates: a.map { |area| [area] } }
    elsif a
      { type: "Polygon", coordinates: [a] }
    end
  end

  def bounds
    return nil unless geometry
    coords = geometry[:coordinates]
    coords = coords.flatten(1) while coords[0][0].is_a?(Array)
    minlon, maxlon = coords.map(&:first).minmax
    minlat, maxlat = coords.map(&:last).minmax
    [minlon, minlat, maxlon, maxlat]
  end

  def center
    b = bounds
    return nil unless b
    [(b[0] + b[2])/2.0, (b[1] + b[3])/2.0]
  end

  def linked_text
    html, _places = link_places(text)
    html
  end

  private

  BUFFER_IN_METERS = 10
  def coords_to_buffered_poly(coords)
    return nil if coords.size <= 1
    factory = RGeo::Geographic.simple_mercator_factory(buffer_resolution: 2)
    coords = coords.map { |c| factory.point(c[0], c[1]) }
    buffered = factory.line_string(coords).buffer(BUFFER_IN_METERS)
    geojson = RGeo::GeoJSON.encode(buffered)["coordinates"].first
    geojson.map { |c| [c[0].round(6), c[1].round(6)] }
  end

  def rough_date_to_text(date)
    case date
    when /^20\d\dQ[1-4]$/ then
      case date[5]
      when "1" then "Winter #{date[0..3]}"
      when "2" then "Frühjahr #{date[0..3]}"
      when "3" then "Sommer #{date[0..3]}"
      when "4" then "Herbst #{date[0..3]}"
      end
    when /^20\d\d-[01]\d$/
      named = MONTHS[date.split("-").last.to_i - 1]
      "#{named} #{date[0..3]}"
    when /^20\d\d$/
      date
    end
  end

end
