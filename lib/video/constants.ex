defmodule Video.Constants do
  @fps_num 30_000
  @fps_den 1001

  # keep in sync with video_player.js
  def output_fps(), do: @fps_num / @fps_den
  def output_fps_s(), do: "#{@fps_num}/#{@fps_den}"
  def frame_duration(), do: 1000.0 / @fps_num * @fps_den

  def desired_time_lapse, do: 5
  def assumed_time_lapse_when_no_metadata, do: 5

  # Apparent speed (real speed × speedup) is held at or below this. Footage
  # slower than this renders at its baseline speedup instead; nothing is ever
  # sped up past its baseline to reach the target.
  def target_apparent_speed_kmh, do: 115.0

  # How much source time the speed average covers. In *source/video* seconds,
  # i.e. the timeline the warp is defined on, which at a 5x recording is 150s of
  # real riding. That is deliberately the playback smoothness scale: a 30s real
  # window would be ~6s of video and make the speed pump during playback.
  def speed_average_window_source_s, do: 30.0

  # How often the speed is sampled, i.e. the spacing of the warp's breakpoints.
  def warp_breakpoint_s, do: 1.0

  # Sources dated before this keep a constant speedup of desired_time_lapse.
  def speed_target_from_date, do: ~D[2026-09-01]

  # At most this many output frames per source frame, i.e. at most one generated
  # frame per real frame at 2.0. This is the one place apparent speed may exceed
  # target_apparent_speed_kmh. A value of 1.0 would forbid frame generation
  # entirely.
  def max_interpolation_density, do: 2.0

  # Below this real speed the baseline speedup is used directly, rather than
  # dividing by a speed that may be zero.
  def min_real_speed_kmh, do: 1.0

  # GPX intervals faster than this are dropped from the speed average entirely,
  # with their distance and their elapsed time, so a GPS jump cannot inflate it.
  def max_plausible_speed_kmh, do: 80.0

  # A time lapse measured from the GPX is only trusted when the GPX span is
  # within this fraction of a whole multiple of the video duration. Anything
  # looser means the GPX does not line up with the video — it overruns, or the
  # video was trimmed — and the assumed value is kept instead.
  def time_lapse_measure_tolerance, do: 0.01

  # Slopes are rounded to this before adjacent equal ones are collapsed. Without
  # it a near uniform warp never collapses and emits hundreds of breakpoints
  # instead of taking the "emit nothing" fast path.
  def slope_quantum, do: 0.002
end
