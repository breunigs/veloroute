require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/route.rb"

describe Route, type: :model do
  let(:simple_route) do
    {
      "relation_id" => 123,
      "color" => "#f00",
      "markers" => [],
      "places" => [
        %w[Some Nice Place],
        %w[Some Nice Area]
      ]
    }
  end

  let(:split_with_dir_route) do
    {
      "relation_id" => 123,
      "color" => "#f00",
      "markers" => [],
      "places" => [
        %w[Place],
        %w[(Other)]
      ]
    }
  end

  let(:x_simple_route) { Route.new("x", simple_route) }
  let(:x_split_with_dir_route) { Route.new("x", split_with_dir_route) }
  let(:y_simple_route) { Route.new("yyyyy", simple_route) }

  before do
    stub_request(:get, %r|https://nominatim.openstreetmap.org/search/|).
      to_return(status: 200, body: %|[{"place_id":"198093421","licence":"Data © OpenStreetMap contributors, ODbL 1.0. https:\/\/osm.org\/copyright","osm_type":"relation","osm_id":"456925","boundingbox":["53.5501228","53.5515159","9.9918396","9.9943706"],"lat":"53.55081605","lon":"9.99289936180208","display_name":"Rathausmarkt, Hamburg-Altstadt, Hamburg-Mitte, Hamburg, 20095, Deutschland","class":"highway","type":"pedestrian","importance":0.48123930027933803}]|, headers: {})
  end

  it "only splits routes when necessary" do
    expect(x_simple_route.route_array.map { |s| s.map(&:to_s) }).to eq [
      ["Some", ""],
      ["Nice", ""],
      ["Place", "Area"],
    ]
  end

  describe "SVG render" do
    it "puts route icons on the left if there's no 2nd route entry" do
      expect_any_instance_of(SVGPather).to receive(:conn).with(:center, :left)
      x_simple_route.to_svg({"Some" => [x_simple_route, y_simple_route]})
    end

    it "avoids splitting the way just to indicate a direction" do
      allow_any_instance_of(SVGPather).to receive(:split).and_raise("should not be called")

      expect do
        x_split_with_dir_route.to_svg
      end.not_to raise_error
    end

    it "puts end icons on routes that have no direction follow up" do
      expect_any_instance_of(SVGPather).to receive(:stop).with(:left).once
      expect_any_instance_of(SVGPather).to receive(:stop).with(:right).once
      x_simple_route.to_svg
    end
  end

  describe "HTML render" do
    it "puts route icons on the left if there's no 2nd route entry" do
      html = x_simple_route.to_html({"Some" => [x_simple_route, y_simple_route]})
      expect(html).to match /yyyyy.*Some.*Nice/m
    end

    it "does not put direction icons on the left if we avoided a split" do
      html = x_split_with_dir_route.to_html({"Place" => [x_split_with_dir_route, y_simple_route]})
      expect(html).to match /Other.*Place.*yyyyy/m
    end
  end
end
