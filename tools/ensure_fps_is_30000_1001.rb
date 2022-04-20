#!/usr/bin/env ruby

def die(msg)
  puts msg
  exit(1)
end

Dir.glob("*.MP4_time_lapse.mkv").each do |video|
  print "checking #{video}… fps="
  fps = `ffprobe -v error -select_streams v -of default=noprint_wrappers=1:nokey=1 -show_entries stream=r_frame_rate "#{video}"`.strip
  puts fps

  next if fps == "30000/1001"

  puts "fixing…"

  temp_name = "fixed_#{video}"
  wrong_fps_name = "#{video}_wrong_fps"
  die("#{temp_name} already exists") if File.exist?(temp_name)
  die("#{wrong_fps_name} already exists") if File.exist?(wrong_fps_name)

  out = `ffmpeg -loglevel error -hide_banner -i "#{video}" -r 30000/1001 -c:v ffv1 "#{temp_name}"`
  die(out) unless $?.success?

  File.rename(video, wrong_fps_name)
  File.rename(temp_name, video)
end
