defmodule Data.Route.Route9 do
  @behaviour Route.Behaviour

  def id(), do: "9"
  def type(), do: :alltag
  def color(), do: "#9d2928"
  def name(), do: "Alltagsroute 9"
  def article(), do: "alltagsroute-9"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/229823"

  forward = %Video.Track{
    group: "9 Bergedorf",
    direction: :forward,
    from: "Innenstadt",
    to: "Bergedorf",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Bergedorf",
    videos: [
      {"2021-07-03-veloroute10/GX012051", :start, "00:00:03.770"},
      {"2021-06-27-veloroute9/GX012023", "00:00:56.356", :end},
      {"2021-04-25-freizeitroute4/GX011376", "00:00:10.377", :end},
      {"2021-06-27-veloroute9/GX012024", "00:00:31.131", :end},
      {"2021-06-27-veloroute9/GX012025", :start, :end},
      {"2021-06-27-veloroute9/GX012026", :start, :end},
      {"2021-06-27-veloroute9/GX012027", :start, "00:01:30.490"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012883", "00:00:15.415", "00:00:58.959"},
      {"2021-06-27-veloroute9/GX012027", "00:02:23.510", :end},
      {"2021-06-27-veloroute9/GX022027", :start, :end},
      {"2021-06-27-veloroute9/GX012028", :start, :end},
      {"2021-06-27-veloroute9/GX012029", :start, :end},
      {"2021-06-27-veloroute9/GX012030", :start, :end},
      {"2021-06-27-veloroute9/GX012031", :start, "00:00:12.312"}
    ]
  }

  backward = %Video.Track{
    group: "9 Bergedorf",
    direction: :backward,
    from: "Bergedorf",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "aus Bergedorf in die Innenstadt",
    videos: [
      {"2021-06-27-veloroute9/GX012031", "00:00:21.655", :end},
      {"2021-06-27-veloroute9/GX012032", :start, :end},
      {"2021-06-27-veloroute9/GX012033", :start, :end},
      {"2021-06-27-veloroute9/GX012034", :start, :end},
      {"2021-06-27-veloroute9/GX012035", :start, :end},
      {"2021-06-27-veloroute9/GX022035", :start, :end},
      {"2021-06-27-veloroute9/GX012036", :start, :end},
      {"2021-06-27-veloroute9/GX012037", :start, "00:01:06.767"},
      {"2021-09-19-rsw-geesthacht-velo9/GX012918", "00:01:06.066", "00:01:29.356"},
      {"2021-06-27-veloroute9/GX012037", "00:01:46.540", :end},
      {"2021-06-27-veloroute9/GX012038", :start, :end},
      {"2021-06-27-veloroute9/GX012039", :start, :end},
      {"2021-06-27-veloroute9/GX012040", :start, :end},
      {"2021-06-27-veloroute9/GX012041", :start, "00:00:16.350"},
      {"2021-06-22-velo7-und-pauli-altona/GX011937", "00:00:23.023", "00:00:47.180"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
