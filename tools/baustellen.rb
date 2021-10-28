#!/usr/bin/env ruby

require 'open-uri'
require 'date'
require 'json'
require 'pry'
require 'yaml'
require 'parallel'

SEEN_FN = File.join(__dir__, './baustellen_seen_ids.txt')
seen = YAML.load_file(SEEN_FN)

references = Dir.glob(File.join(__dir__, "../data/articles/*.yaml")).flat_map do |path|
  construction_ids = YAML.load_file(path)["construction_site_id_hh"]
  [construction_ids].flatten.map { |cid| [cid, path] }
end.to_h
references.delete(nil)

def ids_by_date(date)
  json = OpenURI.open_uri("https://bauweiser.hamburg.de/api/steckbriefeweb/list?date=#{date}").read
  print "."
  JSON.parse(json).map { |entry| entry["id"] }
end

ids = ids_by_date(Date.today) + ids_by_date(Date.today + 7) + ids_by_date(Date.today + 30)
ids = (ids + references.keys).uniq


updates = Parallel.map(ids, in_threads: 4) do |id|
  url = "https://bauweiser.hamburg.de/api/steckbriefeweb/id/#{id}"
  jsonRaw = OpenURI.open_uri(url).read
  json = JSON.parse(jsonRaw)
  print "."

  text = jsonRaw.downcase
  velo = ["veloroute", "radverkehr", "radfahr"].any? { |x| text.include?(x) }

  {
    id: id,
    title: "#{json["titel"]} -- #{json["organisationId"]}",
    updated: json['updateDatetime'],
    link: json["internetLink"],
    start: json["bauintervall"]["start"]&.strip,
    end: json["bauintervall"]["end"]&.strip,
    velo: velo,
  }.compact
rescue => e
  warn "baustellen.rb: failed to process id=#{id} #{url}\n#{e}\n"
  nil
end.compact


rewrite = {}

updates.each do |upd|
  path = references[upd[:id]]
  if path
    rewrite[path] ||= {starts: [], ends: []}
    rewrite[path][:starts] << upd[:start]
    rewrite[path][:ends] << upd[:end]
  end

  prev = seen[upd[:id]]
  alreadySeen = prev && prev[:updated] == upd[:updated]
  next if alreadySeen || path

  seen[upd[:id]] = upd
  puts <<~TEXT

    #{upd[:title]}
      start: #{upd[:start]}
      end: #{upd[:end]}
      velo: #{upd[:velo]}
      curl -s https://bauweiser.hamburg.de/api/steckbriefeweb/id/#{upd[:id]} | jq
  TEXT
  puts "  " + upd[:link] if upd[:link]
end

rewrite.each do |path, dates|
  startDate = dates[:starts].compact.min
  endDate = dates[:ends].compact.max
  startText = "start: #{startDate}"
  endText = "end: #{endDate}"

  updated = File.read(path)
  next if updated.include?(startText) && updated.include?(endText)

  if startDate
    updated.sub!(/^start: .*$/, startText) || updated.prepend("#{startText}\n")
  end
  if endDate
    updated.sub!(/^end: .*$/, endText) || updated.prepend("#{endText}\n")
  end

  File.write(path, updated)
  puts "\n✓ #{File.basename(path)}"
end


File.write(SEEN_FN, seen.to_yaml)
puts
