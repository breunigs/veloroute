defmodule Data.AutoGenerated.Video.Rendered_936d92c42595877d0925a822fdb40837 do
  @moduledoc "#{"2021-05-19-versuchsradweg-hallerstrasse: Hallerstraße Richtung Westen"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2021-05-19-versuchsradweg-hallerstrasse: Hallerstraße Richtung Westen"
  end

  @impl Video.Rendered
  def hash() do
    "936d92c42595877d0925a822fdb40837"
  end

  @impl Video.Rendered
  def length_ms() do
    17202
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2021-06-19-veloroute6/GX011884", "00:00:02.002", :end},
      {"2021-06-19-veloroute6/GX011885", :start, "00:00:13.447"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.572772,
      maxLon: 9.987941,
      minLat: 53.572584,
      minLon: 9.979473523952096
    }
  end

  @impl Video.Rendered
  def renderer() do
    1
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "Juni 2021"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.572772, lon: 9.987941, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.57277, lon: 9.987784, time_offset_ms: 334},
      %Video.TimedPoint{lat: 53.572765, lon: 9.987623, time_offset_ms: 667},
      %Video.TimedPoint{lat: 53.572765, lon: 9.98746, time_offset_ms: 1001},
      %Video.TimedPoint{lat: 53.572765, lon: 9.987298, time_offset_ms: 1335},
      %Video.TimedPoint{lat: 53.572763, lon: 9.987139, time_offset_ms: 1668},
      %Video.TimedPoint{lat: 53.572763, lon: 9.986985, time_offset_ms: 2002},
      %Video.TimedPoint{lat: 53.572761, lon: 9.986844, time_offset_ms: 2336},
      %Video.TimedPoint{lat: 53.572762, lon: 9.986727, time_offset_ms: 2669},
      %Video.TimedPoint{lat: 53.572763, lon: 9.986639, time_offset_ms: 3003},
      %Video.TimedPoint{lat: 53.572763, lon: 9.986569, time_offset_ms: 3337},
      %Video.TimedPoint{lat: 53.572761, lon: 9.986516, time_offset_ms: 3670},
      %Video.TimedPoint{lat: 53.572711, lon: 9.986451, time_offset_ms: 3755},
      %Video.TimedPoint{lat: 53.572711, lon: 9.986435, time_offset_ms: 4089},
      %Video.TimedPoint{lat: 53.57271, lon: 9.986375, time_offset_ms: 4422},
      %Video.TimedPoint{lat: 53.572715, lon: 9.986285, time_offset_ms: 4756},
      %Video.TimedPoint{lat: 53.572719, lon: 9.986175, time_offset_ms: 5090},
      %Video.TimedPoint{lat: 53.572712, lon: 9.986047, time_offset_ms: 5423},
      %Video.TimedPoint{lat: 53.572699, lon: 9.985906, time_offset_ms: 5757},
      %Video.TimedPoint{lat: 53.572691, lon: 9.98575, time_offset_ms: 6091},
      %Video.TimedPoint{lat: 53.572683, lon: 9.985585, time_offset_ms: 6424},
      %Video.TimedPoint{lat: 53.572677, lon: 9.985413, time_offset_ms: 6758},
      %Video.TimedPoint{lat: 53.572674, lon: 9.985239, time_offset_ms: 7092},
      %Video.TimedPoint{lat: 53.572672, lon: 9.985058, time_offset_ms: 7425},
      %Video.TimedPoint{lat: 53.572671, lon: 9.984875, time_offset_ms: 7759},
      %Video.TimedPoint{lat: 53.572668, lon: 9.984694, time_offset_ms: 8093},
      %Video.TimedPoint{lat: 53.572661, lon: 9.984504, time_offset_ms: 8426},
      %Video.TimedPoint{lat: 53.572659, lon: 9.984317, time_offset_ms: 8760},
      %Video.TimedPoint{lat: 53.572662, lon: 9.984132, time_offset_ms: 9094},
      %Video.TimedPoint{lat: 53.572662, lon: 9.983943, time_offset_ms: 9427},
      %Video.TimedPoint{lat: 53.572654, lon: 9.983754, time_offset_ms: 9761},
      %Video.TimedPoint{lat: 53.572648, lon: 9.983566, time_offset_ms: 10095},
      %Video.TimedPoint{lat: 53.572643, lon: 9.983375, time_offset_ms: 10428},
      %Video.TimedPoint{lat: 53.572643, lon: 9.983183, time_offset_ms: 10762},
      %Video.TimedPoint{lat: 53.572644, lon: 9.982989, time_offset_ms: 11096},
      %Video.TimedPoint{lat: 53.572643, lon: 9.982792, time_offset_ms: 11429},
      %Video.TimedPoint{lat: 53.572641, lon: 9.982594, time_offset_ms: 11763},
      %Video.TimedPoint{lat: 53.572638, lon: 9.982394, time_offset_ms: 12097},
      %Video.TimedPoint{lat: 53.572637, lon: 9.982194, time_offset_ms: 12430},
      %Video.TimedPoint{lat: 53.572635, lon: 9.981992, time_offset_ms: 12764},
      %Video.TimedPoint{lat: 53.57263, lon: 9.981792, time_offset_ms: 13098},
      %Video.TimedPoint{lat: 53.572624, lon: 9.981585, time_offset_ms: 13431},
      %Video.TimedPoint{lat: 53.572616, lon: 9.981377, time_offset_ms: 13765},
      %Video.TimedPoint{lat: 53.57261, lon: 9.981171, time_offset_ms: 14099},
      %Video.TimedPoint{lat: 53.572605, lon: 9.980969, time_offset_ms: 14432},
      %Video.TimedPoint{lat: 53.572603, lon: 9.98077, time_offset_ms: 14766},
      %Video.TimedPoint{lat: 53.572597, lon: 9.980578, time_offset_ms: 15099},
      %Video.TimedPoint{lat: 53.572592, lon: 9.980387, time_offset_ms: 15433},
      %Video.TimedPoint{lat: 53.572587, lon: 9.980206, time_offset_ms: 15767},
      %Video.TimedPoint{lat: 53.572584, lon: 9.980028, time_offset_ms: 16100},
      %Video.TimedPoint{lat: 53.572586, lon: 9.979853, time_offset_ms: 16434},
      %Video.TimedPoint{lat: 53.5726, lon: 9.979685, time_offset_ms: 16768},
      %Video.TimedPoint{lat: 53.572614, lon: 9.979521, time_offset_ms: 17101},
      %Video.TimedPoint{lat: 53.57261430239521, lon: 9.979473523952096, time_offset_ms: 17202}
    ]
  end
end