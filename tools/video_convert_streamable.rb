#!/usr/bin/env ruby

require 'tmpdir'
require 'ruby-progressbar'

VIDEO_OUT_DIR = ARGV[0]
EXPECTED_VIDEO_DURATION_MS = ARGV[1] && ARGV[1].to_i > 0 ? ARGV[1].to_i : nil
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

DEFAULT_CODEC = ENV["HW_ACCEL"] == "1" \
  ? %w[libx264 -preset veryslow -x264opts opencl] \
  : %w[libx264 -preset veryslow]
HQ_CODEC = ENV["HW_ACCEL"] == "1" \
  ? %w[hevc_nvenc -preset slow -tier high -level 6.2 -nonref_p 1 -spatial_aq 1] \
  : %w[libx265 -x265-params log-level=error]
VARIANTS = [
  {title: "360p",       width:  640, height:  360, bitrate:  4   },
  {title: "144p",       width:  256, height:  144, bitrate:  0.7 },
  {title: "240p",       width:  426, height:  240, bitrate:  2   },
  {title: "720p",       width: 1280, height:  720, bitrate:  6   },
  {title: "1080p",      width: 1920, height: 1080, bitrate: 12   },
  {title: "1080p (HD)", width: 1920, height: 1080, bitrate: 12, codec: HQ_CODEC},
]

# The average bitrate is given in the variants above. This defined
# how much the maximum bitrate may deviate from that (as a ratio)
MAX_BITRATE = 1.1
# The sliding window in which the codec can distribute its bits,
# as a ratio of the bitrate, see
# https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate
BUF_SIZE = 2.0


tmp_dir = Dir.mktmpdir("video_convert_streamable__#{File.basename(VIDEO_OUT_DIR)}__")
at_exit { FileUtils.rmdir(tmp_dir) }


variants_index = VARIANTS.size - 1
EXPECTED_VIDEO_SIZE = EXPECTED_VIDEO_DURATION_MS/1000.0 * VARIANTS[variants_index][:bitrate]/8.0*1024*1024
$bar = ProgressBar.create(
  format: '%a [%W]%E (%R MiB/s)',
  total: EXPECTED_VIDEO_SIZE.round,
  smoothing: 0.2,
  rate_scale: lambda { |rate| rate / 1024 / 1024 }
)
$bar_thread = Thread.new do
  loop do
    sleep 10

    size = File.new("#{tmp_dir}/stream_#{variants_index}.m4s").size rescue 0
    $bar.progress = size
  rescue ProgressBar::InvalidProgressError
    $bar.total = nil
    retry
  end
end


def ffmpeg
  cmd =  %w[nice -n18 ffmpeg -hide_banner -loglevel warning]
  cmd << %w[-hwaccel auto] if ENV["HW_ACCEL"] == "1"
  cmd << %w[-re -f matroska -i -]
  cmd << %w[-keyint_min] << GOP_SIZE << "-g" << GOP_SIZE << %w[-sc_threshold 0]
  cmd << %w[-pix_fmt yuv420p -refs 5]
  cmd
end

# mp4 (fallback and ie11)
fallback_mp4 = ffmpeg()
fallback_mp4 << "-c:v" << DEFAULT_CODEC
fallback_mp4 << "-s" << "#{VARIANTS[0][:width]}x#{VARIANTS[0][:height]}"
rate = VARIANTS[0][:bitrate]
fallback_mp4 << ["-b:v", "#{rate}M", "-maxrate", "#{rate * MAX_BITRATE}M", "-bufsize", "#{rate*BUF_SIZE}M"]
fallback_mp4 << %w[-movflags +faststart]
fallback_mp4 << "#{tmp_dir}/fallback.mp4"

# webm (no h264 installed?). We use a decent quality here, since presumably it's
# some open source licencing issue, and not bandwidth/performance related.
fallback_webm = ffmpeg()
fallback_webm << %w[-c:v libvpx-vp9 -row-mt 1]
fallback_webm << "-s" << "#{VARIANTS[3][:width]}x#{VARIANTS[3][:height]}"
rate = VARIANTS[3][:bitrate]
fallback_webm << ["-b:v", "#{rate}M", "-maxrate", "#{rate * MAX_BITRATE}M", "-bufsize", "#{rate*BUF_SIZE}M"]
fallback_webm << "#{tmp_dir}/fallback.webm"
# ffmpeg recommends two pass, but that's not straight forward to implement with
# the current approach
# fallback_webm_pass1 += ["-pass", "1", "-f", "null", "/dev/null"]
# fallback_webm_pass2 += ["-pass", "2", "#{tmp_dir}/fallback.webm"]


# hls
hls = ffmpeg()
VARIANTS.each.with_index do |var, idx|
  hls << "-c:v:#{idx}" << (var[:codec] || DEFAULT_CODEC) << "-flags" << "+cgop"
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
  warn "\nAborting…"
  $stdin.close
  $ios.each { |io| Process.kill("KILL", io.pid) unless io.closed? }
  $ios.each(&:close)
  exit(2)
end

Signal.trap("TERM") { cancel() }
Signal.trap("INT") { cancel() }

begin
  $ios << IO.popen(fallback_mp4.flatten, "w+")
  $ios << IO.popen(fallback_webm.flatten, "w+")
  $ios << IO.popen(hls.flatten, "w+")

  loop do
    break if $stdin.closed?
    buf = $stdin.readpartial(1024*1024)
    $ios.each { |io| io.write(buf) }
  rescue EOFError
    # stdin is empty
    $stdin.close
    break
  end
ensure
  $ios.each { |io| io.close() }
end

$bar_thread.terminate
$bar.finish

print "\nRenaming… "
FileUtils.move(tmp_dir, VIDEO_OUT_DIR)
puts "Done!"
