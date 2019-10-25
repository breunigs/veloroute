require 'spec_helper'
require 'open3'

GEOJSON_REWIND_PATH = File.expand_path(File.join(__dir__, "../node_modules/.bin/geojson-rewind"))

RSpec::Matchers.define :resolve_with_200 do
  match do |url|
    url = URI.parse(url)

    rest = url.path
    rest << "?" << url.query if url.query
    rest << "#" << url.fragment if url.fragment

    req = Net::HTTP.new(url.host, url.port)
    req.read_timeout = 120 # seconds
    req.use_ssl = url.scheme == 'https'
    res = req.request_head(rest)

    code = res.code.to_i

    if code == 301 || code == 302
      warn "URL moved:\nold: #{url}\nnew: #{res.header['Location']}\n"
    end

    code == 200
  rescue Errno::ECONNREFUSED
    false
  end
end

RSpec::Matchers.define :be_closed_ring do
  match do |a|
    a[:polygon].first == a[:polygon].last
  end
  failure_message_for_should do |a|
    "#{a[:shortcoming]}##{a[:pos]} should be a closed ring"
  end
end

RSpec::Matchers.define :follow_right_hand_rule do
  match do |a|
    as_geojson = {
      type: :Feature,
      geometry: {
        type: :Polygon,
        coordinates: [a[:polygon]]
      }
    }.to_json

    okay = true
    Open3.popen3(GEOJSON_REWIND_PATH) do |stdin, stdout, stderr, wait_thr|
      stdin.write(as_geojson)
      stdin.close

      okay = false if wait_thr.value.exitstatus != 0
      okay = false if stdout.read.chomp != as_geojson
    end
    okay
  end
  failure_message_for_should do |a|
    "#{a[:shortcoming]}##{a[:pos]} should follow the right-hand-rule"
  end
end

RSpec::Matchers.define :have_place_class do
  match do |a|
    a.classes.include?("place")
  end
end

RSpec::Matchers.define :have_place_link_start do
  match do |a|
    url = a.attr(:href)
    url.start_with?(%r{/\d*#}) || url.start_with?("#")
  end
end

describe "shortcomings.yaml" do
  let(:path) { File.join(__dir__, "..", "shortcomings.yaml") }
  let(:shortcomings) { YAML.load_file(path) }


  let(:links) do
    shortcomings
     .values
     .map { |s| s["desc"] }
     .map { |desc| Nokogiri::HTML::fragment(desc) }
     .flat_map { |html| html.css("a[href]") }
  end

  it "uses unique keys" do
    raw = File.read(path, encoding: 'UTF-8')
    keys = raw.split("\n").grep(/^[a-z0-9_-]+:/).map { |k| k.chomp(":") }
    expect(keys).to match_array shortcomings.keys
  end

  it "uses only URL safe names" do
    expect(shortcomings.keys).to all(match /\A[a-z0-9-]+\z/)
  end

  it "has titles for all entries" do
    expect(shortcomings.values).to all(include('title'))
  end

  it "has last check dates in the past" do
    lastChecks = shortcomings.values.map { |v| Date.parse(v["lastCheck"]) }
    expect(lastChecks).to all(be <= Date.today)
  end

  it "links that look like places include proper class" do
    placehrefs = links.select do |a|
      url = a.attr(:href)
      url.start_with?("/#") || url.start_with?("#")
    end
    expect(placehrefs).to all(have_place_class)
  end

  it "place classes have proper links" do
    placehrefs = links.select { |a| a.classes.include?("place") }
    expect(placehrefs).to all(have_place_link_start)
  end

  it "uses proper GeoJSON polygons for area" do
    polygons = []

    shortcomings.each do |name, props|
      area = props["area"]
      next unless area

      multi = area.first.first.is_a?(Array)
      normalized = multi ? area : [area]

      normalized.each.with_index do |poly, pos|
        polygons << {shortcoming: name, pos: pos, polygon: poly}
      end
    end

    expect(polygons).to all(be_closed_ring).and all(follow_right_hand_rule)
  end

  context "integration", integration: true do
    before { allow_net_connect! }
    after { disable_net_connect! }

    it "links only valid URLs" do
      urls = links
        .map { |a| a.attr(:href) }
        .select { |url| url.match(%r{^https?://}i) }

      expect(urls).to all(resolve_with_200)
    end
  end
end
