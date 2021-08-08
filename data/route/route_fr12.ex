defmodule Data.Route.RouteFR12 do
  @behaviour Route.Behaviour

  def id(), do: "FR12"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Tarpenbekradweg (FR12)"
  def article(), do: "freizeitroute-12"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/5821671"

  forward = %Video.Track{
    group: "Tarpenbekradweg",
    direction: :forward,
    from: "Lattenkamp",
    to: "Garstedt",
    parent_ref: __MODULE__,
    text: "entlang der Tarpenbek nach Garstedt",
    videos: [
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011155", "00:00:04.338", "00:00:16.783"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011157", :start, "00:01:48.342"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011158", "00:00:00.234", "00:00:23.490"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011159", "00:00:00.601", "00:02:33.587"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011160", "00:00:00.100", "00:00:50.083"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011161", "00:00:00.100", :end},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011162", :start, "00:00:01.802"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011164", "00:00:14.081", "00:01:15.642"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011164", "00:01:21.281", :end},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011165", :start, "00:03:02.282"}
    ]
  }

  backward = %Video.Track{
    group: "Tarpenbekradweg",
    direction: :backward,
    from: "Garstedt",
    to: "Lattenkamp",
    parent_ref: __MODULE__,
    text: "entlang der Tarpenbek zum Lattenkamp",
    videos: [
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011165", "00:03:04.084", "00:03:06.720"},
      {"2021-04-04-freizeitroute-12-realtime/GX011166.MP4_time_lapse.mkv", "00:00:17.384",
       "00:01:26.286"},
      {"2021-04-04-freizeitroute-12-realtime/GX011166.MP4_time_lapse.mkv", "00:01:37.464", :end},
      {"2021-04-04-freizeitroute-12-realtime/GX021166.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-04-freizeitroute-12-realtime/GX011167.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-04-freizeitroute-12-realtime/GX011168.MP4_time_lapse.mkv", :start, :end},
      {"2021-04-04-freizeitroute-12-realtime/GX011169.MP4_time_lapse.mkv", :start,
       "00:00:49.883"},
      {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011612", "00:00:04.037", "00:01:46.573"},
      {"2021-04-04-freizeitroute-12-realtime/GX011171.MP4_time_lapse.mkv", "00:00:05.772",
       "00:00:41.909"},
      {"2021-04-04-freizeitroute-12-realtime/GX011171.MP4_time_lapse.mkv", "00:00:44.178", :end},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011172", :start, "00:01:28.288"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011156", "00:00:11.411", "00:00:12.045"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011172", "00:01:46.273", :end}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
