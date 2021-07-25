defmodule Data.Route.Route10 do
  @behaviour Route.Behaviour

  def id(), do: "10"
  def type(), do: :alltag
  def color(), do: "#552976"
  def name(), do: "Alltagsroute 10"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/231965"

  forward = %Video.Track{
    group: "10",
    direction: :forward,
    from: "Innenstadt",
    to: "Neugraben",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Neugraben",
    videos: [
      {"2021-07-03-veloroute10/GX012051", :start, :end},
      {"2021-07-03-veloroute10/GX012052", :start, :end},
      {"2021-07-03-veloroute10/GX012053", :start, :end},
      {"2021-07-03-veloroute10/GX012054", :start, :end},
      {"2021-07-03-veloroute10/GX012055", :start, :end},
      {"2021-07-03-veloroute10/GX012056", :start, :end},
      {"2021-07-03-veloroute10/GX012057", :start, :end},
      {"2021-07-03-veloroute10/GX012058", :start, :end},
      {"2021-07-03-veloroute10/GX012059", :start, :end},
      {"2021-07-03-veloroute10/GX012060", :start, :end},
      {"2021-07-03-veloroute10/GX012061", :start, :end},
      {"2021-07-03-veloroute10/GX012062", :start, :end},
      {"2021-07-03-veloroute10/GX012063", :start, "00:00:43.277"},
      {"2021-07-03-veloroute10/GX012068", "00:00:31.265", :end},
      {"2021-07-03-veloroute10/GX012069", :start, "00:01:11.939"},
      {"2021-07-03-veloroute10/GX012083", "00:00:00.200", "00:00:03.904"},
      {"2021-07-03-veloroute10/GX012070", "00:00:02.469", "00:00:32.366"},
      {"2021-07-03-veloroute10/GX012071", "00:00:00.067", :end},
      {"2021-07-03-veloroute10/GX012072", :start, :end},
      {"2021-07-03-veloroute10/GX012073", :start, :end},
      {"2021-07-03-veloroute10/GX012074", :start, :end},
      {"2021-07-03-veloroute10/GX012075", :start, :end},
      {"2021-07-03-veloroute10/GX012076", :start, "00:01:39.199"}
    ]
  }

  backward = %Video.Track{
    group: "10",
    direction: :backward,
    from: "Neugraben",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "von Neugraben in die Innenstadt",
    videos: [
      {"2021-07-03-veloroute10/GX012076", "00:02:13.633", "00:03:49.229"},
      {"2021-07-03-veloroute10/GX012077", "00:01:43.670", :end},
      {"2021-07-03-veloroute10/GX012078", :start, :end},
      {"2021-07-03-veloroute10/GX012079", :start, :end},
      {"2021-07-03-veloroute10/GX012080", :start, :end},
      {"2021-07-03-veloroute10/GX012081", :start, :end},
      {"2021-07-03-veloroute10/GX012082", :start, "00:01:06.500"},
      {"2021-07-03-veloroute10/GX012084", "00:00:00.400", :end},
      {"2021-07-03-veloroute10/GX012085", :start, :end},
      {"2021-07-03-veloroute10/GX012086", :start, "00:00:11.645"},
      {"2021-07-03-veloroute10/GX012087", "00:00:00.200", :end},
      {"2021-07-03-veloroute10/GX012088", :start, :end},
      {"2021-07-03-veloroute10/GX012089", :start, :end},
      {"2021-07-03-veloroute10/GX012090", :start, "00:00:15.782"},
      {"2021-07-03-veloroute10/GX012091", "00:00:00.501", :end},
      {"2021-07-03-veloroute10/GX012092", :start, :end},
      {"2021-07-03-veloroute10/GX012093", :start, :end},
      {"2021-07-03-veloroute10/GX012094", :start, :end},
      {"2021-07-03-veloroute10/GX012095", :start, :end},
      {"2021-07-03-veloroute10/GX012096", :start, :end},
      {"2021-07-03-veloroute10/GX012097", :start, :end},
      {"2021-07-03-veloroute10/GX012098", :start, :end},
      {"2021-07-03-veloroute10/GX012099", :start, :end}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
