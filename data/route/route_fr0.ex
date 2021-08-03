defmodule Data.Route.RouteFR0 do
  @behaviour Route.Behaviour

  def id(), do: "FR0"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "1. Grüner Ring (FR0)"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/9038695"

  forward = %Video.Track{
    group: "1. Grüner Ring",
    direction: :forward,
    from: "Alter Elbpark",
    to: "Alter Elbpark",
    parent_ref: __MODULE__,
    text: "im Uhrzeigersinn entlang der Wallanlagen",
    videos: [
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012352", "00:00:08.642", "00:00:10.911"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012332", "00:00:03.737", :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012333", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012334", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012335", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012336", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012337", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012338", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012339", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012340", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012341", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012342", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012343", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012344", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012345", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012346", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012347", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012348", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012349", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012350", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012351", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012352", :start, "00:00:08.642"}
    ]
  }

  backward = %Video.Track{
    group: "1. Grüner Ring",
    direction: :backward,
    from: "Alter Elbpark",
    to: "Alter Elbpark",
    parent_ref: __MODULE__,
    text: "gegen Uhrzeigersinn entlang der Wallanlagen",
    videos: [
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012312", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012313", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012314", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012315", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012316", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012317", :start, "00:00:03.203"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012355", "00:00:03.837", "00:00:22.189"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012317", "00:00:20.220", :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012318", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012319", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012320", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012321", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012322", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012323", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012324", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012325", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012326", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012327", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012328", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012329", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012330", :start, :end}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
