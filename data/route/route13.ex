defmodule Data.Route.Route13 do
  @behaviour Route.Behaviour

  def id(), do: "13"
  def type(), do: :alltag
  def color(), do: "#f28801"
  def name(), do: "Alltagsroute 13"
  def article(), do: "alltagsroute-13"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/2238764"

  clockwise = %Video.Track{
    group: "13",
    direction: :forward,
    from: "Altona",
    to: "Hamm",
    parent_ref: __MODULE__,
    text: "innere Ringroute, im Uhrzeigersinn",
    videos: [
      {"2021-07-10-13uhr-14gg/GX012155", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012156", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012157", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012159", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012160", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012161", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012162", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012163", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012164", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012165", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012166", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012167", :start, "00:00:09.076"},
      {"2021-07-10-13uhr-14gg/GX012168", "00:00:01.668", :end},
      {"2021-07-10-13uhr-14gg/GX012169", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012170", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012171", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012172", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012173", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012174", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012175", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012176", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012177", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012178", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012179", :start, "00:00:12.079"},
      {"2021-07-15-14uhr-und-13gg/GX012277", "00:00:00.534", :end},
      {"2021-07-15-14uhr-und-13gg/GX012278", :start, "00:00:03.303"},
      {"2021-07-10-13uhr-14gg/GX012180", "00:00:03.403", :end},
      {"2021-07-10-13uhr-14gg/GX012181", :start, :end}
    ]
  }

  counter_clockwise = %Video.Track{
    group: "13",
    direction: :backward,
    from: "Hamm",
    to: "Altona",
    parent_ref: __MODULE__,
    text: "innere Ringroute, gegen Uhrzeigersinn",
    videos: [
      {"2021-07-15-14uhr-und-13gg/GX012276", "00:00:00.601", "00:00:11.979"},
      {"2021-07-15-14uhr-und-13gg/GX012279", "00:00:03.203", :end},
      {"2021-07-15-14uhr-und-13gg/GX012280", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012281", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012282", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012283", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012284", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012285", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012286", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012287", :start, "00:00:08.408"},
      {"2021-07-15-14uhr-und-13gg/GX012288", "00:00:02.369", "00:00:25.559"},
      {"2021-07-15-14uhr-und-13gg/GX012289", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012290", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012291", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012292", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012293", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012294", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012295", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012296", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012297", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012298", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012299", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012300", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012301", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012302", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012303", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012304", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012305", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012306", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012307", :start, "00:00:07.040"},
      {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011552", "00:00:03.737", "00:00:07.608"}
    ]
  }

  @tracks [clockwise, counter_clockwise]
  def tracks(), do: @tracks
end
