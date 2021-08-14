defmodule Data.Route.RouteFR13 do
  @behaviour Route.Behaviour

  def id(), do: "FR13"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Radweg „Dritte Meile“ (FR13)"
  def article(), do: "freizeitroute-13"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/9069490"

  forward = %Video.Track{
    group: "Radweg „Dritte Meile“",
    direction: :forward,
    from: "Finkenwerder",
    to: "Harburger Berge",
    parent_ref: __MODULE__,
    text: "durchs Alte Land in die Harburger Berge",
    videos: [
      {"2021-08-04-fr13-fr14/GX012514", :start, "00:00:23.590"},
      {"2021-08-04-fr13-fr14/GX012515", "00:00:16.617", "00:01:11.605"},
      {"2021-08-04-fr13-fr14/GX012517", "00:00:00.467", :end},
      {"2021-08-04-fr13-fr14/GX012518", :start, :end},
      {"2021-08-04-fr13-fr14/GX012519", :start, :end},
      {"2021-08-04-fr13-fr14/GX012520", :start, :end},
      {"2021-08-04-fr13-fr14/GX012521", :start, :end},
      {"2021-08-04-fr13-fr14/GX012534", "00:00:17.217", :end},
      {"2021-08-04-fr13-fr14/GX012535", :start, :end},
      {"2021-08-04-fr13-fr14/GX012536", :start, :end},
      {"2021-08-04-fr13-fr14/GX012537", "00:00:00.133", "00:01:44.371"}
    ]
  }

  backward = %Video.Track{
    group: "Radweg „Dritte Meile“",
    direction: :backward,
    from: "Harburger Berge",
    to: "Finkenwerder",
    parent_ref: __MODULE__,
    text: "durchs alte Land nach Finkenwerder",
    videos: [
      {"2021-08-04-fr13-fr14/GX012551.MP4_time_lapse.mkv", "00:00:10.010", :end},
      {"2021-08-04-fr13-fr14/GX022551.MP4_time_lapse.mkv", :start, :end},
      {"2021-08-04-fr13-fr14/GX012533", "00:02:40.394", :end},
      {"2021-08-04-fr13-fr14/GX012534", :start, "00:00:15.916"},
      {"2021-08-04-fr13-fr14/GX012522", :start, :end},
      {"2021-08-04-fr13-fr14/GX012523", :start, :end},
      {"2021-08-04-fr13-fr14/GX012524", :start, "00:00:05.739"},
      {"2021-08-14-fr13-und-11alt/GX012655", "00:00:03.103", "00:00:38.805"},
      {"2021-08-04-fr13-fr14/GX012553", "00:00:05.172", "00:00:19.119"},
      {"2021-08-14-fr13-und-11alt/GX012655", "00:00:44.912", "00:01:08.969"},
      {"2021-08-04-fr13-fr14/GX012555", "00:00:07.808", :end},
      {"2021-08-04-fr13-fr14/GX012556", :start, :end},
      {"2021-08-04-fr13-fr14/GX012557", :start, :end},
      {"2021-08-04-fr13-fr14/GX012558", :start, "00:01:15.375"},
      {"2021-08-04-fr13-fr14/GX012513", "00:00:42.643", "00:00:48.482"},
      {"2021-08-04-fr13-fr14/GX012513", "00:01:04.932", :end}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
