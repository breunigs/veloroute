require "gradient"
require "set"

require_relative "geojson"
require_relative "joiner"
require_relative "relation"

module Quality
  class Way
    def initialize(relation_way)
      @way = relation_way
    end

    def yes?(attribute)
      !no?(attribute)
    end

    def no?(attribute)
      [nil, "", "no", "none", "street"].include?(val(attribute))
    end

    def strict_no?(attribute)
      ["no", "none", "street"].include?(val(attribute))
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

    def issues
      iss = Set.new
      iss << :not_lit if strict_no?('lit')
      rate_surface.each do |side, rating|
        next if rating == :excellent
        iss << :"surface_#{side}_#{rating}"
      end
      iss
    end

    def values(tag)
      tag = tag.to_s
      sides_to_consider.map do |side|
        v = val("cycleway:#{side}:#{tag}") || val("cycleway:both:#{tag}") || val("cycleway:#{tag}")
        v ||= cycleway_on_street?("cycleway:#{side}") ? val(tag) : nil
        [side, v]
      end.to_h
    end

    # returns a hash in the format of:
    # {left: :okay, right: :bad}
    # Sides are present as per sides_to_consider.
    # Quality is one of :excellent, :okay, :bad
    def rate_surface
      surfaces = values(:surface)
      values(:smoothness).map do |side, smooth|
        rating = case smooth&.to_sym
        when :excellent then :excellent
        when :good then :okay
        when :intermediate, :bad then :bad
        else
          case surfaces[side]&.to_sym
          when :asphalt, :concrete, :metal then :excellent
          when :paving_stones then :okay
          when :fine_gravel, :cobblestone, :sett, :gravel then :bad
          else
            warn "Cannot rate surface for osm_id=#{id} side=#{side} role=#{@way[:role]} oneway=#{oneway?}:\n#{attrs.inspect}"
            :missing_tags
          end
        end
        [side, rating]
      end.to_h
    end

    private

    def cycleway_on_street?(attr)
      no?(attr) || %w[crossing lane opposite opposite_lane share_busway shared_lane sidepath].include?(val(attr))
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

    def val(attribute)
      # Tags can contain both _ and :, so a symbol is weird
      raise "pass a string!" unless attribute.is_a?(String)
      v = @way[:attrs][attribute]
      v == "" ? nil : v
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
      @ratings = Hash.new { |h, k| h[k] = [] }
      judge
    end

    def to_geojson
      features = @ratings.map do |issues, ways|
        concatted = Joiner.join(ways.map(&:coords))

        {
          type: "Feature",
          properties: {
            name: @route.name,
            quality: true,
            color: grade2color(issues.size),
            issues: issues.to_a.join(", "),
            osm_ids: ways.map(&:id).join(", ")
          },
          geometry: {
            type: "MultiLineString",
            coordinates: concatted
          }
        }
      end

      ::GeoJSON.to_feature_collection(features)
    end

    private

    def ways
      @ways ||= @route.relation.ways.map { |w| Way.new(w) }
    end

    def judge
      ways.each do |way|
        @ratings[way.issues] << way
      end
    end

    def grade2color(grade)
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
