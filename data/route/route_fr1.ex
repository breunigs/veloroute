defmodule Data.Route.RouteFR1 do
  @behaviour Route.Behaviour

  def id(), do: "FR1"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Alsterradweg (FR1)"
  def article(), do: "freizeitroute-1"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/9040865"

  forward = %Video.Track{
    group: "Alsterradweg",
    direction: :forward,
    from: "Binnenalster",
    to: "Duvenstedter Brook",
    parent_ref: __MODULE__,
    text: "entlang der Alster zum Duvenstedter Brook",
    videos: [
      {"2021-05-29-freizeitroute1/GX011470", "00:00:05.405", :end},
      {"2021-05-29-freizeitroute1/GX011471", :start, "00:00:00.634"},
      {"2021-05-29-freizeitroute1/GX011473", :start, "00:00:15.349"},
      {"2021-05-29-freizeitroute1/GX011474", "00:00:26.860", :end},
      {"2021-05-29-freizeitroute1/GX011475", :start, :end},
      # TODO: maybe cut part where I go wrong?,
      {"2021-05-29-freizeitroute1/GX011476", :start, :end},
      {"2021-05-29-freizeitroute1/GX011477", "00:00:38.739", "00:03:21.968"},
      {"2021-05-29-freizeitroute1/GX011478", :start, "00:00:03.403"},
      {"2021-05-29-freizeitroute1/GX011479", "00:00:15.115", :end},
      {"2021-05-29-freizeitroute1/GX011480", :start, :end},
      {"2021-05-29-freizeitroute1/GX011481", :start, "00:00:01.301"},
      {"2021-05-29-freizeitroute1/GX011483", "00:00:06.874", :end},
      {"2021-05-29-freizeitroute1/GX011484", :start, "00:00:16.283"},
      {"2021-05-29-freizeitroute1/GX011484", "00:00:43.810", "00:01:44.605"},
      {"2021-05-29-freizeitroute1/GX011485", "00:00:03.203", "00:03:27.708"}
    ]
  }

  backward = %Video.Track{
    group: "Alsterradweg",
    direction: :backward,
    from: "Duvenstedter Brook",
    to: "Binnenalster",
    parent_ref: __MODULE__,
    text: "entlang der Alster in die Innenstadt",
    videos: [
      {"2021-05-29-freizeitroute1/GX011485", "00:03:29.276", :end},
      {"2021-05-29-freizeitroute1/GX011487", :start, "00:01:17.678"},
      {"2021-05-29-freizeitroute1/GX011489", "00:01:13.040", "00:01:46.707"},
      {"2021-05-29-freizeitroute1/GX011490", "00:00:01.134", :end},
      {"2021-05-29-freizeitroute1/GX011491", :start, :end},
      {"2021-05-29-freizeitroute1/GX011492", :start, "00:01:21.214"},
      {"2021-05-29-freizeitroute1/GX011493", "00:00:12.880", :end},
      {"2021-05-29-freizeitroute1/GX011494", :start, :end},
      {"2021-05-29-freizeitroute1/GX021494", :start, :end},
      {"2021-05-29-freizeitroute1/GX011495", :start, :end},
      {"2021-05-29-freizeitroute1/GX011496", :start, :end},
      {"2021-05-29-freizeitroute1/GX011497", :start, :end},
      {"2021-05-29-freizeitroute1/GX011498", :start, :end},
      {"2021-05-29-freizeitroute1/GX011499", :start, :end},
      {"2021-05-29-freizeitroute1/GX011500", :start, "00:02:29.716"}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
