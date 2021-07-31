defmodule Data.Route.RouteFR6 do
  @behaviour Route.Behaviour

  def id(), do: "FR6"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Elbbrücken (FR6)"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/8847600"
  # https://www.komoot.de/tour/227478472
  # https://www.hamburg.de/radtour/6294576/radtour-city-wilhelmsburg-harburger-stadtpark/

  forward = %Video.Track{
    group: "Elbbrücken",
    direction: :forward,
    from: "Hauptbahnhof",
    to: "Harburger Berge",
    parent_ref: __MODULE__,
    text: "vom Hauptbahnhof in die Harburger Berge",
    videos: [
      {"2021-06-27-veloroute9/GX012024", "00:00:31.999", :end},
      {"2021-06-27-veloroute9/GX012025", :start, :end},
      {"2021-06-27-veloroute9/GX012026", :start, "00:00:11.612"},
      {"2021-04-03-freizeitroute-5-realtime/GX011113.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011114.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011115.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011116.MP4_time_lapse.mkv", :start, "00:00:14.848"},
      {"2021-04-17-freizeitrouten-6und-7/GX011261", "00:00:01.635", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011262", :start, "00:00:26.660"},
      {"2021-07-18-whburg-and-on/GX012389", "00:00:26.360", :end},
      {"2021-07-18-whburg-and-on/GX012390", :start, :end},
      {"2021-07-18-whburg-and-on/GX012391", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011264", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011265", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011266", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011267", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011268", :start, "00:00:47.314"},
      {"2021-07-03-veloroute10/GX012083", "00:00:00.267", "00:00:04.071"},
      {"2021-04-17-freizeitrouten-6und-7/GX011268", "00:00:51.752", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011269", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011270", :start, "00:00:01.435"},
      {"2021-04-17-freizeitrouten-6und-7/GX011273", "00:00:22.189", "00:01:06.199"},
      {"2021-04-17-freizeitrouten-6und-7/GX011273", "00:01:12.973", "00:02:56.743"},
      {"2021-04-17-freizeitrouten-6und-7/GX011274", "00:00:07.040", "00:00:38.038"},
      {"2021-04-17-freizeitrouten-6und-7/GX011275", "00:00:08.675", "00:01:34.695"},
      {"2021-04-17-freizeitrouten-6und-7/GX011275", "00:01:51.278", "00:02:12.733"}
    ]
  }

  backward = %Video.Track{
    group: "Elbbrücken",
    direction: :backward,
    from: "Harburger Berge",
    to: "Hauptbahnhof",
    parent_ref: __MODULE__,
    text: "von den Harburger Bergen zum Hauptbahnhof",
    videos: [
      {"2021-04-17-freizeitrouten-6und-7/GX011275", "00:02:33.186", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX021275", :start, "00:02:18.772"},
      {"2021-04-17-freizeitrouten-6und-7/GX011273", "00:00:07.841", "00:00:18.151"},
      {"2021-04-17-freizeitrouten-6und-7/GX011271", "00:00:07.074", "00:00:09.243"},
      {"2021-04-17-freizeitrouten-6und-7/GX011278", "00:00:02.870", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011300", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011301", :start, "00:00:15.749"},
      {"2021-07-03-veloroute10/GX012082", "00:00:58.792", "00:01:07.000"},
      {"2021-04-17-freizeitrouten-6und-7/GX011301", "00:00:25.092", "00:01:02.029"},
      {"2021-04-17-freizeitrouten-6und-7/GX011301", "00:01:19.012", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011302", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011303", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011304", :start, :end},
      {"2021-07-18-whburg-and-on/GX012396", :start, :end},
      {"2021-07-18-whburg-and-on/GX012397", :start, "00:00:04.705"},
      {"2021-07-03-veloroute10/GX012091", "00:00:10.410", "00:00:24.024"},
      {"2021-04-17-freizeitrouten-6und-7/GX011305", "00:00:14.314", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011306", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011307", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011308", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011309", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011310", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011311", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011312", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011313", :start, "00:00:14.114"},
      {"2021-06-27-veloroute9/GX012038", "00:00:04.805", :end},
      {"2021-06-27-veloroute9/GX012039", :start, :end},
      {"2021-06-27-veloroute9/GX012040", :start, "00:00:01.835"}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
