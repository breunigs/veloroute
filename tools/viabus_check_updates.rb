#!/usr/bin/env ruby

require 'date'
require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'parallel'
require 'yaml'

SEEN_LINKS_FN = File.join(__dir__, './viabus_seen_links.txt')
TODAY = Date.today.to_s

BASE_URL = 'https://via-bus.hamburg.de/'

seen = YAML.load_file(SEEN_LINKS_FN)
seen_links = seen.values.flatten

def abs_url(link)
  href = link.attr(:href)
  return nil if href.nil? || href.empty? || href.start_with?("javascript:")

  uri = URI.parse(href)
  return nil if uri.path.nil?

  abs = uri.relative? ? URI.join(BASE_URL, uri.path) : uri
  abs.to_s
end

def traverse(url, processed = {})
  return [] if processed.key?(url)
  processed[url] = true
  raw_html = open(url).read and print "."
  ff = Nokogiri::HTML::fragment(raw_html)
  ff.css("#main a").flat_map do |link|
    abs = abs_url(link)
    next if abs.nil?
    next {url: abs, text: link.text.strip} if abs.downcase.end_with?(".pdf")

    traverse(abs, processed) if abs.start_with?(BASE_URL) && abs.end_with?("/")
  end.compact
end

pdfs = traverse(URI.join(BASE_URL, "/plaene"))
exit(0) if pdfs.none?

pdfs.uniq.each do |info|
  next if seen_links.include?(info[:url])
  seen[TODAY] ||= []
  seen[TODAY] << info[:url]

  puts "NEW LINK: #{info[:text]}"
  puts "          #{info[:url]}"
  puts
end

File.write(SEEN_LINKS_FN, seen.to_yaml)
