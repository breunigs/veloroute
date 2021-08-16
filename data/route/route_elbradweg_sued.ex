defmodule Data.Route.RouteElbradwegSued do
  @behaviour Route.Behaviour

  def id(), do: "e"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Elbradweg (Südteil auf Hamburger Gebiet)"
  def article(), do: "elbradweg-sued"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/2599004"

  forward = %Video.Track{
    group: "Elbradweg Süd",
    direction: :forward,
    from: "Finkenwerder",
    to: "Cranz",
    parent_ref: __MODULE__,
    text: "Elbradweg ab Finkenweder",
    videos: [
      {"2021-08-04-fr13-fr14/GX012514", :start, "00:00:11.078"},
      {"2021-08-14-fr13-und-11alt/GX012639", "00:02:30.317", "00:02:43.830"},
      # TODO: gap
      {"2021-08-14-fr13-und-11alt/GX012657", "00:00:58.592", "00:01:35.162"},
      # TODO: gap
      {"2021-08-14-fr13-und-11alt/GX012641", :start, "00:00:19.653"},
      {"2021-08-14-fr13-und-11alt/GX012643", "00:00:00.534", :end},
      {"2021-08-14-fr13-und-11alt/GX012644", :start, "00:01:47.074"},
      {"2021-08-14-fr13-und-11alt/GX012645", "00:00:07.508", "00:00:15.649"},
      {"2021-08-14-fr13-und-11alt/GX012646", "00:00:03.737", "00:02:25.512"}
    ]
  }

  backward = %Video.Track{
    group: "Elbradweg Süd",
    direction: :backward,
    from: "Cranz",
    to: "Finkenwerder",
    parent_ref: __MODULE__,
    text: "Elbradweg ab Cranz",
    videos: [
      {"2021-08-14-fr13-und-11alt/GX012646", "00:02:25.879", :end},
      {"2021-08-14-fr13-und-11alt/GX022646", :start, :end},
      {"2021-08-14-fr13-und-11alt/GX012647", :start, "00:03:30.343"},
      {"2021-08-14-fr13-und-11alt/GX012656", "00:01:02.329", :end},
      {"2021-08-14-fr13-und-11alt/GX012657", :start, "00:00:24.591"},
      {"2021-08-14-fr13-und-11alt/GX012657", "00:01:37.664", "00:02:38.125"},
      {"2021-08-04-fr13-fr14/GX012513", "00:01:12.406", :end}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
