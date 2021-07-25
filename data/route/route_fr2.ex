defmodule Data.Route.RouteFR2 do
  @behaviour Route.Behaviour

  def id(), do: "FR2"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Osterbekradweg (FR2)"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/9056480"

  forward = %Video.Track{
    group: "Osterbekradweg",
    direction: :forward,
    from: "Ferdinandstor",
    to: "Stellmoorer Tunneltal",
    parent_ref: __MODULE__,
    text: "entlang der Osterbek zum Stellmoorer Tunneltal",
    videos: [
      {"2021-04-10-freizeitroute2/GX011188", :start, :end},
      {"2021-04-10-freizeitroute2/GX011189", :start, :end},
      {"2021-04-10-freizeitroute2/GX011190", :start, "00:00:51.552"},
      {"2021-04-10-freizeitroute2/GX011192", "00:00:01.034", :end},
      {"2021-04-10-freizeitroute2/GX011193", :start, "00:00:04.271"},
      {"2021-04-10-freizeitroute2/GX011195", "00:00:15.115", :end},
      {"2021-04-10-freizeitroute2/GX011196", :start, :end},
      {"2021-04-10-freizeitroute2/GX011197", :start, :end},
      {"2021-04-10-freizeitroute2/GX011198", :start, :end},
      {"2021-04-10-freizeitroute2/GX011199", :start, "00:00:51.852"},
      {"2021-04-10-freizeitroute2/GX011201", "00:00:07.341", :end},
      {"2021-04-10-freizeitroute2/GX011202", :start, "00:02:18.205"},
      {"2021-04-10-freizeitroute2/GX011204", "00:00:02.903", :end},
      {"2021-04-10-freizeitroute2/GX011205", :start, :end},
      {"2021-04-10-freizeitroute2/GX011206", :start, :end},
      {"2021-04-10-freizeitroute2/GX011207", :start, :end},
      {"2021-04-10-freizeitroute2/GX011208", :start, :end},
      {"2021-04-10-freizeitroute2/GX011209", :start, :end},
      {"2021-04-10-freizeitroute2/GX011210", :start, :end},
      {"2021-04-10-freizeitroute2/GX011211", :start, "00:00:42.776"},
      {"2021-04-10-freizeitroute2/GX011212", "00:00:00.300", "00:00:32.733"},
      {"2021-04-10-freizeitroute2/GX011213", "00:00:01.935", :end},
      {"2021-04-10-freizeitroute2/GX011214", :start, :end},
      {"2021-04-10-freizeitroute2/GX011215", :start, "00:00:01.602"},
      {"2021-04-10-freizeitroute2/GX011217", "00:00:12.713", "00:00:42.209"},
      {"2021-04-10-freizeitroute2/GX011217", "00:00:57.157", :end},
      {"2021-04-10-freizeitroute2/GX011218", :start, "00:00:06.240"},
      {"2021-04-10-freizeitroute2/GX011218", "00:00:16.750", :end},
      {"2021-04-10-freizeitroute2/GX011219", :start, "00:01:29.856"},
      {"2021-04-10-freizeitroute2/GX011220", "00:00:00.000", "00:00:01.001"},
      {"2021-04-10-freizeitroute2/GX011221", "00:00:00.200", :end},
      {"2021-04-10-freizeitroute2/GX011222", :start, "00:01:10.671"}
    ]
  }

  backward = %Video.Track{
    group: "Osterbekradweg",
    direction: :backward,
    from: "Stellmoorer Tunneltal",
    to: "Ferdinandstor",
    parent_ref: __MODULE__,
    text: "entlang der Osterbek in die Innenstadt",
    videos: [
      {"2021-04-10-freizeitroute2/GX011223", "00:00:19.052", "00:03:28.041"},
      {"2021-04-10-freizeitroute2/GX011223", "00:03:40.687", "00:04:34.841"},
      {"2021-04-10-freizeitroute2/GX021223", "00:00:02.936", :end},
      {"2021-04-10-freizeitroute2/GX011224", :start, :end},
      {"2021-04-10-freizeitroute2/GX011225", :start, :end},
      {"2021-04-10-freizeitroute2/GX011226", :start, "00:01:04.665"},
      {"2021-04-10-freizeitroute2/GX011226", "00:01:20.213", :end},
      {"2021-04-10-freizeitroute2/GX011227", :start, "00:00:23.524"},
      {"2021-04-10-freizeitroute2/GX011227", "00:00:30.063", :end},
      {"2021-04-10-freizeitroute2/GX011228", :start, :end},
      {"2021-04-10-freizeitroute2/GX011229", :start, :end},
      {"2021-04-10-freizeitroute2/GX011230", :start, :end},
      {"2021-04-10-freizeitroute2/GX011231", :start, :end},
      {"2021-04-10-freizeitroute2/GX011232", :start, :end},
      {"2021-04-10-freizeitroute2/GX011233", :start, :end},
      {"2021-04-10-freizeitroute2/GX011234", :start, :end},
      {"2021-04-10-freizeitroute2/GX011235", :start, :end},
      {"2021-04-10-freizeitroute2/GX011236", :start, :end},
      {"2021-04-10-freizeitroute2/GX011237", :start, :end},
      {"2021-04-10-freizeitroute2/GX011238", :start, :end},
      {"2021-04-10-freizeitroute2/GX011239", :start, :end},
      {"2021-04-10-freizeitroute2/GX011240", :start, :end},
      {"2021-04-10-freizeitroute2/GX011241", :start, :end},
      {"2021-04-10-freizeitroute2/GX011242", :start, "00:01:33.660"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011822", "00:00:15.849", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011823", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011824", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011825", :start, "00:00:01.969"}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
