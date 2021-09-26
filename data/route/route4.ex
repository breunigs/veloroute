defmodule Data.Route.Route4 do
  @behaviour Route.Behaviour

  def id(), do: "4"
  def type(), do: :alltag
  def color(), do: "#008aa7"
  def name(), do: "Alltagsroute 4"
  def article(), do: "alltagsroute-4"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/191882"

  forward = %Video.Track{
    group: "4",
    direction: :forward,
    from: "Innenstadt",
    to: "Ochsenzoll",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt zum Ochsenzoll",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011655", "00:00:46.480", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011656", :start, "00:00:02.669"},
      {"2021-06-12-veloroute-3-und-4/GX011701", "00:00:01.301", :end},
      {"2021-06-12-veloroute-3-und-4/GX011702", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011703", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011704", :start, "00:00:02.135"},
      {"2021-09-26-velo6-rsw-ahrensburg/GX012988", "00:00:02.603", "00:00:06.039"},
      {"2021-09-26-velo6-rsw-ahrensburg/GX012983", "00:01:17.811", "00:01:33.660"},
      {"2021-06-12-veloroute-3-und-4/GX011704", "00:00:20.554", :end},
      {"2021-06-12-veloroute-3-und-4/GX011705", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011706", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011707", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011708", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011709", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011710", :start, "00:02:14.067"},
      {"2021-09-09-rsw-bad-bramstedt/GX012763", "00:01:27.187", "00:01:58.018"},
      {"2021-06-12-veloroute-3-und-4/GX011711", "00:00:11.712", :end}
    ]
  }

  backward = %Video.Track{
    group: "4",
    direction: :backward,
    from: "Ochsenzoll",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "vom Ochsenzoll in die Innenstadt",
    videos: [
      {"2021-06-12-veloroute-3-und-4/GX011712", "00:00:01.869", :end},
      {"2021-06-12-veloroute-3-und-4/GX011713", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011714", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011715", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011716", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011717", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011718", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011719", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011720", :start, "00:00:19.319"},
      {"2021-06-12-veloroute-3-und-4/GX011727", "00:00:01.568", :end},
      {"2021-06-12-veloroute-3-und-4/GX011728", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011729", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011730", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011731", :start, "00:00:58.759"},
      {"2021-09-26-velo6-rsw-ahrensburg/GX012984", "00:00:02.636", "00:00:25.125"},
      {"2021-06-12-veloroute-3-und-4/GX011731", "00:01:21.848", :end},
      {"2021-06-12-veloroute-3-und-4/GX011732", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011733", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011734", :start, "00:00:26.894"},
      {"2021-09-08-velo5-reroute/GX012727", "00:00:09.510", "00:00:20.120"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
