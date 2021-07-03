defmodule Video.MatchingIntegrationTest do
  use ExUnit.Case, async: true

  test "match_track case 1: velo2 2021 forward" do
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
             {"GX011638", "0:00:00.000", "0:01:04.064"},
             {"GX011647", "0:00:55.786", "0:01:34.520"},
             {"GX011638", "0:01:35.296", "0:01:46.440"},
             {"GX011639", "0:00:00.000", "0:00:16.349"},
             {"GX011640", "0:00:00.000", "0:00:05.339"},
             {"GX011641", "0:00:00.000", "0:00:20.353"},
             {"GX011642", "0:00:00.000", "0:01:02.062"},
             {"GX011643", "0:00:00.000", "0:00:01.408"}
           ] = get_tsv_cuts_for("velo2_2021", :forward)
  end

  test "match_track case 1: velo2 2021 backward" do
    assert [
             {"GX011645", "0:00:00.734", "0:00:19.620"},
             {"GX011645", "0:01:05.399", "0:01:20.413"},
             {"GX011646", "0:00:00.000", "0:01:21.415"},
             {"GX011647", "0:00:00.000", "0:00:55.055"},
             {"GX011649", "0:00:15.349", "0:01:22.415"},
             {"GX011650", "0:00:00.000", "0:00:05.339"},
             {"GX011651", "0:00:00.000", "0:00:14.014"},
             {"GX011652", "0:00:00.000", "0:00:23.357"},
             {"GX011653", "0:00:00.000", "0:00:19.019"},
             {"GX011654", "0:00:00.000", "0:01:18.412"},
             {"GX011655", "0:00:00.000", "0:00:47.127"}
           ] = get_tsv_cuts_for("velo2_2021", :backward)
  end

  defp get_tsv_cuts_for(name, direction) do
    tsvs =
      (File.cwd!() <> "/test/fixtures/#{name}/*.gpx")
      |> Path.wildcard()
      |> Enum.map(&String.replace_suffix(&1, ".gpx", ""))
      |> Enum.map(&Video.TrimmedSource.new_from_path(&1))

    get_track(name, direction)
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

  defp get_track(name, direction) do
    (File.cwd!() <> "/test/fixtures/#{name}.osm")
    |> Map.Parser.load()
    |> Map.fetch!(:relations)
    |> Map.values()
    |> hd()
    |> TrackFinder.ordered()
    |> Enum.find(fn track -> track.type == direction end)
    |> Track.with_nodes()
  end
end
