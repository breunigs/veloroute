defmodule Video.SourceTest do
  use ExUnit.Case, async: true

  test "parses GPX properly" do
    video = Video.Source.new_from_path(File.cwd!() <> "/test/fixtures/1")

    expected = [
      %Video.TimedPointWithGPX{
        gpx_ele: 1.908,
        gpx_time: ~N[2021-04-17 13:21:10.000],
        lat: 53.460992,
        lon: 9.977524,
        time_offset_ms: 0
      },
      %Video.TimedPointWithGPX{
        gpx_ele: 1.8876,
        gpx_time: ~N[2021-04-17 13:21:10.334],
        lat: 53.460977,
        lon: 9.977508,
        time_offset_ms: 334
      },
      %Video.TimedPointWithGPX{
        gpx_ele: 1.9146,
        gpx_time: ~N[2021-04-17 13:21:10.667],
        lat: 53.460951,
        lon: 9.977476,
        time_offset_ms: 667
      },
      %Video.TimedPointWithGPX{
        gpx_ele: 2.074,
        gpx_time: ~N[2021-04-17 13:21:11.001],
        lat: 53.460951,
        lon: 9.977433,
        time_offset_ms: 1001
      },
      %Video.TimedPointWithGPX{
        gpx_ele: 2.234,
        gpx_time: ~N[2021-04-17 13:21:11.334],
        lat: 53.46095,
        lon: 9.977412,
        time_offset_ms: 1334
      }
    ]

    assert Video.Source.timed_points_with_gpx(video) == expected
  end
end
