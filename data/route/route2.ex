defmodule Data.Route.Route2 do
  @behaviour Route.Behaviour

  def id(), do: "2"
  def type(), do: :alltag
  def color(), do: "#b2211d"
  def name(), do: "Alltagsroute 2"
  def article(), do: "alltagsroute-2"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/194841"

  forward = %Video.Track{
    group: "2",
    direction: :forward,
    from: "Innenstadt",
    to: "Eidelstedt",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Eidelstedt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011629", "00:00:12.246", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011630", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011631", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011632", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011633", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011634", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011635", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011636", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011637", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011638", :start, "00:01:03.397"},
      {"2021-06-05-velorouten-1-1a-2/GX011647", "00:00:55.522", "00:01:34.061"},
      {"2021-06-05-velorouten-1-1a-2/GX011638", "00:01:35.128", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011639", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011640", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011641", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011642", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011643", :start, :end}
    ]
  }

  backward = %Video.Track{
    group: "2",
    direction: :backward,
    from: "Eidelstedt",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "von Eidelstedt in die Innenstadt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011645", :start, "00:00:19.620"},
      {"2021-06-05-velorouten-1-1a-2/GX011645", "00:01:05.399", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011646", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011647", :start, "00:00:54.855"},
      {"2021-06-05-velorouten-1-1a-2/GX011649", "00:00:15.749", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011650", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011651", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011652", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011653", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011654", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011655", :start, :end}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
