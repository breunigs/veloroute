#!/usr/bin/env ruby

require 'pry'

# Convert a regular video to a time lapsed one.

# The ffmpeg commands assume that the source video is a regular 23.976 FPS video.
# Since time lapsed videos are usually at 30000/1001 FPS and 5x faster than a regular
# video, the PTS is additionally adjusted to match the same speed.

ARGV.each do |file|
  warn "\n\nworking on #{file}"
  target = "#{file}_time_lapse.mkv"

  if File.exist?(target)
    warn "  target already exists, skpping (#{target})"
    next
  end

  warn "  asserting input has expected FPS"
  fps = `mediainfo --Inform='Video;%FrameRate%\n%Duration%' "#{file}"`.to_f
  binding.pry unless $?.success?
  if fps != 23.976
    warn "  video has #{fps} fps. It should have 23.976 fps though. Skipping."
    next
  end

  Dir.mktmpdir("video_deshake_time_lapse") do |temp_dir|
    warn "  fixing speed"
    `nice -n18 ffmpeg -hide_banner -loglevel warning -r 30000/1001 -i "#{file}" -vf "setpts=1/4*PTS" -an -c:v ffv1 "#{target}"`
    binding.pry unless $?.success?

    warn "  renaming original"
    FileUtils.mv file, "#{file}_"
  end
end
