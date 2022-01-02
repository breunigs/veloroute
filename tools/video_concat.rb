#!/usr/bin/env ruby

require 'ruby-progressbar'
require 'tmpdir'
require 'open3'

Thread.abort_on_exception = true

def die(msg)
  warn "video_concat: #{msg}"
  exit(1)
end

pipes = ""
readers = Thread::Queue.new

groups = []
ARGV.each_slice(3) do |group|
  next if group.size != 3
  groups << group
end

video_types = groups.map do |group|
  File.basename(group[0]).split(".").last.downcase
end
single_video_type = video_types.uniq.size <= 1

blur = ENV['ANONYMIZE'] == '1'

# ffmpeg cannot cut accurately with a copy codec and cuts on keyframes only,
# see https://trac.ffmpeg.org/wiki/Seeking#Seekingwhiledoingacodeccopy
# additionally, we can't "copy" mixed codecs together
codec = ENV['INACCURATE_CUTS'] == '1' && single_video_type && !blur ? 'copy' : 'yuv4'
warn "video_concat: concatting using codec #{codec}"

def parse_ffmpeg_timestamp(string)
  # example: 00:01:46.473
  h, m, s, ms = string.split(/[:.]/).map(&:to_i)
  h * 3600 + m * 60 + s + ms / 1000.0
end

def determine_frame_rate(video)
  frame_rate = `ffprobe -v 0 -of compact=p=0 -select_streams 0 -show_entries stream=r_frame_rate #{video}`
  raise "failed to get frame rate for #{video}: #{frame_rate}" unless $?.success?
  parts = frame_rate.match(/^r_frame_rate=(\d+)\/(\d+)\n$/).captures.map(&:to_i)
  Rational(parts[0], parts[1])
end

def ffmpeg_reader(video, start, stop, idx, codec, blur, fifo)
  is_start = start == "start"
  is_end = stop == "end"

  blur_frame_skip = 0
  if blur && !is_start
    start_in_s = parse_ffmpeg_timestamp(start)
    fps = determine_frame_rate(video)
    blur_frame_skip = (start_in_s*fps).ceil
  end

  cmd = ["nice", "-n18", "ffmpeg", "-hide_banner", "-loglevel", "fatal", "-y"]
  cmd += ["-hwaccel", "auto"]
  cmd += ["-sseof", start] if !is_start && start[0] == "-"
  cmd += ["-ss", start] if !is_start && start[0] != "-"
  cmd += ["-to", stop] if !is_end
  cmd += ["-i", video]
  cmd += ["-vf", "frei0r=jsonblur:#{video}.json.gz|#{blur_frame_skip}"] if blur
  cmd += ["-c:v", codec, "-an", "-f", "matroska", fifo]
  io = IO.popen(cmd)
  at_exit { Process.kill("KILL", io.pid) unless io.closed? }
  out = io.read
  io.close
  die(out) unless $?.success?
end

def ffmpeg_concat(concat, bar)
  cmd = ["nice", "-n18", "ffmpeg", "-hide_banner", "-f", "concat",
    "-safe", "0", "-i", concat, "-c:v", "copy", "-an", "-f", "matroska", "-"]

  Open3.popen3(*cmd) do |stdin, stdout, stderr, wait_thr|
    at_exit { Process.kill("KILL", wait_thr.pid) unless stderr.closed? }
    stdin.close

    Thread.new do
      out = ''
      until stderr.eof? do
        read = stderr.read_nonblock(128)
        out << read
        last_kbyte = out[-1024..-1] || out
        extract = last_kbyte.scan(/time=(\d{2,}:\d{2}:\d{2}\.\d+) /).last
        next unless extract
        bar.progress = parse_ffmpeg_timestamp(extract[0]).round(1)
      end
      stderr.close
    rescue IOError => e
      # e.g. when closed in another thread
    end

    until stdout.eof? do
      begin
        STDOUT.write(stdout.read(1024))
      rescue Errno::EPIPE
        die("stdout closed prematurely, aborting")
      rescue Interrupt
        die("interrupt was signaled, aborting")
      end
    end
    stdout.close

    die(out) unless wait_thr.value == 0
  end

  bar.log("video_concat: finished reading, waiting for receiver to complete")
end

def create_bar()
  duration = ARGV.size % 3 == 1 ? ARGV[-1] : nil
  if duration && duration.to_f > 0
    duration = duration.to_f
  elsif duration
    parse_ffmpeg_timestamp(duration)
  end

  # an empty format still prints log messages, but no intermediate bar
  ProgressBar.create(
    format: duration ? "%a [%W]%E (%cs/%us)" : "",
    total: duration&.round,
    smoothing: 0.2,
    output: $stderr,
  )
end

bar = create_bar()

Dir.mktmpdir("video_concat") do |temp_dir|
  groups.each.with_index do |group, idx|
    video, start, stop = *group
    die(<<~MAN) if start.nil? || stop.nil?

      Usage:
      #{$0} \\
      video0 start_time     end_time     \\
      video1 hh:mm:ss.milli hh:mm:ss.milli \\
      video2 hh:mm:ss.milli hh:mm:ss.milli \\
      video2 "start"        "end" \\
      …
      [hh:mm:ss.milli xor total_seconds.milli (for progress bar)]
    MAN

    die("File not found: #{video}") unless File.exist?(video)

    fifo = File.join(temp_dir, "temp#{idx}")
    File.mkfifo(fifo)
    pipes << "file '#{fifo}'\n"
    readers << [video, start, stop, idx, codec, blur, fifo]
  end
  readers.close

  3.times do
    Thread.new do
      while args = readers.pop do
        ffmpeg_reader(*args)
        bar.log("video_concat: finished ##{args[3]+1}: (#{args[0]})")
      end
    end
  end

  concat = File.join(temp_dir, "pipes")
  File.write(concat, pipes)

  ffmpeg_concat(concat, bar)
end
