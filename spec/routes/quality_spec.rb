require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/quality.rb"

describe Quality::Way, type: :model do
  def way(tags, attrs = {})
    described_class.new({
      id: "123",
      coords: [],
      attrs: tags,
      role: "",
      oneway: false
    }.merge(attrs))
  end

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
