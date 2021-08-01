defmodule Data.Route.RouteFR7 do
  @behaviour Route.Behaviour

  def id(), do: "FR7"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Harburger Berge (FR7)"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/9064960"

  forward = %Video.Track{
    group: "Harburger Berge",
    direction: :forward,
    from: "Harburger Rathaus",
    to: "Harburger Berge",
    parent_ref: __MODULE__,
    text: "vom Harburger Rathaus in die Harburger Berge",
    videos: [
      {"2021-04-17-freizeitrouten-6und-7/GX011284", "00:00:01.869", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011285", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011286", :start, "00:00:15.782"},
      {"2021-04-17-freizeitrouten-6und-7/GX011287", "00:00:00.400", "00:01:15.242"},
      {"2021-04-17-freizeitrouten-6und-7/GX011288", "00:00:01.401", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011289", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011290", :start, "00:00:29.830"},
      {"2021-04-17-freizeitrouten-6und-7/GX011291", "00:00:00.901", "00:00:47.681"},
      {"2021-04-17-freizeitrouten-6und-7/GX011292", "00:00:04.004", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011293", :start, "00:01:42.002"},
      {"2021-04-17-freizeitrouten-6und-7/GX011294", "00:00:02.769", "00:00:15.482"}
    ]
  }

  backward = %Video.Track{
    group: "Harburger Berge",
    direction: :backward,
    from: "Harburger Berge",
    to: "Harburger Rathaus",
    parent_ref: __MODULE__,
    text: "von den Harburger Bergen zum Harburger Rathaus",
    videos: [
      {"2021-04-17-freizeitrouten-6und-7/GX011294", "00:00:17.784", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011295", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX021295", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011296", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011297", :start, :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011298", :start, :end}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
