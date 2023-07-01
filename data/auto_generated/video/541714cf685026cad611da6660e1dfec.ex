defmodule Data.AutoGenerated.Video.Rendered_541714cf685026cad611da6660e1dfec do
  @moduledoc "#{"ahrensburg-a6: Zentrum → U-Bahn Ahrensburg West"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "ahrensburg-a6: Zentrum → U-Bahn Ahrensburg West"
  end

  @impl Video.Rendered
  def hash() do
    "541714cf685026cad611da6660e1dfec"
  end

  @impl Video.Rendered
  def length_ms() do
    83209
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-10-16-ahrensburg2/GX014933", "00:00:07.941", "00:00:18.051"},
      {"2022-10-16-ahrensburg2/GX014928", "00:00:48.448", :end},
      {"2022-10-16-ahrensburg2/GX014929", :start, :end},
      {"2022-10-16-ahrensburg2/GX014930", :start, :end},
      {"2022-10-16-ahrensburg2/GX014931", :start, "00:00:43.034"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.220475,
      minLat: 53.663991,
      maxLon: 10.239110711711712,
      maxLat: 53.672995003003
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Oktober 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.239110711711712, lat: 53.672995003003, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.239099, lat: 53.672987, time_offset_ms: 65},
      %Video.TimedPoint{lon: 10.239016, lat: 53.672959, time_offset_ms: 399},
      %Video.TimedPoint{lon: 10.23893, lat: 53.672939, time_offset_ms: 733},
      %Video.TimedPoint{lon: 10.238841, lat: 53.672925, time_offset_ms: 1066},
      %Video.TimedPoint{lon: 10.238763, lat: 53.672924, time_offset_ms: 1400},
      %Video.TimedPoint{lon: 10.238703, lat: 53.672921, time_offset_ms: 1733},
      %Video.TimedPoint{lon: 10.238654, lat: 53.672901, time_offset_ms: 2067},
      %Video.TimedPoint{lon: 10.238593, lat: 53.672869, time_offset_ms: 2401},
      %Video.TimedPoint{lon: 10.238524, lat: 53.672832, time_offset_ms: 2734},
      %Video.TimedPoint{lon: 10.238446, lat: 53.672792, time_offset_ms: 3068},
      %Video.TimedPoint{lon: 10.238374, lat: 53.672743, time_offset_ms: 3401},
      %Video.TimedPoint{lon: 10.238297, lat: 53.672695, time_offset_ms: 3735},
      %Video.TimedPoint{lon: 10.238212, lat: 53.672646, time_offset_ms: 4069},
      %Video.TimedPoint{lon: 10.238126, lat: 53.672599, time_offset_ms: 4402},
      %Video.TimedPoint{lon: 10.23804, lat: 53.672555, time_offset_ms: 4736},
      %Video.TimedPoint{lon: 10.237949, lat: 53.672513, time_offset_ms: 5069},
      %Video.TimedPoint{lon: 10.23786, lat: 53.672468, time_offset_ms: 5403},
      %Video.TimedPoint{lon: 10.237771, lat: 53.672425, time_offset_ms: 5737},
      %Video.TimedPoint{lon: 10.237673, lat: 53.672387, time_offset_ms: 6070},
      %Video.TimedPoint{lon: 10.237575, lat: 53.672351, time_offset_ms: 6404},
      %Video.TimedPoint{lon: 10.237483, lat: 53.672309, time_offset_ms: 6737},
      %Video.TimedPoint{lon: 10.237392, lat: 53.672262, time_offset_ms: 7071},
      %Video.TimedPoint{lon: 10.237299, lat: 53.672211, time_offset_ms: 7405},
      %Video.TimedPoint{lon: 10.237205, lat: 53.672161, time_offset_ms: 7738},
      %Video.TimedPoint{lon: 10.237107, lat: 53.672109, time_offset_ms: 8072},
      %Video.TimedPoint{lon: 10.237012, lat: 53.672057, time_offset_ms: 8405},
      %Video.TimedPoint{lon: 10.236916, lat: 53.672009, time_offset_ms: 8739},
      %Video.TimedPoint{lon: 10.236813, lat: 53.671965, time_offset_ms: 9073},
      %Video.TimedPoint{lon: 10.236711, lat: 53.67192, time_offset_ms: 9406},
      %Video.TimedPoint{lon: 10.236616, lat: 53.671873, time_offset_ms: 9740},
      %Video.TimedPoint{lon: 10.236493459459458, lat: 53.671808414414414, time_offset_ms: 9860},
      %Video.TimedPoint{lon: 10.236424, lat: 53.671776, time_offset_ms: 10117},
      %Video.TimedPoint{lon: 10.236337, lat: 53.671728, time_offset_ms: 10451},
      %Video.TimedPoint{lon: 10.236253, lat: 53.671678, time_offset_ms: 10785},
      %Video.TimedPoint{lon: 10.236173, lat: 53.671631, time_offset_ms: 11118},
      %Video.TimedPoint{lon: 10.236085, lat: 53.671593, time_offset_ms: 11452},
      %Video.TimedPoint{lon: 10.235998, lat: 53.671565, time_offset_ms: 11785},
      %Video.TimedPoint{lon: 10.235916, lat: 53.671546, time_offset_ms: 12119},
      %Video.TimedPoint{lon: 10.235831, lat: 53.671536, time_offset_ms: 12453},
      %Video.TimedPoint{lon: 10.235745, lat: 53.671539, time_offset_ms: 12786},
      %Video.TimedPoint{lon: 10.235679, lat: 53.67155, time_offset_ms: 13120},
      %Video.TimedPoint{lon: 10.235669, lat: 53.671536, time_offset_ms: 13181},
      %Video.TimedPoint{lon: 10.235658, lat: 53.67153, time_offset_ms: 13515},
      %Video.TimedPoint{lon: 10.235617, lat: 53.671511, time_offset_ms: 13848},
      %Video.TimedPoint{lon: 10.235559, lat: 53.67148, time_offset_ms: 14182},
      %Video.TimedPoint{lon: 10.235493, lat: 53.671442, time_offset_ms: 14515},
      %Video.TimedPoint{lon: 10.235423, lat: 53.671397, time_offset_ms: 14849},
      %Video.TimedPoint{lon: 10.235365, lat: 53.671347, time_offset_ms: 15183},
      %Video.TimedPoint{lon: 10.235293, lat: 53.671301, time_offset_ms: 15516},
      %Video.TimedPoint{lon: 10.235205, lat: 53.671261, time_offset_ms: 15850},
      %Video.TimedPoint{lon: 10.235116, lat: 53.671217, time_offset_ms: 16183},
      %Video.TimedPoint{lon: 10.235011, lat: 53.671179, time_offset_ms: 16517},
      %Video.TimedPoint{lon: 10.234909, lat: 53.671128, time_offset_ms: 16851},
      %Video.TimedPoint{lon: 10.234805, lat: 53.671078, time_offset_ms: 17184},
      %Video.TimedPoint{lon: 10.234707, lat: 53.671024, time_offset_ms: 17518},
      %Video.TimedPoint{lon: 10.234612, lat: 53.670966, time_offset_ms: 17851},
      %Video.TimedPoint{lon: 10.234521, lat: 53.670903, time_offset_ms: 18185},
      %Video.TimedPoint{lon: 10.234446, lat: 53.670843, time_offset_ms: 18519},
      %Video.TimedPoint{lon: 10.234401, lat: 53.6708, time_offset_ms: 18852},
      %Video.TimedPoint{lon: 10.234336, lat: 53.670789, time_offset_ms: 18937},
      %Video.TimedPoint{lon: 10.234338, lat: 53.670785, time_offset_ms: 19271},
      %Video.TimedPoint{lon: 10.234368, lat: 53.670768, time_offset_ms: 19604},
      %Video.TimedPoint{lon: 10.234423, lat: 53.670742, time_offset_ms: 19938},
      %Video.TimedPoint{lon: 10.234495, lat: 53.670708, time_offset_ms: 20271},
      %Video.TimedPoint{lon: 10.234569, lat: 53.670676, time_offset_ms: 20605},
      %Video.TimedPoint{lon: 10.234639, lat: 53.670628, time_offset_ms: 20939},
      %Video.TimedPoint{lon: 10.234701, lat: 53.670578, time_offset_ms: 21272},
      %Video.TimedPoint{lon: 10.234763, lat: 53.670524, time_offset_ms: 21606},
      %Video.TimedPoint{lon: 10.234827, lat: 53.67047, time_offset_ms: 21939},
      %Video.TimedPoint{lon: 10.2349, lat: 53.670408, time_offset_ms: 22273},
      %Video.TimedPoint{lon: 10.234969, lat: 53.670347, time_offset_ms: 22607},
      %Video.TimedPoint{lon: 10.235044, lat: 53.670285, time_offset_ms: 22940},
      %Video.TimedPoint{lon: 10.235118, lat: 53.67022, time_offset_ms: 23274},
      %Video.TimedPoint{lon: 10.235193, lat: 53.67016, time_offset_ms: 23607},
      %Video.TimedPoint{lon: 10.235269, lat: 53.6701, time_offset_ms: 23941},
      %Video.TimedPoint{lon: 10.235342, lat: 53.670039, time_offset_ms: 24275},
      %Video.TimedPoint{lon: 10.235415, lat: 53.66998, time_offset_ms: 24608},
      %Video.TimedPoint{lon: 10.235488, lat: 53.669924, time_offset_ms: 24942},
      %Video.TimedPoint{lon: 10.235559, lat: 53.669868, time_offset_ms: 25275},
      %Video.TimedPoint{lon: 10.23562, lat: 53.669817, time_offset_ms: 25609},
      %Video.TimedPoint{lon: 10.235662, lat: 53.669763, time_offset_ms: 25943},
      %Video.TimedPoint{lon: 10.235634, lat: 53.669706, time_offset_ms: 26276},
      %Video.TimedPoint{lon: 10.235559, lat: 53.669665, time_offset_ms: 26610},
      %Video.TimedPoint{lon: 10.235473, lat: 53.669623, time_offset_ms: 26943},
      %Video.TimedPoint{lon: 10.235379, lat: 53.669583, time_offset_ms: 27277},
      %Video.TimedPoint{lon: 10.235289, lat: 53.669542, time_offset_ms: 27611},
      %Video.TimedPoint{lon: 10.235224, lat: 53.669486, time_offset_ms: 27944},
      %Video.TimedPoint{lon: 10.235156, lat: 53.669424, time_offset_ms: 28278},
      %Video.TimedPoint{lon: 10.235061, lat: 53.669381, time_offset_ms: 28611},
      %Video.TimedPoint{lon: 10.23496, lat: 53.669341, time_offset_ms: 28945},
      %Video.TimedPoint{lon: 10.234853, lat: 53.669299, time_offset_ms: 29279},
      %Video.TimedPoint{lon: 10.23475, lat: 53.669257, time_offset_ms: 29612},
      %Video.TimedPoint{lon: 10.234649, lat: 53.669215, time_offset_ms: 29946},
      %Video.TimedPoint{lon: 10.234547, lat: 53.669174, time_offset_ms: 30279},
      %Video.TimedPoint{lon: 10.234445, lat: 53.669133, time_offset_ms: 30613},
      %Video.TimedPoint{lon: 10.234341, lat: 53.669095, time_offset_ms: 30947},
      %Video.TimedPoint{lon: 10.234237, lat: 53.669053, time_offset_ms: 31280},
      %Video.TimedPoint{lon: 10.234137, lat: 53.669012, time_offset_ms: 31614},
      %Video.TimedPoint{lon: 10.234034, lat: 53.668969, time_offset_ms: 31947},
      %Video.TimedPoint{lon: 10.233932, lat: 53.668928, time_offset_ms: 32281},
      %Video.TimedPoint{lon: 10.233825, lat: 53.668888, time_offset_ms: 32615},
      %Video.TimedPoint{lon: 10.233719, lat: 53.668849, time_offset_ms: 32948},
      %Video.TimedPoint{lon: 10.233612, lat: 53.668809, time_offset_ms: 33282},
      %Video.TimedPoint{lon: 10.233508, lat: 53.668775, time_offset_ms: 33615},
      %Video.TimedPoint{lon: 10.2334, lat: 53.668763, time_offset_ms: 33949},
      %Video.TimedPoint{lon: 10.233292, lat: 53.668781, time_offset_ms: 34283},
      %Video.TimedPoint{lon: 10.233182, lat: 53.668801, time_offset_ms: 34616},
      %Video.TimedPoint{lon: 10.233077, lat: 53.668833, time_offset_ms: 34950},
      %Video.TimedPoint{lon: 10.233009, lat: 53.668894, time_offset_ms: 35283},
      %Video.TimedPoint{lon: 10.232981, lat: 53.668967, time_offset_ms: 35617},
      %Video.TimedPoint{lon: 10.232964, lat: 53.669041, time_offset_ms: 35950},
      %Video.TimedPoint{lon: 10.232955, lat: 53.669117, time_offset_ms: 36284},
      %Video.TimedPoint{lon: 10.232952, lat: 53.669187, time_offset_ms: 36618},
      %Video.TimedPoint{lon: 10.232944, lat: 53.669259, time_offset_ms: 36951},
      %Video.TimedPoint{lon: 10.232934, lat: 53.669336, time_offset_ms: 37285},
      %Video.TimedPoint{lon: 10.232925, lat: 53.669414, time_offset_ms: 37618},
      %Video.TimedPoint{lon: 10.232916, lat: 53.669489, time_offset_ms: 37952},
      %Video.TimedPoint{lon: 10.232902, lat: 53.669558, time_offset_ms: 38286},
      %Video.TimedPoint{lon: 10.232888, lat: 53.669618, time_offset_ms: 38619},
      %Video.TimedPoint{lon: 10.232868, lat: 53.669683, time_offset_ms: 38953},
      %Video.TimedPoint{lon: 10.232849, lat: 53.669754, time_offset_ms: 39286},
      %Video.TimedPoint{lon: 10.232877, lat: 53.669813, time_offset_ms: 39620},
      %Video.TimedPoint{lon: 10.232944, lat: 53.669849, time_offset_ms: 39954},
      %Video.TimedPoint{lon: 10.232973, lat: 53.669891, time_offset_ms: 40175},
      %Video.TimedPoint{lon: 10.232961, lat: 53.669902, time_offset_ms: 40509},
      %Video.TimedPoint{lon: 10.232909, lat: 53.669922, time_offset_ms: 40842},
      %Video.TimedPoint{lon: 10.23283, lat: 53.669914, time_offset_ms: 41176},
      %Video.TimedPoint{lon: 10.232743, lat: 53.669886, time_offset_ms: 41509},
      %Video.TimedPoint{lon: 10.232656, lat: 53.669847, time_offset_ms: 41843},
      %Video.TimedPoint{lon: 10.232561, lat: 53.669804, time_offset_ms: 42177},
      %Video.TimedPoint{lon: 10.232463, lat: 53.669758, time_offset_ms: 42510},
      %Video.TimedPoint{lon: 10.232366, lat: 53.66971, time_offset_ms: 42844},
      %Video.TimedPoint{lon: 10.232264, lat: 53.66966, time_offset_ms: 43177},
      %Video.TimedPoint{lon: 10.232162, lat: 53.66961, time_offset_ms: 43511},
      %Video.TimedPoint{lon: 10.232061, lat: 53.669562, time_offset_ms: 43845},
      %Video.TimedPoint{lon: 10.231959, lat: 53.669513, time_offset_ms: 44178},
      %Video.TimedPoint{lon: 10.231859, lat: 53.669467, time_offset_ms: 44512},
      %Video.TimedPoint{lon: 10.231756, lat: 53.669421, time_offset_ms: 44845},
      %Video.TimedPoint{lon: 10.231653, lat: 53.669374, time_offset_ms: 45179},
      %Video.TimedPoint{lon: 10.231551, lat: 53.669327, time_offset_ms: 45513},
      %Video.TimedPoint{lon: 10.231451, lat: 53.669286, time_offset_ms: 45846},
      %Video.TimedPoint{lon: 10.231353, lat: 53.669241, time_offset_ms: 46180},
      %Video.TimedPoint{lon: 10.231256, lat: 53.669197, time_offset_ms: 46513},
      %Video.TimedPoint{lon: 10.231159, lat: 53.669153, time_offset_ms: 46847},
      %Video.TimedPoint{lon: 10.231062, lat: 53.669104, time_offset_ms: 47181},
      %Video.TimedPoint{lon: 10.230966, lat: 53.669057, time_offset_ms: 47514},
      %Video.TimedPoint{lon: 10.230873, lat: 53.669011, time_offset_ms: 47848},
      %Video.TimedPoint{lon: 10.230779, lat: 53.668964, time_offset_ms: 48181},
      %Video.TimedPoint{lon: 10.230685, lat: 53.668919, time_offset_ms: 48515},
      %Video.TimedPoint{lon: 10.23059, lat: 53.668872, time_offset_ms: 48849},
      %Video.TimedPoint{lon: 10.230495, lat: 53.668824, time_offset_ms: 49182},
      %Video.TimedPoint{lon: 10.230401, lat: 53.668781, time_offset_ms: 49516},
      %Video.TimedPoint{lon: 10.23031, lat: 53.66874, time_offset_ms: 49849},
      %Video.TimedPoint{lon: 10.230214, lat: 53.668697, time_offset_ms: 50183},
      %Video.TimedPoint{lon: 10.230115, lat: 53.668653, time_offset_ms: 50517},
      %Video.TimedPoint{lon: 10.23002, lat: 53.668604, time_offset_ms: 50850},
      %Video.TimedPoint{lon: 10.229932, lat: 53.668547, time_offset_ms: 51184},
      %Video.TimedPoint{lon: 10.229827, lat: 53.668496, time_offset_ms: 51517},
      %Video.TimedPoint{lon: 10.229723, lat: 53.668446, time_offset_ms: 51851},
      %Video.TimedPoint{lon: 10.229623, lat: 53.668393, time_offset_ms: 52185},
      %Video.TimedPoint{lon: 10.229526, lat: 53.668337, time_offset_ms: 52518},
      %Video.TimedPoint{lon: 10.229428, lat: 53.668286, time_offset_ms: 52852},
      %Video.TimedPoint{lon: 10.229328, lat: 53.668235, time_offset_ms: 53185},
      %Video.TimedPoint{lon: 10.229228, lat: 53.668185, time_offset_ms: 53519},
      %Video.TimedPoint{lon: 10.229126, lat: 53.66814, time_offset_ms: 53853},
      %Video.TimedPoint{lon: 10.229028, lat: 53.668096, time_offset_ms: 54186},
      %Video.TimedPoint{lon: 10.228933, lat: 53.66805, time_offset_ms: 54520},
      %Video.TimedPoint{lon: 10.228847, lat: 53.668004, time_offset_ms: 54853},
      %Video.TimedPoint{lon: 10.228759, lat: 53.667958, time_offset_ms: 55187},
      %Video.TimedPoint{lon: 10.228668, lat: 53.667911, time_offset_ms: 55521},
      %Video.TimedPoint{lon: 10.228579, lat: 53.667866, time_offset_ms: 55854},
      %Video.TimedPoint{lon: 10.228486, lat: 53.667817, time_offset_ms: 56188},
      %Video.TimedPoint{lon: 10.22839, lat: 53.667769, time_offset_ms: 56521},
      %Video.TimedPoint{lon: 10.228296, lat: 53.667721, time_offset_ms: 56855},
      %Video.TimedPoint{lon: 10.228201, lat: 53.66767, time_offset_ms: 57189},
      %Video.TimedPoint{lon: 10.228105, lat: 53.667616, time_offset_ms: 57522},
      %Video.TimedPoint{lon: 10.228008, lat: 53.667564, time_offset_ms: 57856},
      %Video.TimedPoint{lon: 10.227906, lat: 53.667512, time_offset_ms: 58189},
      %Video.TimedPoint{lon: 10.227802, lat: 53.667458, time_offset_ms: 58523},
      %Video.TimedPoint{lon: 10.227699, lat: 53.667406, time_offset_ms: 58857},
      %Video.TimedPoint{lon: 10.227594, lat: 53.667354, time_offset_ms: 59190},
      %Video.TimedPoint{lon: 10.227488, lat: 53.667302, time_offset_ms: 59524},
      %Video.TimedPoint{lon: 10.227387, lat: 53.667249, time_offset_ms: 59857},
      %Video.TimedPoint{lon: 10.227282, lat: 53.667197, time_offset_ms: 60191},
      %Video.TimedPoint{lon: 10.227177, lat: 53.667144, time_offset_ms: 60525},
      %Video.TimedPoint{lon: 10.227072, lat: 53.667092, time_offset_ms: 60858},
      %Video.TimedPoint{lon: 10.226962, lat: 53.667039, time_offset_ms: 61192},
      %Video.TimedPoint{lon: 10.226855, lat: 53.666986, time_offset_ms: 61525},
      %Video.TimedPoint{lon: 10.226749, lat: 53.666934, time_offset_ms: 61859},
      %Video.TimedPoint{lon: 10.226644, lat: 53.666878, time_offset_ms: 62193},
      %Video.TimedPoint{lon: 10.226536, lat: 53.666824, time_offset_ms: 62526},
      %Video.TimedPoint{lon: 10.226431, lat: 53.666771, time_offset_ms: 62860},
      %Video.TimedPoint{lon: 10.226323, lat: 53.666719, time_offset_ms: 63193},
      %Video.TimedPoint{lon: 10.226215, lat: 53.666665, time_offset_ms: 63527},
      %Video.TimedPoint{lon: 10.226108, lat: 53.666611, time_offset_ms: 63861},
      %Video.TimedPoint{lon: 10.226003, lat: 53.666557, time_offset_ms: 64194},
      %Video.TimedPoint{lon: 10.225897, lat: 53.666504, time_offset_ms: 64528},
      %Video.TimedPoint{lon: 10.225794, lat: 53.666453, time_offset_ms: 64861},
      %Video.TimedPoint{lon: 10.225691, lat: 53.666401, time_offset_ms: 65195},
      %Video.TimedPoint{lon: 10.225586, lat: 53.666347, time_offset_ms: 65529},
      %Video.TimedPoint{lon: 10.225484, lat: 53.666296, time_offset_ms: 65862},
      %Video.TimedPoint{lon: 10.225378, lat: 53.666243, time_offset_ms: 66196},
      %Video.TimedPoint{lon: 10.225276, lat: 53.666192, time_offset_ms: 66529},
      %Video.TimedPoint{lon: 10.225172, lat: 53.666141, time_offset_ms: 66863},
      %Video.TimedPoint{lon: 10.22507, lat: 53.666091, time_offset_ms: 67197},
      %Video.TimedPoint{lon: 10.224968, lat: 53.666037, time_offset_ms: 67530},
      %Video.TimedPoint{lon: 10.224858, lat: 53.665985, time_offset_ms: 67864},
      %Video.TimedPoint{lon: 10.224745, lat: 53.665936, time_offset_ms: 68197},
      %Video.TimedPoint{lon: 10.224635, lat: 53.665882, time_offset_ms: 68531},
      %Video.TimedPoint{lon: 10.224523, lat: 53.665824, time_offset_ms: 68865},
      %Video.TimedPoint{lon: 10.224412, lat: 53.665768, time_offset_ms: 69198},
      %Video.TimedPoint{lon: 10.224302, lat: 53.665712, time_offset_ms: 69532},
      %Video.TimedPoint{lon: 10.224186, lat: 53.665656, time_offset_ms: 69865},
      %Video.TimedPoint{lon: 10.224075, lat: 53.665602, time_offset_ms: 70199},
      %Video.TimedPoint{lon: 10.223964, lat: 53.665548, time_offset_ms: 70533},
      %Video.TimedPoint{lon: 10.223849, lat: 53.665492, time_offset_ms: 70866},
      %Video.TimedPoint{lon: 10.223739, lat: 53.665439, time_offset_ms: 71200},
      %Video.TimedPoint{lon: 10.223632, lat: 53.665387, time_offset_ms: 71533},
      %Video.TimedPoint{lon: 10.223524, lat: 53.665332, time_offset_ms: 71867},
      %Video.TimedPoint{lon: 10.223419, lat: 53.665279, time_offset_ms: 72201},
      %Video.TimedPoint{lon: 10.22331, lat: 53.665224, time_offset_ms: 72534},
      %Video.TimedPoint{lon: 10.223202, lat: 53.665172, time_offset_ms: 72868},
      %Video.TimedPoint{lon: 10.223094, lat: 53.665119, time_offset_ms: 73201},
      %Video.TimedPoint{lon: 10.222984, lat: 53.665064, time_offset_ms: 73535},
      %Video.TimedPoint{lon: 10.222875, lat: 53.665008, time_offset_ms: 73869},
      %Video.TimedPoint{lon: 10.222767, lat: 53.664952, time_offset_ms: 74202},
      %Video.TimedPoint{lon: 10.22266, lat: 53.664897, time_offset_ms: 74536},
      %Video.TimedPoint{lon: 10.22255, lat: 53.664842, time_offset_ms: 74869},
      %Video.TimedPoint{lon: 10.222447, lat: 53.664788, time_offset_ms: 75203},
      %Video.TimedPoint{lon: 10.222339, lat: 53.664733, time_offset_ms: 75537},
      %Video.TimedPoint{lon: 10.222234, lat: 53.66468, time_offset_ms: 75870},
      %Video.TimedPoint{lon: 10.222122, lat: 53.664624, time_offset_ms: 76204},
      %Video.TimedPoint{lon: 10.222017, lat: 53.664569, time_offset_ms: 76537},
      %Video.TimedPoint{lon: 10.221912, lat: 53.664515, time_offset_ms: 76871},
      %Video.TimedPoint{lon: 10.221808, lat: 53.664462, time_offset_ms: 77205},
      %Video.TimedPoint{lon: 10.221712, lat: 53.664414, time_offset_ms: 77538},
      %Video.TimedPoint{lon: 10.221619, lat: 53.664367, time_offset_ms: 77872},
      %Video.TimedPoint{lon: 10.221526, lat: 53.664321, time_offset_ms: 78205},
      %Video.TimedPoint{lon: 10.221429, lat: 53.664275, time_offset_ms: 78539},
      %Video.TimedPoint{lon: 10.221336, lat: 53.664228, time_offset_ms: 78873},
      %Video.TimedPoint{lon: 10.22123, lat: 53.664176, time_offset_ms: 79206},
      %Video.TimedPoint{lon: 10.221121, lat: 53.664125, time_offset_ms: 79540},
      %Video.TimedPoint{lon: 10.221015, lat: 53.664073, time_offset_ms: 79873},
      %Video.TimedPoint{lon: 10.220911, lat: 53.664022, time_offset_ms: 80207},
      %Video.TimedPoint{lon: 10.2208, lat: 53.663991, time_offset_ms: 80541},
      %Video.TimedPoint{lon: 10.220694, lat: 53.664005, time_offset_ms: 80874},
      %Video.TimedPoint{lon: 10.220619, lat: 53.66405, time_offset_ms: 81208},
      %Video.TimedPoint{lon: 10.220553, lat: 53.6641, time_offset_ms: 81541},
      %Video.TimedPoint{lon: 10.2205, lat: 53.664161, time_offset_ms: 81875},
      %Video.TimedPoint{lon: 10.220475, lat: 53.664224, time_offset_ms: 82209},
      %Video.TimedPoint{lon: 10.22048, lat: 53.66429, time_offset_ms: 82542},
      %Video.TimedPoint{lon: 10.220499, lat: 53.664356, time_offset_ms: 82876},
      %Video.TimedPoint{lon: 10.220525, lat: 53.664419, time_offset_ms: 83209}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "s`}jeBef}oR?@?@@@@B?B@@?B@B@B@D?B@B@D@D@D@D@D@D@D@F@F@D@FBH@F@HBH@HBJ@JBJBJBL@H@J@F@HBH@F?H@F@H@H@F@H@F@H?H@F@H?H@F@H?H@H@F?H@H?F@H?F@H?F@H?F?F@H?F@F?F?F@H?F?F@D?F?F@D?F?D@F?D?D@D?D?D@D?D?D@B?D@B?D?B@D?B?B@D?B@B?B?D@B?B@B?B@B?D@B@B?B@B?B@B@D?B@B@B@D?B@D@B@D@B@D@D@D@B@DBD@D@DBF@DBD@FBD@DBFBD@FBDBFBD@FBDBFBDBFBFBD@FBFBDBFBFBDBFBDBFBFBDBFBFBFBDBFBFBFBDBFBFBFBFBFBDBFDFBFBFBDBFBFDFBFBFDDBFBFDFBFBDDFBFBFDFBDDFBFBFDDBFBFDFBFDDBFDFBFBFDDBFDFBFBFDFBDDFBFBFDFBFDFBFBFDFBFDFBHDFBFDFBFDHBFDFBHDFBFBHDFBFDFBHDFBHBFDFBHDFBFBHDFBFDHBFBFDHBFBFBFDHBFBFDHBFBFBFBHDFBFBFBHBFDFBHBFBFBFBHBFDFBHBFBFBHBFDHBFBHBFBHBFBFDHBHBFBFBHBFDHBFBHBFBHDHBFBFBHBFDHBFBHBHBFDHBFBHBFBHDFBFBHBFBHDHBFBFBHBFBHBFBHDFBHBFBHBFBHBFBHBFBHBHBFBHBHBFBHBHBHBHBHBFBHBHBHBHBHBHBH@FBHBHBHBHBHBHBH@FBHBHBHBHBFBHBH@HBFBHBHBFBHBHBHBFBHBHBFBHBHBFBHBFBHBHBFBHBFBHDFBHBFBHBHDFBHBFBHBFDHBHBFDHBFBHDHBFBHDFBHDFBHDHBFDHBHBFDHBHDFBHDHDFBHDHBHDFBHDHBFDHBHDFBHDHBHDFBHDHDFBHBHDFDHBHDFBHBHDFBHDHDHBFDHBHDHBHDHDFBHDHBHDHDHBHDHDHBHDHBFDHDHBHDHDHBHDHBFDHDHBHDHBHDHDFBHDHBHDFBHDHBHDFBHDHBHDHBFBHDHBHBFDHBHDHBHBFDHBHBHBHDHBHBHDHBHBFDHBHBHBHDHBJBHBHDHBHBHBHDHBHBHBJDHBHBHBHDHBJBHBHDHBHBHDHBHBHBHDHBHBHBFBHDHBHBFBHDHBFBHBFBHDFBHBHDHBHDJDJFLDLFNHPHRJXNZP`@Pd@NZJVHRFNDLFLBHDHBHBFBDBFBFBFBD@FBFBFDFBFBFBFBFBFBFDHBFDFBHBFDHBFDHBHDFDHBFDHBFDHBFDHDFBHDFBFDHBFDFBHDFBFDFBFDHBFBFDFBFDHBFBFDFBFBFDFBFBHDFBFBFBFBFDFBHBFBFBFBHBFBFDHBFBFBF@HBFBHBFBHBFBHBF@HBFBFBH@FBHBF@HBF@HBF@FBH@FBH@F@FBH@F@F@FBH@F@F@F@H@F@F@F@F@F@F@F@F@F@F@F@F?F@F@F@F?F@F@F?H@F@F?F@F?F@F?F@H?F@F?H?F@F?H?F@F?H?F?H?H?J?J@J?L?J?L?L?J?J?J?H@H?H?H?F?F?F?F@D?D?F?B?D?D?B@D?B?B?B?B?B?B@@?B?B?@?B@@?B?@@B?B@@?@???@@??@???@?????@??@??@???@???@@@???@@@?@?@@@?@?@@@?@@@?B@@@B?@@B@@?B@B@B@B@B@B@B@B@D@BBD@D@DBDBDBD@FBDBFBFBFDFBFBFDHBFBFBFBFDFBDBFBFBDBFBDBFBDBFBDBFBDBFDDBFBFBDBFDDBFBDBFDDBFBDDFBDBFDDBFDDBDBFDDBFBDDDBDDFBDBDDDBDBFDDBDDDBDBDDFBDBDDDBDBFDDBDBFDDBFBDBFDDBFBDDFBDBFBFBDDFBFBFBFBFDFBFBFBFBFBFBFDFBFBFBHBFBFBHBFDFBFBHBFBHBFBHBFBHDFBHBFBHBFBHBFBHBHBFBHBFBHDHBHBFBHBHBHBHBHBHBHBFBHBJBHBHDHBHBHBHBHBHBHDJBHBHDHBHBJBHDHBHDHBJDHBJDHBHDHBJDHBHDHBHDJDHBHDHBJDHBHDHBHDHDJBHDHBHDHBHDHBHDHDHBHDHDHBHDHBHDHDHBHDHDHBHDHDFDHBHDHDHBFDHDHDHDHDHBFDHDHDHDFDHDHDHDFDHDHDHBFDHDHFFDHDHDFDHDHDFDHDHFFDHDHFFDHDFDHDFFHDFDHDFFFDHDFDFFFDHDFFFDFDFDFFFDFDFDFDFDFDFDFDJFHFJFHFJFFDFDDBDBDBBDB@BBBBB@@BBBB@B@@BB@B@D@D@B?@?@?@@@?????@????????????????????@A?????????A??@????A????@A???A??@A???A@??A@A??@A?A@A?A@A@A?A@A@A@A@C@A@C@A@C@C@CBC@EBCBEBEBEBGBGDGDIDKHKFMBGBIBGBGBGBGBG@GBGBEBGBG@GBEBGBG@EBGBE@GBEBGBE@GBEBGBEBGBEBGBGBEBGBEBGBGBEBGBGDEBGDGBEBGDGBEDGBEDGBEBGDEBGDEBEDGBEDEBEDGBEDEBEDEBEDEBEDEBEDGBEDEBEDEDEBEDEBGDEDEBEDEDEDGBEDEDEBEDEDEBEDGDEBEDEDEBEDEDEBEDGDEBEDEDEBGDEDEDEDGDEBGDEDGDEDGDEFGDEDGDGDGDGFEDGDGDEDGDGDEFGDEDGDGDEDGDEDGDEDEDGDGDEDEDGDEDGDEDGDEDGDGDEDGDEFGDGDEDGDGDEDGFGDGDEDGDGDEDGFGDGDEDGDGFGDGDEDGFGDGDGDEFGDGDGDGFEDGDGDGDEDGDGFGDEDGDGDGDEDGDGDEDGDGDEDGDGDEDGDGDGDEDGDGDGDEDGDGDGDEDGDGDGDEDGDGDGDEDGDGDGDEDGDGDGDEDGDGDEDGDGDEDGDGDGDEDGDGDEDGDGDEDGDGDEDGDGDEDGDGDEDGDGDEDGDGDEDGDGBEDGDGDEDGDEDGDGBEDGDEDGDGDEBGDGDEDGDEBGDGDEDGDGDEBGDEDGDGDEDGDGDEBGDEDGDEDGBEDGDEDEBGDEDEBEDEDEBEDEDEBEDEDEBEDCDEBCDEDCBEDCDCBEDCDCBCDADCBCDADCBADADABADABAD?BAB?DAB?D?B?D?B@D?B@D?B@D@B@D@B@DBB@DBB@BBDBBBDBBBBDDBBDBBBDDDBDBDDDBDBDBFDDBFBDBFBFDFBFBFBFBFDFBFBHBFBFBFDHBFBHBFBFBHBFBHBFDHBFBHBHBFBHBFBHBHBFBHDHBFBHBHBFBHBHBFBHBFBHDHBFBFBHBFBHBFBFBHDFBFBFBFDFBFBFBFDFBFBDDFBFBFDDBFDDBFDDBFDDDFBDDFDDDFBDDFDDDFDDDFDDDFDDDFDFDDDFDFDFDFDFDFDDBFDFDFBFDFDFBFDHBFDFBFDHBFBFBHDFBHBFBHDFBHBFBHBHBHBFDHBHBHBHBHBHBFBHBHBHBJBHBHBHBHBHBHBHBHBHDJBHBHBHBJBHBHBJBHBHDJBHBJBHBHBJBHBHDJBHBHBJBHBHBHBJDHBHBHBHBHBJBHBHBHBHBHBHDHBHBHBHBJBHBHBHBHBHBHDHBHBHBHBHBHBHBHBHBHBHBJBHBHDHBHBHBHBHBHBHBJBHBHBHBHBHBHBHBHBHDHBJBHBHBHBHBHBHBHBHBJBHBHBHBHBHBHBHBHBJBHBHBHBHBH@HBHBHBHBJBHBHBHBHBHBHBJBHBHBHBHBJBHBHBHBJBHBHBHDJBHBHBJBHBHBHBHBHBHBJDHBHBHBHBHBHBHBHBHBHBHBHBHBHBFBHBHBHBHBJDHBHBHBHBHBJBHBHDHBHBJBHBHBHBHDHBHBJBHBHBHBHBHBHBHBJBHBHBHDHBHBHBHBHBHBHBJBHBHBHBHBJBHBHBHBJBHBHBJBHBHBJBHBHBJBHBHBJBHBHBJBHBHBJBHBHBJBHBHBJBHBHBHBJ@HBHBJBHBHBJBHBHBJBHBHBJBHBJBHBJBHBJBHBJBHBHBJBH@JBHBJBHBH@JBHBJ@HBHBJ@HBJ@HBH@H@J@HBH@H@J@H@H@H@J?H@H@H@H?H@H?H@J?H?H@H?H?H?H?H?H?J?H?H?HAH?H?JAH?HAH?JAH?JAHAJAH?JAHAJAHAJAHAJAHAJAHAJAJAHAHAJAJAHAHAJCHAHAJAHCJAHCHAJAHCHAHCHCHAHCHCHCHAHCHCFCHCFCHCFCFEFCHCFCDEFCFEFEFCDEFEFEDEDEFEDEDEDEBGDEDEBEDGBEDGBEBEBGBEBGBG@EBGBE@GBG@EBG@G@EBG@G@E@G@GBE@G@G@E?G@G@G@E@G@G@E?G@G@G@E?G@G@G?G@E@G?G@G?G@E?G@G?G@G?G@E?G?G@G?E?G@G?E?G@E?G?E?G@E?G?E?G@E?E?G?E@G?E?G@E?G?E?G@E?G?E@G?E?G@E?G?G@E?G?E@G?G@E?G?G@E?G@G?G@E?G@G?G?G@E?G@G?G@G?G@G?G@G?E@G?G@G?G@G?G@G?G@G?G?G@G?G@G?G@G?E@G?G@G?G@G?G@G?E@G?G?G@G?E@G?G@G?G@E@G?G@E?G@G?E@G?G@G@E?G@E@G?E@G?E@G@E@G?E@G@E?E@E@G?E@E@E?E@E@E?E@E@E?E@E@E@E?E@E@C?E@E@E@E?E@E@E@E@E?E@E@G@E@E@E@E@G?E@E@G@E@E@G@E@G@E@G@G@E?G@G@E@G?G@E?G@G?G@E?G?G?E?G?EAE?GAE?EAEAEAEAEAEAEAECEACCEAECCCECCCECCCECCCECCCEECCGEEEEEEEGEEEGCECECECCCEAECCACCEACACACACACAAACAC?AAA?A?AAA?A???A???A???A????@??A????@??A??@????A@?@??A@?@??A@?@A@?@A@?@A@?B?@A@?BA@?B?@AB?BAB?B?BAB?B?B?DAB?D?D?DAF?F?D?F?H?F?HAH?J@J?J?H@J@H@H@H@H@F@H@HBH@H@HBF@HBH@FBH@HBFBH@HBFBHBF@HBFBHBFBHBFBH@FBHBFBHBFBHBHBFBHDHBFBHBHBFBHBHBHDFBHBHBHBHDFBHBHBHBHDHBHBHDFBHBHDHBHBHBHDHBHBHDHBHBHDFBHBHDHBHBHDHBHBFDHBHBHDHBHDFBHBHDHBHBHDHBHDFBHDHBJDFBHDJBHDHBHDHBHDHBJDHBHDHBHDHBHDHBJDHBHDHBHDHBHDHBJDHBHDHBHDHBHDJBHDHBHDHBHDHBHDHBHBHDHBHBHDHBHDHBHDHBHBHDHBHBHDHBHDHBJDHBHDHBHDHBHBJDHBHDHBHDHBJBHDHBHDHBHBHDHBHDHBHBHBHDHBHBHDHBHBHBHDHBFBHBHDHBHBJDHBHBHDHBHBHDHBHBHDJBHBHBHDHBHBHDJBHBHDHBHBJDHBHBHDHBHBHDHBJDHBHBHDHBJBHDHBHBHDHBJBHDHBHBHDHBHBJDHBHDHBJBHBHDHBHBHBHDHBHBHBHBHBHDHBHBHBHBHBHBHBFBHDHBHBHBHBFBHBHBHDHBHBHBHBHBHDHBHBHBHDHBHBFBHBHDHBHBHBHDHBHBHBFBHDHBHBHBHDHBHBFBHBHBHDHBFBHBHBHDHBFBHBHBHDHBFBHBHBHDHBFBHBHDHBFBHBHDHBHBHDHBFBHDHBHDHBHBHDHBHDHBHDHBFBHDHBHDHBHDHBHBFDHBHDHBHBHDFBHBHDHBHBFDHBHBFDHBHBHDFBHBHDFBHBHBFDHBFBHDHBFBHDHBFBHBFDHBHBFDHBHBHDFBHBHDFBHBHDHBHBFDHBHBFDHBHBFDHBHBHDFBHBHBFDHBFBHBHDFBHBHBFDHBHBFBHDHBFBHDHBHBFDHBHBFDHBHBFDHBHBHDHBFBHDHBHBFDHBHDHBHBFDHBHDHBHBHDHBFDHBHBHDHBHBFDHBHBHDFBHBHBHDFBHBHBFBHDHBHBFBHBHBFDHBFBHBFBHBFBHBHBFBHBFBHBFBHBFBHDFBHBFBHBFBFBHBHBFBHBHBFBHBFBHBHDHBFBHBHBHBHDHBFBHBHBHBHDHBHBHBFBHDHBHBHBHBHDHBHBHDFBHBHBHDHBHBFBHDHBHDHBHBFDHBHBHDHBFDHBHDFBHDHBFDHBFDHBHDFDHBHDFDHBFDHDFBHDFDHDHBFDHDHBFDHDHBFDHDHDHBHDHDHBHDHDHBHDHDJBHDHDHBHDJBHDHDHBHDJBHDHBHDJBHDHBHDHBHDJDHBHDHBHDHBHDHBHDHBJDHDHBHDHBHDHDHBHDHBHDHDHBHDHDHBHDHDHBHDHDHDHBFDHDHDJDHBFDHDHDJDFBHDHDHBHDHDHBHDHDHDFBHDHBHDHBHDFDHBHDHBHDHBFDHBHDHBHDHDHBHDHBFDHBHDHBHDHDHBHDJBHDHBHDHBHDHBHDHDHBHDHBHDHBHDHBHDHBHDHBHDHBHBHDHBHDHBHBHDJBHDHBHBHDHBHBHDHBHBHDHBHBHBHDHBHBHBHBHDHBHBHBHDHBHBHBHDHBFBHBHBHDHBHBHBFBHDHBHBHDHBFBHBHDHBHBFBHDHBHDHBFBHBHDFBHBHDFBHBFDHBFBHBFDHBFBHDFBFBHBFDFBFBHBFBFDFBHBFBFDHBFBFBHDFBFBFDHBFBHBFDFBHBFDHBFBFDHBFBHDFBHBFDHBFBHDHBFBHDFBHDHBFBHDFBHBFBHDFBHBFDHBFBHDFBFBHBFBFDHBFBHDFBFBHBFDHBFBHBFDHBFDHBFBHDHBFBHDHBFDHBHDHBFDHBHBHDFBHDHBHDFBHDHBHDHBFBHDHBHDHBFDHBHBHDFBHDHBHBFDHBHDHBFBHDHBFBHDFBHDHBHBFDHBFDHBHDFBHBHDHBFDHBHDFBHDHBFDHBHDHDFBHDHBHDFBHDHDHBFDHDHBHDHBHDHDHDFBHDHDHBHDHDHBFDHDHBHDHDHBHDFDHBHDHBHDFDHBHDHBHDFDHBHDHBHDHBFDHDHBHDHBHDHDHBHDHBJDHDHBHDHDHBHDHDHBHDJBHDHDHBHDJDHBHDHDHBHDJDHDHBJDHDHBHDHDHBJDHDHBHDJDHBHDHBHDHDHBHDHBJDHDHBHDHBHDHDHBJDHBHDHDJBHDHBHDJDHBHDHBJDHDHBHDJBHDHDHBHDJBHDHDJBHDHBHDJDHBHDJDHBHDHBJDHDHBHDHDJBHDHBHDHDJBHDHDHBHDHBHDHDJBHDHBHDHDHBHDHBHDHDJBHDHDHBHDHBHDJDHBHDHDJBHDHBHDHDJBHDHBJDHDHBHDJDHBHDHBHDJDHBHDJDHBHDHDJBHDHBHDJDHBHDHDJBHDHBHDHDJBHDHBJDHBHDHDHBJDHBHDJDHBJDHDJBHDHDJBHDJDHBJDJDHBHDJDHBJDHDJBHDJDHBHDJDHBJDHDJBHDHDJBHDHBJDHDHBJDHDHBJDHBHDHDJBHDHBHDJDHBHDHDJBHDHBHDHDJBHDHDJBHDHDHDJBHDHDHBJDHDHDJDHBHDJDHDHBJDHDHDJBHDHDJDHBJDHDHDJBHDJDHDHBJDHDHBJDHDHBJDHDJDHBHDHBJDHDHBHDHDJBHDHBJDHDHBHDHBJDHDHBJDHDHBJDHBJDHDHBJDHDHBJDHBHDJDHBHDJDHBJDHDJBHDHDJBHDHDJBHDJDHBJDHDHDJBHDJDHBHDJDHBJDHDHDJBHDHDJBHDHDJBHDHDJBHDHDJDHBHDJDHBHDHDJDHBHDJDHBHDJDHBHDHDJBHDHDHBHDJDHBHDJDHBHDJDHBHDHDJBHDHDJBHDHDHBJDHBHDHDJBHDHBHDHDJBHDHBHDHBHDJDHBHDHBHDHBHDHBHDHDJBHDHBHDHBHDHBHDHDJBHDHBHDHDHBHDJDHBHDHDJBHDHDHBHDJDHBHDJDHBHDJDHBHDHDJBHDHDHBHDJDHBHDHBHDHDHBHDHBHDJBHDHBHDHBHDHBHDHDHBJDHDHBHDJBHDHDHBJDHDJBHDHDJBHDHDHBHDJDHBHDHBJDHBHDHDHBHDHBJDHBHDHBHDHBHDHBHDHDHBJDHBHDHBHDHBJDHBHDHDJBHDHBHDHBHDHBJDHBHDHDHBHDHBHBHDHBHDHBJDHDHBHDHBHDHBHDHBHDHBHDHDHBHDJDHBHDHBHDJDHDHBHDHBJDHDHBHDJDHBHDJDHBHDJBHDJDHBHDJDJBHDJBHDJBHDJDHBJDHBJDJBHDJBHDJBJDHBJDHBJDHBJDHBJDHBJDHDJBJDHBJDHDJBHDJBHDJDHBJDHDJBHDJDHBJDHDJDHDJBJDHDJDHDJDJBHDJDHDJDJDJDHDJDJDHBJDHDJDJDHDJDHBJDJDHDJDHDJBHDJDJDHDHBJDHDJDHBJDHDJDHDJBHDJDHDJBHDJDHDJDHBJDHDJDHBJDHDJDJDJBHDJDJDJDHDJBJDJDJDJDJDHDJBJDJDHDJBJDHDJDJDHBJDJDHBJDHDJBHDJDHBJDHDJBHDJDHBJDHDJBHDJDHBJDHDJBHDJDHDJBHDJDHBJDHDJBJDHDJDJDHBJDJDJDJDHBJDJDJDJDJDHBJDJDJDHBJDJDHDJDJBHDJDHBJDHDJBHDJDHBJDHBHDJDHBJDHBHDJDHBJDHBHDJDHBHDJBHDHDJBHDHBJDHDHBHDJDHBJDHDHBJDHDJDHBHDJDHBJDHDJDHBJDHDHDJBHDHDJDHBHDJBHDHDHBHDJDHBHDHDJBHDHBHDHDJBHDHDJDHBHDJDHBJDHDJDHBJDHDJDHDJBHDJDHBJDHDHBJDJDHBHDJDHBHDJDHBHDJBHDJDHBHDHBJDHDHBJDHBJDHDHBJDHDJBHDHDJBHDJDHBHDJBHDJDHBHDJDHDJBHDJDHBJDHDHDJBHDJDJDHBJDHDJDHBHDJDHDJDJBHDHDJDHBJDHDJDHDJBHDJDHDHDJBHDJDHDHDJBJDHDHDJDHDJBHDJDHDHDJBHDJDHDHBJDHDHDJDHBJDHDHDJBHDHDJBHDHDJDHBHDJDHDHBJDHDHDJBHDJDHDJBHDJDHDJDHBJDHDJDJDHBHDJDHDJBHDHDJDHBHDHDJBHDHDHBHDHDJBHDHDHBHDHDHBJDHDHBHDJDHDHBHDJDHBHDJDHDJDHBJDHDJDHBHDJDHBHDJDHDHBJDHDHBHDJDHBHDHBHDJDHBHDHDHBJDHDHBJDHDJDHBJDHDJDHDJBJDHDJDJDHDJDJBHDJDHDJDHBJDHDHDJBHDJDHDHBHDJDHDHBHDJDHBHDHDHDJBHDHDJBHDHDHDHBJDHDHBHDJDHBHDHDJBHDHDHBHDJDHDHBJDHDHBHDJDHBHDHDJDHBHDJBHDHDHBHDHBHDHBHDHBHDHBHDHBFDHBHBHDFBHBHDFBHBHDFBHBHDHBFDHBHBFDHBFBHDHBFBHDHBFBHDHBFBHBFDHBHBFDHBHBFDHBHBFDHBFBHBHDFBHBHDFBHBHBFDHBHBHDFBHBHDHBFBHBHDHBHDHBFBHDHBHBFBHDHBHBFDHBHBFDHBHBFBHDFBHBFBHDHBFBHDHBFBHDHBHDHBHDHBHDHBHDHBJDHDHBJDHDJBHDHBJDHDJBHDJDHBJDHBHDJDHBJDHBHDJBHDJDHBJDHBHDJBHDHDJBHDJBHDHDJBHDJBHDHDJBHDHBJDHDHBJDHBHDHBJDHDJBHDHBJDHBJDHBHDJBHDJBHDJBHBJBHDJBHBJBJBHBJ@JBHBJ@HBJ@JBH@J@J@H@J@H@H?J@H?H@H?H?H@H?H?HAH?H?F?HAH?HAHAF?HAFAHAFAHAFAFAHCFAFCFAFAHCFCFAFCFCFCFCFCFCFCDCFCFEFCDCFCFEDCFCDEFCDEFCDEDCDEFCDEDCDEDEDCDEDEDCDEDEDEDEDEDEDEDEBEDEDEDEBEDEBEBEDGBEBEBEBEBEBE@EBEBE@GBE@E@EBE@E@E@E@E@E@E?E@E@G?E@E?E@E?G@E?E?E?E?G?E?E?G?E?EAG?E?EAE?GAE?GAE?EAEAG?EAGAEAEAGAGAGAGAGAECGAEAGAEAEAEACAEAEACAE?CACACACAC?CACAA?CAA?CAAAA?",
      precision: 6
    }
  end
end
