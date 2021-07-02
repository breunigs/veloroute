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

    Video.TrimmedSourceSequence.new_from_tsv_list([tsv1, tsv2], "fixtures 1+2")
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

  # test "match_track case 1: gap at traffic light should start 2nd video from start if bearing is approximately the same" do
  #   assert [
  #            {"case_1a", "0:00:07.007", "0:00:10.010"},
  #            {"case_1b", "0:00:00.000", "0:00:01.668"}
  #          ] = get_tsv_cuts_for_case("1")
  # end

  # test "match_track case 2: gap at traffic light should use full video" do
  #   assert [
  #            {"case_2a", "0:00:14.348", "0:00:21.688"},
  #            {"case_2b", "0:00:00.000", "0:00:10.010"}
  #          ] = get_tsv_cuts_for_case("2")
  # end

  # defp get_tsv_cuts_for_case(case_number) do
  #   track = tsv1 = tsv_from_gpx("case_#{case_number}a")
  #   tsv2 = tsv_from_gpx("case_#{case_number}b")

  #   track_from_osm("case_#{case_number}")
  #   |> Video.TrimmedSourceSequence.match_track([tsv1, tsv2])
  #   |> Map.fetch!(:tsvs)
  #   |> Enum.map(fn tsv -> {Path.basename(tsv.source_path_rel, ".MP4"), tsv.from, tsv.to} end)
  # end

  # defp tsv_from_gpx(name) do
  #   Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/#{name}")
  # end

  # defp track_from_osm(name) do
  #   ways =
  #     (File.cwd!() <> "/test/fixtures/#{name}.osm")
  #     |> Map.Parser.load()
  #     |> Map.fetch!(:ways)
  #     |> Map.values()
  #     |> Enum.sort_by(fn %Map.Way{tags: tags} -> tags[:name] end)

  #   Track.with_nodes(%Track{
  #     type: "testcase",
  #     id: name,
  #     name: name,
  #     direction: :forward,
  #     full_name: name,
  #     ways: ways
  #   })
  # end
end
