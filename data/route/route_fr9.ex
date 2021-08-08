defmodule Data.Route.RouteFR9 do
  @behaviour Route.Behaviour

  def id(), do: "FR9"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Klövensteenradweg (FR9)"
  def article(), do: "freizeitroute-9"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/13069179"

  forward = %Video.Track{
    group: "",
    direction: :forward,
    from: "Binnenalster",
    to: "Klövensteen",
    parent_ref: __MODULE__,
    text: "von der Binnenalster in den Klövensteen",
    videos: [
      {"2021-07-26-missing-parts-fr2-fr3/GX012412", "00:00:07.508", :end},
      {"2021-07-26-missing-parts-fr2-fr3/GX012413", :start, "00:00:02.903"},
      {"2021-08-01-freizeit9-anfang/GX012477", "00:00:13.747", "00:00:53.120"},
      {"2021-08-01-freizeit9-anfang/GX012471", "00:00:18.952", :end},
      {"2021-08-01-freizeit9-anfang/GX012482", :start, :end},
      {"2021-08-01-freizeit9-anfang/GX012483", :start, :end},
      {"2021-08-01-freizeit9-anfang/GX012484", :start, :end},
      {"2021-08-01-freizeit9-anfang/GX012485", :start, :end},
      {"2021-08-08-fr9/GX012616", :start, :end},
      {"2021-08-08-fr9/GX012617", :start, :end},
      {"2021-08-08-fr9/GX012618", :start, "00:00:17.818"},
      {"2021-08-08-fr9/GX012619", :start, :end},
      {"2021-08-08-fr9/GX012620", :start, :end},
      {"2021-08-08-fr9/GX012621", :start, :end},
      {"2021-08-08-fr9/GX012622", :start, "00:00:01.568"},
      {"2021-08-08-fr9/GX012627", "00:01:44.571", "00:01:52.346"},
      {"2021-08-08-fr9/GX012622", "00:00:10.611", "00:04:11.718"},
      {"2021-08-08-fr9/GX012623", "00:00:03.003", :end},
      {"2021-08-08-fr9/GX012624", :start, :end}
    ]
  }

  backward = %Video.Track{
    group: "Kollauradweg",
    direction: :backward,
    from: "Klövensteen",
    to: "Binnenalster",
    parent_ref: __MODULE__,
    text: "vom Klövensteen zur Binnenalster",
    videos: [
      {"2021-08-08-fr9/GX012625", :start, :end},
      {"2021-08-08-fr9/GX012626", :start, :end},
      {"2021-08-08-fr9/GX012627", :start, "00:01:37.698"},
      {"2021-08-08-fr9/GX012628", "00:00:02.402", :end},
      {"2021-08-08-fr9/GX012629", :start, :end},
      {"2021-08-08-fr9/GX012630", :start, :end},
      {"2021-08-08-fr9/GX012631", :start, :end},
      {"2021-08-08-fr9/GX012632", :start, :end},
      {"2021-08-08-fr9/GX012633", :start, "00:00:40.107"},
      {"2021-08-01-freizeit9-anfang/GX012465", "00:00:26.493", :end},
      {"2021-08-01-freizeit9-anfang/GX012466", :start, "00:00:16.884"},
      {"2021-08-01-freizeit9-anfang/GX012467", "00:00:00.033", :end},
      {"2021-08-01-freizeit9-anfang/GX012468", :start, :end},
      {"2021-08-01-freizeit9-anfang/GX012469", :start, "00:00:27.194"},
      {"2021-08-01-freizeit9-anfang/GX012472", "00:00:04.705", "00:00:11.178"},
      {"2021-08-01-freizeit9-anfang/GX012471", "00:00:05.539", "00:00:18.285"},
      {"2021-08-01-freizeit9-anfang/GX012477", "00:00:53.820", "00:01:15.976"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012339", "00:00:03.704", :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012340", :start, "00:00:01.568"}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
