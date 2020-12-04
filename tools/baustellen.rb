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

references = Dir.glob(File.join(__dir__, "../data/articles/*.yaml")).map do |path|
  [YAML.load_file(path)["construction_site_id_hh"], path]
end.to_h
references.delete(nil)

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

  path = references[upd[:id]]
  if path
    startText = "start: #{upd[:start]}"
    endText = "end: #{upd[:end]}"
    replStart = system("sed -i 's/^start: .*$/#{startText}/' #{path}") if upd[:start]
    replEnd = system("sed -i 's/^end: .*$/#{endText}/' #{path}") if upd[:end]

    full = File.read(path)
    added = full.dup
    added << "\n#{startText}" if upd[:start] && !full.include?(startText)
    added << "\n#{endText}" if upd[:end] && !full.include?(endText)

    File.write(path, added) if full != added

    next if replStart && replEnd
  end

  puts <<~TEXT

    #{upd[:title]}
      start: #{upd[:start]}
      end: #{upd[:end]}
      curl -s https://roads-steckbrief.hamburg/api/steckbriefeweb/id/#{upd[:id]} | jq
  TEXT
  puts "  " + upd[:link] if upd[:link]
  puts "  updated start: #{replStart}  end: #{replEnd}" if path
end

File.write(SEEN_FN, seen.to_yaml)
puts
