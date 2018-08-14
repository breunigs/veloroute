require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/joiner.rb"

describe Joiner, type: :model do
  it 'joins opposite ways when reversing is allowed' do
    way1 = [[1,1], [2,2]]
    way2 = [[3,3], [2,2]]
    arr_of_coords = [way1, way2]
    expect(described_class.join(arr_of_coords, reversable: true)).to eq [[[1,1], [2,2], [3, 3]]]
  end

  it 'keeps opposite ways as is when reversing is disabled' do
    way1 = [[1,1], [2,2]]
    way2 = [[3,3], [2,2]]
    arr_of_coords = [way1, way2]
    expect(described_class.join(arr_of_coords, reversable: false)).to eq [way1, way2]
  end
end
