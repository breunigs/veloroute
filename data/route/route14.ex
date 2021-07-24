defmodule Data.Route.Route14 do
  @behaviour Route.Behaviour

  def id(), do: "14"
  def type(), do: :alltag
  def color(), do: "#fdb801"
  def name(), do: "Alltagsroute 14"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/8349004"

  forward = %Video.Track{
    group: "14",
    direction: :forward,
    from: "Othmarschen",
    to: "Billstedt",
    parent_ref: __MODULE__,
    text: "äußere Ringroute im Uhrzeigersinn",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011680", "0:00:01.000", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011681", "0:00:01.000", "0:00:01.802"},
      {"2021-07-15-14uhr-und-13gg/GX012235", "0:00:01.268", :end},
      {"2021-07-15-14uhr-und-13gg/GX012236", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012238", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012239", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012240", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012241", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012242", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012243", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012244", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012245", :start, "0:00:39.773"},
      {"2021-07-15-14uhr-und-13gg/GX012246", "0:00:00.033", :end},
      {"2021-07-15-14uhr-und-13gg/GX012247", "0:00:00.033", "0:00:35.102"},
      # TODO: gap here (this segment takes the wrong path)
      {"2021-07-15-14uhr-und-13gg/GX012247", "0:01:36.229", "0:02:08.362"},
      {"2021-07-15-14uhr-und-13gg/GX012250", "0:00:00.434", :end},
      {"2021-07-15-14uhr-und-13gg/GX012251", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012252", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012253", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012254", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012255", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012256", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012257", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012258", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012259", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012260", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012261", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012262", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012263", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012264", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012265", :start, "0:00:13.213"},
      {"2021-07-15-14uhr-und-13gg/GX012266", "0:00:29.129", "0:00:50.317"},
      {"2021-07-15-14uhr-und-13gg/GX012267", "0:00:01.602", :end},
      {"2021-07-15-14uhr-und-13gg/GX012268", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012269", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012270", :start, :end},
      {"2021-07-15-14uhr-und-13gg/GX012271", :start, :end}
    ]
  }

  backward = %Video.Track{
    group: "14",
    direction: :backward,
    from: "Billstedt",
    to: "Othmarschen",
    parent_ref: __MODULE__,
    text: "äußere Ringroute gegen Uhrzeigersinn",
    videos: [
      {"2021-07-10-13uhr-14gg/GX012187", "0:00:14.214", :end},
      {"2021-07-10-13uhr-14gg/GX012188", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012189", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012190", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012191", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012192", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012193", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012194", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012195", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012196", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012197", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012198", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012199", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012200", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012201", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012202", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012203", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012204", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012205", :start, "0:00:51.285"},
      {"2021-07-15-14uhr-und-13gg/GX012248", "0:00:31.598", :end},
      {"2021-07-15-14uhr-und-13gg/GX012249", :start, "0:00:03.637"},
      {"2021-07-10-13uhr-14gg/GX012206", "0:00:20.120", :end},
      {"2021-07-10-13uhr-14gg/GX012207", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012208", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012209", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012210", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012211", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012212", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012213", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012214", :start, :end},
      {"2021-07-10-13uhr-14gg/GX012215", :start, "0:01:04.064"},
      {"2021-06-05-velorouten-1-1a-2/GX011686", "0:00:24.558", "0:02:00.187"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
