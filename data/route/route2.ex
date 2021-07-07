defmodule Data.Route.Route2 do
  @behaviour Route.Behaviour

  @name "Alltagsroute 2"

  def id(), do: "2"
  def color(), do: "#b2211d"
  def name(), do: @name
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/194841"

  forward = %Video.Track{
    group: "2",
    direction: :forward,
    from: "Innenstadt",
    to: "Eidelstedt",
    parent_text: @name,
    text: "aus der Innenstadt nach Eidelstedt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011629", "0:00:12.246", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011630", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011631", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011632", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011633", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011634", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011635", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011636", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011637", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011638", :start, "0:01:03.397"},
      {"2021-06-05-velorouten-1-1a-2/GX011647", "0:00:55.522", "0:01:34.061"},
      {"2021-06-05-velorouten-1-1a-2/GX011638", "0:01:35.128", :end},
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
    parent_text: @name,
    text: "von Eidelstedt in die Innenstadt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011645", :start, "0:00:19.620"},
      {"2021-06-05-velorouten-1-1a-2/GX011645", "0:01:05.399", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011646", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011647", :start, "0:00:54.855"},
      {"2021-06-05-velorouten-1-1a-2/GX011649", "0:00:15.749", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011650", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011651", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011652", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011653", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011654", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011655", :start, :end}
    ]
  }

  @tracks Enum.map([forward, backward], &Video.Track.with_rendered_ref/1)
  def tracks(), do: @tracks

  # legacy
  def parsed() do
    %{{id(), ""} => []}
  end

  def index() do
    %{}
  end
end
