class Markers
  EARTH_RADIUS_METERS = 6371000
  RAD_PER_DEG = Math::PI / 180

  def initialize(markers:, relation:)
    @markers = markers
    @relation = relation
  end

  attr_reader :markers, :relation

  def snapped
    markers.map do |marker|
      new_pos = marker
      dist_so_far = Float::INFINITY

      way_endpoints.each do |coord|
        new_dist = dist(coord, marker)
        next if new_dist >= dist_so_far
        dist_so_far = new_dist
        new_pos = coord
      end

      new_pos
    end
  end

  private

  def way_endpoints
    relation.ways.map { |w| w[:coords] }.flat_map { |c| [c.first, c.last] }
  end

  def dist(coord1, coord2)
    # via https://stackoverflow.com/a/36832601
    lon1_rad, lon2_rad = coord1[0] * RAD_PER_DEG, coord2[0] * RAD_PER_DEG
    lat1_rad, lat2_rad = coord1[1] * RAD_PER_DEG, coord2[1] * RAD_PER_DEG

    a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    EARTH_RADIUS_METERS * c # Delta in meters
  end

end
