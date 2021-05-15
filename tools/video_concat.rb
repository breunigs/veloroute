#!/usr/bin/env ruby

require 'tmpdir'

Thread.abort_on_exception = true

def die(msg)
  warn msg
  exit(1)
end

pipes = ""

Dir.mktmpdir("video_concat") do |temp_dir|
  ARGV.each_slice(3).with_index do |group, idx|
    video, start, stop = *group
    die(<<~MAN) if start.nil? || stop.nil?
      Usage:
      #{$0} \\
      video0 start_time     end_time     \\
      video1 hh:mm:ss.milli hh:mm:ss.milli \\
      video2 hh:mm:ss.milli hh:mm:ss.milli \\
      …
    MAN

    die("File not found: #{video}") unless File.exist?(video)

    fifo = File.join(temp_dir, "temp#{idx}")
    system("mkfifo", fifo)
    pipes << "file '#{fifo}'\n"
    Thread.new do
      io = IO.popen([
        "ffmpeg", "-hide_banner", "-loglevel", "warning", "-y", "-i", video,
        "-ss", start, "-to", stop, "-c", "copy", "-f", "matroska", fifo
      ])
      out = io.read
      io.close
      die(out) unless $?.success?
    end
  end

  concat = File.join(temp_dir, "pipes")
  File.write(concat, pipes)

  system(
    "ffmpeg", "-hide_banner", "-loglevel", "warning", "-f", "concat",
    "-safe", "0", "-i", concat, "-c", "copy", "-f", "matroska", "-"
  )
end

