#!/usr/bin/env ruby

require 'date'
require 'net/http'
require 'nokogiri'
require 'parallel'
require 'yaml'

SEEN_LINKS_FN = File.join(__dir__, './sitzungsdienst_seen_links.txt')
# Note: Mitte and Bergedorf(?) currently do not attach PDFs :(
DISTRICTS = %w[altona eimsbuettel hamburg-mitte hamburg-nord wandsbek bergedorf harburg]
FILTER_KEYWORDS = %w[velo straße radverkehr fahrrad verschickung baustelle twiete chaussee allee bezirksroute]

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

def index_url(district)
  "https://sitzungsdienst-#{district}.hamburg.de/bi/vo040.asp"
end

def details_url(district)
  "https://sitzungsdienst-#{district}.hamburg.de/bi/"
end

def indent(str, prepend)
  str.split(/\n+/).map { |line| "    #{line}" }.join("\n")
end

def post(url, params)
  req = Net::HTTP::Post.new(url)
  req.form_data = params
  opts = {
    read_timeout: 120, # seconds
    use_ssl: url.scheme == 'https'
  }
  Net::HTTP.start(url.hostname, url.port, opts) do |http|
    print '.'
    http.request(req)
  end
end

seen = YAML.load_file(SEEN_LINKS_FN)
seen_links = seen.values.flatten

links = Parallel.map(DISTRICTS, in_threads: DISTRICTS.size) do |district|
  url = URI.parse(index_url(district))

  FILTER_KEYWORDS.flat_map do |keyword|
    params = {filtvobetr1: :filter, filtvoname: :filter, VO040FIL2: keyword}
    resp, _data = post(url, params)
    ff = Nokogiri::HTML::fragment(resp.body)

    ff.css('#rismain tbody tr').map do |row|
      next unless row.css("td img[src='images/attmnt.gif']").any?
      link = row.css("td a").first
      href = link.attr(:href)

      abs = URI.join(details_url(district), href).to_s
      next if seen_links.include?(abs)

      {district: district, title: link.text.strip, url: abs}
    end.compact
  end.uniq { |e| e[:url] }
end.flatten

exit(0) if links.empty?

today = Date.today.to_s
seen[today] ||= []

puts
puts "NEW LINKS:"
links.each do |link|
  prefix = link[:district].upcase + ': '
  puts
  puts "#{prefix}#{link[:title]}"
  puts indent(link[:url], ' '*prefix.size)

  seen[today] << link[:url]
end

File.write(SEEN_LINKS_FN, seen.to_yaml)
