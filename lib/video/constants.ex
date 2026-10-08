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
  def target_apparent_speed_kmh, do: 100.0

  # How much source time the speed average covers, in *source/video* seconds —
  # the timeline the warp is defined on, so at a 5x recording this is ~40s of
  # real riding.
  #
  # Long enough to average out pedal strokes and traffic lights, short enough to
  # follow terrain. 30s smoothed so heavily that a 26 km/h descent read as 22
  # km/h once the slower approach to it was averaged in, and barely slowed at
  # all; shorter than this and the slope starts changing substantially every few
  # seconds of playback, which reads as the speed pumping.
  def speed_average_window_source_s, do: 8.0

  # How often the speed is sampled, i.e. the spacing of the warp's breakpoints.
  def warp_breakpoint_s, do: 1.0

  # Sources dated before this keep a constant speedup of desired_time_lapse.
  def speed_target_from_date, do: ~D[2026-09-01]

  # Slowing footage down lowers its frame rate rather than interpolating, so the
  # floor on the rate is the ceiling on how far anything may be slowed. This is
  # the one place apparent speed may exceed target_apparent_speed_kmh.
  def min_output_fps, do: 20.0

  # The same clamp seen from the other side: output frames per source frame.
  # Frames are dropped below 1.0 and would have to be invented above it, which
  # is why the slowdown instead shows up as a lower frame rate.
  def max_interpolation_density, do: output_fps() / min_output_fps()

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
