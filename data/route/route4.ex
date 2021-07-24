defmodule Data.Route.Route4 do
  @behaviour Route.Behaviour

  def id(), do: "4"
  def type(), do: :alltag
  def color(), do: "#008aa7"
  def name(), do: "Alltagsroute 4"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/191882"

  forward = %Video.Track{
    group: "4",
    direction: :forward,
    from: "Innenstadt",
    to: "Ochsenzoll",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt zum Ochsenzoll",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011655", "0:00:46.480", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011656", :start, "0:00:02.669"},
      {"2021-06-12-veloroute-3-und-4/GX011701", "0:00:01.301", :end},
      {"2021-06-12-veloroute-3-und-4/GX011702", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011703", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011704", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011705", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011706", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011707", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011708", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011709", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011710", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011711", :start, :end}
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
      {"2021-06-12-veloroute-3-und-4/GX011712", "0:00:01.869", :end},
      {"2021-06-12-veloroute-3-und-4/GX011713", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011714", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011715", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011716", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011717", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011718", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011719", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011720", :start, "0:00:19.319"},
      {"2021-06-12-veloroute-3-und-4/GX011727", "0:00:01.568", :end},
      {"2021-06-12-veloroute-3-und-4/GX011728", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011729", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011730", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011731", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011732", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011733", :start, :end},
      # cutting together a legal path
      {"2021-06-12-veloroute-3-und-4/GX011734", :start, :end},
      {"2021-06-12-veloroute-3-und-4/GX011735", :start, "0:00:00.934"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011831", "0:00:01.001", "0:00:02.336"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "0:00:09.610", "0:00:14.348"}
      # real path, but that's not legal
      # {"2021-06-12-veloroute-3-und-4/GX011766", :start, "0:00:18.886"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
