defmodule Video.RenderedTest do
  use ExUnit.Case, async: true
  doctest Video.Rendered

  def example() do
    %Video.Rendered{
      hash: "i-am-a-hash",
      coords: [
        # %Video.TimedPoint{lon: 9.0, lat: 9.0, time_offset_ms: 0},
        # %Video.TimedPoint{lon: 1.0, lat: 1.0, time_offset_ms: 100},
        # %Video.TimedPoint{lon: 2.0, lat: 2.0, time_offset_ms: 200},
        # %Video.TimedPoint{lon: 3.0, lat: 3.0, time_offset_ms: 300},
        # %Video.TimedPoint{lon: 4.0, lat: 4.0, time_offset_ms: 400},
        # %Video.TimedPoint{lon: 5.0, lat: 5.0, time_offset_ms: 500}
        %Video.TimedPoint{lat: 53.507, lon: 10.044, time_offset_ms: 0},
        %Video.TimedPoint{lat: 53.508, lon: 10.042, time_offset_ms: 100},
        %Video.TimedPoint{lat: 53.509, lon: 10.040, time_offset_ms: 200},
        %Video.TimedPoint{lat: 53.510, lon: 10.038, time_offset_ms: 300},
        %Video.TimedPoint{lat: 53.511, lon: 10.036, time_offset_ms: 400}
      ],
      length_ms: 400
    }
  end
end
