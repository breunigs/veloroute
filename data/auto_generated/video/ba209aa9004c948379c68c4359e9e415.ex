defmodule Data.AutoGenerated.Video.Rendered_ba209aa9004c948379c68c4359e9e415 do
  @moduledoc "#{"2024-06-21-steinstrasse: Steinstraße Richtung Hauptbahnhof"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2024-06-21-steinstrasse: Steinstraße Richtung Hauptbahnhof"
  end

  @impl Video.Rendered
  def hash() do
    "ba209aa9004c948379c68c4359e9e415"
  end

  @impl Video.Rendered
  def length_ms() do
    26555
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-04-02-velo9/GX013398", "00:00:01.568", "00:00:07.808"},
      {"2024-04-06-fr4/GX017043", "00:00:01.869", :end},
      {"2024-04-06-fr4/GX017044", :start, "00:00:10.408"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.995090143712575,
      minLat: 53.54846091616766,
      maxLon: 10.006679,
      maxLat: 53.550146999999996
    }
  end

  @impl Video.Rendered
  def renderer() do
    5
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "April 2022"}, %{timestamp: 5973, text: "April 2024"}]
  end

  @impl Video.Rendered
  def street_names() do
    [
      %{timestamp: 0, text: "Domstraße"},
      %{timestamp: 9108, text: "Speersort"},
      %{timestamp: 11110, text: "Steinstraße"},
      %{timestamp: 25888, text: "Altmannbrücke"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.995090143712575, lat: 53.54846091616766, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.995112, lat: 53.548469, time_offset_ms: 100},
      %Video.TimedPoint{lon: 9.995195, lat: 53.548502, time_offset_ms: 434},
      %Video.TimedPoint{lon: 9.995261, lat: 53.548558, time_offset_ms: 767},
      %Video.TimedPoint{lon: 9.995305, lat: 53.54865, time_offset_ms: 1101},
      %Video.TimedPoint{lon: 9.995347, lat: 53.548713, time_offset_ms: 1434},
      %Video.TimedPoint{lon: 9.995375, lat: 53.548781, time_offset_ms: 1768},
      %Video.TimedPoint{lon: 9.995406, lat: 53.548838, time_offset_ms: 2102},
      %Video.TimedPoint{lon: 9.995451, lat: 53.54888, time_offset_ms: 2435},
      %Video.TimedPoint{lon: 9.995517, lat: 53.548886, time_offset_ms: 2769},
      %Video.TimedPoint{lon: 9.995586, lat: 53.548899, time_offset_ms: 3102},
      %Video.TimedPoint{lon: 9.99566, lat: 53.548916, time_offset_ms: 3436},
      %Video.TimedPoint{lon: 9.995724, lat: 53.548959, time_offset_ms: 3770},
      %Video.TimedPoint{lon: 9.995791, lat: 53.54901, time_offset_ms: 4103},
      %Video.TimedPoint{lon: 9.995863, lat: 53.549064, time_offset_ms: 4437},
      %Video.TimedPoint{lon: 9.995938, lat: 53.549124, time_offset_ms: 4770},
      %Video.TimedPoint{lon: 9.996003, lat: 53.549185, time_offset_ms: 5104},
      %Video.TimedPoint{lon: 9.996088, lat: 53.549229, time_offset_ms: 5438},
      %Video.TimedPoint{lon: 9.996192, lat: 53.549262, time_offset_ms: 5771},
      %Video.TimedPoint{lon: 9.996777631736528, lat: 53.54940246107785, time_offset_ms: 5973},
      %Video.TimedPoint{lon: 9.996829, lat: 53.549416, time_offset_ms: 6106},
      %Video.TimedPoint{lon: 9.99696, lat: 53.549465, time_offset_ms: 6439},
      %Video.TimedPoint{lon: 9.997098, lat: 53.549511, time_offset_ms: 6773},
      %Video.TimedPoint{lon: 9.997234, lat: 53.549555, time_offset_ms: 7106},
      %Video.TimedPoint{lon: 9.997385, lat: 53.549592, time_offset_ms: 7440},
      %Video.TimedPoint{lon: 9.997541, lat: 53.549628, time_offset_ms: 7774},
      %Video.TimedPoint{lon: 9.997695, lat: 53.549667, time_offset_ms: 8107},
      %Video.TimedPoint{lon: 9.997855, lat: 53.54971, time_offset_ms: 8441},
      %Video.TimedPoint{lon: 9.998015, lat: 53.549741, time_offset_ms: 8774},
      %Video.TimedPoint{lon: 9.998183, lat: 53.549763, time_offset_ms: 9108},
      %Video.TimedPoint{lon: 9.998358, lat: 53.549777, time_offset_ms: 9442},
      %Video.TimedPoint{lon: 9.998533, lat: 53.549793, time_offset_ms: 9775},
      %Video.TimedPoint{lon: 9.998713, lat: 53.549806, time_offset_ms: 10109},
      %Video.TimedPoint{lon: 9.998893, lat: 53.549818, time_offset_ms: 10442},
      %Video.TimedPoint{lon: 9.999074, lat: 53.549833, time_offset_ms: 10776},
      %Video.TimedPoint{lon: 9.999251, lat: 53.549847, time_offset_ms: 11110},
      %Video.TimedPoint{lon: 9.999426, lat: 53.549856, time_offset_ms: 11443},
      %Video.TimedPoint{lon: 9.999598, lat: 53.549871, time_offset_ms: 11777},
      %Video.TimedPoint{lon: 9.999768, lat: 53.549888, time_offset_ms: 12110},
      %Video.TimedPoint{lon: 9.999938, lat: 53.549902, time_offset_ms: 12444},
      %Video.TimedPoint{lon: 10.000107, lat: 53.549917, time_offset_ms: 12778},
      %Video.TimedPoint{lon: 10.000275, lat: 53.549931, time_offset_ms: 13111},
      %Video.TimedPoint{lon: 10.000439, lat: 53.549933, time_offset_ms: 13445},
      %Video.TimedPoint{lon: 10.000607, lat: 53.549939, time_offset_ms: 13778},
      %Video.TimedPoint{lon: 10.000774, lat: 53.549949, time_offset_ms: 14112},
      %Video.TimedPoint{lon: 10.000944, lat: 53.549956, time_offset_ms: 14446},
      %Video.TimedPoint{lon: 10.001117, lat: 53.549959, time_offset_ms: 14779},
      %Video.TimedPoint{lon: 10.001267, lat: 53.549964, time_offset_ms: 15113},
      %Video.TimedPoint{lon: 10.001363, lat: 53.549966, time_offset_ms: 15446},
      %Video.TimedPoint{lon: 10.00142, lat: 53.549966, time_offset_ms: 15780},
      %Video.TimedPoint{lon: 10.001441, lat: 53.549967, time_offset_ms: 16114},
      %Video.TimedPoint{lon: 10.001465, lat: 53.549945999999984, time_offset_ms: 16147},
      %Video.TimedPoint{lon: 10.001484, lat: 53.54994699999999, time_offset_ms: 16547},
      %Video.TimedPoint{lon: 10.001566, lat: 53.549957999999975, time_offset_ms: 16881},
      %Video.TimedPoint{lon: 10.001685, lat: 53.549968, time_offset_ms: 17215},
      %Video.TimedPoint{lon: 10.001834, lat: 53.549977000000005, time_offset_ms: 17548},
      %Video.TimedPoint{lon: 10.001991000000002, lat: 53.55, time_offset_ms: 17882},
      %Video.TimedPoint{lon: 10.002152000000002, lat: 53.550014999999995, time_offset_ms: 18215},
      %Video.TimedPoint{lon: 10.002317, lat: 53.55002499999999, time_offset_ms: 18549},
      %Video.TimedPoint{lon: 10.002483, lat: 53.55002999999998, time_offset_ms: 18883},
      %Video.TimedPoint{lon: 10.002649999999997, lat: 53.55002999999998, time_offset_ms: 19216},
      %Video.TimedPoint{lon: 10.002819, lat: 53.550033, time_offset_ms: 19550},
      %Video.TimedPoint{lon: 10.002983000000002, lat: 53.55004399999999, time_offset_ms: 19883},
      %Video.TimedPoint{lon: 10.003146, lat: 53.550056, time_offset_ms: 20217},
      %Video.TimedPoint{lon: 10.003308, lat: 53.550065, time_offset_ms: 20551},
      %Video.TimedPoint{lon: 10.003466999999999, lat: 53.550074999999985, time_offset_ms: 20884},
      %Video.TimedPoint{lon: 10.003631000000002, lat: 53.55008199999999, time_offset_ms: 21218},
      %Video.TimedPoint{lon: 10.0038, lat: 53.55007999999998, time_offset_ms: 21551},
      %Video.TimedPoint{lon: 10.00397, lat: 53.55008099999998, time_offset_ms: 21885},
      %Video.TimedPoint{lon: 10.004144999999998, lat: 53.550078, time_offset_ms: 22219},
      %Video.TimedPoint{lon: 10.004321, lat: 53.55009, time_offset_ms: 22552},
      %Video.TimedPoint{lon: 10.004498000000002, lat: 53.55010299999999, time_offset_ms: 22886},
      %Video.TimedPoint{lon: 10.004678, lat: 53.55010799999999, time_offset_ms: 23219},
      %Video.TimedPoint{lon: 10.004859, lat: 53.550104, time_offset_ms: 23553},
      %Video.TimedPoint{lon: 10.005035, lat: 53.55009399999999, time_offset_ms: 23886},
      %Video.TimedPoint{lon: 10.005210000000002, lat: 53.55008099999998, time_offset_ms: 24220},
      %Video.TimedPoint{lon: 10.005395, lat: 53.550064, time_offset_ms: 24554},
      %Video.TimedPoint{lon: 10.005587, lat: 53.550055, time_offset_ms: 24887},
      %Video.TimedPoint{lon: 10.005791, lat: 53.550054, time_offset_ms: 25221},
      %Video.TimedPoint{lon: 10.006015, lat: 53.550070999999996, time_offset_ms: 25554},
      %Video.TimedPoint{lon: 10.00624, lat: 53.55009399999999, time_offset_ms: 25888},
      %Video.TimedPoint{lon: 10.006455, lat: 53.55011999999999, time_offset_ms: 26222},
      %Video.TimedPoint{lon: 10.006679, lat: 53.550146999999996, time_offset_ms: 26555}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "iziceBou`aRA??AAC?AAC?AACACAAACACACAEACACAEACCEAEAECECECGCECGCGCIEIEIEIEIGIEICGEEEGEGEECEEGEEGEEEEEGEEGGEGEGEGEIEGEIEIEIEIEIGICIEIEGEICGEGCGCGEGCGCGCECGCECGCECEAECECECEAECECEAECECGAECECECGAECECEAGCECGAECGCEAECGCEAGCECEAGCECECEAECGCECEAECECECECECEEECCCECEECCECCECCEECCCCCECCCEACCCCEACCEACCCAEACACACACAEACACAEACACACAE?CACAE?CACAEAC?EAEAC?EAEACAE?EAEAE?EAGAEAE?EAEAG?EAEAGAE?EAGAEAE?GAEAGAEAGAE?EAGAEAGAEAEAGAEAGAEAECGAEAEAGCEAEAGCEAGCECEAGCECGCGCEAGCECGEECGCGCECGEECGCGEECGEECGEGCEEGEECGEECGEEEGCEEGCEEGEECGEEEGCEEGEECGEEEGCGEEEGEECGEGEEEGCEEGEGEGEEEGEGEGEEEGEGEGEGEGGEEGEGEEEGEGEEEGEGEEEGEGEEEGEGEEEGEEEGEGEEEGEGCEEGEGCEEGCGEGCEEGCGCGEGCECGCGCGCGCECGCGCGCECGAGCECGAGCGAECGCGAGCGAGAECIAGCIEOCMEUGUG_@Ia@Ko@Ms@Mw@My@O_AOaAUuAW_BYsBU{AUwASsAWaBSqAOy@Ie@EYEOAEAIAGCGAICGAICGAKCICKCICKCMEKCMEMCOEOEMEOCOEMEOCMEMCMEMCMCMEMCMEKCMCMEMCMCMCMEMCMCKEMCMCMCMEMCMCKCMCMCMEMCMCKCMCMCMCMCMCMCMCKCOCMCMCMCOCMCMCMCOCMCOCMCOCOCMCOAMCOCMCOCOCOCMAOCOCMCOCOAMCOCOCOCOCOCMAOCOCOCMCOCOCOAMCOCOCMCOCOCOCMCOCOCMAOCOCMCOCOCMCOCOEOCOCOCOCOCOCOCOCOCOCQCOEOCOCOAOCOCOCOCOCOCOCOAOCOCOAOCOCOAOCOAOCOAOCOAOAOCOAOCOAOAOAQCOAOAOAOAQCOAOAQAOAQAOAQAOAQAOAQAOAQAQAOAQ?OAQAQAOAQ?QAQAOAQ?QAOAQAQ?OAQAQAQ?QAOAQAQ?QAQAOAQAQ?QAOAQAQ?QAOAQAQ?QAQAQ?QAOAQAQ?QAQAQ?QAQAQ?QAQAQ?QAQAQ?QAQ?QAQAQ?QAQAQ?QAQ?QAQAQ?QAQAQ?QAQAQ?QAQ?QAQAQAQ?QAQAQ?QAQAQ?QAQASAQ?QAQAQAQ?QAQAO?SAQAQAQ?OAQAQ?QAQAO?QAQAQ?QAQAQ?OAQAQ?QAO?QAQ?QAQAQ?OAQ?QAQ?OAQ?QAQ?OAQ?QAOAQ?QAO?QAQAO?QAQAO?QAOAQ?QAOAQAQ?OAQAOAQ?OAQAOAQ?QAOAOAQAQAO?QAOAQAQAO?QAOAOAQAO?QAOAQAOAQ?OAQAOAQ?OAQAO?QAOAQAO?QAOAOAQ?OAQAO?QAOAQAO?QAOAOAQ?OAQAO?QAOAQAO?OAQAOAQ?OAQAO?QAOAQAO?QAOAO?QAQ?OAOAQ?OAO?QAO?O?QAO?OAO?Q?OAO?O?O?OAO?O?Q?O?OAO?O?O?O?QAO?O?Q?O?OAQ?O?Q?OAO?Q?OAQ?O?QAO?O?QAO?O?QAO?QAO?OAQ?O?OAO?QAO?QAO?O?QAO?OAQ?OAO?QAO?Q?OAO?QAO?Q?OAO?Q?QAO?Q?OAQ?O?Q?OAQ?O?QAQ?Q?O?Q?QAQ?Q?Q?OAQ?Q?Q?Q?OAQ?O?Q?O?OAQ?O?Q?O?OAO?O?O?OAQ?O?O?OAO?M?O?M?M?OAM?M?M?M?M?MAM?M?M?K?M?K?K?I@I?I?I?G?G@G?G?E?G?E@E?C?E?C?C?C@C?C?C?C?A?C?A?C@A?A?A?A?C???A?A?A?A???A@A???A?A???A?A?A?A?A@A?C@I?C?C?A?A@A?A???A???A???A???A???A???A?A???A?A?C?A@A?A?C?C?A?C?C?E?C?E?E?E?G?E?G?I?G?I?IAK?K?M?MAM?OAM?OAOAOAO?MAOAM?KAM?MAKAM?MAM?MAM?MAM?MAO?MAO?MAOAM?OAOAO?MAOAM?OAOAOAO?MAOAOAOAOAMAOAOAOAOAOAOAOAOAOAOAOAOAO?OAOAOAOAOAOAOAO?OAOAOAOAO?OAOAO?OAOAO?OAQAO?OAO?OAQAO?OAO?OAQ?OAO?QAO?O?OAO?QAO?O?QAO?O?OAQ?O?OAO?Q?O?OAQ?O?O?O?QAO?O?O?Q?O?Q?O?OAQ?O?O?Q?O?Q?O?O?Q?O?O?O?Q?O?QAO?Q?O?O?Q?O?Q?OAO?Q?Q?O?QAO?O?Q?OAO?Q?OAQ?O?OAQ?OAO?Q?OAO?OAO?QAO?OAO?OAOAO?OAQ?OAO?OAO?QAOAO?OAO?OAOAQ?OAO?OAO?OAO?OAO?QAO?OAO?OAO?OAO?OAQ?OAO?OAO?OAO?OAO?OAO?OAO?OAO?OAO?O?OAO?OAO?OAO?OAO?OAM?O?OAO?QAO?OAO?O?OAO?O?OAO?Q?OAO?O?O?QAO?O?O?Q?O?O?QAO?O?Q?Q?O?O?Q?O?Q?O?Q?O?Q?O?Q?O?O?Q?Q?O@Q?O?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?Q?O?Q?Q?O?Q?Q?O?Q?Q?Q?Q?O?Q?Q?O?Q?Q?OAQ?Q?QAQ?O?QAQ?Q?QAQ?QAQ?OAQAQ?QAO?QAQ?QAQAQ?OAQAQ?QAQ?OAQAQ?QAQ?QAQ?OAQAQ?Q?QAO?SAQ?QAO?Q?QAS?Q?OAQ?S?Q?QAQ?Q?Q?O?Q?Q?Q?Q?S?Q?Q?Q?Q?Q?Q?Q?Q?Q@Q?Q?Q?Q@Q?Q?Q?Q@Q?Q?Q@Q?Q@O?Q?Q@Q?Q@Q?Q@Q?O@Q?Q@O?Q@Q?Q@O?Q@Q@Q?O@Q?Q@O@Q?Q@O@Q?Q@Q?O@Q@Q@Q?O@Q@Q?Q@Q@Q@Q?Q@Q@Q@S@Q?Q@Q@S@Q?Q@S@Q@Q?S@Q@Q?S@Q@S?Q@Q?S@S?Q@S?Q@S?Q@S?S@Q?S?Q@S?S?S@S?S?S?S?S@S?S?S?S?S?S?S?U?S?S?SAU?S?U?SAU?UAS?UAU?UAU?UAUAWAU?WAUAUAUAWAUAUAUAUAWAUAWAUAUAUAUAUAWAUAUCWAUAUAWAUAUCUAUAUAUAUCUAUAUASCUAUASAUCUAUASAUCUASAUCUAUASCWAUAWCUAWCYAYC[C[A[CWAUASAOAOAMAMAK?IAI?G",
      precision: 6
    }
  end
end
