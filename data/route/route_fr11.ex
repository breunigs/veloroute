defmodule Data.Route.RouteFR11 do
  @behaviour Route.Behaviour

  def id(), do: "FR11"
  def type(), do: :freizeit
  def color(), do: "#006106"
  def name(), do: "2. Grüner Ring (FR11)"
  def article(), do: "freizeitroute-11"
  def osm_relation_ref(), do: "http://overpass-turbo.eu/s/1aam"
  # TODO: support more than one relation
  # def osm_relation_ref(),
  #   do: [
  #     "https://www.openstreetmap.org/relation/190774",
  #     "https://www.openstreetmap.org/relation/191378",
  #     "https://www.openstreetmap.org/relation/191510"
  #   ]

  forward = %Video.Track{
    group: "2. Grüner Ring",
    direction: :forward,
    from: "Teufelsbrück",
    to: "Rüschpark",
    parent_ref: __MODULE__,
    text: "2. Grüner Ring im Uhrzeigersinn",
    videos: [
      {"2021-08-04-fr13-fr14/GX012560", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011420", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", :start, "00:00:02.302"},
      {"2021-06-05-velorouten-1-1a-2/GX011668", "00:01:15.909", "00:01:18.378"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", "00:00:18.051", "00:00:45.379"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", "00:01:01.428", "00:01:56.483"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", "00:02:06.593", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011422", :start, "00:00:01.335"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011423", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011424", :start, "00:00:54.755"},
      {"2021-08-08-fr9/GX012627", "00:01:19.513", "00:01:37.698"},
      {"2021-08-08-fr9/GX012628", "00:00:02.402", :end},
      {"2021-08-08-fr9/GX012629", :start, "00:00:14.848"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011425", "00:00:15.916", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011426", :start, "00:01:08.268"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011426", "00:01:12.306", "00:05:00.066"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021426", "00:00:07.508", "00:00:42.709"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021426", "00:00:45.112", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011429", :start, "00:00:47.047"},
      {"2021-04-04-freizeitroute-12-speedup-5x/GX011159", "00:00:41.742", "00:02:33.286"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011430", "00:01:00.394", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011431", :start, "00:00:05.839"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011431", "00:00:25.659", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011432", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011433", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011434", :start, "00:02:27.648"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011435", "00:00:04.905", "00:01:39.900"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011437", "00:00:11.178", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011438", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011439", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011440", :start, "00:00:39.640"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011440", "00:00:59.026", "00:02:12.432"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011440", "00:02:22.876", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011441", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011442", "00:01:01.328", "00:02:37.290"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011442", "00:02:55.075", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011443", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011444", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011445", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011446", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011447", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021447", :start, "00:00:53.220"},
      {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011586", "00:01:00.861", "00:01:17.978"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021447", "00:01:05.332", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011448", :start, :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011449", :start, "00:00:44.945"},
      {"2021-04-17-freizeitrouten-6und-7/GX011261", "00:00:16.016", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011262", :start, "00:00:26.660"},
      {"2021-07-18-whburg-and-on/GX012389", "00:00:26.360", :end},
      {"2021-07-18-whburg-and-on/GX012390", :start, :end},
      {"2021-07-18-whburg-and-on/GX012391", :start, :end},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011462.MP4_time_lapse.mkv", :start, :end},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX021462.MP4_time_lapse.mkv", :start, :end},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX031462.MP4_time_lapse.mkv", :start,
       "00:00:33.825"},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX031462.MP4_time_lapse.mkv", "00:00:36.995",
       :end},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX041462.MP4_time_lapse.mkv", :start, :end},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011463.MP4_time_lapse.mkv", :start, :end},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn-zeitraffer/GX011465", :start, "00:01:17.344"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011523", "00:00:43.377", :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011524", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011525", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011526", :start, "00:00:22.756"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011526", "00:00:56.823", :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011527", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011528", :start, "00:00:11.311"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011531", "00:00:53.787", :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011533", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011534", :start, "00:00:06.874"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011534", "00:00:09.343", :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011535", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011536", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011538", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011539", :start, "00:01:51.612"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011540", "00:00:00.467", "00:01:27.521"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011542", "00:00:46.747", :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011543", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011544", :start, :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011545", :start, "00:00:33.166"},
      {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011561", "00:00:47.814", "00:01:23.884"},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011546", "00:00:59.226", :end},
      {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011547", :start, "00:01:07.167"},
      {"2021-08-04-fr13-fr14/GX012559", :start, :end}
    ]
  }

  backward = %Video.Track{
    group: "2. Grüner Ring",
    direction: :backward,
    from: "Rüschpark",
    to: "Teufelsbrück",
    parent_ref: __MODULE__,
    text: "2. Grüner Ring gegen Uhrzeigersinn",
    videos: [
      # TODO
      {"2021-08-04-fr13-fr14/GX012559", :start, :end}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
