require_relative "web"

KNOWN_PLACES = {}

class Place
  MUTEX = Mutex.new

  REPLACE_NAMES = {
    'Hafen' => 'Reiherdamm',
    'Altona' => 'Altona-Altstadt',
    'Langenhorn' => 'Langenhorn Markt',
  }

  def self.find(name)
    MUTEX.synchronize { KNOWN_PLACES[name] ||= self.new(name) }
    KNOWN_PLACES[name]
  end

  def initialize(name)
    raise "No name given!" if name.nil?
    @name = name
    @bbox = resolve
  end

  attr_reader :bbox, :name

  def is_dir?
    @name.start_with?("(")
  end

  def url
    return "/" if bbox.any?(&:nil?)
    # follow state.js format
    lat = (bbox[0] + bbox[2])/2.0
    lon = (bbox[1] + bbox[3])/2.0
    "/#13/#{lon}/#{lat}"
  end

  def link
    %|<a href="#{url}" class="place">#{name}</a>|
  end

  def ==(other_place)
    @name == other_place&.name
  end

  def to_s
    name
  end

  private

  def nominatim_query
    search_name = REPLACE_NAMES[@name] || @name
    return search_name.gsub(/[()]/, '') if search_name.include?('(')
    search_name + ' Hamburg'
  end

  def resolve
    url = "https://nominatim.openstreetmap.org/search/"
    url << URI.escape(nominatim_query)
    url << "?format=json&viewbox=9.7,53.3825092,10.3,53.7&bounded=1&limit=5"

    resp = get(url, max_retries: 3)
    importance = resp.map { |e| e["importance"] }.max

    # combine bboxes with the same importance
    important_results = resp.take_while { |e| e["importance"] == importance }
    bboxes = important_results.map { |e| e["boundingbox"].map(&:to_f) }
    bbox_0 = bboxes.map { |bbox| bbox[0] }.min
    bbox_1 = bboxes.map { |bbox| bbox[1] }.max
    bbox_2 = bboxes.map { |bbox| bbox[2] }.min
    bbox_3 = bboxes.map { |bbox| bbox[3] }.max

    # switch order to MapboxGL one
    [bbox_2, bbox_0, bbox_3, bbox_1]
  end
end
