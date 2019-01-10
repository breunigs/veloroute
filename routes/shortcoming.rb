require "yaml"

require_relative "rough_date"

class Shortcoming
  def self.all
    @raw ||= YAML.load_file(File.join(__dir__, "..", "shortcomings.yaml"))
    @raw.map { |key, data| self.new(key, data) }
  end

  def self.select(type:)
    self.all.select { |s| s.type == type.to_s }
  end

  def initialize(key, data)
    @key = key

    @title = data.fetch("title")
    @type = data.fetch("type") rescue raise("missing type attribute on #{key}")
    @desc = data.fetch("desc")
    @latLon = data.fetch("loc")
    @images = data.fetch("images")

    @last_check = Date.parse(data.fetch("lastCheck"))
    @start = RoughDate.new(data["start"])
    @end = RoughDate.new(data["end"])
  end

  attr_reader :title, :last_check, :images, :type, :start, :end, :key, :desc

  def url
    "/quality/#{@key}"
  end

  def link
    %|<a href="#{url}">#{@title}</a>|
  end

  def duration_with_link
    d = duration
    d ? %|<span class="duration">(#{d})</span> #{link}| : link
  end

  def lat
    @latLon[0]
  end

  def lon
    @latLon[1]
  end

  def lonLat
    @latLon.reverse
  end

  def coord
    {lon: lon, lat: lat}
  end

  def duration
    return "Unbekannt" if @start.nil? && @end.nil?
    RoughDate.range(@start, @end)
  end

  def type_text
    case @type
      when 'construction' then 'Baustelle'
      when 'planned-construction' then 'Baumaßnahme'
      when 'changed-routing' then 'Routenänderung'
      when 'bettelampel' then 'Bettelampel'
      when 'intent' then 'Vorhaben'
      when 'issue' then 'Problemstelle'
    end
  end

  def full_title
    "#{type_text}: #{title}"
  end

  private

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
