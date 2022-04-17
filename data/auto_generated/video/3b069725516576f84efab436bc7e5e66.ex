defmodule Data.AutoGenerated.Video.Rendered_3b069725516576f84efab436bc7e5e66 do
  @moduledoc "#{"2022-02-16-luruper-hauptstrasse: Luruper Hauptstraße Richtung Schenefeld"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-02-16-luruper-hauptstrasse: Luruper Hauptstraße Richtung Schenefeld"
  end

  @impl Video.Rendered
  def hash() do
    "3b069725516576f84efab436bc7e5e66"
  end

  @impl Video.Rendered
  def length_ms() do
    76541
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-01-16-wedel/GX013142", :start, :end},
      {"2022-01-16-wedel/GX013143", :start, "00:01:04.798"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.59839745345345,
      maxLon: 9.876371,
      minLat: 53.588399,
      minLon: 9.853760690690692
    }
  end

  @impl Video.Rendered
  def renderer() do
    2
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "Januar 2022"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.588399, lon: 9.876371, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.58841, lon: 9.876359, time_offset_ms: 334},
      %Video.TimedPoint{lat: 53.588437, lon: 9.876328, time_offset_ms: 667},
      %Video.TimedPoint{lat: 53.588477, lon: 9.876279, time_offset_ms: 1001},
      %Video.TimedPoint{lat: 53.588526, lon: 9.876214, time_offset_ms: 1334},
      %Video.TimedPoint{lat: 53.588579, lon: 9.876141, time_offset_ms: 1668},
      %Video.TimedPoint{lat: 53.588638, lon: 9.87606, time_offset_ms: 2002},
      %Video.TimedPoint{lat: 53.5887, lon: 9.875975, time_offset_ms: 2335},
      %Video.TimedPoint{lat: 53.588767, lon: 9.875891, time_offset_ms: 2669},
      %Video.TimedPoint{lat: 53.588841, lon: 9.875807, time_offset_ms: 3002},
      %Video.TimedPoint{lat: 53.588915, lon: 9.875726, time_offset_ms: 3336},
      %Video.TimedPoint{lat: 53.588991, lon: 9.875646, time_offset_ms: 3670},
      %Video.TimedPoint{lat: 53.58907, lon: 9.875565, time_offset_ms: 4003},
      %Video.TimedPoint{lat: 53.58915, lon: 9.875493, time_offset_ms: 4337},
      %Video.TimedPoint{lat: 53.589231, lon: 9.875422, time_offset_ms: 4670},
      %Video.TimedPoint{lat: 53.589315, lon: 9.875351, time_offset_ms: 5004},
      %Video.TimedPoint{lat: 53.589395, lon: 9.875277, time_offset_ms: 5338},
      %Video.TimedPoint{lat: 53.589473, lon: 9.875199, time_offset_ms: 5671},
      %Video.TimedPoint{lat: 53.589549, lon: 9.875117, time_offset_ms: 6005},
      %Video.TimedPoint{lat: 53.589622, lon: 9.87504, time_offset_ms: 6338},
      %Video.TimedPoint{lat: 53.589694, lon: 9.874967, time_offset_ms: 6672},
      %Video.TimedPoint{lat: 53.589766, lon: 9.874891, time_offset_ms: 7006},
      %Video.TimedPoint{lat: 53.589838, lon: 9.874824, time_offset_ms: 7339},
      %Video.TimedPoint{lat: 53.589911, lon: 9.874761, time_offset_ms: 7673},
      %Video.TimedPoint{lat: 53.589983, lon: 9.874688, time_offset_ms: 8006},
      %Video.TimedPoint{lat: 53.590053, lon: 9.874619, time_offset_ms: 8340},
      %Video.TimedPoint{lat: 53.590121, lon: 9.874551, time_offset_ms: 8673},
      %Video.TimedPoint{lat: 53.590191, lon: 9.874479, time_offset_ms: 9007},
      %Video.TimedPoint{lat: 53.590257, lon: 9.874407, time_offset_ms: 9341},
      %Video.TimedPoint{lat: 53.590324, lon: 9.874338, time_offset_ms: 9674},
      %Video.TimedPoint{lat: 53.59039, lon: 9.874264, time_offset_ms: 10008},
      %Video.TimedPoint{lat: 53.590457, lon: 9.874192, time_offset_ms: 10341},
      %Video.TimedPoint{lat: 53.590522, lon: 9.874119, time_offset_ms: 10675},
      %Video.TimedPoint{lat: 53.590587, lon: 9.874045, time_offset_ms: 11009},
      %Video.TimedPoint{lat: 53.590649, lon: 9.873973, time_offset_ms: 11342},
      %Video.TimedPoint{lat: 53.59071, lon: 9.873903, time_offset_ms: 11676},
      %Video.TimedPoint{lat: 53.59074123123123, lon: 9.873865762762764, time_offset_ms: 11876},
      %Video.TimedPoint{lat: 53.590829, lon: 9.873743, time_offset_ms: 11876},
      %Video.TimedPoint{lat: 53.59084, lon: 9.873733, time_offset_ms: 12210},
      %Video.TimedPoint{lat: 53.590872, lon: 9.873707, time_offset_ms: 12543},
      %Video.TimedPoint{lat: 53.590919, lon: 9.873674, time_offset_ms: 12877},
      %Video.TimedPoint{lat: 53.59097, lon: 9.873635, time_offset_ms: 13210},
      %Video.TimedPoint{lat: 53.591027, lon: 9.873587, time_offset_ms: 13544},
      %Video.TimedPoint{lat: 53.591086, lon: 9.873521, time_offset_ms: 13878},
      %Video.TimedPoint{lat: 53.591141, lon: 9.873451, time_offset_ms: 14211},
      %Video.TimedPoint{lat: 53.591195, lon: 9.873373, time_offset_ms: 14545},
      %Video.TimedPoint{lat: 53.591249, lon: 9.873296, time_offset_ms: 14878},
      %Video.TimedPoint{lat: 53.591305, lon: 9.87322, time_offset_ms: 15212},
      %Video.TimedPoint{lat: 53.591365, lon: 9.873143, time_offset_ms: 15546},
      %Video.TimedPoint{lat: 53.591425, lon: 9.873058, time_offset_ms: 15879},
      %Video.TimedPoint{lat: 53.591486, lon: 9.87297, time_offset_ms: 16213},
      %Video.TimedPoint{lat: 53.591547, lon: 9.872879, time_offset_ms: 16546},
      %Video.TimedPoint{lat: 53.591609, lon: 9.872781, time_offset_ms: 16880},
      %Video.TimedPoint{lat: 53.591666, lon: 9.872677, time_offset_ms: 17214},
      %Video.TimedPoint{lat: 53.59172, lon: 9.872572, time_offset_ms: 17547},
      %Video.TimedPoint{lat: 53.59177, lon: 9.87246, time_offset_ms: 17881},
      %Video.TimedPoint{lat: 53.591822, lon: 9.872358, time_offset_ms: 18214},
      %Video.TimedPoint{lat: 53.591869, lon: 9.872269, time_offset_ms: 18548},
      %Video.TimedPoint{lat: 53.591923, lon: 9.872184, time_offset_ms: 18882},
      %Video.TimedPoint{lat: 53.591986, lon: 9.872109, time_offset_ms: 19215},
      %Video.TimedPoint{lat: 53.592045, lon: 9.872025, time_offset_ms: 19549},
      %Video.TimedPoint{lat: 53.592107, lon: 9.87193, time_offset_ms: 19882},
      %Video.TimedPoint{lat: 53.592165, lon: 9.871838, time_offset_ms: 20216},
      %Video.TimedPoint{lat: 53.592228, lon: 9.871749, time_offset_ms: 20550},
      %Video.TimedPoint{lat: 53.592295, lon: 9.871656, time_offset_ms: 20883},
      %Video.TimedPoint{lat: 53.592365, lon: 9.871571, time_offset_ms: 21217},
      %Video.TimedPoint{lat: 53.592436, lon: 9.871483, time_offset_ms: 21550},
      %Video.TimedPoint{lat: 53.592508, lon: 9.871391, time_offset_ms: 21884},
      %Video.TimedPoint{lat: 53.592578, lon: 9.871308, time_offset_ms: 22218},
      %Video.TimedPoint{lat: 53.592642, lon: 9.871224, time_offset_ms: 22551},
      %Video.TimedPoint{lat: 53.592709, lon: 9.871149, time_offset_ms: 22885},
      %Video.TimedPoint{lat: 53.592781, lon: 9.871078, time_offset_ms: 23218},
      %Video.TimedPoint{lat: 53.592851, lon: 9.871007, time_offset_ms: 23552},
      %Video.TimedPoint{lat: 53.592923, lon: 9.870934, time_offset_ms: 23886},
      %Video.TimedPoint{lat: 53.592995, lon: 9.870866, time_offset_ms: 24219},
      %Video.TimedPoint{lat: 53.593065, lon: 9.870803, time_offset_ms: 24553},
      %Video.TimedPoint{lat: 53.593131, lon: 9.870739, time_offset_ms: 24886},
      %Video.TimedPoint{lat: 53.593191, lon: 9.87068, time_offset_ms: 25220},
      %Video.TimedPoint{lat: 53.593245, lon: 9.870624, time_offset_ms: 25554},
      %Video.TimedPoint{lat: 53.593294, lon: 9.870574, time_offset_ms: 25887},
      %Video.TimedPoint{lat: 53.59333, lon: 9.870537, time_offset_ms: 26221},
      %Video.TimedPoint{lat: 53.593352, lon: 9.870509, time_offset_ms: 26554},
      %Video.TimedPoint{lat: 53.593365, lon: 9.870492, time_offset_ms: 26888},
      %Video.TimedPoint{lat: 53.593373, lon: 9.870481, time_offset_ms: 27222},
      %Video.TimedPoint{lat: 53.593383, lon: 9.870468, time_offset_ms: 27555},
      %Video.TimedPoint{lat: 53.593391, lon: 9.870459, time_offset_ms: 27889},
      %Video.TimedPoint{lat: 53.593396, lon: 9.870453, time_offset_ms: 28222},
      %Video.TimedPoint{lat: 53.593403, lon: 9.870443, time_offset_ms: 28556},
      %Video.TimedPoint{lat: 53.593429, lon: 9.870413, time_offset_ms: 28890},
      %Video.TimedPoint{lat: 53.593465, lon: 9.870376, time_offset_ms: 29223},
      %Video.TimedPoint{lat: 53.59351, lon: 9.870326, time_offset_ms: 29557},
      %Video.TimedPoint{lat: 53.593564, lon: 9.87027, time_offset_ms: 29890},
      %Video.TimedPoint{lat: 53.593627, lon: 9.870207, time_offset_ms: 30224},
      %Video.TimedPoint{lat: 53.59369, lon: 9.870138, time_offset_ms: 30558},
      %Video.TimedPoint{lat: 53.593756, lon: 9.870068, time_offset_ms: 30891},
      %Video.TimedPoint{lat: 53.593827, lon: 9.869996, time_offset_ms: 31225},
      %Video.TimedPoint{lat: 53.593897, lon: 9.869917, time_offset_ms: 31558},
      %Video.TimedPoint{lat: 53.593972, lon: 9.869844, time_offset_ms: 31892},
      %Video.TimedPoint{lat: 53.594047, lon: 9.869771, time_offset_ms: 32226},
      %Video.TimedPoint{lat: 53.594124, lon: 9.869688, time_offset_ms: 32559},
      %Video.TimedPoint{lat: 53.594198, lon: 9.869604, time_offset_ms: 32893},
      %Video.TimedPoint{lat: 53.594273, lon: 9.869525, time_offset_ms: 33226},
      %Video.TimedPoint{lat: 53.594348, lon: 9.869447, time_offset_ms: 33560},
      %Video.TimedPoint{lat: 53.594422, lon: 9.869363, time_offset_ms: 33894},
      %Video.TimedPoint{lat: 53.594499, lon: 9.869279, time_offset_ms: 34227},
      %Video.TimedPoint{lat: 53.594575, lon: 9.869196, time_offset_ms: 34561},
      %Video.TimedPoint{lat: 53.594652, lon: 9.86911, time_offset_ms: 34894},
      %Video.TimedPoint{lat: 53.594729, lon: 9.869027, time_offset_ms: 35228},
      %Video.TimedPoint{lat: 53.594809, lon: 9.868943, time_offset_ms: 35562},
      %Video.TimedPoint{lat: 53.594886, lon: 9.868861, time_offset_ms: 35895},
      %Video.TimedPoint{lat: 53.594965, lon: 9.868777, time_offset_ms: 36229},
      %Video.TimedPoint{lat: 53.595041, lon: 9.868695, time_offset_ms: 36562},
      %Video.TimedPoint{lat: 53.595118, lon: 9.868614, time_offset_ms: 36896},
      %Video.TimedPoint{lat: 53.595193, lon: 9.868527, time_offset_ms: 37230},
      %Video.TimedPoint{lat: 53.595267, lon: 9.868445, time_offset_ms: 37563},
      %Video.TimedPoint{lat: 53.595341, lon: 9.868365, time_offset_ms: 37897},
      %Video.TimedPoint{lat: 53.595415, lon: 9.868284, time_offset_ms: 38230},
      %Video.TimedPoint{lat: 53.595491, lon: 9.868203, time_offset_ms: 38564},
      %Video.TimedPoint{lat: 53.595563, lon: 9.868125, time_offset_ms: 38898},
      %Video.TimedPoint{lat: 53.595638, lon: 9.868045, time_offset_ms: 39231},
      %Video.TimedPoint{lat: 53.59571, lon: 9.867962, time_offset_ms: 39565},
      %Video.TimedPoint{lat: 53.595779, lon: 9.86788, time_offset_ms: 39898},
      %Video.TimedPoint{lat: 53.59585, lon: 9.867797, time_offset_ms: 40232},
      %Video.TimedPoint{lat: 53.595921, lon: 9.867711, time_offset_ms: 40566},
      %Video.TimedPoint{lat: 53.595989, lon: 9.867623, time_offset_ms: 40899},
      %Video.TimedPoint{lat: 53.596059, lon: 9.86753, time_offset_ms: 41233},
      %Video.TimedPoint{lat: 53.596124, lon: 9.867435, time_offset_ms: 41566},
      %Video.TimedPoint{lat: 53.596187, lon: 9.86734, time_offset_ms: 41900},
      %Video.TimedPoint{lat: 53.596246, lon: 9.867246, time_offset_ms: 42234},
      %Video.TimedPoint{lat: 53.596303, lon: 9.86715, time_offset_ms: 42567},
      %Video.TimedPoint{lat: 53.596359, lon: 9.867056, time_offset_ms: 42901},
      %Video.TimedPoint{lat: 53.596413, lon: 9.866962, time_offset_ms: 43234},
      %Video.TimedPoint{lat: 53.596469, lon: 9.866864, time_offset_ms: 43568},
      %Video.TimedPoint{lat: 53.59652, lon: 9.866766, time_offset_ms: 43902},
      %Video.TimedPoint{lat: 53.596569, lon: 9.866666, time_offset_ms: 44235},
      %Video.TimedPoint{lat: 53.596619, lon: 9.866562, time_offset_ms: 44569},
      %Video.TimedPoint{lat: 53.596668, lon: 9.866455, time_offset_ms: 44902},
      %Video.TimedPoint{lat: 53.596715, lon: 9.866342, time_offset_ms: 45236},
      %Video.TimedPoint{lat: 53.596763, lon: 9.86623, time_offset_ms: 45570},
      %Video.TimedPoint{lat: 53.596811, lon: 9.866117, time_offset_ms: 45903},
      %Video.TimedPoint{lat: 53.596857, lon: 9.866001, time_offset_ms: 46237},
      %Video.TimedPoint{lat: 53.596902, lon: 9.865877, time_offset_ms: 46570},
      %Video.TimedPoint{lat: 53.596945, lon: 9.865758, time_offset_ms: 46904},
      %Video.TimedPoint{lat: 53.596986, lon: 9.865632, time_offset_ms: 47238},
      %Video.TimedPoint{lat: 53.59703, lon: 9.865509, time_offset_ms: 47571},
      %Video.TimedPoint{lat: 53.597074, lon: 9.865384, time_offset_ms: 47905},
      %Video.TimedPoint{lat: 53.59712, lon: 9.865263, time_offset_ms: 48238},
      %Video.TimedPoint{lat: 53.597162, lon: 9.865143, time_offset_ms: 48572},
      %Video.TimedPoint{lat: 53.597201, lon: 9.865019, time_offset_ms: 48906},
      %Video.TimedPoint{lat: 53.597246, lon: 9.864894, time_offset_ms: 49239},
      %Video.TimedPoint{lat: 53.59729, lon: 9.864767, time_offset_ms: 49573},
      %Video.TimedPoint{lat: 53.597326, lon: 9.864635, time_offset_ms: 49906},
      %Video.TimedPoint{lat: 53.597358, lon: 9.864509, time_offset_ms: 50240},
      %Video.TimedPoint{lat: 53.597377, lon: 9.864372, time_offset_ms: 50574},
      %Video.TimedPoint{lat: 53.597397, lon: 9.864233, time_offset_ms: 50907},
      %Video.TimedPoint{lat: 53.59743, lon: 9.864097, time_offset_ms: 51241},
      %Video.TimedPoint{lat: 53.597464, lon: 9.863963, time_offset_ms: 51574},
      %Video.TimedPoint{lat: 53.597495, lon: 9.863831, time_offset_ms: 51908},
      %Video.TimedPoint{lat: 53.597523, lon: 9.863697, time_offset_ms: 52242},
      %Video.TimedPoint{lat: 53.597551, lon: 9.863564, time_offset_ms: 52575},
      %Video.TimedPoint{lat: 53.597578, lon: 9.863433, time_offset_ms: 52909},
      %Video.TimedPoint{lat: 53.597606, lon: 9.863299, time_offset_ms: 53242},
      %Video.TimedPoint{lat: 53.59763, lon: 9.863166, time_offset_ms: 53576},
      %Video.TimedPoint{lat: 53.597651, lon: 9.863037, time_offset_ms: 53910},
      %Video.TimedPoint{lat: 53.597676, lon: 9.862911, time_offset_ms: 54243},
      %Video.TimedPoint{lat: 53.597702, lon: 9.862781, time_offset_ms: 54577},
      %Video.TimedPoint{lat: 53.597725, lon: 9.862654, time_offset_ms: 54910},
      %Video.TimedPoint{lat: 53.597747, lon: 9.862531, time_offset_ms: 55244},
      %Video.TimedPoint{lat: 53.597769, lon: 9.862411, time_offset_ms: 55578},
      %Video.TimedPoint{lat: 53.59779, lon: 9.862301, time_offset_ms: 55911},
      %Video.TimedPoint{lat: 53.59781, lon: 9.862186, time_offset_ms: 56245},
      %Video.TimedPoint{lat: 53.597832, lon: 9.862065, time_offset_ms: 56578},
      %Video.TimedPoint{lat: 53.597853, lon: 9.861945, time_offset_ms: 56912},
      %Video.TimedPoint{lat: 53.59787, lon: 9.861821, time_offset_ms: 57246},
      %Video.TimedPoint{lat: 53.597888, lon: 9.861697, time_offset_ms: 57579},
      %Video.TimedPoint{lat: 53.597904, lon: 9.861576, time_offset_ms: 57913},
      %Video.TimedPoint{lat: 53.597922, lon: 9.861453, time_offset_ms: 58246},
      %Video.TimedPoint{lat: 53.597939, lon: 9.861325, time_offset_ms: 58580},
      %Video.TimedPoint{lat: 53.597953, lon: 9.861201, time_offset_ms: 58914},
      %Video.TimedPoint{lat: 53.597971, lon: 9.861078, time_offset_ms: 59247},
      %Video.TimedPoint{lat: 53.597984, lon: 9.860945, time_offset_ms: 59581},
      %Video.TimedPoint{lat: 53.597995, lon: 9.860815, time_offset_ms: 59914},
      %Video.TimedPoint{lat: 53.598005, lon: 9.860685, time_offset_ms: 60248},
      %Video.TimedPoint{lat: 53.598015, lon: 9.860554, time_offset_ms: 60582},
      %Video.TimedPoint{lat: 53.598027, lon: 9.860423, time_offset_ms: 60915},
      %Video.TimedPoint{lat: 53.598038, lon: 9.860294, time_offset_ms: 61249},
      %Video.TimedPoint{lat: 53.598049, lon: 9.86016, time_offset_ms: 61582},
      %Video.TimedPoint{lat: 53.598055, lon: 9.860028, time_offset_ms: 61916},
      %Video.TimedPoint{lat: 53.59806, lon: 9.859896, time_offset_ms: 62250},
      %Video.TimedPoint{lat: 53.59807, lon: 9.859761, time_offset_ms: 62583},
      %Video.TimedPoint{lat: 53.598076, lon: 9.859629, time_offset_ms: 62917},
      %Video.TimedPoint{lat: 53.59808, lon: 9.859496, time_offset_ms: 63250},
      %Video.TimedPoint{lat: 53.598085, lon: 9.859359, time_offset_ms: 63584},
      %Video.TimedPoint{lat: 53.598086, lon: 9.859224, time_offset_ms: 63918},
      %Video.TimedPoint{lat: 53.598089, lon: 9.859088, time_offset_ms: 64251},
      %Video.TimedPoint{lat: 53.598095, lon: 9.858945, time_offset_ms: 64585},
      %Video.TimedPoint{lat: 53.5981, lon: 9.858801, time_offset_ms: 64918},
      %Video.TimedPoint{lat: 53.598106, lon: 9.858657, time_offset_ms: 65252},
      %Video.TimedPoint{lat: 53.598112, lon: 9.85851, time_offset_ms: 65586},
      %Video.TimedPoint{lat: 53.598117, lon: 9.858369, time_offset_ms: 65919},
      %Video.TimedPoint{lat: 53.598122, lon: 9.858224, time_offset_ms: 66253},
      %Video.TimedPoint{lat: 53.598131, lon: 9.858085, time_offset_ms: 66586},
      %Video.TimedPoint{lat: 53.598138, lon: 9.857942, time_offset_ms: 66920},
      %Video.TimedPoint{lat: 53.598144, lon: 9.857799, time_offset_ms: 67254},
      %Video.TimedPoint{lat: 53.598149, lon: 9.857657, time_offset_ms: 67587},
      %Video.TimedPoint{lat: 53.598154, lon: 9.857519, time_offset_ms: 67921},
      %Video.TimedPoint{lat: 53.598164, lon: 9.857382, time_offset_ms: 68254},
      %Video.TimedPoint{lat: 53.598169, lon: 9.857238, time_offset_ms: 68588},
      %Video.TimedPoint{lat: 53.598174, lon: 9.857098, time_offset_ms: 68922},
      %Video.TimedPoint{lat: 53.598178, lon: 9.856957, time_offset_ms: 69255},
      %Video.TimedPoint{lat: 53.598185, lon: 9.856818, time_offset_ms: 69589},
      %Video.TimedPoint{lat: 53.598194, lon: 9.856683, time_offset_ms: 69922},
      %Video.TimedPoint{lat: 53.598204, lon: 9.856546, time_offset_ms: 70256},
      %Video.TimedPoint{lat: 53.598212, lon: 9.856417, time_offset_ms: 70590},
      %Video.TimedPoint{lat: 53.598221, lon: 9.856282, time_offset_ms: 70923},
      %Video.TimedPoint{lat: 53.59823, lon: 9.85613, time_offset_ms: 71257},
      %Video.TimedPoint{lat: 53.598236, lon: 9.855966, time_offset_ms: 71590},
      %Video.TimedPoint{lat: 53.598238, lon: 9.855791, time_offset_ms: 71924},
      %Video.TimedPoint{lat: 53.598238, lon: 9.855617, time_offset_ms: 72258},
      %Video.TimedPoint{lat: 53.598246, lon: 9.855457, time_offset_ms: 72591},
      %Video.TimedPoint{lat: 53.598255, lon: 9.855301, time_offset_ms: 72925},
      %Video.TimedPoint{lat: 53.598262, lon: 9.855145, time_offset_ms: 73258},
      %Video.TimedPoint{lat: 53.598271, lon: 9.854997, time_offset_ms: 73592},
      %Video.TimedPoint{lat: 53.598282, lon: 9.854853, time_offset_ms: 73926},
      %Video.TimedPoint{lat: 53.598296, lon: 9.854707, time_offset_ms: 74259},
      %Video.TimedPoint{lat: 53.598312, lon: 9.854568, time_offset_ms: 74593},
      %Video.TimedPoint{lat: 53.59833, lon: 9.854432, time_offset_ms: 74926},
      %Video.TimedPoint{lat: 53.598343, lon: 9.854289, time_offset_ms: 75260},
      %Video.TimedPoint{lat: 53.598355, lon: 9.85415, time_offset_ms: 75594},
      %Video.TimedPoint{lat: 53.598368, lon: 9.85401, time_offset_ms: 75927},
      %Video.TimedPoint{lat: 53.598384, lon: 9.85387, time_offset_ms: 76261},
      %Video.TimedPoint{lat: 53.59839745345345, lon: 9.853760690690692, time_offset_ms: 76541}
    ]
  end
end