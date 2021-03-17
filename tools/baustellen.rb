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

references = Dir.glob(File.join(__dir__, "../data/articles/*.yaml")).flat_map do |path|
  construction_ids = YAML.load_file(path)["construction_site_id_hh"]
  [construction_ids].flatten.map { |cid| [cid, path] }
end.to_h
references.delete(nil)

updates = Parallel.map(ids, in_threads: 4) do |id|
  jsonRaw = OpenURI.open_uri("https://roads-steckbrief.hamburg/api/steckbriefeweb/id/#{id}").read
  json = JSON.parse(jsonRaw)
  print "."

  prev = seen[json["id"]]
  if prev && prev[:updated] == json['updateDatetime']
    next
  end

  {
    id: id,
    title: "#{json["titel"]} -- #{json["organisationId"]}",
    updated: json['updateDatetime'],
    link: json["internetLink"],
    start: json["bauintervall"]["start"],
    end: json["bauintervall"]["end"],
    velo: jsonRaw.downcase.include?("veloroute"),
  }.compact
end.compact

updates.each do |upd|
  seen[upd[:id]] = upd

  path = references[upd[:id]]
  if path
    startText = "start: #{upd[:start]}"
    endText = "end: #{upd[:end]}"
    full = File.read(path)
    updated = full.dup

    if !updated.include?(startText) && upd[:start]
      updated.sub!(/^start: .*$/, startText) || updated.prepend("#{startText}\n")
    end
    if !updated.include?(endText) && upd[:end]
      updated.sub!(/^end: .*$/, endText) || updated.prepend("#{endText}\n")
    end

    if full != updated
      File.write(path, updated)
      puts "\n✓ #{File.basename(path)}"
    end

    next
  end

  puts <<~TEXT

    #{upd[:title]}
      start: #{upd[:start]}
      end: #{upd[:end]}
      velo: #{upd[:velo]}
      curl -s https://roads-steckbrief.hamburg/api/steckbriefeweb/id/#{upd[:id]} | jq
  TEXT
  puts "  " + upd[:link] if upd[:link]
end

File.write(SEEN_FN, seen.to_yaml)
puts
