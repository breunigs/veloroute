#!/usr/bin/env ruby

require 'nokogiri'
require 'yaml'
require 'open-uri'

LSBG_SEEN_LINKS_FN = File.join(__dir__, "./lsbg_seen_links.txt")
LSBG_NEWS_URL = "http://lsbg.hamburg.de/aktuelle-planungen/"

seen = YAML.load_file(LSBG_SEEN_LINKS_FN)
seen_links = seen.values.flatten

raw_html = open(LSBG_NEWS_URL).read
ff = Nokogiri::HTML::fragment(raw_html)

ff.css(".linklist a").each do |link|
  href = link.attr(:href)
  next if seen_links.include?(href)

  abs = URI.join(LSBG_NEWS_URL, href).to_s

  puts "NEW LINK: #{link.text.strip}"
  puts "          #{abs}"
  puts

  seen[Date.today.to_s] ||= []
  seen[Date.today.to_s] << href
end

File.write(LSBG_SEEN_LINKS_FN, seen.to_yaml)
