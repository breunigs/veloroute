#!/usr/bin/env ruby

require 'tmpdir'
require 'ruby-progressbar'
require 'open3'

VIDEO_OUT_DIR = ARGV[0]
PARENT_DIR = File.dirname(VIDEO_OUT_DIR)
NAME = File.basename($0, ".*")

def die(msg)
  warn "#{NAME}: #{msg}"
  exit(1)
end

def can_use?(codec)
  `ffmpeg -hide_banner -loglevel fatal -f lavfi -i rgbtestsrc -pix_fmt yuv420p -t 0.016 -c:v #{codec} -f mp4 -y /dev/null`
  $?.exitstatus == 0
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

# codec tag specification:
# https://developer.mozilla.org/en-US/docs/Web/Media/Formats/codecs_parameter
# vp9 levels: https://www.webmproject.org/vp9/levels/
# hevc tag: ISO/IEC 14496-15 (€)
CODEC_AVC = %w[libx264 -preset veryslow -x264opts opencl]
CODEC_VP9 = %w[libvpx-vp9 -row-mt 1 -tile-columns 4 -frame-parallel 1 -speed 1 -threads 2]
CODEC_HEVC = can_use?("hevc_nvenc") \
  ? %w[hevc_nvenc -preset slow -tier:v:__INDEX__ high -level:v:__INDEX__ 6.2 -nonref_p 1 -spatial_aq 1 -tag:v:__INDEX__ hvc1 -refs:v:__INDEX__ 0] \
  : %w[libx265 -x265-params log-level=error -tag:v:__INDEX__ hvc1]
VARIANTS = [
  {title: "360p",       width:  640, height:  360, bitrate:  4,   codec: CODEC_AVC, fallback: :mp4},
  {title: "144p",       width:  256, height:  144, bitrate:  0.7, codec: CODEC_AVC},
  {title: "240p",       width:  426, height:  240, bitrate:  2,   codec: CODEC_AVC},
  {title: "480p",       width:  854, height:  480, bitrate:  4,   codec: CODEC_VP9, tag_as: "vp09.00.30.08", fallback: :webm},
  {title: "720p",       width: 1280, height:  720, bitrate:  6,   codec: CODEC_AVC},
  {title: "1080p",      width: 1920, height: 1080, bitrate: 12,   codec: CODEC_AVC},
  {title: "1080p (HD)", width: 1920, height: 1080, bitrate: 12,   codec: CODEC_HEVC, tag_as: "hvc1.1.4.L186.B01"},
]

# The average bitrate is given in the variants above. This defined
# how much the maximum bitrate may deviate from that (as a ratio)
MAX_BITRATE = 1.1
# The sliding window in which the codec can distribute its bits,
# as a ratio of the bitrate, see
# https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate
BUF_SIZE = 2.0

TMP_DIR = Dir.mktmpdir("video_convert_streamable__#{File.basename(VIDEO_OUT_DIR)}__")
at_exit { FileUtils.rmdir(TMP_DIR) if Dir.exist?(TMP_DIR) && Dir.empty?(TMP_DIR) }

def nice
  %w[nice -n18 ionice -c 3]
end

def ffmpeg
  cmd = nice()
  cmd << %w[ffmpeg -hide_banner -loglevel fatal]
  cmd << %w[-hwaccel auto]
  cmd << %w[-re -r] << FPS.to_s << %w[-i -] << "-r" << FPS.to_s
  cmd << %w[-keyint_min] << GOP_SIZE << "-g" << GOP_SIZE << %w[-sc_threshold 0]
  cmd << %w[-pix_fmt yuv420p -refs 5]
  cmd
end

def variant_flags(idx)
  var = VARIANTS[idx]
  codec = var[:codec].flatten.map { |x| x.gsub("__INDEX__", "#{idx}") }

  cmd = []
  cmd << "-c:v:#{idx}" << codec << "-flags" << "+cgop"
  cmd << %w[-map v:0] << "-s:#{idx}" << "#{var[:width]}x#{var[:height]}"
  cmd << "-metadata:s:v:#{idx}" << %|title="#{var[:title]}"|
  rate = var[:bitrate]
  cmd << ["-b:v:#{idx}", "#{rate}M"]
  cmd << ["-maxrate:#{idx}", "#{rate*MAX_BITRATE}M"]
  cmd << ["-bufsize:#{idx}", "#{rate*BUF_SIZE}M"]

  cmd
end

def hls()
  cmd = %w[-movflags +faststart]
  cmd << %w[-f hls -hls_time] << HLS_TIME << %w[-hls_playlist_type vod]
  cmd << %w[-hls_segment_type fmp4]
  cmd << %w[-master_pl_name] << "stream.m3u8"
  cmd << %w[-hls_flags single_file+independent_segments -hls_list_size 0]
  cmd << %w[-var_stream_map] << VARIANTS.map.with_index { |_, idx| "v:#{idx}"}.join(" ")
  cmd << "#{TMP_DIR}/stream_%v.m3u8"
  cmd
end

def fallback(type)
  idx = VARIANTS.index { |v| v[:fallback] == type }
  cmd = nice()
  cmd << %w[ffmpeg -hide_banner -loglevel fatal]
  cmd << ["-i", "#{TMP_DIR}/stream_#{idx}.m4s"]
  cmd << %w[-c:v copy -movflags +faststart]
  cmd << [File.join(TMP_DIR, "fallback.#{type}")]
  cmd.flatten
end

$shutdown = false
def cancel(message = "Aborting…")
  $shutdown = true
  warn "\n#{NAME}: #{message}"
  $stdin.close unless $stdin.closed?
  RUNNING_CHILDREN.each { |pid| Process.kill("KILL", pid) rescue nil }
  exit(2)
end

def run_pipe(cmd)
  input, wait_threads = Open3.pipeline_w(cmd.flatten)

  $stdin.binmode

  wait_threads.each do |wt|
    RUNNING_CHILDREN << wt.pid
  end

  while buf = $stdin.read(1024*1024) do
    begin
      input.write(buf)
    rescue IOError
      break
    end
  end
ensure
  input.close
  $stdin.close

  wait_threads.each do |wt|
    exit_status = wt.value
    RUNNING_CHILDREN.delete(wt.pid)
    next if $shutdown
    next if exit_status == 0
    cancel(<<~ERROR)
      subprocess failed ↑
      CONVERT: #{cmd.flatten.join(" ")}
    ERROR
  end
end

RUNNING_CHILDREN = []

Signal.trap("TERM") { cancel() }
Signal.trap("INT") { cancel() }

puts "\n#{NAME}: hls…"
run_pipe(ffmpeg() + VARIANTS.size.times.flat_map { |idx| variant_flags(idx) } + hls())

puts "\n#{NAME}: fallbacks…"
system(*fallback(:mp4), exception: true)
system(*fallback(:webm), exception: true)

# manually tag codecs if ffmpeg didn't set them
stream_path = File.join(TMP_DIR, "stream.m3u8")
manifest = File.read(stream_path)
manifest.gsub!(/^#EXT-X-STREAM-INF:.*$/).with_index do |line, idx|
  tag = VARIANTS[idx][:tag_as]
  next line if !tag || line.include?("CODEC")
  warn "stream_#{idx} #{VARIANTS[idx][:title]}: manually tagging as #{tag}"
  %|#{line},CODECS="#{tag}"|
end
File.write(stream_path, manifest)

print "\nUploading… "
tries = 0
begin
  FileUtils.move(TMP_DIR, VIDEO_OUT_DIR, verbose: true)
rescue => e
  tries += 1
  warn "video_convert_streamable: Failed moving (try #{tries}): #{e}"
  tries <= 3 ? retry : die("Failed moving the files from #{TMP_DIR} to #{VIDEO_OUT_DIR}: #{e}")
end

puts "Done!"
