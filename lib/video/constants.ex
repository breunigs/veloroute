defmodule Video.Constants do
  def output_fps(), do: 30000 / 1001

  def desired_time_lapse, do: 5
  def assumed_time_lapse_when_no_metadata, do: 5
end
