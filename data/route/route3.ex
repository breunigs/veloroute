defmodule Data.Route.Route3 do
  @behaviour Route.Behaviour

  def id(), do: "3"
  def type(), do: :alltag
  def color(), do: "#e8430b"
  def name(), do: "Alltagsroute 3"
  def article(), do: "alltagsroute-3"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/194840"

  forward = %Video.Track{
    group: "3",
    direction: :forward,
    from: "Innenstadt",
    to: "Niendorf",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Niendorf",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011655", "00:00:46.480", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011656", :start, "00:00:13.046"},
      {"2021-06-12-veloroute-3-und-4/GX011737", "00:00:11.144", :end},
      {"2021-06-12-veloroute-3-und-4/GX011738", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011739", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011740", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011741", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011742", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011743", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011744", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011745", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011746", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011747", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011748", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011749", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011750", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011751", :start, "00:00:02.302"}
    ]
  }

  backward = %Video.Track{
    group: "3",
    direction: :backward,
    from: "Niendorf",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "von Niendorf in die Innenstadt",
    videos: [
      {"2021-06-12-veloroute-3-und-4/GX011751", "00:00:02.302", :end},
      {"2021-06-12-veloroute-3-und-4/GX011752", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011753", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011754", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011755", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011756", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011757", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011758", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011760", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011761", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011762", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011763", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011764", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011765", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011766", :start, "00:00:09.209"},
      {"2021-09-08-velo5-reroute/GX012727", "00:00:07.441", "00:00:20.120"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
