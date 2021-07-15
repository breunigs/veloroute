defmodule Data.Route.Route1 do
  @behaviour Route.Behaviour

  @name "Alltagsroute 1"

  def id(), do: "1"
  def color(), do: "#7d8b2f"
  def name(), do: @name
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/194843"

  forward_rissen = %Video.Track{
    group: "1",
    direction: :forward,
    from: "Innenstadt",
    to: "Rissen",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Rissen",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011629", "0:00:12.246", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011630", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011631", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011632", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011633", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011659", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011660", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011661", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011662", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011663", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011664", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011665", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011666", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011667", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011668", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011669", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011670", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011671", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011672", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011673", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011674", :start, "0:01:14.000"}
    ]
  }

  backward_rissen = %Video.Track{
    group: "1",
    direction: :backward,
    from: "Rissen",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "aus Rissen in die Innenstadt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011675", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011676", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011677", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011678", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011679", :start, "0:00:45.178"},
      {"2021-06-05-velorouten-1-1a-2/GX011686", "0:02:00.187", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011687", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011688", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011690", :start, "0:00:15.282"},
      {"2021-06-05-velorouten-1-1a-2/GX011691", "0:00:01.134", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011692", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011693", :start, :end},
      {"2021-04-18-freizeitroute3/GX011324", :start, "0:00:16.683"},
      {"2021-04-10-freizeitroute2/GX011183", "0:00:01.435", "0:00:51.818"},
      {"2021-06-05-velorouten-1-1a-2/GX011654", "0:00:30.964", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011655", :start, :end}
    ]
  }

  forward_osdorf = %Video.Track{
    group: "1a",
    direction: :forward,
    from: "Innenstadt",
    to: "Osdorfer Born",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt zum Osdorfer Born",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011680", "0:00:01.000", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011681", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011682", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011683", :start, "0:00:47.447"}
    ]
  }

  backward_osdorf = %Video.Track{
    group: "1a",
    direction: :backward,
    from: "Osdorfer Born",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "vom Osdorfer Born in die Innenstadt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011683", "0:00:47.447", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011684", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011685", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011686", :start, "0:02:00.187"}
    ]
  }

  @tracks [
    forward_rissen,
    backward_rissen,
    forward_osdorf,
    backward_osdorf
  ]

  def tracks(), do: @tracks

  # legacy
  def parsed() do
    %{{id(), ""} => []}
  end

  def index() do
    %{}
  end
end
