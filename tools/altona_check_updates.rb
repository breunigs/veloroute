#!/usr/bin/env ruby

require 'date'
require 'net/http'
require 'nokogiri'
require 'yaml'

SEEN_LINKS_FN = File.join(__dir__, "./altona_seen_links.txt")
INDEX_URL = "https://sitzungsdienst-altona.hamburg.de/bi/vo040.asp"
DETAILS_URL = "https://sitzungsdienst-altona.hamburg.de/bi/"

seen = YAML.load_file(SEEN_LINKS_FN)
seen_links = seen.values.flatten

url = URI.parse(INDEX_URL)

%w[velo straße radverkehr].each do |keyword|
  params = {filtvobetr1: :filter, filtvoname: :filter, VO040FIL2: keyword}
  resp, _data = Net::HTTP.post_form(url, params)
  ff = Nokogiri::HTML::fragment(resp.body)

  ff.css("#rismain tbody tr").each do |row|
    next unless row.css("td img[src='images/attmnt.gif']").any?
    link = row.css("td a").first
    href = link.attr(:href)
    next if seen_links.include?(href)

    abs = URI.join(DETAILS_URL, href).to_s

    puts "NEW LINK: #{link.text.strip}"
    puts "          #{abs}"
    puts

    seen[Date.today.to_s] ||= []
    seen[Date.today.to_s] << href
  end
end

File.write(SEEN_LINKS_FN, seen.to_yaml)
