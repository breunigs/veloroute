#!/usr/bin/env ruby

require 'open-uri'
require 'date'
require 'json'
require 'pry'
require 'yaml'
require 'parallel'

SEEN_FN = File.join(__dir__, './baustellen_seen_ids.txt')
seen = YAML.load_file(SEEN_FN)

def ids_by_date(date)
  json = OpenURI.open_uri("https://roads-steckbrief.hamburg/api/steckbriefeweb/list?date=#{date}").read
  print "."
  JSON.parse(json).map { |entry| entry["id"] }
end

ids = ids_by_date(Date.today) + ids_by_date(Date.today + 7) + ids_by_date(Date.today + 30)
ids = ids.uniq

updates = Parallel.map(ids, in_threads: 4) do |id|
  json = OpenURI.open_uri("https://roads-steckbrief.hamburg/api/steckbriefeweb/id/#{id}").read
  json = JSON.parse(json)

  prev = seen[json["id"]]
  if prev && prev[:updated] == json['updateDatetime']
    print "."
    next
  end
  print "✓"

  {
    id: id,
    title: "#{json["titel"]} -- #{json["organisationId"]}",
    updated: json['updateDatetime'],
    link: json["internetLink"],
    start: json["bauintervall"]["start"],
    end: json["bauintervall"]["end"]
  }.compact
end.compact

updates.each do |upd|
  seen[upd[:id]] = upd

  puts <<~TEXT

    #{upd[:title]}
      start: #{upd[:start]}
      end: #{upd[:end]}
      curl -s https://roads-steckbrief.hamburg/api/steckbriefeweb/id/#{upd[:id]} | jq
  TEXT
  puts "  " + upd[:link] if upd[:link]
end

File.write(SEEN_FN, seen.to_yaml)
puts
