defmodule Data.Route.Route11 do
  @behaviour Route.Behaviour

  def id(), do: "11"
  def color(), do: "#00a0e2"
  def name(), do: "Alltagsroute 11"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/233959"

  forward_innenstadt = %Video.Track{
    group: "11 Eißendorf",
    direction: :forward,
    from: "Innenstadt",
    to: "Eißendorf",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Eißendorf",
    videos: [
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011832", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011833", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011834", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011835", :start, "0:00:07.908"},
      {"2021-07-04-veloroute11/GX012106", :start, :end},
      {"2021-07-04-veloroute11/GX012107", :start, :end},
      {"2021-07-04-veloroute11/GX012108", :start, :end},
      {"2021-07-04-veloroute11/GX012109", :start, :end},
      {"2021-07-04-veloroute11/GX012111", :start, :end},
      {"2021-07-04-veloroute11/GX012112", :start, :end},
      {"2021-07-04-veloroute11/GX012113", :start, :end},
      {"2021-07-04-veloroute11/GX012114", :start, "0:00:31.632"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012373", "0:00:21.488", :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012374", :start, "0:00:57.391"},
      {"2021-07-04-veloroute11/GX012120", "0:01:08.535", :end},
      {"2021-07-04-veloroute11/GX012121", :start, :end},
      {"2021-07-04-veloroute11/GX012122", :start, :end},
      {"2021-07-04-veloroute11/GX012123", :start, :end},
      {"2021-07-04-veloroute11/GX012124", :start, :end},
      {"2021-07-04-veloroute11/GX012125", :start, :end},
      {"2021-07-04-veloroute11/GX012126", :start, "0:01:35.462"}
    ]
  }

  backward_innenstadt = %Video.Track{
    group: "11 Eißendorf",
    direction: :backward,
    from: "Eißendorf",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "aus Eißendorf in die Innenstadt",
    videos: [
      {"2021-07-04-veloroute11/GX012126", "0:01:37.264", :end},
      {"2021-07-04-veloroute11/GX012128", :start, :end},
      {"2021-07-04-veloroute11/GX012129", :start, :end},
      {"2021-07-04-veloroute11/GX012130", :start, :end},
      {"2021-07-04-veloroute11/GX012131", :start, :end},
      {"2021-07-04-veloroute11/GX012132", :start, :end},
      {"2021-07-04-veloroute11/GX012133", :start, :end},
      {"2021-07-04-veloroute11/GX012134", :start, :end},
      {"2021-07-04-veloroute11/GX012135", :start, :end},
      {"2021-07-04-veloroute11/GX012136", :start, "0:01:42.336"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012374", "0:01:10.804", :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012375", :start, :end},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012376", :start, "0:00:06.540"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012373", "0:00:01.802", "0:00:12.479"},
      {"2021-07-04-veloroute11/GX012138", "0:00:11.278", :end},
      {"2021-07-04-veloroute11/GX012139", :start, :end},
      {"2021-07-04-veloroute11/GX012140", :start, :end},
      {"2021-07-04-veloroute11/GX012141", :start, :end},
      {"2021-07-04-veloroute11/GX012142", :start, :end},
      {"2021-07-04-veloroute11/GX012143", :start, :end},
      {"2021-07-04-veloroute11/GX012144", :start, :end},
      {"2021-06-27-veloroute9/GX012017", :start, :end},
      {"2021-06-27-veloroute9/GX012018", :start, :end},
      {"2021-06-27-veloroute9/GX012019", :start, :end},
      {"2021-06-27-veloroute9/GX012020", :start, :end},
      {"2021-06-27-veloroute9/GX012021", :start, "0:00:13.413"},
      {"2021-06-22-velo7-und-pauli-altona/GX011901", "0:00:04.238", "0:00:16.450"},
      {"2021-06-05-velorouten-1-1a-2/GX011655", "0:00:34.601", "0:00:48.215"}
    ]
  }

  # videos are only the short segments, GPX should be the full tracks
  forward_veddel = %Video.Track{
    group: "11 Veddel",
    direction: :forward,
    from: "Veddel",
    to: "Wilhelmsburg",
    parent_ref: __MODULE__,
    text: "von der Veddel nach Wilhelmsburg",
    videos: [
      {"2021-07-18-whburg-and-on/GX012389", "0:00:42.242", :end},
      {"2021-07-18-whburg-and-on/GX012390", :start, :end},
      {"2021-07-18-whburg-and-on/GX012391", :start, :end},
      {"2021-07-18-whburg-and-on/GX012392", :start, "0:00:02.302"},
      {"2021-04-17-freizeitrouten-6und-7/GX011264", "0:00:02.169", "0:01:15.008"},
      {"2021-07-04-veloroute11/GX012118", "0:00:03.704", "0:00:13.747"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012372", :start, "0:00:12.479"}
    ]
  }

  backward_veddel = %Video.Track{
    group: "11 Veddel",
    direction: :backward,
    from: "Wilhelmsburg",
    to: "Veddel",
    parent_ref: __MODULE__,
    text: "von Wilhelmsburg zur Veddel",
    videos: [
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012376", "0:00:06.840", "0:00:08.609"},
      {"2021-07-04-veloroute11/GX012117", "0:00:08.308", "0:00:26.860"},
      {"2021-04-17-freizeitrouten-6und-7/GX011303", "0:00:39.540", :end},
      {"2021-04-17-freizeitrouten-6und-7/GX011304", :start, :end},
      {"2021-07-18-whburg-and-on/GX012396", :start, :end},
      {"2021-07-18-whburg-and-on/GX012397", :start, "0:00:03.270"}
    ]
  }

  @tracks [
    forward_innenstadt,
    backward_innenstadt,
    forward_veddel,
    backward_veddel
  ]
  def tracks(), do: @tracks
end
