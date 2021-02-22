#!/usr/bin/env ruby

require 'nokogiri'
require 'yaml'
require 'open-uri'

LSBG_SEEN_LINKS_FN = File.join(__dir__, "./lsbg_seen_links.txt")
LSBG_NEWS_URLS = [
  "https://lsbg.hamburg.de/aktuelle-planungen/",
  "https://lsbg.hamburg.de/anliegerinformationen"
]

seen = YAML.load_file(LSBG_SEEN_LINKS_FN)
seen_links = seen.values.flatten

LSBG_NEWS_URLS.each do |lsbg_url|
  raw_html = OpenURI.open_uri(lsbg_url).read
  ff = Nokogiri::HTML::fragment(raw_html)

  ff.css(".linklist a").each do |link|
    href = link.attr(:href)
    next if seen_links.include?(href)

    abs = URI.join(lsbg_url, href).to_s

    puts "NEW LINK: #{link.text.strip}"
    puts "          #{abs}"
    puts

    seen[Date.today.to_s] ||= []
    seen[Date.today.to_s] << href
  end

  File.write(LSBG_SEEN_LINKS_FN, seen.to_yaml)
end
