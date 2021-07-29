defmodule Data.Route.RouteFR5 do
  @behaviour Route.Behaviour

  def id(), do: "FR5"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Vier und Marschlande (FR5)"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/8847599"

  forward = %Video.Track{
    group: "Vier und Marschlande",
    direction: :forward,
    from: "Hauptbahnhof",
    to: "Besenhorster Sandberge",
    parent_ref: __MODULE__,
    text: "vom Hauptbahnhof nach Borghorst",
    videos: [
      {"2021-06-27-veloroute9/GX012024", "00:00:31.999", :end},
      {"2021-06-27-veloroute9/GX012025", :start, :end},
      {"2021-06-27-veloroute9/GX012026", :start, "00:00:11.612"},
      {"2021-04-03-freizeitroute-5-realtime/GX011113.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011114.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011115.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011116.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011117.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX021117.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX031117.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX041117.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX051117.MP4_time_lapse.mkv", :start, "00:00:27.661"},
      {"2021-04-03-freizeitroute-5-realtime/GX011118.MP4_time_lapse.mkv", "00:00:01.502", :end},
      {"2021-04-03-freizeitroute-5-realtime/GX021118.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX011119.MP4_time_lapse.mkv", "00:00:00.400", :end},
      {"2021-04-03-freizeitroute-5-realtime/GX021119.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-03-freizeitroute-5-realtime/GX031119.MP4_time_lapse.mkv", :start, :end}
    ]
  }

  backward = %Video.Track{
    group: "Vier und Marschlande",
    direction: :backward,
    from: "Besenhorster Sandberge",
    to: "Hauptbahnhof",
    parent_ref: __MODULE__,
    text: "von Borghorst zum Hauptbahnhof",
    videos: [
      {"2021-04-03-freizeitroute-5-realtime/GX011120.MP4_time_lapse.mkv", :start, "00:01:00.928"},
      {"2021-04-03-freizeitroute-5-realtime/GX011121.MP4_time_lapse.mkv", "00:00:00.434", :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011122", :start, :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011123", :start, :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011124", :start, :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011125", :start, :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011126", :start, :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX021126", :start, :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011127", :start, :end},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011128", :start, "00:00:07.241"},
      {"2021-04-03-freizeitroute-5-zeitraffer/GX011129", :start, "00:00:15.048"},
      {"2021-04-17-freizeitrouten-6und-7/GX011307", "00:00:00.234", :end},
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
