defmodule Data.AutoGenerated.Video.Rendered_4b0adb7b8bc291cede31172f0941da1e do
  @moduledoc "#{"2022-10-18-reeperbahn: Reeperbahn (→ Millerntorplatz)"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-10-18-reeperbahn: Reeperbahn (→ Millerntorplatz)"
  end

  @impl Video.Rendered
  def hash() do
    "4b0adb7b8bc291cede31172f0941da1e"
  end

  @impl Video.Rendered
  def length_ms() do
    43911
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-11-25-reeperbahn/GX015000", "00:00:10.377", :end},
      {"2022-11-25-reeperbahn/GX015001", :start, :end},
      {"2022-11-25-reeperbahn/GX015002", :start, :end}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.953228,
      minLat: 53.549406,
      maxLon: 9.969782036036035,
      maxLat: 53.5499750960961
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "November 2022"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.953228, lat: 53.549562, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.953228, lat: 53.549562, time_offset_ms: 1623},
      %Video.TimedPoint{lon: 9.953346, lat: 53.549565, time_offset_ms: 1956},
      %Video.TimedPoint{lon: 9.953557, lat: 53.549569, time_offset_ms: 2290},
      %Video.TimedPoint{lon: 9.95377, lat: 53.549572, time_offset_ms: 2623},
      %Video.TimedPoint{lon: 9.953975, lat: 53.549578, time_offset_ms: 2957},
      %Video.TimedPoint{lon: 9.95417, lat: 53.549582, time_offset_ms: 3291},
      %Video.TimedPoint{lon: 9.95434, lat: 53.549582, time_offset_ms: 3624},
      %Video.TimedPoint{lon: 9.954476, lat: 53.549577, time_offset_ms: 3958},
      %Video.TimedPoint{lon: 9.954582, lat: 53.549575, time_offset_ms: 4291},
      %Video.TimedPoint{lon: 9.955215, lat: 53.549626, time_offset_ms: 4555},
      %Video.TimedPoint{lon: 9.95524, lat: 53.549626, time_offset_ms: 4889},
      %Video.TimedPoint{lon: 9.955318, lat: 53.549626, time_offset_ms: 5222},
      %Video.TimedPoint{lon: 9.955412, lat: 53.549627, time_offset_ms: 5556},
      %Video.TimedPoint{lon: 9.955512, lat: 53.549629, time_offset_ms: 5889},
      %Video.TimedPoint{lon: 9.955624, lat: 53.549633, time_offset_ms: 6223},
      %Video.TimedPoint{lon: 9.955742, lat: 53.549637, time_offset_ms: 6557},
      %Video.TimedPoint{lon: 9.955867, lat: 53.54964, time_offset_ms: 6890},
      %Video.TimedPoint{lon: 9.955992, lat: 53.549643, time_offset_ms: 7224},
      %Video.TimedPoint{lon: 9.956118, lat: 53.549646, time_offset_ms: 7557},
      %Video.TimedPoint{lon: 9.956252, lat: 53.54965, time_offset_ms: 7891},
      %Video.TimedPoint{lon: 9.956396, lat: 53.549632, time_offset_ms: 8225},
      %Video.TimedPoint{lon: 9.956516, lat: 53.5496, time_offset_ms: 8558},
      %Video.TimedPoint{lon: 9.956648, lat: 53.549586, time_offset_ms: 8892},
      %Video.TimedPoint{lon: 9.956793, lat: 53.549576, time_offset_ms: 9225},
      %Video.TimedPoint{lon: 9.956937, lat: 53.549567, time_offset_ms: 9559},
      %Video.TimedPoint{lon: 9.957086, lat: 53.549562, time_offset_ms: 9893},
      %Video.TimedPoint{lon: 9.957234, lat: 53.549564, time_offset_ms: 10226},
      %Video.TimedPoint{lon: 9.957374, lat: 53.549556, time_offset_ms: 10560},
      %Video.TimedPoint{lon: 9.957512, lat: 53.549543, time_offset_ms: 10893},
      %Video.TimedPoint{lon: 9.957646, lat: 53.549533, time_offset_ms: 11227},
      %Video.TimedPoint{lon: 9.957767, lat: 53.54953, time_offset_ms: 11561},
      %Video.TimedPoint{lon: 9.95788, lat: 53.549538, time_offset_ms: 11894},
      %Video.TimedPoint{lon: 9.957984, lat: 53.549558, time_offset_ms: 12228},
      %Video.TimedPoint{lon: 9.958071, lat: 53.549569, time_offset_ms: 12561},
      %Video.TimedPoint{lon: 9.958132, lat: 53.549569, time_offset_ms: 12895},
      %Video.TimedPoint{lon: 9.958171, lat: 53.549566, time_offset_ms: 13229},
      %Video.TimedPoint{lon: 9.958206, lat: 53.549563, time_offset_ms: 13562},
      %Video.TimedPoint{lon: 9.958237, lat: 53.54956, time_offset_ms: 13896},
      %Video.TimedPoint{lon: 9.958265, lat: 53.549558, time_offset_ms: 14229},
      %Video.TimedPoint{lon: 9.958287, lat: 53.549554, time_offset_ms: 14563},
      %Video.TimedPoint{lon: 9.958307, lat: 53.549552, time_offset_ms: 14897},
      %Video.TimedPoint{lon: 9.958364, lat: 53.549548, time_offset_ms: 15230},
      %Video.TimedPoint{lon: 9.958475, lat: 53.549539, time_offset_ms: 15564},
      %Video.TimedPoint{lon: 9.958609, lat: 53.549525, time_offset_ms: 15897},
      %Video.TimedPoint{lon: 9.958755, lat: 53.549509, time_offset_ms: 16231},
      %Video.TimedPoint{lon: 9.958905, lat: 53.549497, time_offset_ms: 16565},
      %Video.TimedPoint{lon: 9.959062, lat: 53.549488, time_offset_ms: 16898},
      %Video.TimedPoint{lon: 9.959226, lat: 53.549479, time_offset_ms: 17232},
      %Video.TimedPoint{lon: 9.959391, lat: 53.54947, time_offset_ms: 17565},
      %Video.TimedPoint{lon: 9.959561, lat: 53.549463, time_offset_ms: 17899},
      %Video.TimedPoint{lon: 9.959736, lat: 53.549454, time_offset_ms: 18233},
      %Video.TimedPoint{lon: 9.959906, lat: 53.549446, time_offset_ms: 18566},
      %Video.TimedPoint{lon: 9.960079, lat: 53.549437, time_offset_ms: 18900},
      %Video.TimedPoint{lon: 9.960255, lat: 53.549429, time_offset_ms: 19233},
      %Video.TimedPoint{lon: 9.960427, lat: 53.549423, time_offset_ms: 19567},
      %Video.TimedPoint{lon: 9.960599, lat: 53.54942, time_offset_ms: 19900},
      %Video.TimedPoint{lon: 9.960776, lat: 53.549416, time_offset_ms: 20234},
      %Video.TimedPoint{lon: 9.96095, lat: 53.549412, time_offset_ms: 20568},
      %Video.TimedPoint{lon: 9.961125, lat: 53.549408, time_offset_ms: 20901},
      %Video.TimedPoint{lon: 9.961306, lat: 53.549406, time_offset_ms: 21235},
      %Video.TimedPoint{lon: 9.961485, lat: 53.549406, time_offset_ms: 21568},
      %Video.TimedPoint{lon: 9.961667, lat: 53.549408, time_offset_ms: 21902},
      %Video.TimedPoint{lon: 9.961852, lat: 53.549414, time_offset_ms: 22236},
      %Video.TimedPoint{lon: 9.962032, lat: 53.549419, time_offset_ms: 22569},
      %Video.TimedPoint{lon: 9.962215, lat: 53.549426, time_offset_ms: 22903},
      %Video.TimedPoint{lon: 9.962399, lat: 53.549436, time_offset_ms: 23236},
      %Video.TimedPoint{lon: 9.962573, lat: 53.54945, time_offset_ms: 23570},
      %Video.TimedPoint{lon: 9.962746, lat: 53.549465, time_offset_ms: 23904},
      %Video.TimedPoint{lon: 9.962919, lat: 53.549481, time_offset_ms: 24237},
      %Video.TimedPoint{lon: 9.963084, lat: 53.549497, time_offset_ms: 24571},
      %Video.TimedPoint{lon: 9.963248, lat: 53.549514, time_offset_ms: 24904},
      %Video.TimedPoint{lon: 9.963417, lat: 53.549531, time_offset_ms: 25238},
      %Video.TimedPoint{lon: 9.963583, lat: 53.549546, time_offset_ms: 25572},
      %Video.TimedPoint{lon: 9.96375, lat: 53.549562, time_offset_ms: 25905},
      %Video.TimedPoint{lon: 9.963921, lat: 53.549578, time_offset_ms: 26239},
      %Video.TimedPoint{lon: 9.964087, lat: 53.549595, time_offset_ms: 26572},
      %Video.TimedPoint{lon: 9.964254, lat: 53.549611, time_offset_ms: 26906},
      %Video.TimedPoint{lon: 9.964424, lat: 53.549628, time_offset_ms: 27240},
      %Video.TimedPoint{lon: 9.964589, lat: 53.549645, time_offset_ms: 27573},
      %Video.TimedPoint{lon: 9.964755, lat: 53.549663, time_offset_ms: 27907},
      %Video.TimedPoint{lon: 9.964926, lat: 53.549684, time_offset_ms: 28240},
      %Video.TimedPoint{lon: 9.965091, lat: 53.5497, time_offset_ms: 28574},
      %Video.TimedPoint{lon: 9.965256, lat: 53.549712, time_offset_ms: 28908},
      %Video.TimedPoint{lon: 9.965426, lat: 53.549727, time_offset_ms: 29241},
      %Video.TimedPoint{lon: 9.965592, lat: 53.549741, time_offset_ms: 29575},
      %Video.TimedPoint{lon: 9.965759, lat: 53.549758, time_offset_ms: 29908},
      %Video.TimedPoint{lon: 9.965929, lat: 53.549777, time_offset_ms: 30242},
      %Video.TimedPoint{lon: 9.966095, lat: 53.549792, time_offset_ms: 30576},
      %Video.TimedPoint{lon: 9.966259, lat: 53.54981, time_offset_ms: 30909},
      %Video.TimedPoint{lon: 9.96643, lat: 53.549827, time_offset_ms: 31243},
      %Video.TimedPoint{lon: 9.966596, lat: 53.549845, time_offset_ms: 31576},
      %Video.TimedPoint{lon: 9.966762, lat: 53.549862, time_offset_ms: 31910},
      %Video.TimedPoint{lon: 9.966931, lat: 53.549878, time_offset_ms: 32244},
      %Video.TimedPoint{lon: 9.967096, lat: 53.549887, time_offset_ms: 32577},
      %Video.TimedPoint{lon: 9.967256, lat: 53.549874, time_offset_ms: 32911},
      %Video.TimedPoint{lon: 9.967417, lat: 53.549864, time_offset_ms: 33244},
      %Video.TimedPoint{lon: 9.967556, lat: 53.549861, time_offset_ms: 33578},
      %Video.TimedPoint{lon: 9.96766, lat: 53.549861, time_offset_ms: 33912},
      %Video.TimedPoint{lon: 9.967756, lat: 53.549858, time_offset_ms: 34245},
      %Video.TimedPoint{lon: 9.967864, lat: 53.549851, time_offset_ms: 34579},
      %Video.TimedPoint{lon: 9.967966, lat: 53.549855, time_offset_ms: 34912},
      %Video.TimedPoint{lon: 9.968069, lat: 53.549866, time_offset_ms: 35246},
      %Video.TimedPoint{lon: 9.968167, lat: 53.549885, time_offset_ms: 35580},
      %Video.TimedPoint{lon: 9.968274, lat: 53.549906, time_offset_ms: 35913},
      %Video.TimedPoint{lon: 9.968391, lat: 53.5499, time_offset_ms: 36247},
      %Video.TimedPoint{lon: 9.968508, lat: 53.549899, time_offset_ms: 36580},
      %Video.TimedPoint{lon: 9.968629, lat: 53.549898, time_offset_ms: 36914},
      %Video.TimedPoint{lon: 9.968739, lat: 53.549898, time_offset_ms: 37248},
      %Video.TimedPoint{lon: 9.968838, lat: 53.549898, time_offset_ms: 37581},
      %Video.TimedPoint{lon: 9.968927, lat: 53.549899, time_offset_ms: 37915},
      %Video.TimedPoint{lon: 9.969007, lat: 53.549895, time_offset_ms: 38248},
      %Video.TimedPoint{lon: 9.969054, lat: 53.549884, time_offset_ms: 38582},
      %Video.TimedPoint{lon: 9.969102, lat: 53.549845, time_offset_ms: 38906},
      %Video.TimedPoint{lon: 9.969109, lat: 53.549839, time_offset_ms: 39240},
      %Video.TimedPoint{lon: 9.969141, lat: 53.549824, time_offset_ms: 39573},
      %Video.TimedPoint{lon: 9.969183, lat: 53.549813, time_offset_ms: 39907},
      %Video.TimedPoint{lon: 9.969235, lat: 53.549801, time_offset_ms: 40240},
      %Video.TimedPoint{lon: 9.9693, lat: 53.549786, time_offset_ms: 40574},
      %Video.TimedPoint{lon: 9.969371, lat: 53.549776, time_offset_ms: 40908},
      %Video.TimedPoint{lon: 9.969431, lat: 53.549773, time_offset_ms: 41241},
      %Video.TimedPoint{lon: 9.969509, lat: 53.549786, time_offset_ms: 41575},
      %Video.TimedPoint{lon: 9.9696, lat: 53.549806, time_offset_ms: 41908},
      %Video.TimedPoint{lon: 9.969689, lat: 53.549837, time_offset_ms: 42242},
      %Video.TimedPoint{lon: 9.969739, lat: 53.549877, time_offset_ms: 42576},
      %Video.TimedPoint{lon: 9.969758, lat: 53.549916, time_offset_ms: 42909},
      %Video.TimedPoint{lon: 9.96977, lat: 53.549943, time_offset_ms: 43243},
      %Video.TimedPoint{lon: 9.969776, lat: 53.549959, time_offset_ms: 43576},
      %Video.TimedPoint{lon: 9.969782036036035, lat: 53.5499750960961, time_offset_ms: 43911}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "s~kceBw|n~Q?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????A?????????????????A???????????A?????AA????A?????A???A???A?A???A?A?A?A?C?A?C?E?E?E?G?G?I?IAK?O?M?U?WAY?]?[AW?S?U?UAU?U?W?U?WAU?U?U?U?UAU?S?U?U?U?SAU?U?S?U?U?SAU?U?U?S?UAS?U?S?U?SAU?S?U?SAS?S?U?SAS?U?S?SAU?S?SAS?S?S?SAS?U?S?SAS?S?S?Q?SAS?S?S?S?QAS?Q?S?Q?Q?S?Q?Q?SAQ?Q?Q?Q?Q?Q?O?Q?Q?O?Q?O@Q?O?O?O?O?O?M?O@O?M?M?O?M?M@M?M?K?M?K?I@K?I?K?I?I?I?G?I?I@G?I?G?G?G?G?G?G?I?M?MAS?U?YAa@?c@Cs@As@Cu@Cu@Cy@Cy@EcAEiAEuAG}AEoAEgACaAE{@C_AEeAC_AAg@Ci@?QAQ?M?K?I?E?E???AAA?A???C?A?A?A?A?C?A?C?C?C?C?C?C?E?C?E?C?E?E?E?E?E?E?E?G?G?E?G?G?G?G?I?GAI?I?I?I?K?I?K?I?I?K?I?I?I?I?I?IAI?I?I?I?I?I?I?I?I?IAI?I?I?I?K?I?I?KAI?I?K?I?K?IAK?I?K?K?IAK?K?I?K?K?KAI?K?K?K?KAI?K?K?K?KAK?K?K?K?KAI?K?K?K?K?KAM?K?K?K?K?MAK?K?M?K?KAM?K?K?K?M?K?KAK?M?K?K?M?KAK?K?M?K?K?K?MAK?K?K?M?K?K?KAK?K?M?K?K?MAK?K?K?M?K?K?KAM?K?K?K?M?KAK?K?M?K?M?K?MAK?M?K?M?M?K?M?M?K?M?M?M?K@M?M?M?M@M?M@M?M@M?O@M@M?M@O@M@O@M@M@M@M@MBM@M@K@M@MBK@M@K@MBK@K@KBK@K@K@K@KBK@M@K@K@K@KBK@K@M@K@K@K?K@M@K@K@M@M@K?M@K@M?M@K@M?M@M@M?M@M@M?O@M?M@M?O@M?O@M@M?M@O?M@M?M?O@M?O@M?M@M?M@M?M@O?M?M@M?M@M?O?M@M?M@M?O?M@O?M?M@O?M?M?O@M?O?M?O@M?O?M?O?M?O?M@O?M?O?M?O?M?O?M?O?M?O?M?O?M?M?O@M?M?M?O?M?M?M@M?M?M?M@M?M?M@M?M?M@M?M?M@M?M@M?M@M?M@M?M@K?M@M@M?M@M?M@M?M@M@M?M@M?M@K@M?M@M?M@M?M@M?M@K?M@M?M@M?M@K?M@M?K?M@K?M?K@M?K?K?M@K?K?K?K?K?K?K@K?K?K?K?KAK?I?K?K?K?K?KAI?K?K?IAK?KAI?K?KAI?KAIAK?IAK?IAKAK?IAKAIAK?IAKAIAKAK?IAKAKAIAKAI?KAIAIAK?IAKAI?IAIAK?IAI?IAI?IAI?I?I?GAI?G?G?GAG?G?G?G?G?E?E?G?E?E?E?E?E?E?E?E?E?C?E?C?E?C?E?C@C?C?C?C?C?E?A?C?C@C?C?C?A?C?C?C?A?C@C?A?C?A?C?A?C?A?C@A?C?A?A?C?A?A?C?A@A?C?A?A?A?A?C?A?A?A@A?A?A?C?A?A?A?A?A?A@A?A?A?A?A?A?A?A?A?A?A@A?A?A???A?A?A?A?A?A???A@A?A?A???A?A?A???A?A?A???A?A@A???A?A???A?A???A?A???A?A???A@A???A?A?A?A?A?A?A?C@A?A?C?A?C?C?C@C?C?C?C?C@E?E?C?E@G?E?G@G?G@I?I?I@K?I@M@K?O@M?O@O@O?O@M@O?M@M@M?M@M@M?M@M?M@M@K@M?M@M@M?M@M@M?M@M@M@M?M@M@M@O?M@M@M@M?M@O@M@M@O?M@O@M@M?O@M@O?M@O@M@O?M@M@O?M@O?M@M@O?O@M?O@M@O?M@O?M@O?O@O?M@O?O@M?O@O?O@O?O@M?O@O?O@O?O@O?O?O@O?O@O?O@O?O@O?O@O?Q?O@O?Q@O?O@O?O@O?Q@O?O?Q@O?O@O?Q@O?O@O?O?Q@O?O@Q?O@O?O?O@Q?O@O?Q?O@Q?O@O?Q?O@O?Q?Q@O?Q@O?Q?O@Q?O@Q?O?Q@Q?Q@O?Q?Q@O?Q@Q?Q@Q?Q?O@Q?Q@O?Q@Q?O?Q@Q?Q@O?Q@O?Q?O@Q?O@Q?O?Q@O?Q@O?Q?O@O?Q@O?Q@Q?O?Q@O?Q@Q?O@Q?O?Q@Q?Q@O?Q@O?Q?Q@O?Q@Q?Q@Q?O?Q@Q?Q@Q?O@Q?Q?Q@Q?Q?O@Q?Q@O?Q?Q@Q?Q?O@Q?O?Q@Q?O?Q@O?Q?Q?O@Q?O?Q?O@Q?O?Q?Q@O?Q?O?Q?Q@O?Q?O?Q?Q@O?Q?Q?O?Q?O@Q?O?Q?Q?Q@Q?O?Q?Q?Q?O@Q?Q?Q?Q?Q@Q?O?Q?Q?Q@Q?O?Q?Q?Q@Q?O?Q?Q?O@Q?O?Q?Q?Q@O?Q?Q?O?Q@Q?O?Q?Q?Q@O?Q?Q?Q?O@Q?Q?Q?O?Q?Q@Q?O?Q?Q?Q?O@Q?S?O?Q?Q?Q?Q@Q?Q?Q?Q?S?Q?Q?Q?Q?Q?Q@Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?O?Q?Q?Q?Q?Q?Q?Q?QAQ?Q?Q?Q?Q?Q?Q?Q?S?QAQ?Q?Q?Q?Q?Q?QAS?Q?Q?QAS?Q?Q?QAQ?S?Q?QAS?Q?Q?QAQ?S?QAQ?Q?Q?QAQ?Q?S?QAQ?Q?Q?QAQ?Q?QAQ?Q?O?QAQ?Q?SAQ?Q?QAQ?Q?QAQ?Q?QAQ?S?QAQ?Q?QAQ?QAS?Q?QAQ?SAQ?QAQ?SAQ?QAQ?SAQ?QAS?QAQ?QAQAQ?QAQ?QAQAQ?OAQ?QAOAQ?QAQAO?QAQAO?QAOAQAQ?OAQAQ?OAQAQAO?QAOAQAQ?OAQAQAO?QAQAOAQ?OAQAQAOAQ?QAOAQAQ?QAOAQAQAQAO?QAQAOAQAO?QAOAQAOAQ?OAQAOAOAO?OAQAOAOAO?QAOAOAOAO?OAOAQAOAO?OAOAQAOAOAO?OAQAOAOAOAO?OAQAOAOAOAQAO?QAOAOAQAOAO?QAOAQAQAOAQAO?OAQAOAQAO?OAQAOAQAO?OAOAQAO?OAOAQAOAO?QAOAOAO?OAQAOAO?QAOAOAQAO?OAQAOAOAQ?OAQAOAO?OAQAOAQAO?QAOAQAOAQ?OAQAOAQAOAQ?QAOAQAOAQ?OAQAOAQAOAQ?OAOAQAOAQAO?OAQAOAOAOAQ?OAOAOAOAQAO?QAOAOAOAQ?OAOAOAQAO?OAQAOAOAQAO?OAQAOAQAO?QAOAQAOAOAQ?OAQAQAOAQAOAQ?OAQAOAQAOAOAQ?OAQAOAOAQAOAO?OAQAOAOAOAO?QAOAOAOAOAOAQAO?OAOAQAOAOAOAOAQAO?OAQAOAOAOAQAOAOAQAQAOAQAOAQAOAQAQAOAQAQAQAOAQAOAQAOAQAOAQAOAQAO?OAQAOAOAOAO?QAOAOAOAO?OAQAO?OAOAOAQ?OAOAO?OAOAQ?OAOAO?OAQAO?OAO?OAQAO?OAOAQ?OAQAOAQ?OAQAQ?OAQAOAQ?QAOAQAO?QAOAOAQ?OAQAO?OAQAOAO?OAQAO?OAQAOAO?OAOAQAO?OAOAQAO?OAQAOAQAOAO?OAQAOAQAOAO?QAOAOAQAOAOAQAQAO?OAQAOAQAOAQAQAOAQAOAQAO?QAOAQAOAQAOAQ?OAOAQAOAO?OAOAQAOAO?QAOAOAOAO?OAQAOAOAQAO?OAOAOAQAOAOAO?OAOAQAOAOAOAO?OAQAOAQAOAQAOAO?QAOAQAOAQAQAQAO?QAOAQAOAQAOAQAOAQ?OAQAOAOAQAOAOAQ?OAOAQAOAOAOAOAQ?OAOAQAOAOAOAQ?OAOAOAOAQAOAO?QAOAOAOAQAO?OAQAOAQAOAO?QAOAQAO?QAOAQAQAO?OAQAO?QAOAO?QAOAQ?OAO?QAO?QAO?O?OAQ?O?O?OAO?O?O?O?O?Q?O?O@O?O?O?O@O?O?O@O?O@O?O@O?O@O?O@O@O?O@O?O@O?O@Q?O@O?O@O?Q@O?O@Q?O@O?O@O?M?O@O?O?M?O@O?M?O@M?M?O?M?M?M@M?M?M?K?M?K?K?M?K@K?K?I?K?I?K?I?I?I?I?I?I?I?I@G?I?I?G?I?I?I?G?I?G?I@I?G?I?G?I?I?G@I?I?G?I?I?I@I?I?I?K?I@I?I?K?I@I?K?K?I?K?I@K?I?K?I?I?K?I?I?K?I?I?I?I?I?K?IAI?I?I?I?IAI?I?IAI?I?IAI?I?IAI?KAI?IAI?IAIAI?IAI?IAIAI?IAIAI?IAIAIAI?IAIAIAI?GAIAIAIAIAIAI?IAIAIAIAIAIAKAIAI?IAKAIAKAIAI?KAIAKAI?KAI?KAI?KAI?KAI?K?IAK?K?I?K?K?I?K?K?K?K?K?K?K?I?K?K?K?K?K?K@K?K?K?I?K?K?K?K?K?K@I?K?K?K?K?K?K?K?K?K?M?K?K?K?K?K?M?K@K?K?K?K?K?K?K?K?K?K?K?K?I?K?K?I?K?I?K?K?I?I?K?I?K?I?I?K?I?I?I?K?I?I?I?I?I?I?I?I?I?I?I?I?G?I?I?I?I?I?G?I?I?G?I?I?G?I?I?I?I?G@I?I?G?I?I?G@I?G?G@G?I?G@G?G?E@G?G@G?E@G?E@E@G?E@E@G@E@E?E@E@C@E?C@E@C@C@C?E@C@C@C@C@E@C@C@E@C@E@C@EBE@C@EBE@C@EBE@E@CBE@C@C@C@C@A?C@A@C?A@A?A@A???A@A?????A??@A???A@??A?A@??A?A@A?A@A?A@A?A@A?A@C?A@A?A@C?A@A?A@C?A@A?C@A@A?C@A?C@A?C@A?C@A?C@A?C@C?C@A@C?C@C?C@C@C?E@C@C?E@C@E?C@E@E@E@E?E@E@E@E@G@E?G@E@G@E@G?E@G@E@G?G@E@G@G?G@E@G?G@G@E?G@G@G?E@G?G@E?G@G?E@G?G@E?G?E@E?G?E@E?E?E?E@E?E?E?E?E?C?E?E?E@C?E?E?C?EAE?E?E?E?E?E?G?EAE?E?G?EAG?EAG?GAG?GAG?GAG?GAIAG?IAGAIAGAIAIAIAGAIAIAIAIAICIAIAIAGCIAIAICIAICGAICICIAGCICGCIAICGCGCICGCGCECGCGCECGCECECECECECECCCECECCCECCECCECCCCECCCCCCCECCACCECCACCEACCCACACCCAAACAAAC?AACAAAA?AAAAC?AA??AAA?AAA?AAA???AAA???AAA???A??AA???A??AA???A?????AA????A?????AA????A?????A????A??A?????A??????AA???????A?????",
      precision: 6
    }
  end
end