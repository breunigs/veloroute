defmodule Video.MatchingIntegrationTest do
  use ExUnit.Case, async: true

  test "match_track case 1: gap at traffic light should start 2nd video from start if bearing is approximately the same" do
    assert [
             {"GX011629", "0:00:11.717", "0:00:21.688"},
             {"GX011630", "0:00:00.000", "0:00:10.010"},
             {"GX011631", "0:00:00.000", "0:00:53.720"},
             {"GX011632", "0:00:00.000", "0:00:02.669"},
             {"GX011633", "0:00:00.000", "0:00:10.677"},
             {"GX011634", "0:00:00.000", "0:00:52.386"},
             {"GX011635", "0:00:00.000", "0:00:19.352"},
             {"GX011636", "0:00:00.000", "0:00:08.008"},
             {"GX011637", "0:00:00.000", "0:00:13.347"},
             {"GX011638", "0:00:00.000", "0:01:03.996"},
             {"GX011647", "0:00:55.708", "0:01:34.647"},
             {"GX011638", "0:01:35.283", "0:01:46.440"},
             {"GX011639", "0:00:00.000", "0:00:16.349"},
             {"GX011640", "0:00:00.000", "0:00:05.339"},
             {"GX011641", "0:00:00.000", "0:00:20.353"},
             {"GX011642", "0:00:00.000", "0:01:02.062"},
             {"GX011643", "0:00:00.000", "0:00:01.335"}
           ] = get_tsv_cuts_for("velo2_2021")
  end

  defp get_tsv_cuts_for(name) do
    tsvs =
      (File.cwd!() <> "/test/fixtures/#{name}/*.gpx")
      |> Path.wildcard()
      |> Enum.map(&String.replace_suffix(&1, ".gpx", ""))
      |> Enum.map(&Video.TrimmedSource.new_from_path(&1))

    get_track(name)
    |> Video.TrimmedSourceSequence.match_track(tsvs)
    |> Map.fetch!(:tsvs)
    |> Enum.map(fn tsv ->
      {
        Path.basename(tsv.source_path_rel, ".MP4"),
        Video.Timestamp.from_timed_point(tsv.coord_from),
        Video.Timestamp.from_timed_point(tsv.coord_to)
      }
    end)
  end

  defp get_track(name) do
    (File.cwd!() <> "/test/fixtures/#{name}.osm")
    |> Map.Parser.load()
    |> Map.fetch!(:relations)
    |> Map.values()
    |> hd()
    |> TrackFinder.ordered()
    |> hd()
    |> Track.with_nodes()
  end
end
