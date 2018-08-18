require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/geo.rb"

describe Geo do
  let(:path) { [[9.95750489684, 53.55596021735], [9.95782492166, 53.55597355817], [9.95823197077, 53.55575510172]] }
  let(:point) { [9.95767052372, 53.5559335357] }

  describe '.dist' do
    it 'returns expected distance between two points' do
      expect(described_class.dist(from: path[0], to: point).round(4)).to eq 11.3726
    end

    it 'returns expected distance between path and a point' do
      expect(described_class.dist(from: path, to: point).round(4)).to eq 3.7289
    end

    it 'direction of path makes no difference' do
      dist1 = described_class.dist(from: path, to: point)
      dist2 = described_class.dist(from: path.reverse, to: point)
      expect(dist1.round(4)).to eq dist2.round(4)
    end
  end

  describe '.bearing' do
    it 'returns expected angular bearing between two points' do
      expect(described_class.bearing(lonLat1: path[0], lonLat2: point).round).to eq 105
    end
  end
end
