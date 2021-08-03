defmodule Data.Route.RouteFR8 do
  @behaviour Route.Behaviour

  def id(), do: "FR8"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Elbuferradweg (FR8)"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/9070354"

  forward = %Video.Track{
    group: "Elbufer",
    direction: :forward,
    from: "Landungsbrücken",
    to: "Wedel",
    parent_ref: __MODULE__,
    text: "entang des Elbufers nach Wedel",
    videos: [
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011836", :start, "00:00:10.911"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011416", "00:00:01.068", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011417", :start, "00:00:56.390"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011417", "00:01:21.048", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011418", "00:01:08.201", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021418", :start, "00:00:43.477"}
    ]
  }

  backward = %Video.Track{
    group: "Elbufer",
    direction: :backward,
    from: "Wedel",
    to: "Landungsbrücken",
    parent_ref: __MODULE__,
    text: "entlang des Elbufers zu den Landungsbrücken",
    videos: [
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011419", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021419", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011549", "00:00:00.767", "00:00:12.145"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011418", "00:00:04.972", "00:00:27.327"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011549", "00:01:04.097", :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011550", :start, "00:04:44.384"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011510", "00:00:16.216", "00:00:27.427"},
      {"2021-08-03-fr14-noerdlich-kattwyk/GX012487", "00:00:28.529", :end}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
