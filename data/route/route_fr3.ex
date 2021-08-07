defmodule Data.Route.RouteFR3 do
  @behaviour Route.Behaviour

  def id(), do: "FR3"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "Wandseradweg (FR3)"
  def article(), do: "freizeitroute-3"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/14910"

  forward = %Video.Track{
    group: "Wandseradweg",
    direction: :forward,
    from: "Ferdinandstor",
    to: "Stapelfeld",
    parent_ref: __MODULE__,
    text: "entlang der Wandse nach Stapelfeld",
    videos: [
      {"2021-04-10-freizeitroute2/GX011188", :start, :end},
      {"2021-04-10-freizeitroute2/GX011189", :start, "00:00:57.524"},
      {"2021-07-26-missing-parts-fr2-fr3/GX012418", "00:00:19.620", :end},
      {"2021-07-26-missing-parts-fr2-fr3/GX012419", :start, :end},
      {"2021-07-26-missing-parts-fr2-fr3/GX012420", :start, "00:00:03.504"},
      {"2021-04-18-freizeitroute3/GX011334", "00:00:03.003", :end},
      {"2021-04-18-freizeitroute3/GX011335", :start, :end},
      {"2021-04-18-freizeitroute3/GX011336", :start, :end},
      {"2021-04-18-freizeitroute3/GX011337", :start, :end},
      {"2021-04-18-freizeitroute3/GX011338", :start, :end},
      {"2021-04-18-freizeitroute3/GX011339", :start, "00:00:41.341"},
      {"2021-04-18-freizeitroute3/GX011340", :start, :end},
      {"2021-04-18-freizeitroute3/GX011341", :start, "00:00:10.677"},
      {"2021-04-18-freizeitroute3/GX011342", :start, "00:01:39.600"},
      {"2021-04-18-freizeitroute3/GX011342", "00:01:40.467", :end},
      {"2021-04-18-freizeitroute3/GX011343", :start, :end},
      {"2021-04-18-freizeitroute3/GX011344", :start, "00:00:32.366"},
      {"2021-04-18-freizeitroute3/GX011345", "00:00:07.241", :end},
      {"2021-04-18-freizeitroute3/GX011348", "00:00:00.367", "00:00:13.580"},
      {"2021-04-18-freizeitroute3/GX011349", "00:00:00.267", :end},
      {"2021-04-18-freizeitroute3/GX011350", :start, "00:04:02.309"}
    ]
  }

  backward = %Video.Track{
    group: "Wandseradweg",
    direction: :backward,
    from: "Stapelfeld",
    to: "Ferdinandstor",
    parent_ref: __MODULE__,
    text: "entlang der Wandse in die Innenstadt",
    videos: [
      {"2021-04-18-freizeitroute3/GX011350", "00:04:44.785", :end},
      {"2021-04-18-freizeitroute3/GX011351", :start, :end},
      {"2021-04-18-freizeitroute3/GX011352", "00:00:13.714", "00:01:42.569"},
      {"2021-04-18-freizeitroute3/GX011352", "00:02:10.497", "00:02:59.413"},
      {"2021-04-18-freizeitroute3/GX011352", "00:02:59.880", :end},
      {"2021-04-18-freizeitroute3/GX011353", :start, :end},
      {"2021-04-18-freizeitroute3/GX011354", :start, :end},
      {"2021-04-18-freizeitroute3/GX011355", :start, :end},
      {"2021-04-18-freizeitroute3/GX011356", :start, :end},
      {"2021-04-18-freizeitroute3/GX011357", :start, :end},
      {"2021-04-18-freizeitroute3/GX011358", :start, :end},
      {"2021-04-18-freizeitroute3/GX011359", :start, :end},
      {"2021-04-18-freizeitroute3/GX011360", :start, "00:02:00.187"},
      {"2021-07-26-missing-parts-fr2-fr3/GX012422", "00:00:03.570", "00:00:05.138"},
      {"2021-07-26-missing-parts-fr2-fr3/GX012423", :start, "00:00:02.469"},
      {"2021-07-26-missing-parts-fr2-fr3/GX012428", :start, :end},
      {"2021-07-26-missing-parts-fr2-fr3/GX012429", :start, "00:00:04.037"},
      {"2021-04-10-freizeitroute2/GX011242", "00:01:19.846", "00:01:33.660"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011822", "00:00:15.849", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011823", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011824", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011825", :start, "00:00:01.969"}
    ]
  }

  @tracks [forward, backward]

  def tracks(), do: @tracks
end
