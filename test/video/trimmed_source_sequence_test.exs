defmodule Video.TrimmedSourceSequenceTest do
  use ExUnit.Case, async: true

  def example_tsv() do
    tsv1 =
      Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")
      |> Video.TrimmedSource.cut(
        %{lat: 53.460992, lon: 9.977524},
        %{lat: 53.460950, lon: 9.977412},
        nil,
        nil,
        nil
      )

    tsv2 =
      Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/2")
      |> Video.TrimmedSource.cut(
        %{lat: 53.460917, lon: 9.977349},
        %{lat: 53.460875, lon: 9.977034},
        nil,
        nil,
        nil
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
             start1: "0:00:00.000",
             end1: "0:00:01.334",
             start2: "0:00:00.000",
             end2: "0:00:01.668"
           }
  end

  test "produces correct video preview commands" do
    cmds =
      example_tsv()
      |> Video.TrimmedSourceSequence.preview(123)
      |> Enum.map(fn preview ->
        # remove player part and join as string
        preview |> Enum.take_while(fn x -> x != "|" end) |> Enum.join(" ")
      end)

    assert [
             "./tools/video_concat.rb test/fixtures/1.MP4 0:00:00.000 0:00:01.334 test/fixtures/2.MP4 0:00:00.000 0:00:01.668",
             "./tools/video_concat.rb test/fixtures/1.MP4 0:00:01.211 0:00:01.334 test/fixtures/2.MP4 0:00:00.000 0:00:00.123"
           ] == cmds
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
