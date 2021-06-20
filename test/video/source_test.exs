defmodule Video.SourceTest do
  use ExUnit.Case, async: true

  test "parses GPX properly" do
    video = Video.Source.new_from_path(File.cwd!() <> "/test/fixtures/1")

    expected = [
      %Video.TimedPoint{lat: 53.460992, lon: 9.977524, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
      %Video.TimedPoint{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
      %Video.TimedPoint{lat: 53.460951, lon: 9.977433, time_offset_ms: 1001},
      %Video.TimedPoint{lat: 53.46095, lon: 9.977412, time_offset_ms: 1334}
    ]

    assert Video.Source.timed_points(video) == expected
  end
end
