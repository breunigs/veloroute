defmodule Data.Route.RSWBadBramstedt do
  @behaviour Route.Behaviour

  def id(), do: "rsw-bad-bramstedt"
  def type(), do: :rsw
  def color(), do: "#000000"
  def name(), do: "Radschnellweg Bad Bramstedt"
  def article(), do: "rsw-bad-bramstedt"
  def osm_relation_ref(), do: nil

  forward = %Video.Track{
    group: "Radschnellweg Bad Bramstedt",
    direction: :forward,
    from: "Hamburg Diebsteich",
    to: "Bad Bramstedt Zeltberg",
    parent_ref: __MODULE__,
    text: "künftiger Radschnellweg nach Bad Bramstedt",
    videos: [
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011787", "00:00:56.423", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011788", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011789", :start, "00:00:05.606"},
      {"2021-09-09-rsw-bad-bramstedt/GX012752", "00:00:01.335", "00:00:38.038"},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011432", "00:01:38.332", :end},
      {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011433", :start, "00:00:01.201"},
      {"2021-09-09-rsw-bad-bramstedt/GX012753", "00:00:24.892", :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012754", :start, "00:00:14.681"},
      {"2021-09-09-rsw-bad-bramstedt/GX012761", "00:00:14.548", :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012762", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012763", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012764", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012765", :start, "00:00:09.009"},
      {"2021-09-09-rsw-bad-bramstedt/GX012767", "00:00:01.001", :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012768", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012769", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012771", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012772", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012773", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012774", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012776", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012777", :start, "00:00:33.433"},
      {"2021-09-09-rsw-bad-bramstedt/GX012778", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012779", :start, "00:00:55.255"},
      {"2021-09-09-rsw-bad-bramstedt/GX012779", "00:01:13.273", :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012780", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012781", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012782", :start, :end},
      {"2021-09-09-rsw-bad-bramstedt/GX012783", :start, "00:01:41.101"},
      {"2021-09-09-rsw-bad-bramstedt/GX012785", "00:00:14.381", "00:02:58.512"}
    ]
  }

  @tracks [forward]
  def tracks(), do: @tracks
end
