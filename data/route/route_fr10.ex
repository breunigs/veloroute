defmodule Data.Route.RouteFR10 do
  @behaviour Route.Behaviour

  def id(), do: "FR10"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Kollauradweg (FR10)"
  def article(), do: "freizeitroute-10"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/2910884"

  forward = %Video.Track{
    group: "Kollauradweg",
    direction: :forward,
    from: "Stephansplatz",
    to: "Wendlohe",
    parent_ref: __MODULE__,
    text: "entlang der Kollau nach Wendlohe",
    videos: [
      {"2021-08-01-freizeit9-anfang/GX012477", "00:00:29.630", "00:00:53.120"},
      {"2021-08-01-freizeit9-anfang/GX012471", "00:00:18.952", :end},
      {"2021-08-01-freizeit9-anfang/GX012482", :start, "00:00:05.739"},
      {"2021-08-07-fr10/GX012568", "00:00:43.277", :end},
      {"2021-08-07-fr10/GX012569", :start, :end},
      {"2021-08-07-fr10/GX012570", :start, :end},
      {"2021-08-07-fr10/GX012571", :start, "00:00:04.371"},
      {"2021-08-07-fr10/GX012574", :start, :end},
      {"2021-08-07-fr10/GX012575", :start, :end},
      {"2021-08-07-fr10/GX012576", :start, :end},
      {"2021-08-07-fr10/GX012577", :start, "00:01:55.582"},
      {"2021-08-07-fr10/GX012579", "00:00:01.502", :end},
      {"2021-08-07-fr10/GX012580", :start, "00:00:34.501"},
      {"2021-08-07-fr10/GX012593", "00:00:00.601", "00:00:05.005"},
      {"2021-08-07-fr10/GX012580", "00:00:37.704", :end},
      {"2021-08-07-fr10/GX012581", :start, "00:00:52.119"},
      {"2021-08-07-fr10/GX012583", "00:00:02.135", :end},
      {"2021-08-07-fr10/GX012584", :start, :end},
      {"2021-08-07-fr10/GX012585", :start, "00:00:35.469"}
    ]
  }

  backward = %Video.Track{
    group: "Kollauradweg",
    direction: :backward,
    from: "Wendlohe",
    to: "Stephansplatz",
    parent_ref: __MODULE__,
    text: "entlang der Kollau in die Innenstadt",
    videos: [
      {"2021-08-07-fr10/GX012587", "00:00:44.011", :end},
      {"2021-08-07-fr10/GX012588", :start, "00:01:34.861"},
      {"2021-08-07-fr10/GX012589", "00:00:00.434", :end},
      {"2021-08-07-fr10/GX012590", :start, "00:01:14.908"},
      {"2021-08-07-fr10/GX012591", "00:00:00.534", "00:00:04.304"},
      {"2021-08-07-fr10/GX012591", "00:00:04.571", "00:00:06.974"},
      {"2021-08-07-fr10/GX012591", "00:00:17.718", "00:00:33.567"},
      {"2021-08-07-fr10/GX012592", "00:00:04.238", "00:01:04.031"},
      {"2021-08-07-fr10/GX012593", "00:00:11.111", :end},
      {"2021-08-07-fr10/GX012594", :start, :end},
      {"2021-08-07-fr10/GX012595", :start, "00:00:42.509"},
      {"2021-08-07-fr10/GX012597", "00:00:18.685", "00:00:36.203"},
      {"2021-08-07-fr10/GX012598", "00:00:05.506", :end},
      {"2021-08-07-fr10/GX012599", :start, :end},
      {"2021-08-07-fr10/GX012600", :start, :end},
      {"2021-08-07-fr10/GX012601", :start, :end},
      {"2021-08-07-fr10/GX012602", :start, :end},
      {"2021-08-07-fr10/GX012603", :start, :end},
      {"2021-08-07-fr10/GX012604", :start, :end},
      {"2021-08-07-fr10/GX012605", :start, :end},
      {"2021-08-07-fr10/GX012606", :start, "00:00:21.855"},
      {"2021-08-01-freizeit9-anfang/GX012469", "00:00:21.989", "00:00:27.194"},
      {"2021-08-01-freizeit9-anfang/GX012472", "00:00:04.705", "00:00:11.178"},
      {"2021-08-01-freizeit9-anfang/GX012471", "00:00:05.539", "00:00:18.285"},
      {"2021-08-01-freizeit9-anfang/GX012477", "00:00:53.820", "00:01:13.106"}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
