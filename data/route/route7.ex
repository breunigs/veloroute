defmodule Data.Route.Route7 do
  @behaviour Route.Behaviour

  def id(), do: "7"
  def type(), do: :alltag
  def color(), do: "#97ba22"
  def name(), do: "Alltagsroute 7"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/228035"

  fw_rahlstedt = %Video.Track{
    group: "7",
    direction: :forward,
    from: "Innenstadt",
    to: "Rahlstedt",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Rahlstedt",
    videos: [
      {"2021-07-03-veloroute10/GX012051", :start, "0:00:03.770"},
      {"2021-06-27-veloroute9/GX012023", "0:00:56.356", :end},
      {"2021-04-25-freizeitroute4/GX011376", "0:00:10.377", :end},
      {"2021-04-25-freizeitroute4/GX011377", :start, "0:00:06.473"},
      {"2021-06-25-velo8/GX011969", "0:00:06.974", :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011902", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011903", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011904", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011905", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011906", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011907", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011908", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011909", :start, "0:00:40.207"},
      {"2021-06-22-velo7-und-pauli-altona/GX011909", "0:00:54.922", "0:01:36.229"},
      {"2021-06-22-velo7-und-pauli-altona/GX011913", "0:00:07.741", :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011914", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011915", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011916", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011917", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011918", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011920", :start, "0:00:57.057"}
    ]
  }

  bw_rahlstedt = %Video.Track{
    group: "7",
    direction: :backward,
    from: "Rahlstedt",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "aus Rahlstedt in die Innenstadt",
    videos: [
      {"2021-06-22-velo7-und-pauli-altona/GX011921", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011922", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011923", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011924", :start, "0:01:20.647"},
      {"2021-06-22-velo7-und-pauli-altona/GX011925", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011926", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011927", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011928", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011930", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011931", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011932", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011933", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011934", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011935", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011937", :start, "0:00:47.180"}
    ]
  }

  fw_jenfeld = %Video.Track{
    group: "7j",
    direction: :forward,
    from: "Innenstadt",
    to: "Jenfeld",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Jenfeld",
    videos: [
      {"2021-06-22-velo7-und-pauli-altona/GX011909", "0:01:37.097", :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011910", :start, "0:00:03.170"}
    ]
  }

  bw_jenfeld = %Video.Track{
    group: "7j",
    direction: :backward,
    from: "Jenfeld",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "aus Jenfeld in die Innenstadt",
    videos: [
      {"2021-06-22-velo7-und-pauli-altona/GX011911", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011912", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011913", :start, "0:00:02.269"}
    ]
  }

  @tracks [fw_rahlstedt, bw_rahlstedt, fw_jenfeld, bw_jenfeld]
  def tracks(), do: @tracks
end
