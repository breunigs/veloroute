defmodule Data.Route.RSWAhrensburg do
  @behaviour Route.Behaviour

  def id(), do: "rsw-ahrensburg"
  def type(), do: :rsw
  def color(), do: "#000000"
  def name(), do: "Radschnellweg Ahrensburg"
  def article(), do: "rsw-ahrensburg"
  def osm_relation_ref(), do: nil

  forward = %Video.Track{
    group: "Radschnellweg Ahrensburg",
    direction: :forward,
    from: "Hamburg Volksdorf",
    to: "Ahrensburg Gewerbegebiet",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg nach Ahrensburg",
    videos: [
      {"2021-09-26-velo6-rsw-ahrensburg/GX012960", "00:00:41.508", :end},
      {"2021-09-26-velo6-rsw-ahrensburg/GX022960", :start, :end},
      {"2021-09-26-velo6-rsw-ahrensburg/GX012964", :start, "00:00:35.402"}
    ]
  }

  backward = %Video.Track{
    group: "Radschnellweg Ahrensburg",
    direction: :backward,
    from: "Ahrensburg Gewerbegebiet",
    to: "Hamburg Volksdorf",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg aus Ahrensburg",
    videos: [
      {"2021-09-26-velo6-rsw-ahrensburg/GX012965", "00:00:35.636", :end},
      {"2021-09-26-velo6-rsw-ahrensburg/GX012966", :start, :end},
      {"2021-09-26-velo6-rsw-ahrensburg/GX012967", :start, "00:05:01.334"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks
end
