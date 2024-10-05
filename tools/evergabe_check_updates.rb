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
SEARCH_TERMS = ["velo", "radverkehr", "INST HVS", "Inst. HVS", "Hauptverkehrsstraße", "Straßenbauarbeiten"].map { |w| URI.encode_www_form_component(w) }

def search_url(term)
  "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/supplier/project/public?cultureName=de-DE&pageIndex=0&pageSize=15&searchTerm=#{term}&sortExpression=biddingPeriod%20desc"
end

seen = {}
seen = YAML.load_file(EVERGABE_SEEN) if File.exist?(EVERGABE_SEEN)
needs_save = false

projects = []

SEARCH_TERMS.each do |term|
  begin
    raw_html = OpenURI.open_uri(PAGE_URL).read
    ff = Nokogiri::HTML::fragment(raw_html)
    auth_token = ff.css("script").first.text.match(/auth_token\s*=\s*['"]([^"']+)['"]/)[1]

    url = search_url(term)
    uri = URI.parse(url)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = url.start_with?("https")
    req = Net::HTTP::Get.new(uri.path+"?"+uri.query)
    req['__RequestVerificationToken'] = auth_token
    res = https.request(req)
    json = JSON.parse(res.body)

    projects += json["projects"] || []
  rescue => e
    pp e
    binding.pry
  end
end

projects.uniq.each do |proj|
  # using bidding period as marker, since the publication date changes for minor updates
  next if seen[proj["projectNumber"]] == proj["biddingPeriod"]
  seen[proj["projectNumber"]] = proj["biddingPeriod"]
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

  puts "\nContinue?"
  gets
  File.write(EVERGABE_SEEN, seen.to_yaml)
end


