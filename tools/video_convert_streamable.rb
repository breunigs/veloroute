#!/usr/bin/env ruby

require 'tmpdir'
require 'ruby-progressbar'

VIDEO_OUT_DIR = ARGV[0]
COMBINED_SIZE_BYTES = ARGV[1] && ARGV[1].to_i > 0 ? ARGV[1].to_i : nil
PARENT_DIR = File.dirname(VIDEO_OUT_DIR)

def die(msg)
  warn msg
  $stdin.close
  exit(1)
end

if VIDEO_OUT_DIR.nil? || VIDEO_OUT_DIR == ""
  die <<~MAN
    Usage:
      cat <some video. | $0 <output directory>
  MAN
end

unless File.directory?(PARENT_DIR) && File.writable?(PARENT_DIR)
  die "No write access to #{PARENT_DIR}"
end

if File.exist?(VIDEO_OUT_DIR)
  die "#{VIDEO_OUT_DIR} already exists -- refusing to overwrite"
end

# length of a single segment in seconds. Quality usually switches between
# segments. https://ffmpeg.org/ffmpeg-formats.html#Options-8
HLS_TIME="2"
# FPS of the source videos. We can't easily change this, since the GPX tracks
# match the FPS.
FPS = 29.97
# GOP=group of pictures, essentially when to insert a keyframe. The script sets
# the min/max for this to the same value, i.e. there will be a keyframe exactly
# every GOP_SIZE. Ideally HLS_TIME * FPS = GOP_SIZE.
# https://video.stackexchange.com/a/24684
GOP_SIZE=(HLS_TIME.to_i * FPS).round.to_s

VARIANTS = [
  {title: "360p",       width:  640, height:  360, bitrate:  4   },
  {title: "144p",       width:  256, height:  144, bitrate:  0.7 },
  {title: "240p",       width:  426, height:  240, bitrate:  2   },
  {title: "720p",       width: 1280, height:  720, bitrate:  6   },
  {title: "1080p",      width: 1920, height: 1080, bitrate: 12   },
  {title: "1080p (HD)", width: 1920, height: 1080, bitrate: 12, codec: %w[libx265 -x265-params log-level=error]},
]

# The average bitrate is given in the variants above. This defined
# how much the maximum bitrate may deviate from that (as a ratio)
MAX_BITRATE = 1.1
# The sliding window in which the codec can distribute its bits,
# as a ratio of the bitrate, see
# https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate
BUF_SIZE = 2.0

$bar = ProgressBar.create(
  format: '%a [%W]%E (%R MiB/s)',
  total: COMBINED_SIZE_BYTES,
  smoothing: 0.2,
  rate_scale: lambda { |rate| rate / 1024 / 1024 }
)

def ffmpeg
  cmd =  %w[nice -n18 ffmpeg -hide_banner -loglevel warning]
  cmd << %w[-re -f matroska -i -]
  cmd << %w[-preset veryslow -keyint_min] << GOP_SIZE << "-g" << GOP_SIZE << %w[-sc_threshold 0]
  cmd << %w[-pix_fmt yuv420p -refs 5]
  cmd
end

tmp_dir = Dir.mktmpdir("video_convert_streamable__#{File.basename(VIDEO_OUT_DIR)}__", PARENT_DIR)
at_exit { FileUtils.remove_entry(tmp_dir, true) }

# mp4 (fallback and ie11)
fallback = ffmpeg()
fallback << "-c:v" << "libx264" << "-s" << "#{VARIANTS[0][:width]}x#{VARIANTS[0][:height]}"
rate = VARIANTS[0][:bitrate]
fallback << ["-b:v", "#{rate}M", "-maxrate", "#{rate * MAX_BITRATE}M", "-bufsize", "#{rate*BUF_SIZE}M"]
fallback << %w[-movflags +faststart]
fallback << "#{tmp_dir}/fallback.mp4"

# hls
hls = ffmpeg()
VARIANTS.each.with_index do |var, idx|
  hls << "-c:v:#{idx}" << (var[:codec] || "libx264") << "-flags" << "+cgop"
  hls << %w[-map v:0] << "-s:#{idx}" << "#{var[:width]}x#{var[:height]}"
  hls << "-metadata:s:v:#{idx}" << %|title="#{var[:title]}"|
  rate = var[:bitrate]
  hls << ["-b:v:#{idx}", "#{rate}M"]
  hls << ["-maxrate:#{idx}", "#{rate * MAX_BITRATE}M"]
  hls << ["-bufsize:#{idx}", "#{rate*BUF_SIZE}M"]
end
hls << %w[-movflags +faststart]
hls << %w[-f hls -hls_time] << HLS_TIME << %w[-hls_playlist_type vod]
hls << %w[-hls_segment_type fmp4]
hls << %w[-master_pl_name] << "stream.m3u8"
hls << %w[-hls_flags single_file+independent_segments -hls_list_size 0]
hls << %w[-var_stream_map] << VARIANTS.map.with_index { |_, idx| "v:#{idx}"}.join(" ")
hls << "#{tmp_dir}/stream_%v.m3u8"


$ios = []
$stdin.binmode

def cancel
  warn "Aborting…"
  $stdin.close
  $ios.each { |io| Process.kill("KILL", io.pid) unless io.closed? }
  $ios.each(&:close)
  exit(2)
end

Signal.trap("TERM") { cancel() }
Signal.trap("INT") { cancel() }

begin
  $ios << IO.popen(fallback.flatten, "w+")
  $ios << IO.popen(hls.flatten, "w+")

  loop do
    break if $stdin.closed?
    buf = $stdin.readpartial(1024*1024)
    $bar.progress += buf.size
    $ios.each { |io| io.write(buf) }
  rescue EOFError
    # stdin is empty
    $stdin.close
    break
  end
ensure
  $ios.each { |io| io.close() }
end

$bar.finish

print "\nRenaming… "
File.rename(tmp_dir, VIDEO_OUT_DIR)
puts "Done!"
