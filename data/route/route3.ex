defmodule Data.Route.Route3 do
  @behaviour Route.Behaviour

  @name "Alltagsroute 3"

  def id(), do: "3"
  def color(), do: "#e8430b"
  def name(), do: @name
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/194840"

  forward = %Video.Track{
    group: "3",
    direction: :forward,
    from: "Innenstadt",
    to: "Niendorf",
    parent_text: @name,
    text: "aus der Innenstadt nach Niendorf",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011655", "0:00:46.480", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011656", :start, "0:00:13.046"},
      {"2021-06-12-veloroute-3-und-4/GX011737", "0:00:11.144", :end},
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
      {"2021-06-12-veloroute-3-und-4/GX011751", :start, "0:00:02.302"}
    ]
  }

  backward = %Video.Track{
    group: "3",
    direction: :backward,
    from: "Niendorf",
    to: "Innenstadt",
    parent_text: @name,
    text: "von Niendorf in die Innenstadt",
    videos: [
      {"2021-06-12-veloroute-3-und-4/GX011751", "0:00:02.302", :end},
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

      # cutting together a legal path
      {"2021-06-12-veloroute-3-und-4/GX011766", :start, "0:00:08.141"},
      {"2021-06-12-veloroute-3-und-4/GX011734", "0:00:24.157", :end},
      {"2021-06-12-veloroute-3-und-4/GX011735", :start, "0:00:00.934"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011831", "0:00:01.001", "0:00:02.336"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "0:00:09.610", "0:00:14.348"}
      # real path, but that's not legal
      # {"2021-06-12-veloroute-3-und-4/GX011766", :start, "0:00:18.886"}
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
