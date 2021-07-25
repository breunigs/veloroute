defmodule Video.TrimmedSourceTest do
  use ExUnit.Case, async: true

  test "extracts parts between two timestamps" do
    tsv = Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")
    cut = Video.TrimmedSource.extract(tsv, "00:00:00.200", "00:00:00.999")

    expected = %{
      coord_from: %Video.TimedPoint{
        lat: 53.46098301796407,
        lon: 9.977514419161677,
        time_offset_ms: 200
      },
      coord_to: %Video.TimedPoint{lat: 53.460951, lon: 9.97743325748503, time_offset_ms: 999}
    }

    assert cut == Map.merge(cut, expected)
  end
end
