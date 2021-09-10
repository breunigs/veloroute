defmodule Data.Route.RSWLueneBurg do
  @behaviour Route.Behaviour

  def id(), do: "rsw-lueneburg"
  def type(), do: :rsw
  def color(), do: "#000000"
  def name(), do: "Radschnellweg Lüneburg"
  def article(), do: "rsw-lueneburg"
  def osm_relation_ref(), do: nil

  forward = %Video.Track{
    group: "Radschnellweg Lüneburg",
    direction: :forward,
    from: "Hamburg Elbbrücken",
    to: "Lüneburg Zeltberg",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg nach Lüneburg",
    videos: [
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012366", "00:00:57.491", "00:01:13.040"},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011460.MP4_time_lapse.mkv", "00:01:21.748",
       :end},
      {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX021460.MP4_time_lapse.mkv", :start, :end},
      {"2021-07-18-whburg-and-on/GX012391", :start, :end},
      {"2021-07-18-whburg-and-on/GX012392", :start, "00:00:02.302"},
      {"2021-04-17-freizeitrouten-6und-7/GX011264", "00:00:02.169", "00:01:15.008"},
      {"2021-07-04-veloroute11/GX012118", "00:00:03.704", "00:00:13.747"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012372", :start, "00:00:11.445"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012373", "00:00:35.736", :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012374", :start, "00:01:02.162"},
      {"2021-08-15-rsw-lueneburg/GX012672", "00:01:15.475", :end},
      {"2021-08-15-rsw-lueneburg/GX012673", :start, :end},
      {"2021-08-15-rsw-lueneburg/GX012674", :start, :end},
      {"2021-08-15-rsw-lueneburg/GX012675", :start, "00:03:56.203"},
      {"2021-08-15-rsw-lueneburg/GX012676", :start, :end},
      {"2021-08-15-rsw-lueneburg/GX022676", :start, "00:00:13.013"},
      {"2021-08-15-rsw-lueneburg/GX012677", "00:00:22.923", "00:01:29.890"},
      {"2021-08-15-rsw-lueneburg/GX012678", "00:00:01.068", :end},
      {"2021-08-15-rsw-lueneburg/GX012679", :start, "00:01:59.186"},
      {"2021-08-15-rsw-lueneburg/GX012683", :start, :end},
      {"2021-08-15-rsw-lueneburg/GX012684", :start, "00:02:15.602"},
      {"2021-08-15-rsw-lueneburg/GX012686.MP4.time_lapse.mkv", "00:00:00.434", :end},
      {"2021-08-15-rsw-lueneburg/GX022686.MP4.time_lapse.mkv", :start, :end},
      {"2021-08-15-rsw-lueneburg/GX012687.MP4.time_lapse.mkv", :start, :end},
      {"2021-08-15-rsw-lueneburg/GX012688.MP4.time_lapse.mkv", :start, "00:01:22.950"},
      {"2021-08-15-rsw-lueneburg/GX012688.MP4.time_lapse.mkv", "00:01:28.388", "00:02:12.099"}
    ]
  }

  @tracks [forward]
  def tracks(), do: @tracks
end
