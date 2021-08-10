#!/usr/bin/env ruby

require 'tmpdir'

Thread.abort_on_exception = true

def die(msg)
  warn msg
  exit(1)
end

pipes = ""

video_types = []
ARGV.each_slice(3) do |group|
  parts = File.basename(group[0]).split(".")
  video_types << parts.size == 1 ? "mp4" : parts.last.downcase
end
single_video_type = video_types.uniq.size <= 1

# ffmpeg cannot cut accurately with a copy codec and cuts on keyframes only,
# see https://trac.ffmpeg.org/wiki/Seeking#Seekingwhiledoingacodeccopy
# additionally, we can't "copy" mixed codecs together
codec = ENV['INACCURATE_CUTS'] == '1' && single_video_type ? 'copy' : 'yuv4'
warn "concatting using codec #{codec}"

total_count = ARGV.size / 3

Dir.mktmpdir("video_concat") do |temp_dir|
  ARGV.each_slice(3).with_index do |group, idx|
    video, start, stop = *group
    die(<<~MAN) if start.nil? || stop.nil?
      Usage:
      #{$0} \\
      video0 start_time     end_time     \\
      video1 hh:mm:ss.milli hh:mm:ss.milli \\
      video2 hh:mm:ss.milli hh:mm:ss.milli \\
      video2 "start"        "end" \\
      …
    MAN

    die("File not found: #{video}") unless File.exist?(video)

    fifo = File.join(temp_dir, "temp#{idx}")
    File.mkfifo(fifo)
    pipes << "file '#{fifo}'\n"
    Thread.new do
      is_start = start == "start"
      is_end = stop == "end"

      cmd = ["nice", "-n18", "ffmpeg", "-hide_banner", "-loglevel", "warning", "-y"]
      cmd += ["-sseof", start] if !is_start && start[0] == "-"
      cmd += ["-ss", start] if !is_start && start[0] != "-"
      cmd += ["-to", stop] if !is_end
      cmd += ["-i", video]
      cmd += ["-c:v", codec, "-an", "-f", "matroska", fifo]
      io = IO.popen(cmd)
      at_exit { Process.kill("KILL", io.pid) unless io.closed? }
      out = io.read
      io.close
      die(out) unless $?.success?
      warn "finished #{idx+1}/#{total_count}: #{video}"
    end
  end

  concat = File.join(temp_dir, "pipes")
  File.write(concat, pipes)

  system(
    "nice", "-n18", "ffmpeg", "-hide_banner", "-loglevel", "warning", "-f", "concat",
    "-safe", "0", "-i", concat, "-c:v", "copy", "-an", "-f", "matroska", "-"
  )
end
