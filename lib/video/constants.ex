defmodule Video.Constants do
  @fps_num 30_000
  @fps_den 1001

  # keep in sync with video_player.js
  def output_fps(), do: @fps_num / @fps_den
  def output_fps_s(), do: "#{@fps_num}/#{@fps_den}"
  def frame_duration(), do: 1000.0 / @fps_num * @fps_den

  def desired_time_lapse, do: 5
  def assumed_time_lapse_when_no_metadata, do: 5
end
