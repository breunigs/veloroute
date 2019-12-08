require 'spec_helper'
require 'open3'
require_relative '../routes/blog.rb'

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
  failure_message do |a|
    "#{a[:name]}##{a[:pos]} should be a closed ring"
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
  failure_message do |a|
    "#{a[:name]}##{a[:pos]} should follow the right-hand-rule"
  end
end

RSpec::Matchers.define :have_place_class do
  match do |a|
    a.classes.include?("place")
  end
end

RSpec::Matchers.define :have_area_or_image_array do
  match do |a|
    area = a.instance_variable_get(:@raw)["area"]
    area || a.images.is_a?(Array)
  end
  failure_message do |a|
    "#{a.name} should either specify an area or have a list of images"
  end
end

RSpec::Matchers.define :have_images do
  match do |a|
    a.images != nil
  end
  failure_message do |a|
    "#{a.name} should either specify images if it has an area"
  end
end

RSpec::Matchers.define :have_valid_html do
  match do |a|
    parsed = Nokogiri::HTML::fragment(a.text)
    parsed.errors.size == 0
  end
  failure_message do |a|
    "#{a.name} has invalid HTML: #{Nokogiri::HTML::fragment(a.text).errors}"
  end
end

RSpec::Matchers.define :have_place_link_start do
  match do |a|
    url = a.attr(:href)
    url.start_with?(%r{/\d*#}) || url.start_with?(/#\d/)
  end
  failure_message do |a|
    "URL for #{a} seems not right"
  end
end

RSpec::Matchers.define :have_route_ref_for_images do
  match do |a|
    url = a.attr(:href)
    has_img_in_hash = url.split('#').last.count('/') == 3
    has_img_in_hash ? url.start_with?(%r{/\d+#}) : true
  end
  failure_message do |a|
    "URL for #{a} has an image, but no route for it"
  end
end

describe "blog/*.yaml" do
  let(:posts) { Blog.instance.posts }

  let(:links) do
    posts
     .map(&:text)
     .map { |desc| Nokogiri::HTML::fragment(desc) }
     .flat_map { |html| html.css("a[href]") }
  end

  it "uses only URL safe names" do
    expect(posts.map(&:name)).to all(match /\A[a-z0-9-]+\z/)
  end

  it "has valid HTML in text" do
    expect(posts).to all(have_valid_html)
  end

  it "specifies area if re-using route images" do
    reusers = posts.select { |p| p.images.is_a?(Integer) }
    expect(reusers).to all(have_area_or_image_array)
  end

  it "has images if area is specified" do
    with_area = posts.select { |p| p.instance_variable_get(:@raw)["area"] != nil }
    expect(with_area).to all(have_images)
  end

  it "has titles for all entries" do
    expect(posts.map(&:title)).to all(match /\w+/)
  end

  it "has last check dates in the past" do
    expect(posts.map(&:date)).to all(be <= Date.today)
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
    expect(placehrefs).to all(have_place_link_start).and all(have_route_ref_for_images)
  end

  it "uses proper GeoJSON polygons for area" do
    polygons = []

    posts.each do |post|
      next unless post.instance_variable_get(:@raw)['area']

      post.geometry[:coordinates].each.with_index do |poly, pos|
        polygons << {name: post.name, pos: pos, polygon: poly}
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
