#!/usr/bin/env ruby

require 'date'
require 'net/http'
require 'nokogiri'
require 'yaml'

SEEN_LINKS_FN = File.join(__dir__, './sitzungsdienst_seen_links.txt')
# Note: Mitte and Nord currently do not attach PDFs :(
# todo: wandsbek bergedorf
DISTRICTS = %w[altona eimsbuettel hamburg-mitte hamburg-nord]

def index_url(district)
  "https://sitzungsdienst-#{district}.hamburg.de/bi/vo040.asp"
end

def details_url(district)
  "https://sitzungsdienst-#{district}.hamburg.de/bi/"
end

def indent(str, prepend)
  str.split(/\n+/).map { |line| "    #{line}" }.join("\n")
end

seen = YAML.load_file(SEEN_LINKS_FN)
seen_links = seen.values.flatten

DISTRICTS.each do |district|
  puts district.upcase
  url = URI.parse(index_url(district))

  %w[velo straße radverkehr fahrrad].each do |keyword|
    params = {filtvobetr1: :filter, filtvoname: :filter, VO040FIL2: keyword}
    resp, _data = Net::HTTP.post_form(url, params)
    ff = Nokogiri::HTML::fragment(resp.body)

    ff.css('#rismain tbody tr').each do |row|
      next unless row.css("td img[src='images/attmnt.gif']").any?
      link = row.css("td a").first
      href = link.attr(:href)

      abs = URI.join(details_url(district), href).to_s
      next if seen_links.include?(abs)

      puts "NEW LINK: #{link.text.strip}"
      puts indent(abs, '          ')
      puts

      seen[Date.today.to_s] ||= []
      seen[Date.today.to_s] << abs
    end
  end
end

File.write(SEEN_LINKS_FN, seen.to_yaml)
