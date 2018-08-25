require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/route.rb"
require_relative "#{PROJECT_ROOT}/routes/review.rb"

describe Review do
  let(:route) { instance_double(Route, name: "123") }

  before do
    stub_request(:get, %r|https://nominatim.openstreetmap.org/search/|).
      to_return(status: 200, body: "{}", headers: {})
  end

  describe '.mentioned_places' do
    it 'returns place names' do
      model = described_class.new(route, description: "This is <a>Test Space</a>", date: nil, grade: 1)
      expect(model.mentioned_places.map(&:name)).to eq ["Test Space"]
    end
  end
end
