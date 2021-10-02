defmodule Data.Route.RSWStade do
  @behaviour Route.Behaviour

  def id(), do: "rsw-stade"
  def type(), do: :rsw
  def color(), do: "#000000"
  def name(), do: "Radschnellweg Stade"
  def article(), do: "rsw-stade"
  def osm_relation_ref(), do: nil

  forward_southeast = %Video.Track{
    group: "Radschnellweg Stade (via Neugraben)",
    direction: :forward,
    from: "Hamburg Finkenwerder",
    to: "Stade Am Güterbahnhof",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg nach Stade (via Neugraben)",
    videos: [
      {"2021-09-18-rsw-stade/GX012828.MP4.time_lapse.mkv", :start, :end},
      {"2021-09-18-rsw-stade/GX012829", :start, :end},
      {"2021-09-18-rsw-stade/GX012830", :start, :end},
      {"2021-09-18-rsw-stade/GX012831", :start, "00:02:53.006"},
      {"2021-09-18-rsw-stade/GX012831", "00:03:09.022", "00:03:34.047"},
      {"2021-09-18-rsw-stade/GX012834", :start, "00:00:37.271"},
      {"2021-09-18-rsw-stade/GX012839", "00:00:01.168", "00:00:23.323"},
      {"2021-09-18-rsw-stade/GX012840", "00:01:01.261", "00:02:52.005"},
      {"2021-09-18-rsw-stade/GX012842", "00:00:04.271", :end},
      {"2021-09-18-rsw-stade/GX012843", :start, :end},
      {"2021-09-18-rsw-stade/GX012844", :start, :end},
      {"2021-09-18-rsw-stade/GX012846", :start, "00:00:23.357"},
      {"2021-09-18-rsw-stade/GX012847", "00:00:04.705", "00:00:27.895"},
      {"2021-09-18-rsw-stade/GX012848", "00:00:00.767", :end},
      {"2021-09-18-rsw-stade/GX012849", :start, :end},
      {"2021-09-18-rsw-stade/GX012850", :start, :end},
      {"2021-09-18-rsw-stade/GX012851", :start, "00:00:03.403"},
      {"2021-09-18-rsw-stade/GX012853", "00:00:02.636", :end},
      {"2021-09-18-rsw-stade/GX012854", :start, :end},
      {"2021-09-18-rsw-stade/GX012855", :start, :end},
      {"2021-09-18-rsw-stade/GX012856", :start, :end},
      {"2021-09-18-rsw-stade/GX012857", :start, "00:02:11.198"},
      {"2021-09-18-rsw-stade/GX012857", "00:02:55.242", :end},
      {"2021-09-18-rsw-stade/GX012858", :start, "00:02:28.248"}
    ]
  }

  backward_northwest = %Video.Track{
    group: "Radschnellweg Stade (via Neuenfelde)",
    direction: :backward,
    from: "Buxtehude Bahnhof",
    to: "Hamburg Finkenwerder",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg von Stade (via Neuenfelde)",
    videos: [
      {"2021-09-18-rsw-stade/GX012862", :start, :end},
      {"2021-09-18-rsw-stade/GX012863", :start, :end},
      {"2021-09-18-rsw-stade/GX012864", :start, :end},
      {"2021-09-18-rsw-stade/GX012865", :start, :end},
      {"2021-09-18-rsw-stade/GX012866", :start, :end},
      {"2021-09-18-rsw-stade/GX012867", :start, "00:00:16.283"},
      {"2021-09-18-rsw-stade/GX012868", "00:00:03.804", :end},
      {"2021-09-18-rsw-stade/GX012869", :start, "00:01:18.078"},
      {"2021-09-18-rsw-stade/GX012870", "00:00:08.909", :end},
      {"2021-09-18-rsw-stade/GX012871", :start, :end},
      {"2021-09-18-rsw-stade/GX012872", :start, "00:00:01.535"},
      {"2021-09-18-rsw-stade/GX012874", :start, :end},
      {"2021-09-18-rsw-stade/GX012875", :start, :end}
    ]
  }

  @tracks [forward_southeast, backward_northwest]
  def tracks(), do: @tracks
end
