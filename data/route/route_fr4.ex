defmodule Data.Route.RouteFR4 do
  @behaviour Route.Behaviour

  def id(), do: "FR4"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Billeradweg (FR4)"
  def article(), do: "freizeitroute-4"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/223231"

  forward = %Video.Track{
    group: "Billeradweg",
    direction: :forward,
    from: "Altmannbrücke",
    to: "Bergedorfer Gehölz",
    parent_ref: __MODULE__,
    text: "entlang der Bille ins Bergedorfer Gehölz",
    videos: [
      {"2021-04-25-freizeitroute4/GX011378", :start, "00:01:02.562"},
      {"2021-04-25-freizeitroute4/GX011379", :start, :end},
      {"2021-04-25-freizeitroute4/GX011380", :start, :end},
      {"2021-04-25-freizeitroute4/GX011381", :start, "00:01:01.895"},
      {"2021-04-25-freizeitroute4/GX011381", "00:01:06.633", :end},
      {"2021-04-25-freizeitroute4/GX011382", :start, :end},
      {"2021-04-25-freizeitroute4/GX011383", :start, "00:00:04.338"},
      {"2021-04-25-freizeitroute4/GX011384", :start, :end},
      {"2021-04-25-freizeitroute4/GX011385", :start, :end},
      {"2021-04-25-freizeitroute4/GX011386", :start, :end},
      {"2021-04-25-freizeitroute4/GX011387", :start, "00:01:37.164"},
      {"2021-04-25-freizeitroute4/GX011388", "00:00:09.109", "00:02:54.574"},
      {"2021-04-25-freizeitroute4/GX011388", "00:03:11.825", :end},
      {"2021-04-25-freizeitroute4/GX011389", :start, :end},
      {"2021-04-25-freizeitroute4/GX011390", :start, :end},
      {"2021-04-25-freizeitroute4/GX011391", :start, :end},
      {"2021-04-25-freizeitroute4/GX011392", :start, :end},
      {"2021-04-25-freizeitroute4/GX011393", :start, "00:00:09.276"},
      {"2021-04-25-freizeitroute4/GX011394", "00:00:00.467", "00:02:27.214"}
    ]
  }

  backward = %Video.Track{
    group: "Billeradweg",
    direction: :backward,
    from: "Bergedorfer Gehölz",
    to: "Altmannbrücke",
    parent_ref: __MODULE__,
    text: "entlang der Bille in die Innenstadt",
    videos: [
      {"2021-04-25-freizeitroute4/GX011394", "00:03:07.054", "00:03:52.899"},
      {"2021-04-25-freizeitroute4/GX011395", "00:00:01.902", :end},
      {"2021-04-25-freizeitroute4/GX011396", :start, :end},
      {"2021-04-25-freizeitroute4/GX011397", :start, :end},
      {"2021-04-25-freizeitroute4/GX011398", :start, :end},
      {"2021-04-25-freizeitroute4/GX011399", :start, "00:00:26.159"},
      {"2021-04-25-freizeitroute4/GX011400", "00:00:00.901", :end},
      {"2021-04-25-freizeitroute4/GX011401", :start, "00:04:34.908"},
      {"2021-04-25-freizeitroute4/GX021401", "00:02:55.675", :end},
      {"2021-04-25-freizeitroute4/GX031401", :start, :end},
      {"2021-04-25-freizeitroute4/GX011402", :start, :end},
      {"2021-04-25-freizeitroute4/GX011403", :start, :end},
      {"2021-04-25-freizeitroute4/GX011404", :start, :end},
      {"2021-04-25-freizeitroute4/GX011405", :start, :end},
      {"2021-04-25-freizeitroute4/GX011406", :start, "00:00:13.881"}
    ]
  }

  forward_neben = %Video.Track{
    group: "Walter-Hammer-Weg",
    direction: :forward,
    from: "",
    to: "",
    parent_ref: __MODULE__,
    text: "Walter-Hammer-Weg Richtung Osten (Nebenstrecke FR4)",
    videos: [
      {"2021-04-25-freizeitroute4/GX011401", "00:04:34.941", :end},
      {"2021-04-25-freizeitroute4/GX021401", :start, "00:01:16.743"}
    ]
  }

  backward_neben = %Video.Track{
    group: "Walter-Hammer-Weg",
    direction: :backward,
    from: "",
    to: "",
    parent_ref: __MODULE__,
    text: "Walter-Hammer-Weg Richtung Westen (Nebenstrecke FR4)",
    videos: [
      {"2021-04-25-freizeitroute4/GX021401", "00:01:18.111", "00:02:55.675"}
    ]
  }

  @tracks [forward, backward, forward_neben, backward_neben]

  def tracks(), do: @tracks
end
