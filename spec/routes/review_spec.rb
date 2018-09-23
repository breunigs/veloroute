require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/route.rb"
require_relative "#{PROJECT_ROOT}/routes/review.rb"

describe Review do
  let(:route) { instance_double(Route, name: "123") }

  before do
    stub_request(:get, %r|https://nominatim.openstreetmap.org/search/|).
      to_return(status: 200, body: %|[{"place_id":"198093421","licence":"Data © OpenStreetMap contributors, ODbL 1.0. https:\/\/osm.org\/copyright","osm_type":"relation","osm_id":"456925","boundingbox":["53.5501228","53.5515159","9.9918396","9.9943706"],"lat":"53.55081605","lon":"9.99289936180208","display_name":"Rathausmarkt, Hamburg-Altstadt, Hamburg-Mitte, Hamburg, 20095, Deutschland","class":"highway","type":"pedestrian","importance":0.48123930027933803}]|, headers: {})
  end

  describe '.mentioned_places' do
    it 'returns place names' do
      model = described_class.new(route, description: "This is <a>Test Space</a>", date: nil, grade: 1)
      expect(model.mentioned_places.map(&:name)).to eq ["Test Space"]
    end
  end
end
