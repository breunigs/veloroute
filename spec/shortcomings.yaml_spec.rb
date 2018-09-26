require 'spec_helper'


describe "shortcomings.yaml" do
  let(:shortcomings) do
    YAML.load_file(File.join(__dir__, "..", "shortcomings.yaml"))
  end

  it "uses only URL safe names" do
    expect(shortcomings.keys).to all(match  /\A[a-z0-9-]+\z/)
  end
end
