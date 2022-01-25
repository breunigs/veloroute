#!/usr/bin/env ruby

require 'nokogiri'
require 'json'
require 'yaml'
require 'pry'
require 'open-uri'
require 'net/http'
require 'net/https'

EVERGABE_SEEN = File.join(__dir__, "./evergabe_seen.txt")
PAGE_URL = "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/tabs/home"
SEARCH_TERM = URI.encode_www_form_component("velo")
SEARCH_URL = "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/supplier/project/public?cultureName=de-DE&pageIndex=0&pageSize=15&searchTerm=#{SEARCH_TERM}&sortExpression=biddingPeriod%20desc"

seen = {}
seen = YAML.load_file(EVERGABE_SEEN) if File.exist?(EVERGABE_SEEN)
needs_save = false

begin
  raw_html = OpenURI.open_uri(PAGE_URL).read
  ff = Nokogiri::HTML::fragment(raw_html)
  auth_token = ff.css("script").first.text.match(/auth_token\s*=\s*['"]([^"']+)['"]/)[1]

  uri = URI.parse(SEARCH_URL)
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = SEARCH_URL.start_with?("https")
  req = Net::HTTP::Get.new(uri.path+"?"+uri.query)
  req['__RequestVerificationToken'] = auth_token
  res = https.request(req)
  json = JSON.parse(res.body)

  json["projects"].each do |proj|
    next if seen[proj["identifier"]] == proj["publicationDate"]
    seen[proj["identifier"]] = proj["publicationDate"]
    needs_save = true
    puts <<~DOC

      #{"="*60}
      #{proj["title"]}
      publish:  #{proj["publicationDate"]}
      from:     #{proj["contractingAuthority"]}
      project:  #{proj["projectGroupName"]}
      where:    #{proj["placeOfDelivery"]}
      link:     #{proj["deepLink"].sub("stadt.hamburg.de", "web.hamburg.de")}
      download: #{proj["downloadLink"]}
      #{proj["info"].gsub(/[\r\n]+/, " ")}
    DOC
  end
rescue => e
  pp e
  binding.pry
end

File.write(EVERGABE_SEEN, seen.to_yaml) if needs_save
