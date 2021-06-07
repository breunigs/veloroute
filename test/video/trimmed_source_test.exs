defmodule Video.TrimmedSourceTest do
  use ExUnit.Case, async: true

  test "clamps coords to GPX boundaries" do
    tsv =
      Video.TrimmedSource.new(
        File.cwd!() <> "/test/fixtures/1",
        %{lat: 53.47, lon: 9.98},
        %{lat: 53.46, lon: 9.977}
      )

    expected = %{
      coords: [
        %{lat: 53.460992, lon: 9.977524, time_offset_ms: 0},
        %{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
        %{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
        %{lat: 53.460951, lon: 9.977433, time_offset_ms: 1001}
      ],
      from: "0:00:00.0000",
      to: "0:00:01.0001"
    }

    assert tsv == Map.merge(tsv, expected)
  end

  test "cuts properly" do
    tsv =
      Video.TrimmedSource.new(
        File.cwd!() <> "/test/fixtures/1",
        # roughly mid between 1st and 2nd point in gpx
        %{lat: 53.460984, lon: 9.977516},
        # last point in gpx
        %{lat: 53.460950, lon: 9.977412}
      )

    expected = %{
      coords: [
        %{lat: 53.460984143754885, lon: 9.977515620005212, time_offset_ms: 174},
        %{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
        %{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
        %{lat: 53.460951, lon: 9.977433, time_offset_ms: 1001},
        %{lat: 53.46095, lon: 9.977412, time_offset_ms: 1334}
      ],
      from: "0:00:00.0174",
      to: "0:00:01.0334"
    }

    assert tsv == Map.merge(tsv, expected)
  end
end
