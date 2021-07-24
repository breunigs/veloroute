defmodule Data.Route.Route12 do
  @behaviour Route.Behaviour

  def id(), do: "12"
  def type(), do: :alltag
  def color(), do: "#ed6706"
  def name(), do: "Alltagsroute 12"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/2238410"

  forward = %Video.Track{
    group: "12",
    direction: :forward,
    from: "Innenstadt",
    to: "Altona",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Altona",
    videos: [
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011832", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011833", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011834", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011835", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011836", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011837", :start, "0:00:46.413"}
    ]
  }

  backward = %Video.Track{
    group: "12",
    direction: :backward,
    from: "Altona",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "von Altona in die Innenstadt",
    videos: [
      {"2021-06-27-veloroute9/GX012013", :start, :end},
      {"2021-06-27-veloroute9/GX012014", :start, :end},
      {"2021-06-27-veloroute9/GX012015", :start, :end},
      {"2021-06-27-veloroute9/GX012016", :start, :end},
      {"2021-06-27-veloroute9/GX012017", :start, :end},
      {"2021-06-27-veloroute9/GX012018", :start, :end},
      {"2021-06-27-veloroute9/GX012019", :start, :end},
      {"2021-06-27-veloroute9/GX012020", :start, :end},
      {"2021-06-27-veloroute9/GX012021", :start, "0:00:13.413"},
      {"2021-06-22-velo7-und-pauli-altona/GX011901", "0:00:04.238", "0:00:16.450"},
      {"2021-06-05-velorouten-1-1a-2/GX011655", "0:00:34.601", "0:00:48.215"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
