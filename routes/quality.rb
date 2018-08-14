require_relative "geojson"
require_relative "joiner"

class Quality
  def initialize(relation)
    @relation = relation
    @ratings = Hash.new { |h, k| h[k] = [] }
    judge
  end

  def to_geojson
    features = @ratings.map do |grade, ways|
      way_ids = ways.map { |w| w[:id] }.join(", ")
      arrOfCoords = ways.map { |w| w[:coords] }
      concatted = Joiner.join(arrOfCoords)

      {
        type: "Feature",
        properties: {color: grade2color(grade), osm_ids: way_ids},
        geometry: {
          type: "MultiLineString",
          coordinates: concatted
        }
      }
    end

    GeoJSON.to_feature_collection(features)
  end

  private

  def ways
    @relation.ways
  end

  def judge
    ways.each do |way|
      @ratings[rand(6)] << way
    end
  end

  def grade2color(grade)
    "#f00"
  end
end
