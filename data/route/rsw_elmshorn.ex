defmodule Data.Route.RSWElmshorn do
  @behaviour Route.Behaviour

  def id(), do: "rsw-elmshorn"
  def type(), do: :rsw
  def color(), do: "#000000"
  def name(), do: "Radschnellweg Elmshorn"
  def article(), do: "rsw-elmshorn"
  def osm_relation_ref(), do: nil

  forward = %Video.Track{
    group: "Radschnellweg Elmshorn",
    direction: :forward,
    from: "Hamburg Diebsteich",
    to: "Elmshorn Zeltberg",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg nach Elmshorn",
    videos: [
      {"2021-09-11-rsw-elmshorn/GX012803", "00:01:05.966", :end},
      {"2021-09-11-rsw-elmshorn/GX012804", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012805", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012806", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012807", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012808", :start, "00:00:01.235"},
      {"2021-09-11-rsw-elmshorn/GX012808", "00:00:23.290", "00:01:15.542"},
      {"2021-09-11-rsw-elmshorn/GX012809", "00:00:01.001", :end},
      {"2021-09-11-rsw-elmshorn/GX012810", :start, "00:03:20.467"},
      {"2021-09-11-rsw-elmshorn/GX012811", "00:00:14.281", "00:00:30.664"},
      {"2021-09-11-rsw-elmshorn/GX012811", "00:01:30.757", "00:01:45.772"},
      {"2021-09-11-rsw-elmshorn/GX012811", "00:01:56.583", "00:02:00.420"},
      {"2021-09-11-rsw-elmshorn/GX012812", "00:00:01.368", "00:01:26.653"},
      {"2021-09-11-rsw-elmshorn/GX012813", "00:00:12.379", :end},
      {"2021-09-11-rsw-elmshorn/GX012814", :start, "00:00:02.436"},
      {"2021-09-11-rsw-elmshorn/GX012814", "00:00:24.825", "00:01:09.236"},
      {"2021-09-11-rsw-elmshorn/GX012816", "00:00:13.213", :end},
      {"2021-09-11-rsw-elmshorn/GX012817", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012818", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012819", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012820", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012821", :start, :end},
      {"2021-09-11-rsw-elmshorn/GX012822", :start, "00:02:01.088"},
      {"2021-09-11-rsw-elmshorn/GX012822", "00:02:19.673", :end}
    ]
  }

  @tracks [forward]
  def tracks(), do: @tracks
end
