defmodule Video.TrimmedSourceSequenceTest do
  use ExUnit.Case, async: true

  def example_tsv() do
    tsv1 =
      Video.TrimmedSource.new(
        File.cwd!() <> "/test/fixtures/1",
        %{lat: 53.460992, lon: 9.977524},
        %{lat: 53.460950, lon: 9.977412}
      )

    tsv2 =
      Video.TrimmedSource.new(
        File.cwd!() <> "/test/fixtures/2",
        %{lat: 53.460917, lon: 9.977349},
        %{lat: 53.460875, lon: 9.977034}
      )

    Video.TrimmedSourceSequence.new_from_tsv_list([tsv1, tsv2])
  end

  test "produces correct video trim commands" do
    [_exe_path, _video1, start1, end1, _video2, start2, end2] =
      example_tsv() |> Video.TrimmedSourceSequence.concat()

    assert %{
             start1: start1,
             end1: end1,
             start2: start2,
             end2: end2
           } == %{
             start1: "0:00:00.0000",
             end1: "0:00:01.0334",
             start2: "0:00:00.0000",
             end2: "0:00:01.0668"
           }
  end

  test "concats coordinates with absolute time offsets" do
    coords = example_tsv() |> Video.TrimmedSourceSequence.coords()

    assert coords == [
             %Video.TimedPoint{lat: 53.460992, lon: 9.977524, time_offset_ms: 0},
             %Video.TimedPoint{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
             %Video.TimedPoint{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
             %Video.TimedPoint{lat: 53.460951, lon: 9.977433, time_offset_ms: 1001},
             %Video.TimedPoint{lat: 53.46095, lon: 9.977412, time_offset_ms: 1334},
             %Video.TimedPoint{lat: 53.460917, lon: 9.977349, time_offset_ms: 1334},
             %Video.TimedPoint{lat: 53.460921, lon: 9.977315, time_offset_ms: 1668},
             %Video.TimedPoint{lat: 53.46093, lon: 9.977242, time_offset_ms: 2001},
             %Video.TimedPoint{lat: 53.460937, lon: 9.977158, time_offset_ms: 2335},
             %Video.TimedPoint{lat: 53.460918, lon: 9.977086, time_offset_ms: 2669},
             %Video.TimedPoint{lat: 53.460875, lon: 9.977034, time_offset_ms: 3002}
           ]
  end
end
