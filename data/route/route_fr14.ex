defmodule Data.Route.RouteFR14 do
  @behaviour Route.Behaviour

  def id(), do: "FR14"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Alter Elbtunnel (FR14)"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/9064655"

  forward = %Video.Track{
    group: "Alter Elbtunnel",
    direction: :forward,
    from: "Landungsbrücken",
    to: "Harburger Berge",
    parent_ref: __MODULE__,
    text: "von den Landungsbrücken in die Harburger Berge",
    videos: [
      {"2021-07-04-veloroute11/GX012107", :start, :end},
      {"2021-07-04-veloroute11/GX012108", :start, :end},
      {"2021-07-04-veloroute11/GX012109", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012489", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012490", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012491", :start, :end},
      {"2021-03-28-kattwybruecke-from-photo/forward.mkv", "00:00:02.002", "00:00:14.414"},
      {"2021-08-04-fr13-fr14/GX012546", "00:02:00.220", :end},
      {"2021-08-04-fr13-fr14/GX012547", :start, :end},
      {"2021-08-04-fr13-fr14/GX012548", :start, :end},
      {"2021-08-04-fr13-fr14/GX012549", :start, :end},
      {"2021-08-04-fr13-fr14/GX012550", :start, :end}
    ]
  }

  backward = %Video.Track{
    group: "Alter Elbtunnel",
    direction: :backward,
    from: "Harburger Berge",
    to: "Landungsbrücken",
    parent_ref: __MODULE__,
    text: "aus den Harburger Bergen zu den Landungsbrücken",
    videos: [
      {"2021-08-04-fr13-fr14/GX012540", "00:00:17.451", "00:01:25.385"},
      {"2021-08-04-fr13-fr14/GX012541", "00:00:36.637", :end},
      {"2021-08-04-fr13-fr14/GX012542", :start, :end},
      {"2021-08-04-fr13-fr14/GX012543", :start, :end},
      {"2021-08-04-fr13-fr14/GX012545", :start, :end},
      {"2021-08-04-fr13-fr14/GX012546", :start, "00:00:09.176"},
      {"2021-08-04-fr13-fr14/GX012546", "00:00:23.824", "00:01:59.219"},
      {"2021-03-28-kattwybruecke-from-photo/backward.mkv", "00:00:01.201", "00:00:11.211"},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012492", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012493", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012494", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012495", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012496", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012497", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012498", :start, :end},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012499", :start, :end},
      {"2021-07-04-veloroute11/GX012143", :start, :end}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
