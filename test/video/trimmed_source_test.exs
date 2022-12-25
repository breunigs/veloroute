defmodule Video.TrimmedSourceTest do
  use ExUnit.Case, async: true

  test "extracts parts between two timestamps" do
    tsv = Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")
    cut = Video.TrimmedSource.extract(tsv, "00:00:00.200", "00:00:00.999")

    expected = %{
      coord_from: %Video.TimedPoint{
        gpx_ele: 1.8957844311377245,
        gpx_time: ~N[2021-04-17 13:21:10.200],
        lat: 53.46098301796407,
        lon: 9.977514419161677,
        time_offset_ms: 200
      },
      coord_to: %Video.TimedPoint{
        gpx_ele: 2.0730455089820357,
        gpx_time: ~N[2021-04-17 13:21:10.999],
        lat: 53.460951,
        lon: 9.97743325748503,
        time_offset_ms: 999
      }
    }

    assert cut == Map.merge(cut, expected)
  end

  test "extrapolates end" do
    tsv = Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")
    cut = Video.TrimmedSource.extract(tsv, "00:00:00.200", "00:00:03.000", extrapolate_end: true)

    expected = %{
      coord_from: %Video.TimedPoint{
        gpx_ele: 1.8957844311377245,
        gpx_time: ~N[2021-04-17 13:21:10.200],
        lat: 53.46098301796407,
        lon: 9.977514419161677,
        time_offset_ms: 200
      },
      coord_to: %Video.TimedPoint{
        gpx_ele: 3.034480480480481,
        gpx_time: ~N[2021-04-17 13:21:13.000],
        lat: 53.46094499699697,
        lon: 9.977306936936936,
        time_offset_ms: 3_000
      }
    }

    assert cut == Map.merge(cut, expected)
  end
end
