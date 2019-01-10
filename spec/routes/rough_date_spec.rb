require 'spec_helper'

require_relative "#{PROJECT_ROOT}/routes/rough_date.rb"

describe RoughDate do
  let(:unknown) { described_class.new(nil) }

  it "detects text as unknown" do
    expect(described_class.new("not a date").unknown?).to eq true
  end

  it "makes nice ranges" do
    a = described_class.new("2019")
    b = described_class.new("2020")

    expect(described_class.range(a, b)).to eq "2019 bis 2020"
    expect(described_class.range(a, unknown)).to eq "ab 2019"
    expect(described_class.range(unknown, b)).to eq "bis 2020"
    expect(described_class.range(a, a)).to eq "2019"
  end

  it "compares decently" do
    a = described_class.new("2019")
    b = described_class.new("2019Q1")
    c = described_class.new("2019-02")
    d = described_class.new("2019-04")
    e = described_class.new("2020")

    expect([a, b, c, d, e].shuffle.sort).to eq [a, b, c, d, e]
  end

  it "sorts nil on bottom" do
    b = described_class.new("2019Q1")

    expect([unknown, b].sort).to eq [b, unknown]
  end

  it "places quarters between months" do
    expect(described_class.new("2019Q1").guessed_start_month).to eq 0.5
    expect(described_class.new("2019Q2").guessed_start_month).to eq 3.5
    expect(described_class.new("2019Q3").guessed_start_month).to eq 6.5
    expect(described_class.new("2019Q4").guessed_start_month).to eq 9.5
  end

  it "converts to text" do
    expect(described_class.new("2019").to_s).to eq "2019"
    expect(described_class.new("2019Q2").to_s).to eq "Frühjahr 2019"
    expect(described_class.new("2019-07").to_s).to eq "Juli 2019"
  end
end
