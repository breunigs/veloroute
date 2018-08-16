require "gradient"

require_relative "geojson"
require_relative "joiner"
require_relative "relation"

module Quality
  class Observation
    RATING_TO_GRADE = {
      excellent: 0,
      okay: 3,
      bad: 5
    }

    def self.judge(observations)
      return '?' if observations.empty?

      grades = observations.partition(&:left_side?).map do |per_side|
        per_side.map(&:grade).max
      end.compact

      grades.sum / grades.size.to_f
    end

    attr_reader :side, :name, :rating, :raw_values

    def initialize(side, name, rating, raw_values: {})
      @side = side
      @name = name
      @rating = rating
      @raw_values = raw_values.map do |k, v|
        [:"#{side}_#{k}", v]
      end.to_h
    end

    def left_side?
      side == :left
    end

    def grade
      RATING_TO_GRADE.fetch(rating)
    end

    def to_s
      "#{side}_#{name}_#{rating}"
    end
  end

  class Way
    YES_VALUES = ["yes"].freeze
    NO_VALUES = ["no", "none", "street"].freeze

    def initialize(relation_way)
      @way = relation_way
    end

    def no?(attribute)
      ([nil, ""] + NO_VALUES).include?(val(attribute))
    end

    def backward?
      @way[:role] == "backward"
    end

    def forward?
      @way[:role] == "forward"
    end

    def oneway?
      @way[:oneway]
    end

    def id
      @way[:id]
    end

    def coords
      @way[:coords]
    end

    def observations
      iss = []

      sides_to_consider.each do |side|
        iss << Observation.new(side, :not_lit, :okay)
      end if NO_VALUES.include?(val('lit'))

      iss += rate_surface

      rate_width.compact.each do |side, rating|
        iss << Observation.new(side, :width, rating)
      end

      rate_maxspeed_and_segregation.compact.each do |side, rating|
        iss << Observation.new(side, :maxspeed_and_segregation, rating)
      end

      iss
    end

    # maxspeed is considered excellent if it's <= 30 or if cycles have their own
    # track. Between 30 and 50 it's okay and everything else above is bad. There
    # is no distinction between the cycle path being on the street or on a
    # separate lane.
    def rate_maxspeed_and_segregation
      maxspeed = val("maxspeed").to_i
      sides_to_consider.map do |side|
        rating = nil

        # track next to street
        rating ||= :excellent if %w[track opposite_track].include?(cycleway_val(side))
        # completely own track
        rating ||= :excellent if %w[path crossing cycleway footway].include?(val("highway"))
        # compare with speed for shared paths
        rating ||= maxspeed <= 30 ? :excellent : (maxspeed <= 50 ? :okay : :bad) if maxspeed

        [side, rating]
      end.to_h
    end

    # Uses either smoothness or surface to determine quality, preferring the
    # smoothness where available. smoothness=excellent is excellent, good is
    # just okay and everything below that is bad. For surfaces the list is more
    # extensive, but the less "gaps" a surface has by design, the nicer is is
    # considered. E.g. asphalt > paving_stones > cobblestone.
    def rate_surface
      surf = rate_surface_tag
      smoo = rate_smoothness_tag
      sides_to_consider.map do |side|
        rating = smoo.dig(side, :rating) || surf.dig(side, :rating)
        next if rating.nil?
        Observation.new(side, :surface, rating, raw_values: {
          smoothness: smoo.dig(side, :value),
          surface: surf.dig(side, :value)
        })
      end.compact
    end

    # Separate cycleways (tracks/lanes) must meet Hamburg's own definition of a
    # minimal width to be considered "okay" (or desired width for excellent).
    # Everything else is considered bad. When the cyclepath shares the street
    # (e.g. residential streets, share_busway) the width is not considered, as
    # parked cars, wide busses, etc. make the width of the street meaningless.
    def rate_width
      values(:width).map do |side, width|
        next [side, nil] if width.nil?

        osm_type = cycleway_val(side)
        internal_type = case osm_type
        when "shared_lane", "shared" then :shared_lane
        when "lane", "opposite_lane" then :lane
        when "crossing"              then :track_dual
        when "track", "opposite_track", "sidepath", "yes" then
          segregated = cycleway_val(side, tag: "segregated")
          oneway = cycleway_val(side, tag: "oneway")

          dual = NO_VALUES.include?(segregated) || NO_VALUES.include?(oneway)
          dual ? :track_dual : :track_single
        when *NO_VALUES, "share_busway", "use_sidepath", "opposite", nil then
          nil # ignore these known cases
        else
          warn "no idea how to rate width for osm_id=#{id} way_type=#{osm_type}"
          nil
        end


        # if there are no special cycleway tags, check if this is a totally
        # separate cycleway/footpath
        internal_type ||= begin
          oneway = YES_VALUES.include?(val("oneway:bicycle") || val("oneway"))

          foot_disallowed_explicitly = NO_VALUES.include?(val("foot"))
          foot_disallowed_implicitly = val("highway") == "cycleway" && val("foot").nil?
          bicycle_only = foot_disallowed_explicitly || foot_disallowed_implicitly

          # width tag vs cycleway:width tag
          specific_width_given = val("width") != width

          whole_width_for_bikes = specific_width_given || bicycle_only

          # dual direction cycleways that we have to share with pedestrians
          # probably require even more width, but it's not a common case, so
          # not going to handle it until it becomes an issue.
          whole_width_for_bikes && oneway ? :track_single : :track_dual
        end

        [side, width_compare(internal_type, width)]
      end.to_h
    end

    def values(tag)
      tag = tag.to_s
      sides_to_consider.map do |side|
        v = cycleway_val(side, tag: tag)
        v ||= cycleway_on_street?(side) ? val(tag) : nil
        [side, v]
      end.to_h
    end

    private

    # desired/minimal widths are from Hamburg's "PLAST 9 Fortschreibung" (2010),
    # see [1]. These width match the Germany wide(?) ERA [2]. The newer red
    # square tiles are 25cm wide. Usually, there should be 6.5 of them, so
    # 162.5cm wide cycle tracks.
    # I could not find values for ways shared with pedestrians, so I am going to
    # assume the same as for dual-way tracks.
    # [1] http://www.hamburg.de/contentblob/2695554/42d1b5cf759fa2fe2b3ffc621538b6e1/data/vorabinformation-zur-plast9-fortschreibung.pdf
    # [2] https://de.wikipedia.org/wiki/Empfehlungen_f%C3%BCr_Radverkehrsanlagen
    MINIMAL_WIDTHS = {
      track_single: 1.6,
      track_dual: 2.5,
      lane: 1.25,
      shared_lane: 1.25
    }
    DESIRED_WIDTHS = {
      track_single: 2.0,
      track_dual: 3.0,
      lane: 1.6,
      shared_lane: 1.5
    }

    def width_compare(type, width)
      return nil unless type && width
      return :excellent if width.to_f >= DESIRED_WIDTHS.fetch(type)
      return :okay if width.to_f >= MINIMAL_WIDTHS.fetch(type)
      :bad
    end

    def rate_surface_tag
      values(:surface).map do |side, value|
        # ignore details like width of individual paving stones
        value = value&.split(":", 2)&.first
        rating = case value&.to_sym
        when :asphalt, :concrete, :metal then :excellent
        when :paving_stones then :okay
        when :fine_gravel, :cobblestone, :sett, :gravel, :wood then :bad
        else nil
        end
        [side, {rating: rating, value: value}]
      end.to_h
    end

    def rate_smoothness_tag
      values(:smoothness).map do |side, value|
        rating = case value&.to_sym
        when :excellent then :excellent
        when :good then :okay
        when :intermediate, :bad then :bad
        else nil
        end
        [side, {rating: rating, value: value}]
      end.to_h
    end

    CYCLEWAY_ON_STREET_VALUES = NO_VALUES + [nil] + %w[crossing lane opposite opposite_lane share_busway shared_lane sidepath]
    def cycleway_on_street?(side)
      v = cycleway_val(side)
      return true if CYCLEWAY_ON_STREET_VALUES.include?(v)
      # edge case where the tagging looks like cycleway=right cycleway:right=track …
      (v == "right" && side.to_s == "left") || (v == "left" && side.to_s == "right")
    end

    def sides_to_consider
      return [:left, :right] unless oneway?

      if forward?
        return [:left] if no?('cycleway:right') && include?('cycleway:left', :opposite)
        [:right]
      elsif backward?
        return [:right] if no?('cycleway:left') && include?('cycleway:right', :opposite)
        [:left]
      else
        [:left, :right]
      end
    end

    def include?(attr, text)
      val(attr)&.include?(text.to_s)
    end

    def cycleway_val(side, tag: "")
      if tag && tag != ""
        val("cycleway:#{side}:#{tag}", "cycleway:both:#{tag}", "cycleway:#{tag}")
      else
        val("cycleway:#{side}", "cycleway:both", "cycleway")
      end
    end

    def val(*attributes)
      attributes.each do |attribute|
        # Tags can contain both _ and :, so a symbol is weird
        raise "pass a string!" unless attribute.is_a?(String)
        v = @way[:attrs][attribute]
        return v if v && v != ""
      end
      nil
    end

    def attrs
      @way[:attrs]
    end

    def ensure_known(key)
      raise "Unknown attribute: #{key}" unless Relation::INTERESTING_KEYS.include?(key.to_s)
    end
  end

  class GeoJSON
    def initialize(route:)
      @route = route
      judged_ways
    end

    def to_geojson
      features = judged_ways.map do |way, geo_props|
        {
          type: "Feature",
          properties: {
            name: @route.name,
            quality: true,
            **geo_props
          },
          geometry: {
            type: "LineString",
            coordinates: way.coords
          }
        }
      end

      ::GeoJSON.to_feature_collection(features)
    end

    private

    def ways
      @ways ||= @route.relation.ways.map { |w| ::Quality::Way.new(w) }
    end

    def judged_ways
      @judged_ways ||= begin
        judged = {}
        ways.each do |way|
          obs = way.observations
          raw_values = obs.map(&:raw_values).reduce(&:merge).compact
          grade = Observation.judge(obs)
          judged[way] = {
            grade: grade,
            color: grade2color(grade),
            # Mapbox GL JS doesn't support nested properties through queryRenderedFeatures
            # https://github.com/mapbox/mapbox-gl-js/issues/2434
            observations: obs.join(","),
            osm_id: way.id,
            **raw_values
          }
        end
        judged
      end
    end

    def grade2color(grade)
      # i.e. no observations and no rating possible
      return '#9A42FF' if grade == '?'

      pos = [grade / 5.0, 1].min
      '#' << gradient.at(pos).color.hex
    end

    def gradient
      @gradient ||= Gradient::Map.new(
        Gradient::Point.new(0.00, Color::RGB.new(0,  142,  4), 1),
        Gradient::Point.new(0.25, Color::RGB.new(105, 204, 0), 1),
        Gradient::Point.new(0.50, Color::RGB.new(242, 234, 0), 1),
        Gradient::Point.new(0.75, Color::RGB.new(239,  91, 0), 1),
        Gradient::Point.new(1.00, Color::RGB.new(188,   0, 0), 1),
      )
    end
  end
end
