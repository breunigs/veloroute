require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/quality.rb"

def way(tags, attrs = {})
  Quality::Way.new({
    id: "123",
    coords: [],
    attrs: tags,
    role: "",
    oneway: false
  }.merge(attrs))
end

describe Quality::Way, type: :model do
  describe ".values" do
    it "gets surface from cycleway:surface when no other definition exists" do
      subject = way({"cycleway:surface"=>"asphalt", "highway"=>"footway", "lit"=>"yes"})
      expect(subject.values('surface')).to eq({left: "asphalt", right: "asphalt"})
    end

    it "gets surface from main street if cycleway is on it" do
      subject = way({"cycleway:right"=>"shared_lane", "highway"=>"tertiary", "maxspeed"=>"50", "surface"=>"asphalt"})
      expect(subject.values('surface')).to eq({left: "asphalt", right: "asphalt"})
    end

    it "gets surface for separate cycleway from specific tag" do
      subject = way({"cycleway"=>"right", "cycleway:right"=>"track", "cycleway:right:smoothness"=>"excellent", "cycleway:right:surface"=>"paving_stones", "highway"=>"primary", "maxspeed"=>"50", "oneway"=>"yes", "surface"=>"asphalt"})
      expect(subject.values('surface')).to eq({left: "asphalt", right: "paving_stones"})
    end

    it "gets surface when tagged with cycleway:both:surface" do
      subject = way({"cycleway:both:surface"=>"paving_stones", "cycleway:left"=>"track", "cycleway:right"=>"track", "surface"=>"asphalt"})
      expect(subject.values('surface')).to eq({left: "paving_stones", right: "paving_stones"})
    end

    it "returns only one side if route has role" do
      tags = {"cycleway:left:surface"=>"paving_stones", "cycleway:left"=>"track", "cycleway:right"=>"track", "cycleway:right:surface"=>"asphalt"}

      subject = way(tags, oneway: true, role: "forward")
      expect(subject.values('surface')).to eq({right: "asphalt"})

      subject = way(tags, oneway: true, role: "backward")
      expect(subject.values('surface')).to eq({left: "paving_stones"})
    end

    it "handles cycling on the wrong side correctly (role=backward)" do
      tags = {"cycleway:right"=>"opposite_track", "cycleway:right:surface"=>"asphalt"}

      subject = way(tags, oneway: true, role: "backward")
      expect(subject.values('surface')).to eq({right: "asphalt"})
    end

    it "handles cycling on the wrong side correctly (role=forward)" do
      tags = {"cycleway:left"=>"opposite_track", "cycleway:left:surface"=>"asphalt"}

      subject = way(tags, oneway: true, role: "forward")
      expect(subject.values('surface')).to eq({left: "asphalt"})
    end
  end

  describe ".rate_width" do
    it "rates separated cycleway/footpath with enough width as excellent" do
      subject = way({"cycleway:width" => "2", "foot" => "yes", "highway" => "path", "oneway:bicycle" => "yes", "segregated" => "yes", "smoothness" => "excellent", "surface" => "paving_stones"}, oneway: true, role: "forward")
      expect(subject.rate_width.first.rating).to eq :excellent
    end

    it "detects separate tracks as dual if they're not oneways" do
      subject = way({"bicycle:oneway" => "no", "cycleway" => "sidepath", "highway" => "cycleway", "oneway" => "no", "width" => "3"})

      expect(subject.rate_width.first.raw_values).to include({
        left_path_internal_type: :track_dual,
        left_shared_with_other_bikes: true,
        left_shared_with_pedestrians: false
      })
    end

    it "detects separate tracks as dual if they're shared with pedestrians" do
      subject = way({"highway" => "footway", "oneway" => "yes", "bicycle" => "yes", "segregated" => "no", "width" => "3"})

      expect(subject.rate_width.first.raw_values).to include({
        left_path_internal_type: :track_dual,
        left_shared_with_other_bikes: false,
        left_shared_with_pedestrians: true
      })
    end

    it "detects separate tracks as dual if they're not oneways + shared with pedestrians" do
      subject = way({"highway" => "footway", "bicycle" => "yes", "segregated" => "no", "width" => "3"})

      expect(subject.rate_width.first.raw_values).to include({
        left_path_internal_type: :track_dual,
        left_shared_with_other_bikes: true,
        left_shared_with_pedestrians: true
      })
    end

    it "detects separate tracks as single if oneway + shared with pedestrians + cycleway has own width" do
      subject = way({"bicycle" => "yes", "cycleway:width" => "2", "foot" => "yes", "highway" => "path", "oneway:bicycle" => "yes", "segregated" => "yes", "smoothness" => "excellent", "surface" => "paving_stones"})
      expect(subject.rate_width.first.raw_values).to include({
        left_path_internal_type: :track_single,
        left_shared_with_other_bikes: false,
        left_shared_with_pedestrians: false,
      })
    end
  end

  describe ".sides_to_consider" do
    it "only considers side with the dual bike way (ignores street)" do
      subject = way({"cycleway:right:oneway" => "no", "cycleway:right:segregated" => "yes", "cycleway:right:surface" => "paving_stones", "cycleway:right:width" => "2", "cycleway:right" => "track", "oneway:bicycle" => "no", "oneway" => "yes", "sidewalk" => "right"})

      expect(subject.send(:sides_to_consider)).to eq [:right]
    end
  end

  describe ".observations" do
    it "handles detailed values" do
      subject = way({"cycleway:both"=>"track", "cycleway:left:surface"=>"paving_stones:20", "cycleway:right:surface"=>"sett:20"})
      expect(subject.observations.map(&:to_s)).to include("left_surface_okay", "right_surface_bad")
    end
  end
end

describe Quality::Observation, type: :model do
  describe ".judge" do
    it "builds average from the directions" do
      observations = way({"cycleway:left" => "track", "cycleway:left:smoothness" => "excellent", "cycleway:left:surface" => "paving_stones", "cycleway:right" => "track", "cycleway:right:smoothness" => "intermediate", "cycleway:right:surface" => "paving_stones", "cycleway:right:width" => "1.5", "lit" => "yes", "maxspeed" => "50", "surface" => "asphalt"}).observations

      # i.e. left good, right bad
      expect(observations.map(&:to_s).sort).to eq ["left_maxspeed_and_segregation_excellent", "left_surface_excellent", "right_maxspeed_and_segregation_excellent", "right_surface_bad", "right_width_bad"]
      # assert avg(excellent, bad) = avg(1, 5) = 3
      expect(described_class.judge(observations)).to eq 3
    end
  end
end
