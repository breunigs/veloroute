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

describe "shortcomings.yaml" do
  let(:shortcomings) do
    YAML.load_file(File.join(__dir__, "..", "shortcomings.yaml"))
  end

  it "uses only URL safe names" do
    expect(shortcomings.keys).to all(match /\A[a-z0-9-]+\z/)
  end

  it "has titles for all entries" do
    expect(shortcomings.values).to all(include('title'))
  end

  context "integration", integration: true do
    before { allow_net_connect! }
    after { disable_net_connect! }

    it "links only valid URLs" do
      urls = shortcomings
        .values
        .map { |s| s["desc"] }
        .map { |desc| Nokogiri::HTML::fragment(desc) }
        .flat_map { |html| html.css("a[href]") }
        .map { |a| a.attr(:href) }
        .select { |url| url.match(%r{^https?://}i) }

      expect(urls).to all(resolve_with_200)
    end
  end
end
