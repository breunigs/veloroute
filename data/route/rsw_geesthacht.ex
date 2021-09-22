defmodule Data.Route.RSWGeesthacht do
  @behaviour Route.Behaviour

  def id(), do: "rsw-geesthacht"
  def type(), do: :rsw
  def color(), do: "#000000"
  def name(), do: "Radschnellweg Geesthacht"
  def article(), do: "rsw-geesthacht"
  def osm_relation_ref(), do: nil

  forward = %Video.Track{
    group: "Radschnellweg Geesthacht",
    direction: :forward,
    from: "Hamburg Tiefstack",
    to: "Geesthacht Bergedorfer Straße",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg nach Geesthacht",
    videos: [
      {"2021-06-27-veloroute9/GX012027", "00:03:10.891", :end},
      {"2021-06-27-veloroute9/GX022027", :start, "00:03:10.390"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012885", "00:04:46.853", "00:05:01.968"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012888", "00:00:01.335", "00:00:03.270"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012889", :start, "00:00:34.801"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012889", "00:00:49.750", :end},
      {"2021-09-19-rsw-geesthacht-velo9/GX012890", :start, "00:00:26.760"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012892", :start, "00:00:13.113"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012894", "00:00:00.334", :end},
      {"2021-09-19-rsw-geesthacht-velo9/GX012895", :start, :end},
      {"2021-09-19-rsw-geesthacht-velo9/GX012896", :start, :end},
      {"2021-09-19-rsw-geesthacht-velo9/GX012897", :start, "00:03:07.654"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012905", "00:00:01.735", "00:00:29.096"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012905", "00:00:38.205", "00:00:58.058"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012897", "00:04:16.656", "00:04:49.890"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012897", "00:04:57.764", :end},
      {"2021-09-19-rsw-geesthacht-velo9/GX012898", :start, :end}
    ]
  }

  @tracks [forward]
  def tracks(), do: @tracks
end
