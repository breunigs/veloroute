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
pipes2 = []
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

blur = ENV['ANONYMIZE'] == '1' || ENV['BLUR'] == '1'

def parse_ffmpeg_timestamp(string)
  # example: 00:01:46.473
  h, m, s, ms = string.split(/[:.]/).map(&:to_i)
  h * 3600 + m * 60 + s + ms / 1000.0
end

def nice
  %w[nice -n18 ionice -c 3]
end

PROBES = {}
def probe(video)
  PROBES[video] ||= begin
    out = `ffprobe -v 0 -of compact=p=0 -select_streams 0 -show_entries stream=r_frame_rate:format=duration #{video}`
    raise "failed to get frame rate for #{video}: #{out}" unless $?.success?
    parts = out.match(/^r_frame_rate=(\d+)\/(\d+)$/).captures.map(&:to_i)
    dur = out.match(/^duration=([0-9\.]+)$/).captures[0].to_f
    {
      fps: Rational(parts[0], parts[1]),
      duration_in_s: dur
    }
  end
end

def ffmpeg_input(video, start, stop, idx, blur)
  info = nil

  is_start = start == "start" || start == "00:00:00.000"
  start_in_s = is_start ? 0 : parse_ffmpeg_timestamp(start)

  is_end = stop == "end"
  end_in_s = !is_end ? parse_ffmpeg_timestamp(stop) : begin
    info ||= probe(video)
    info[:duration_in_s]
  end

  blur_frame_skip = 0
  if blur && !is_start
    info ||= probe(video)
    blur_frame_skip = (start_in_s*info[:fps]).ceil
  end

  cutter = []
  cutter += ["-sseof", start] if !is_start && start[0] == "-"
  cutter += ["-ss", start] if !is_start && start[0] != "-"
  cutter += ["-to", stop] if !is_end
  cutter += ["-i", video]

  blurrer = "[#{idx}]frei0r=jsonblur:#{video}.json.gz|#{blur_frame_skip}[blur#{idx}]"

  {
    cutter: cutter,
    blurrer: blurrer,
    duration: (end_in_s - start_in_s).round(3)
  }
end

def ffmpeg_run(cmd, bar)
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
    ensure
      die("concat: #{out}") unless wait_thr.value == 0
    end

    until stdout.eof? do
      begin
        STDOUT.write(stdout.read(1024))
      rescue Errno::EPIPE
        die("concat: stdout closed prematurely, aborting")
      rescue Interrupt
        die("concat: interrupt was signaled, aborting")
      end
    end
    stdout.close
  end

  bar.log("video_concat: finished reading, waiting for receiver to complete")
end

def create_bar(duration)
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

# fade duration, or 8 frames @ 29.97fps
fade_for = (ARGV[groups.size*3+0] || 29.97/8.0).to_f
duration = ARGV[groups.size*3+1]
bar = create_bar(duration)

Dir.mktmpdir("video_concat") do |temp_dir|
  inputs = []

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
    [fade duration in seconds]
    [hh:mm:ss.milli xor total_seconds.milli (for progress bar)]
    MAN

    die("File not found: #{video}") unless File.exist?(video)

    inputs << ffmpeg_input(video, start, stop, idx, blur)
  end

  filters = []
  filters += inputs.map { |inp| inp[:blurrer] } if blur
  duration = 0
  inputs.each.with_index do |inp, idx|
    offset = duration
    duration += inp[:duration] - fade_for
    next if idx == 0
    from = blur ? "blur" : ""
    prev = idx == 1 ? "#{from}0" : "fade#{idx-1}"
    xfade = "[#{prev}][#{from}#{idx}]xfade=transition=fade:duration=#{fade_for}:offset=#{offset}"
    xfade << "[fade#{idx}]" if idx < inputs.size-1
    filters << xfade
  end

  cmd = nice()
  cmd += ["ffmpeg", "-hide_banner"]
  cmd += inputs.flat_map { |inp| inp[:cutter] }
  cmd += ["-filter_complex", filters.join(";")]
  cmd += [ "-an", "-pix_fmt", "yuv420p", "-f", "yuv4mpegpipe", "-"]

  ffmpeg_run(cmd, bar)
end
