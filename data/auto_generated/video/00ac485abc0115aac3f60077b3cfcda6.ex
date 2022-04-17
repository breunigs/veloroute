defmodule Data.AutoGenerated.Video.Rendered_00ac485abc0115aac3f60077b3cfcda6 do
  @moduledoc "#{"2021-10-21-st-benedictstrasse: St. Benedictstraße Fahrtrichtung Westen"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2021-10-21-st-benedictstrasse: St. Benedictstraße Fahrtrichtung Westen"
  end

  @impl Video.Rendered
  def hash() do
    "00ac485abc0115aac3f60077b3cfcda6"
  end

  @impl Video.Rendered
  def length_ms() do
    17284
  end

  @impl Video.Rendered
  def sources() do
    [{"2021-04-04-freizeitroute-12-speedup-5x/GX011173", "00:01:14.141", "00:01:31.425"}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.58385834834834,
      maxLon: 9.995742885885885,
      minLat: 53.58206793712575,
      minLon: 9.989528646706587
    }
  end

  @impl Video.Rendered
  def renderer() do
    1
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "April 2021"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.58385834834834, lon: 9.995742885885885, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.583824, lon: 9.995667, time_offset_ms: 266},
      %Video.TimedPoint{lat: 53.583788, lon: 9.995561, time_offset_ms: 600},
      %Video.TimedPoint{lat: 53.583751, lon: 9.995455, time_offset_ms: 934},
      %Video.TimedPoint{lat: 53.583713, lon: 9.99535, time_offset_ms: 1267},
      %Video.TimedPoint{lat: 53.583677, lon: 9.995244, time_offset_ms: 1601},
      %Video.TimedPoint{lat: 53.583644, lon: 9.995138, time_offset_ms: 1935},
      %Video.TimedPoint{lat: 53.583613, lon: 9.995027, time_offset_ms: 2268},
      %Video.TimedPoint{lat: 53.583584, lon: 9.994913, time_offset_ms: 2602},
      %Video.TimedPoint{lat: 53.583552, lon: 9.994792, time_offset_ms: 2936},
      %Video.TimedPoint{lat: 53.583519, lon: 9.994659, time_offset_ms: 3269},
      %Video.TimedPoint{lat: 53.583483, lon: 9.994525, time_offset_ms: 3603},
      %Video.TimedPoint{lat: 53.583446, lon: 9.994388, time_offset_ms: 3937},
      %Video.TimedPoint{lat: 53.583409, lon: 9.994254, time_offset_ms: 4270},
      %Video.TimedPoint{lat: 53.583373, lon: 9.994129, time_offset_ms: 4604},
      %Video.TimedPoint{lat: 53.583339, lon: 9.994002, time_offset_ms: 4938},
      %Video.TimedPoint{lat: 53.583298, lon: 9.993865, time_offset_ms: 5271},
      %Video.TimedPoint{lat: 53.583251, lon: 9.993727, time_offset_ms: 5605},
      %Video.TimedPoint{lat: 53.583208, lon: 9.993587, time_offset_ms: 5939},
      %Video.TimedPoint{lat: 53.583168, lon: 9.993446, time_offset_ms: 6272},
      %Video.TimedPoint{lat: 53.583128, lon: 9.993307, time_offset_ms: 6606},
      %Video.TimedPoint{lat: 53.583092, lon: 9.993172, time_offset_ms: 6940},
      %Video.TimedPoint{lat: 53.583057, lon: 9.993041, time_offset_ms: 7273},
      %Video.TimedPoint{lat: 53.583022, lon: 9.992915, time_offset_ms: 7607},
      %Video.TimedPoint{lat: 53.582992, lon: 9.992786, time_offset_ms: 7941},
      %Video.TimedPoint{lat: 53.582966, lon: 9.992661, time_offset_ms: 8274},
      %Video.TimedPoint{lat: 53.582933, lon: 9.992539, time_offset_ms: 8608},
      %Video.TimedPoint{lat: 53.582899, lon: 9.992419, time_offset_ms: 8942},
      %Video.TimedPoint{lat: 53.582862, lon: 9.992298, time_offset_ms: 9275},
      %Video.TimedPoint{lat: 53.582831, lon: 9.992182, time_offset_ms: 9609},
      %Video.TimedPoint{lat: 53.582797, lon: 9.992065, time_offset_ms: 9943},
      %Video.TimedPoint{lat: 53.582763, lon: 9.991947, time_offset_ms: 10276},
      %Video.TimedPoint{lat: 53.582729, lon: 9.991824, time_offset_ms: 10610},
      %Video.TimedPoint{lat: 53.582695, lon: 9.991705, time_offset_ms: 10944},
      %Video.TimedPoint{lat: 53.582659, lon: 9.99158, time_offset_ms: 11277},
      %Video.TimedPoint{lat: 53.582623, lon: 9.991455, time_offset_ms: 11611},
      %Video.TimedPoint{lat: 53.582588, lon: 9.991335, time_offset_ms: 11945},
      %Video.TimedPoint{lat: 53.582556, lon: 9.991218, time_offset_ms: 12278},
      %Video.TimedPoint{lat: 53.582523, lon: 9.99111, time_offset_ms: 12612},
      %Video.TimedPoint{lat: 53.582493, lon: 9.991002, time_offset_ms: 12946},
      %Video.TimedPoint{lat: 53.582463, lon: 9.99089, time_offset_ms: 13279},
      %Video.TimedPoint{lat: 53.582438, lon: 9.990775, time_offset_ms: 13613},
      %Video.TimedPoint{lat: 53.582402, lon: 9.99066, time_offset_ms: 13947},
      %Video.TimedPoint{lat: 53.582365, lon: 9.990545, time_offset_ms: 14280},
      %Video.TimedPoint{lat: 53.582331, lon: 9.990429, time_offset_ms: 14614},
      %Video.TimedPoint{lat: 53.582298, lon: 9.990318, time_offset_ms: 14948},
      %Video.TimedPoint{lat: 53.582265, lon: 9.990204, time_offset_ms: 15281},
      %Video.TimedPoint{lat: 53.58223, lon: 9.990087, time_offset_ms: 15615},
      %Video.TimedPoint{lat: 53.582195, lon: 9.989974, time_offset_ms: 15949},
      %Video.TimedPoint{lat: 53.582166, lon: 9.989861, time_offset_ms: 16282},
      %Video.TimedPoint{lat: 53.582136, lon: 9.989751, time_offset_ms: 16616},
      %Video.TimedPoint{lat: 53.582102, lon: 9.989641, time_offset_ms: 16950},
      %Video.TimedPoint{lat: 53.582068, lon: 9.989529, time_offset_ms: 17283},
      %Video.TimedPoint{lat: 53.58206793712575, lon: 9.989528646706587, time_offset_ms: 17284}
    ]
  end
end