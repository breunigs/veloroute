defmodule Video.TrackTest do
  use ExUnit.Case, async: true

  @track_defaults %{group: "", direction: :forward, from: "", to: "", parent_ref: nil, text: ""}

  @tracks [
    {"a38ca679d6dfe9f001054440ed1651c2", 22632,
     %{
       renderer: 1,
       videos: [
         {"2021-11-29-stephansplatz/GX013011", "00:00:20.821", :end},
         {"2021-11-29-stephansplatz/GX013012", :start, :end}
       ]
     }},
    {"e18277249b53ff4bff6e63f252a69996", 26054,
     %{
       renderer: 2,
       videos: [
         {"2022-03-26-veloroute-4/GX013360", "00:03:01.415", :end},
         {"2022-03-26-veloroute-4/GX013361", :start, "00:00:10.911"}
       ]
     }}
  ]

  test "rendered hashes of old versions remain the same" do
    changed_hashes =
      Enum.flat_map(@tracks, fn {exp_hash, exp_dur, track} ->
        track = Kernel.struct!(Video.Track, Map.merge(@track_defaults, track))

        {hash, coords, _meta} = Video.Track.render(track)
        dur = List.last(coords).time_offset_ms

        [
          if(dur != exp_dur,
            do: "renderer v=#{track.renderer} has changed the duration from #{exp_dur} to #{dur}"
          ),
          if(hash != exp_hash,
            do: "renderer v=#{track.renderer} has changed the hash from #{exp_hash} to #{hash}"
          )
        ]
      end)
      |> Util.compact()

    assert [] == changed_hashes
  end
end
