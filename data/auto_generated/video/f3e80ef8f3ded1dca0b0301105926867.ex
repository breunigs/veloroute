defmodule Data.AutoGenerated.Video.Rendered_f3e80ef8f3ded1dca0b0301105926867 do
  @moduledoc "#{"2021-05-19-versuchsradweg-hallerstrasse: Hallerstraße Richtung Osten"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2021-05-19-versuchsradweg-hallerstrasse: Hallerstraße Richtung Osten"
  end

  @impl Video.Rendered
  def hash() do
    "f3e80ef8f3ded1dca0b0301105926867"
  end

  @impl Video.Rendered
  def length_ms() do
    19453
  end

  @impl Video.Rendered
  def sources() do
    [{"2021-06-19-veloroute6/GX011842", "00:00:18.852", "00:00:38.305"}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.57258640419161,
      maxLon: 9.988055494011975,
      minLat: 53.57229781081081,
      minLon: 9.979471162162161
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
      %Video.TimedPoint{lat: 53.57229781081081, lon: 9.979471162162161, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.572299, lon: 9.979489, time_offset_ms: 33},
      %Video.TimedPoint{lat: 53.572305, lon: 9.979668, time_offset_ms: 367},
      %Video.TimedPoint{lat: 53.57231, lon: 9.97984, time_offset_ms: 701},
      %Video.TimedPoint{lat: 53.572315, lon: 9.980012, time_offset_ms: 1034},
      %Video.TimedPoint{lat: 53.572318, lon: 9.980176, time_offset_ms: 1368},
      %Video.TimedPoint{lat: 53.572321, lon: 9.980338, time_offset_ms: 1702},
      %Video.TimedPoint{lat: 53.572323, lon: 9.980505, time_offset_ms: 2035},
      %Video.TimedPoint{lat: 53.572327, lon: 9.980668, time_offset_ms: 2369},
      %Video.TimedPoint{lat: 53.572331, lon: 9.98083, time_offset_ms: 2703},
      %Video.TimedPoint{lat: 53.572336, lon: 9.980994, time_offset_ms: 3036},
      %Video.TimedPoint{lat: 53.572337, lon: 9.981153, time_offset_ms: 3370},
      %Video.TimedPoint{lat: 53.572339, lon: 9.981312, time_offset_ms: 3704},
      %Video.TimedPoint{lat: 53.572342, lon: 9.981472, time_offset_ms: 4037},
      %Video.TimedPoint{lat: 53.572346, lon: 9.981631, time_offset_ms: 4371},
      %Video.TimedPoint{lat: 53.572351, lon: 9.981786, time_offset_ms: 4705},
      %Video.TimedPoint{lat: 53.572359, lon: 9.98194, time_offset_ms: 5038},
      %Video.TimedPoint{lat: 53.572361, lon: 9.982088, time_offset_ms: 5372},
      %Video.TimedPoint{lat: 53.572363, lon: 9.982236, time_offset_ms: 5706},
      %Video.TimedPoint{lat: 53.572366, lon: 9.982383, time_offset_ms: 6039},
      %Video.TimedPoint{lat: 53.572371, lon: 9.982526, time_offset_ms: 6373},
      %Video.TimedPoint{lat: 53.572374, lon: 9.982663, time_offset_ms: 6707},
      %Video.TimedPoint{lat: 53.572374, lon: 9.982798, time_offset_ms: 7040},
      %Video.TimedPoint{lat: 53.572377, lon: 9.982936, time_offset_ms: 7374},
      %Video.TimedPoint{lat: 53.572377, lon: 9.983076, time_offset_ms: 7708},
      %Video.TimedPoint{lat: 53.572375, lon: 9.983219, time_offset_ms: 8041},
      %Video.TimedPoint{lat: 53.572378, lon: 9.983354, time_offset_ms: 8375},
      %Video.TimedPoint{lat: 53.572377, lon: 9.983484, time_offset_ms: 8709},
      %Video.TimedPoint{lat: 53.57238, lon: 9.983619, time_offset_ms: 9042},
      %Video.TimedPoint{lat: 53.572382, lon: 9.983755, time_offset_ms: 9376},
      %Video.TimedPoint{lat: 53.572387, lon: 9.983886, time_offset_ms: 9710},
      %Video.TimedPoint{lat: 53.572389, lon: 9.984025, time_offset_ms: 10043},
      %Video.TimedPoint{lat: 53.572397, lon: 9.984165, time_offset_ms: 10377},
      %Video.TimedPoint{lat: 53.572404, lon: 9.984305, time_offset_ms: 10711},
      %Video.TimedPoint{lat: 53.572412, lon: 9.984452, time_offset_ms: 11044},
      %Video.TimedPoint{lat: 53.57242, lon: 9.984599, time_offset_ms: 11378},
      %Video.TimedPoint{lat: 53.572428, lon: 9.984737, time_offset_ms: 11712},
      %Video.TimedPoint{lat: 53.572438, lon: 9.984865, time_offset_ms: 12045},
      %Video.TimedPoint{lat: 53.572444, lon: 9.984986, time_offset_ms: 12379},
      %Video.TimedPoint{lat: 53.572449, lon: 9.985115, time_offset_ms: 12713},
      %Video.TimedPoint{lat: 53.57245, lon: 9.985256, time_offset_ms: 13046},
      %Video.TimedPoint{lat: 53.57245, lon: 9.985398, time_offset_ms: 13380},
      %Video.TimedPoint{lat: 53.572449, lon: 9.98554, time_offset_ms: 13714},
      %Video.TimedPoint{lat: 53.572452, lon: 9.985684, time_offset_ms: 14047},
      %Video.TimedPoint{lat: 53.572451, lon: 9.98583, time_offset_ms: 14381},
      %Video.TimedPoint{lat: 53.572456, lon: 9.985974, time_offset_ms: 14715},
      %Video.TimedPoint{lat: 53.572467, lon: 9.986122, time_offset_ms: 15048},
      %Video.TimedPoint{lat: 53.57249, lon: 9.986269, time_offset_ms: 15382},
      %Video.TimedPoint{lat: 53.572509, lon: 9.986416, time_offset_ms: 15716},
      %Video.TimedPoint{lat: 53.572512, lon: 9.986561, time_offset_ms: 16049},
      %Video.TimedPoint{lat: 53.57251, lon: 9.986707, time_offset_ms: 16383},
      %Video.TimedPoint{lat: 53.572511, lon: 9.986854, time_offset_ms: 16717},
      %Video.TimedPoint{lat: 53.572514, lon: 9.987, time_offset_ms: 17050},
      %Video.TimedPoint{lat: 53.572518, lon: 9.987145, time_offset_ms: 17384},
      %Video.TimedPoint{lat: 53.572521, lon: 9.987288, time_offset_ms: 17718},
      %Video.TimedPoint{lat: 53.572528, lon: 9.98743, time_offset_ms: 18051},
      %Video.TimedPoint{lat: 53.572552, lon: 9.987563, time_offset_ms: 18385},
      %Video.TimedPoint{lat: 53.57257, lon: 9.987713, time_offset_ms: 18719},
      %Video.TimedPoint{lat: 53.572579, lon: 9.987865, time_offset_ms: 19052},
      %Video.TimedPoint{lat: 53.572585, lon: 9.988024, time_offset_ms: 19386},
      %Video.TimedPoint{lat: 53.57258640419161, lon: 9.988055494011975, time_offset_ms: 19453}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "ukxdeBceb`R?C?E?E?E?G?GAI?I?K?K?OAQ?QAU?Y?YA]?]AW?S?SAS?Q?QAQ?Q?Q?OAQ?O?Q?QAO?Q?O?QAO?Q?Q?OAQ?O?Q?QAO?Q?Q?QAO?Q?O?QAQ?Q?O?QAO?Q?O?Q?OAQ?O?O?Q?OAO?O?Q?O?O?OAO?O?Q?O?O?OAO?O?O?O?O?O?OAQ?O?O?O?O?O?OAO?O?O?O?O?O?OAO?O?Q?O?O?Q?O?OAQ?O?Q?O?O?Q?O?QAO?O?Q?O?O?O?QAO?Q?O?O?O?OAO?O?O?Q?O?OAO?O?O?O?OAO?O?Q?O?OAO?O?O?O?OAO?O?O?Q?OAO?O?O?O?OAO?O?O?QAO?O?O?O?QAO?O?O?QAO?O?Q?O?OAO?O?O?O?O?QAO?O?O?O?M?O?O?O?O?OAO?O?O?O?O?M?O?O?O?O?O?O?OAO?O?O?M?O?O?O?O?O?OAO?O?O?O?O?O?O?OAO?O?O?O?O?O?OAO?O?O?O?O?O?OAO?O?O?O?OAO?O?O?O?O?OAO?O?O?O?OAO?M?O?O?OAO?O?O?OAM?O?O?OAM?O?O?MAO?O?O?OAM?O?OAM?O?O?MAO?O?OAM?O?OAO?O?MAO?O?OAM?O?OAM?O?OAM?O?M?O?MAO?M?O?M?MAO?M?O?M?M?O?MAM?M?O?M?O?M?M?O?M?MAO?M?M?O?M?O?M?O?MAM?O?M?M?O?M?O?MAM?O?M?O?M?O?MAM?O?M?O?M?MAM?O?M?M?OAM?M?M?O?MAM?M?M?M?OAM?M?M?MAM?M?M?M?MAM?M?M?M?M?MAM?M?M?K?M?M?MAM?M?K?M?M?K?M?M?M?MAK?M?M?M?K?M?M?M?K?M?M?M?K?M?M?KAM?M?M?M?M?K?M?M?M?M?K?MAM?M?M?M?M?M?M?M?M?M?M?MAM?K?M?M?M?M?M?M?M?M?M?M?M?M?M?M?M?M?O?M@M?M?M?O?M?M?M?M?O?M?M?M?M?O?M?M?M?M?M?M?M?K?M?M?M?M?KAM?M?M?M?K?M?K?M?M?K?M?K?M?M?K?K?M?K?M?K?KAM?K?M?K?M?K?K?M?K?M?M?K?M?M?K?M?M?M?KAM?M?M?M?K?M?M?M?MAK?M?M?M?M?M?KAM?M?M?K?M?M?M?MAM?M?K?M?M?KAM?M?K?M?K?MAK?M?K?M?KAM?K?M?K?M?KAM?K?M?M?MAK?M?M?M?M?MAM?M?M?M?MAM?M?M?K?MAM?M?M?MAO?M?K?MAM?M?MAM?M?MAO?M?KAM?M?MAM?MAM?M?MAM?M?MAM?M?MAM?MAM?M?MAM?M?MAK?O?MAM?MAM?M?OAM?MAO?M?MAO?MAO?M?OAM?MAO?M?OAM?OAM?M?OAM?OAM?M?OAM?OAM?O?MAM?MAO?M?MAM?MAO?M?MAM?MAM?MAK?M?OAM?KAM?MAM?K?MAM?MAK?MAM?KAM?K?MAM?KAK?MAK?MAK?K?KAM?KAK?K?KAK?K?KAK?K?KAK?K?KAK?K?KAK?K?KAK?K?K?KAK?K?K?MAK?K?K?KAM?K?M?KAM?K?M?K?MAK?M?M?M?M?MAK?M?M?O?M?M?M?M?M?M?MAO?M?M?M?M?M?M?O?M?M?M?M?M?M?M?M?M?O?M?M?M?M?M?M?M?M?M?M?M?M?M?O?M?M?M?M?M?M?M?M?M?M?M?M?M?O?M?M?M?M?M?O?M?M?M?OAM?M?M?O?M?M?M?M?M?O?M?M?O?M?M?M?O?MAM?O?M?M?O?M?M?M?O?M?M?M?O?MAM?M?M?O?M?MAM?M?M?OAM?M?M?MAM?M?MAO?MAO?MAM?MAO?MAO?MAM?OAM?OAMAMAO?MAMAOAM?OAMAOAMAMAOAMAMAOAMAOAMAOAMAMAOAMAOAMAMAOAMAOAMAMAOAMAOAMAMAOAM?OAMAMAO?MAMAM?OAM?MAO?MAM?M?OAM?M?MAM?O?M?M?M?MAM?M?O?M?M?O?M?M?M?M?O?M?M?M?O?M?O?M?M?M?O?M?M?M?O?M?O?M?M?O?M?M?M?O?M?O?M?M?O?M?M?O?M?M?OAM?M?O?M?M?O?M?M?OAM?O?M?M?M?OAM?M?M?M?O?MAO?M?M?M?M?OAM?M?M?O?MAM?M?O?M?M?MAM?O?M?M?MAM?M?O?M?M?MAM?M?M?O?MAM?M?M?MAM?M?O?MAM?M?MAM?MAO?MAM?MAM?MAM?MAM?MAKAMAM?MAMAKAMAM?KAMAKAMAMAKAMAKAMAMAMAKAMAMAMAOAMAMAMAMAOAMAOAMAOAOAMAOAM?OAOAMAO?MAOAO?MAOAM?OAO?MAO?MAO?MAO?MAO?OAM?OAO?Q?OAQ?QAS?SAW?YAU?UAS?O?QAM?K?K?I?IAG?G?E?G?E?E?C?C",
      precision: 6
    }
  end
end