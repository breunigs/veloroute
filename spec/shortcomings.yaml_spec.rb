require 'spec_helper'

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

RSpec::Matchers.define :have_place_class do
  match do |a|
    a.classes.include?("place")
  end
end

RSpec::Matchers.define :have_place_link_start do
  match do |a|
    url = a.attr(:href)
    url.start_with?("/#") || url.start_with?("#")
  end
end

describe "shortcomings.yaml" do
  let(:shortcomings) do
    YAML.load_file(File.join(__dir__, "..", "shortcomings.yaml"))
  end

  let(:links) do
    shortcomings
     .values
     .map { |s| s["desc"] }
     .map { |desc| Nokogiri::HTML::fragment(desc) }
     .flat_map { |html| html.css("a[href]") }
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
