defmodule Data.AutoGenerated.Video.Rendered_05a39727e1398686b5c7fc33c2de906b do
  @moduledoc "#{"pinneberg-veloroute-1: von Prisdorf zum Zentrum"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "pinneberg-veloroute-1: von Prisdorf zum Zentrum"
  end

  @impl Video.Rendered
  def hash() do
    "05a39727e1398686b5c7fc33c2de906b"
  end

  @impl Video.Rendered
  def length_ms() do
    139_276
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-02-27-pinneberg/GX013244", "00:00:10.644", :end},
      {"2022-02-27-pinneberg/GX013245", :start, :end},
      {"2022-02-27-pinneberg/GX013246", :start, :end},
      {"2022-02-27-pinneberg/GX013247", :start, "00:01:40.949"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.67477463363364,
      maxLon: 9.795845,
      minLat: 53.66142,
      minLon: 9.771168204204203
    }
  end

  @impl Video.Rendered
  def renderer() do
    2
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.67477463363364, lon: 9.771168204204203, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.674767, lon: 9.771175, time_offset_ms: 31},
      %Video.TimedPoint{lat: 53.674683, lon: 9.77125, time_offset_ms: 365},
      %Video.TimedPoint{lat: 53.674606, lon: 9.771321, time_offset_ms: 698},
      %Video.TimedPoint{lat: 53.674523, lon: 9.771396, time_offset_ms: 1032},
      %Video.TimedPoint{lat: 53.674444, lon: 9.771468, time_offset_ms: 1366},
      %Video.TimedPoint{lat: 53.674366, lon: 9.771537, time_offset_ms: 1699},
      %Video.TimedPoint{lat: 53.674286, lon: 9.771609, time_offset_ms: 2033},
      %Video.TimedPoint{lat: 53.674208, lon: 9.77168, time_offset_ms: 2366},
      %Video.TimedPoint{lat: 53.674135, lon: 9.771751, time_offset_ms: 2700},
      %Video.TimedPoint{lat: 53.674064, lon: 9.771828, time_offset_ms: 3034},
      %Video.TimedPoint{lat: 53.673993, lon: 9.771902, time_offset_ms: 3367},
      %Video.TimedPoint{lat: 53.673922, lon: 9.77197, time_offset_ms: 3701},
      %Video.TimedPoint{lat: 53.673853, lon: 9.772038, time_offset_ms: 4034},
      %Video.TimedPoint{lat: 53.673782, lon: 9.772102, time_offset_ms: 4368},
      %Video.TimedPoint{lat: 53.673712, lon: 9.772165, time_offset_ms: 4702},
      %Video.TimedPoint{lat: 53.673643, lon: 9.772229, time_offset_ms: 5035},
      %Video.TimedPoint{lat: 53.673575, lon: 9.772292, time_offset_ms: 5369},
      %Video.TimedPoint{lat: 53.673505, lon: 9.772353, time_offset_ms: 5702},
      %Video.TimedPoint{lat: 53.673434, lon: 9.772417, time_offset_ms: 6036},
      %Video.TimedPoint{lat: 53.673368, lon: 9.772482, time_offset_ms: 6370},
      %Video.TimedPoint{lat: 53.673305, lon: 9.772551, time_offset_ms: 6703},
      %Video.TimedPoint{lat: 53.673245, lon: 9.772626, time_offset_ms: 7037},
      %Video.TimedPoint{lat: 53.67319, lon: 9.772712, time_offset_ms: 7370},
      %Video.TimedPoint{lat: 53.673132, lon: 9.772807, time_offset_ms: 7704},
      %Video.TimedPoint{lat: 53.673075, lon: 9.772902, time_offset_ms: 8038},
      %Video.TimedPoint{lat: 53.673021, lon: 9.773001, time_offset_ms: 8371},
      %Video.TimedPoint{lat: 53.672969, lon: 9.773096, time_offset_ms: 8705},
      %Video.TimedPoint{lat: 53.672921, lon: 9.773192, time_offset_ms: 9038},
      %Video.TimedPoint{lat: 53.672874, lon: 9.773291, time_offset_ms: 9372},
      %Video.TimedPoint{lat: 53.67283, lon: 9.773387, time_offset_ms: 9706},
      %Video.TimedPoint{lat: 53.672784, lon: 9.773483, time_offset_ms: 10039},
      %Video.TimedPoint{lat: 53.672737, lon: 9.773582, time_offset_ms: 10373},
      %Video.TimedPoint{lat: 53.672693, lon: 9.773677, time_offset_ms: 10706},
      %Video.TimedPoint{lat: 53.67265, lon: 9.773771, time_offset_ms: 11040},
      %Video.TimedPoint{lat: 53.672606, lon: 9.773868, time_offset_ms: 11374},
      %Video.TimedPoint{lat: 53.672564, lon: 9.773961, time_offset_ms: 11707},
      %Video.TimedPoint{lat: 53.672521, lon: 9.774052, time_offset_ms: 12041},
      %Video.TimedPoint{lat: 53.67248, lon: 9.774143, time_offset_ms: 12374},
      %Video.TimedPoint{lat: 53.67244, lon: 9.774231, time_offset_ms: 12708},
      %Video.TimedPoint{lat: 53.6724, lon: 9.774319, time_offset_ms: 13042},
      %Video.TimedPoint{lat: 53.672359, lon: 9.774409, time_offset_ms: 13375},
      %Video.TimedPoint{lat: 53.672317, lon: 9.774503, time_offset_ms: 13709},
      %Video.TimedPoint{lat: 53.672277, lon: 9.774592, time_offset_ms: 14042},
      %Video.TimedPoint{lat: 53.67224, lon: 9.774689, time_offset_ms: 14376},
      %Video.TimedPoint{lat: 53.67221, lon: 9.774788, time_offset_ms: 14710},
      %Video.TimedPoint{lat: 53.672183, lon: 9.774893, time_offset_ms: 15043},
      %Video.TimedPoint{lat: 53.672164, lon: 9.775004, time_offset_ms: 15377},
      %Video.TimedPoint{lat: 53.672144, lon: 9.775114, time_offset_ms: 15710},
      %Video.TimedPoint{lat: 53.67211, lon: 9.775217, time_offset_ms: 16044},
      %Video.TimedPoint{lat: 53.672072, lon: 9.775304, time_offset_ms: 16378},
      %Video.TimedPoint{lat: 53.672034, lon: 9.775388, time_offset_ms: 16711},
      %Video.TimedPoint{lat: 53.671995, lon: 9.775469, time_offset_ms: 17045},
      %Video.TimedPoint{lat: 53.671956, lon: 9.775554, time_offset_ms: 17378},
      %Video.TimedPoint{lat: 53.671918, lon: 9.775642, time_offset_ms: 17712},
      %Video.TimedPoint{lat: 53.671878, lon: 9.77573, time_offset_ms: 18046},
      %Video.TimedPoint{lat: 53.671838, lon: 9.775819, time_offset_ms: 18379},
      %Video.TimedPoint{lat: 53.671799, lon: 9.775914, time_offset_ms: 18713},
      %Video.TimedPoint{lat: 53.671757, lon: 9.776004, time_offset_ms: 19046},
      %Video.TimedPoint{lat: 53.671713, lon: 9.776097, time_offset_ms: 19380},
      %Video.TimedPoint{lat: 53.671673, lon: 9.776187, time_offset_ms: 19714},
      %Video.TimedPoint{lat: 53.671629, lon: 9.776276, time_offset_ms: 20047},
      %Video.TimedPoint{lat: 53.671585, lon: 9.776367, time_offset_ms: 20381},
      %Video.TimedPoint{lat: 53.671545, lon: 9.776453, time_offset_ms: 20714},
      %Video.TimedPoint{lat: 53.671507, lon: 9.77654, time_offset_ms: 21048},
      %Video.TimedPoint{lat: 53.67147, lon: 9.776626, time_offset_ms: 21382},
      %Video.TimedPoint{lat: 53.671429, lon: 9.7767, time_offset_ms: 21715},
      %Video.TimedPoint{lat: 53.671387, lon: 9.776771, time_offset_ms: 22049},
      %Video.TimedPoint{lat: 53.671349, lon: 9.776854, time_offset_ms: 22382},
      %Video.TimedPoint{lat: 53.671312, lon: 9.776943, time_offset_ms: 22716},
      %Video.TimedPoint{lat: 53.671274, lon: 9.777035, time_offset_ms: 23049},
      %Video.TimedPoint{lat: 53.671234, lon: 9.777124, time_offset_ms: 23383},
      %Video.TimedPoint{lat: 53.671195, lon: 9.77721, time_offset_ms: 23717},
      %Video.TimedPoint{lat: 53.671154, lon: 9.777293, time_offset_ms: 24050},
      %Video.TimedPoint{lat: 53.671113, lon: 9.777379, time_offset_ms: 24384},
      %Video.TimedPoint{lat: 53.671073, lon: 9.777465, time_offset_ms: 24717},
      %Video.TimedPoint{lat: 53.671034, lon: 9.77755, time_offset_ms: 25051},
      %Video.TimedPoint{lat: 53.670994, lon: 9.777641, time_offset_ms: 25385},
      %Video.TimedPoint{lat: 53.670954, lon: 9.777724, time_offset_ms: 25718},
      %Video.TimedPoint{lat: 53.670914, lon: 9.777804, time_offset_ms: 26052},
      %Video.TimedPoint{lat: 53.670879, lon: 9.777889, time_offset_ms: 26385},
      %Video.TimedPoint{lat: 53.670843, lon: 9.777976, time_offset_ms: 26719},
      %Video.TimedPoint{lat: 53.670807, lon: 9.778067, time_offset_ms: 27053},
      %Video.TimedPoint{lat: 53.670771, lon: 9.778156, time_offset_ms: 27386},
      %Video.TimedPoint{lat: 53.670733, lon: 9.778248, time_offset_ms: 27720},
      %Video.TimedPoint{lat: 53.670694, lon: 9.778336, time_offset_ms: 28053},
      %Video.TimedPoint{lat: 53.670655, lon: 9.778424, time_offset_ms: 28387},
      %Video.TimedPoint{lat: 53.670617, lon: 9.778509, time_offset_ms: 28721},
      %Video.TimedPoint{lat: 53.670576, lon: 9.778598, time_offset_ms: 29054},
      %Video.TimedPoint{lat: 53.670538, lon: 9.778687, time_offset_ms: 29388},
      %Video.TimedPoint{lat: 53.670503, lon: 9.778774, time_offset_ms: 29721},
      %Video.TimedPoint{lat: 53.670471, lon: 9.778854, time_offset_ms: 30055},
      %Video.TimedPoint{lat: 53.670439, lon: 9.778939, time_offset_ms: 30389},
      %Video.TimedPoint{lat: 53.670413, lon: 9.779031, time_offset_ms: 30722},
      %Video.TimedPoint{lat: 53.670387, lon: 9.779126, time_offset_ms: 31056},
      %Video.TimedPoint{lat: 53.670363, lon: 9.779222, time_offset_ms: 31389},
      %Video.TimedPoint{lat: 53.670338, lon: 9.779314, time_offset_ms: 31723},
      %Video.TimedPoint{lat: 53.670315, lon: 9.779401, time_offset_ms: 32057},
      %Video.TimedPoint{lat: 53.670294, lon: 9.779491, time_offset_ms: 32390},
      %Video.TimedPoint{lat: 53.670274, lon: 9.779581, time_offset_ms: 32724},
      %Video.TimedPoint{lat: 53.670258, lon: 9.779675, time_offset_ms: 33057},
      %Video.TimedPoint{lat: 53.670248, lon: 9.779769, time_offset_ms: 33391},
      %Video.TimedPoint{lat: 53.670251, lon: 9.779849, time_offset_ms: 33725},
      %Video.TimedPoint{lat: 53.670257, lon: 9.779907, time_offset_ms: 34058},
      %Video.TimedPoint{lat: 53.670256, lon: 9.779955, time_offset_ms: 34392},
      %Video.TimedPoint{lat: 53.6702505945946, lon: 9.779970615615614, time_offset_ms: 34592},
      %Video.TimedPoint{lat: 53.670215, lon: 9.779973, time_offset_ms: 34592},
      %Video.TimedPoint{lat: 53.670206, lon: 9.77998, time_offset_ms: 34926},
      %Video.TimedPoint{lat: 53.670177, lon: 9.779996, time_offset_ms: 35259},
      %Video.TimedPoint{lat: 53.670152, lon: 9.780027, time_offset_ms: 35593},
      %Video.TimedPoint{lat: 53.670142, lon: 9.780061, time_offset_ms: 35926},
      %Video.TimedPoint{lat: 53.670135, lon: 9.780075, time_offset_ms: 36260},
      %Video.TimedPoint{lat: 53.6701337987988, lon: 9.780078603603602, time_offset_ms: 36460},
      %Video.TimedPoint{lat: 53.670132, lon: 9.780096, time_offset_ms: 36460},
      %Video.TimedPoint{lat: 53.670127, lon: 9.780106, time_offset_ms: 36794},
      %Video.TimedPoint{lat: 53.670109, lon: 9.78015, time_offset_ms: 37127},
      %Video.TimedPoint{lat: 53.670087, lon: 9.780211, time_offset_ms: 37461},
      %Video.TimedPoint{lat: 53.670065, lon: 9.780281, time_offset_ms: 37794},
      %Video.TimedPoint{lat: 53.670039, lon: 9.780344, time_offset_ms: 38128},
      %Video.TimedPoint{lat: 53.67001, lon: 9.780391, time_offset_ms: 38462},
      %Video.TimedPoint{lat: 53.66999798798798, lon: 9.780404813813814, time_offset_ms: 38662},
      %Video.TimedPoint{lat: 53.670019, lon: 9.780425, time_offset_ms: 38662},
      %Video.TimedPoint{lat: 53.670009, lon: 9.780417, time_offset_ms: 38996},
      %Video.TimedPoint{lat: 53.669979, lon: 9.780379, time_offset_ms: 39329},
      %Video.TimedPoint{lat: 53.669939, lon: 9.780334, time_offset_ms: 39663},
      %Video.TimedPoint{lat: 53.66989, lon: 9.780307, time_offset_ms: 39996},
      %Video.TimedPoint{lat: 53.669847, lon: 9.780349, time_offset_ms: 40330},
      %Video.TimedPoint{lat: 53.669816, lon: 9.780432, time_offset_ms: 40664},
      %Video.TimedPoint{lat: 53.669789, lon: 9.780529, time_offset_ms: 40997},
      %Video.TimedPoint{lat: 53.669755, lon: 9.780632, time_offset_ms: 41331},
      %Video.TimedPoint{lat: 53.669722, lon: 9.780732, time_offset_ms: 41664},
      %Video.TimedPoint{lat: 53.669693, lon: 9.780831, time_offset_ms: 41998},
      %Video.TimedPoint{lat: 53.669664, lon: 9.780929, time_offset_ms: 42332},
      %Video.TimedPoint{lat: 53.669633, lon: 9.781022, time_offset_ms: 42665},
      %Video.TimedPoint{lat: 53.669605, lon: 9.781119, time_offset_ms: 42999},
      %Video.TimedPoint{lat: 53.669581, lon: 9.781223, time_offset_ms: 43332},
      %Video.TimedPoint{lat: 53.669557, lon: 9.781324, time_offset_ms: 43666},
      %Video.TimedPoint{lat: 53.669533, lon: 9.781422, time_offset_ms: 44000},
      %Video.TimedPoint{lat: 53.669504, lon: 9.781517, time_offset_ms: 44333},
      %Video.TimedPoint{lat: 53.669474, lon: 9.781611, time_offset_ms: 44667},
      %Video.TimedPoint{lat: 53.669442, lon: 9.781708, time_offset_ms: 45000},
      %Video.TimedPoint{lat: 53.669411, lon: 9.781809, time_offset_ms: 45334},
      %Video.TimedPoint{lat: 53.669379, lon: 9.781909, time_offset_ms: 45668},
      %Video.TimedPoint{lat: 53.669348, lon: 9.782011, time_offset_ms: 46001},
      %Video.TimedPoint{lat: 53.669318, lon: 9.782115, time_offset_ms: 46335},
      %Video.TimedPoint{lat: 53.669289, lon: 9.782216, time_offset_ms: 46668},
      %Video.TimedPoint{lat: 53.669258, lon: 9.782323, time_offset_ms: 47002},
      %Video.TimedPoint{lat: 53.669227, lon: 9.782427, time_offset_ms: 47336},
      %Video.TimedPoint{lat: 53.669193, lon: 9.782535, time_offset_ms: 47669},
      %Video.TimedPoint{lat: 53.66916, lon: 9.782644, time_offset_ms: 48003},
      %Video.TimedPoint{lat: 53.669127, lon: 9.782749, time_offset_ms: 48336},
      %Video.TimedPoint{lat: 53.669096, lon: 9.782854, time_offset_ms: 48670},
      %Video.TimedPoint{lat: 53.669063, lon: 9.782962, time_offset_ms: 49004},
      %Video.TimedPoint{lat: 53.669026, lon: 9.783068, time_offset_ms: 49337},
      %Video.TimedPoint{lat: 53.66899, lon: 9.783169, time_offset_ms: 49671},
      %Video.TimedPoint{lat: 53.668952, lon: 9.783267, time_offset_ms: 50004},
      %Video.TimedPoint{lat: 53.668915, lon: 9.783366, time_offset_ms: 50338},
      %Video.TimedPoint{lat: 53.66888, lon: 9.783464, time_offset_ms: 50672},
      %Video.TimedPoint{lat: 53.668846, lon: 9.783555, time_offset_ms: 51005},
      %Video.TimedPoint{lat: 53.668809, lon: 9.783647, time_offset_ms: 51339},
      %Video.TimedPoint{lat: 53.668771, lon: 9.783743, time_offset_ms: 51672},
      %Video.TimedPoint{lat: 53.668732, lon: 9.78384, time_offset_ms: 52006},
      %Video.TimedPoint{lat: 53.668694, lon: 9.783932, time_offset_ms: 52340},
      %Video.TimedPoint{lat: 53.668655, lon: 9.784021, time_offset_ms: 52673},
      %Video.TimedPoint{lat: 53.668617, lon: 9.784116, time_offset_ms: 53007},
      %Video.TimedPoint{lat: 53.668578, lon: 9.784209, time_offset_ms: 53340},
      %Video.TimedPoint{lat: 53.668547, lon: 9.784294, time_offset_ms: 53674},
      %Video.TimedPoint{lat: 53.668513, lon: 9.78437, time_offset_ms: 54008},
      %Video.TimedPoint{lat: 53.668486, lon: 9.784433, time_offset_ms: 54341},
      %Video.TimedPoint{lat: 53.668466, lon: 9.784487, time_offset_ms: 54675},
      %Video.TimedPoint{lat: 53.668445, lon: 9.784532, time_offset_ms: 55008},
      %Video.TimedPoint{lat: 53.668426, lon: 9.78458, time_offset_ms: 55342},
      %Video.TimedPoint{lat: 53.668405, lon: 9.784623, time_offset_ms: 55676},
      %Video.TimedPoint{lat: 53.668374, lon: 9.784646, time_offset_ms: 56009},
      %Video.TimedPoint{lat: 53.668324, lon: 9.784645, time_offset_ms: 56343},
      %Video.TimedPoint{lat: 53.668266, lon: 9.784624, time_offset_ms: 56676},
      %Video.TimedPoint{lat: 53.668208, lon: 9.784601, time_offset_ms: 57010},
      %Video.TimedPoint{lat: 53.668147, lon: 9.784617, time_offset_ms: 57344},
      %Video.TimedPoint{lat: 53.668078, lon: 9.784634, time_offset_ms: 57677},
      %Video.TimedPoint{lat: 53.668008, lon: 9.784629, time_offset_ms: 58011},
      %Video.TimedPoint{lat: 53.667939, lon: 9.784632, time_offset_ms: 58344},
      %Video.TimedPoint{lat: 53.66787, lon: 9.784642, time_offset_ms: 58678},
      %Video.TimedPoint{lat: 53.667803, lon: 9.78466, time_offset_ms: 59012},
      %Video.TimedPoint{lat: 53.667737, lon: 9.784679, time_offset_ms: 59345},
      %Video.TimedPoint{lat: 53.667672, lon: 9.784701, time_offset_ms: 59679},
      %Video.TimedPoint{lat: 53.667606, lon: 9.78473, time_offset_ms: 60012},
      %Video.TimedPoint{lat: 53.667537, lon: 9.78476, time_offset_ms: 60346},
      %Video.TimedPoint{lat: 53.667468, lon: 9.784783, time_offset_ms: 60680},
      %Video.TimedPoint{lat: 53.667395, lon: 9.784806, time_offset_ms: 61013},
      %Video.TimedPoint{lat: 53.66732, lon: 9.784827, time_offset_ms: 61347},
      %Video.TimedPoint{lat: 53.667246, lon: 9.784838, time_offset_ms: 61680},
      %Video.TimedPoint{lat: 53.667176, lon: 9.784847, time_offset_ms: 62014},
      %Video.TimedPoint{lat: 53.667098, lon: 9.784843, time_offset_ms: 62348},
      %Video.TimedPoint{lat: 53.667024, lon: 9.784809, time_offset_ms: 62681},
      %Video.TimedPoint{lat: 53.666952, lon: 9.784776, time_offset_ms: 63015},
      %Video.TimedPoint{lat: 53.66688, lon: 9.784792, time_offset_ms: 63348},
      %Video.TimedPoint{lat: 53.666826, lon: 9.784873, time_offset_ms: 63682},
      %Video.TimedPoint{lat: 53.666804, lon: 9.784989, time_offset_ms: 64016},
      %Video.TimedPoint{lat: 53.666811, lon: 9.785115, time_offset_ms: 64349},
      %Video.TimedPoint{lat: 53.666815, lon: 9.785239, time_offset_ms: 64683},
      %Video.TimedPoint{lat: 53.666812, lon: 9.785361, time_offset_ms: 65016},
      %Video.TimedPoint{lat: 53.666803, lon: 9.785477, time_offset_ms: 65350},
      %Video.TimedPoint{lat: 53.666787, lon: 9.785596, time_offset_ms: 65684},
      %Video.TimedPoint{lat: 53.666765, lon: 9.785706, time_offset_ms: 66017},
      %Video.TimedPoint{lat: 53.666734, lon: 9.785811, time_offset_ms: 66351},
      %Video.TimedPoint{lat: 53.666693, lon: 9.785904, time_offset_ms: 66684},
      %Video.TimedPoint{lat: 53.666639, lon: 9.78598, time_offset_ms: 67018},
      %Video.TimedPoint{lat: 53.666581, lon: 9.786054, time_offset_ms: 67352},
      %Video.TimedPoint{lat: 53.666527, lon: 9.786136, time_offset_ms: 67685},
      %Video.TimedPoint{lat: 53.666478, lon: 9.78622, time_offset_ms: 68019},
      %Video.TimedPoint{lat: 53.666424, lon: 9.786298, time_offset_ms: 68352},
      %Video.TimedPoint{lat: 53.666367, lon: 9.786365, time_offset_ms: 68686},
      %Video.TimedPoint{lat: 53.666309, lon: 9.786434, time_offset_ms: 69020},
      %Video.TimedPoint{lat: 53.666253, lon: 9.78651, time_offset_ms: 69353},
      %Video.TimedPoint{lat: 53.666198, lon: 9.786598, time_offset_ms: 69687},
      %Video.TimedPoint{lat: 53.666141, lon: 9.78668, time_offset_ms: 70020},
      %Video.TimedPoint{lat: 53.666082, lon: 9.786758, time_offset_ms: 70354},
      %Video.TimedPoint{lat: 53.666019, lon: 9.786828, time_offset_ms: 70688},
      %Video.TimedPoint{lat: 53.665957, lon: 9.786902, time_offset_ms: 71021},
      %Video.TimedPoint{lat: 53.665898, lon: 9.786975, time_offset_ms: 71355},
      %Video.TimedPoint{lat: 53.665838, lon: 9.787052, time_offset_ms: 71688},
      %Video.TimedPoint{lat: 53.665779, lon: 9.78713, time_offset_ms: 72022},
      %Video.TimedPoint{lat: 53.665722, lon: 9.787202, time_offset_ms: 72356},
      %Video.TimedPoint{lat: 53.665671, lon: 9.787273, time_offset_ms: 72689},
      %Video.TimedPoint{lat: 53.665622, lon: 9.787361, time_offset_ms: 73023},
      %Video.TimedPoint{lat: 53.665568, lon: 9.78744, time_offset_ms: 73356},
      %Video.TimedPoint{lat: 53.665506, lon: 9.787498, time_offset_ms: 73690},
      %Video.TimedPoint{lat: 53.66544, lon: 9.787554, time_offset_ms: 74024},
      %Video.TimedPoint{lat: 53.665371, lon: 9.787616, time_offset_ms: 74357},
      %Video.TimedPoint{lat: 53.665301, lon: 9.787677, time_offset_ms: 74691},
      %Video.TimedPoint{lat: 53.665226, lon: 9.787721, time_offset_ms: 75024},
      %Video.TimedPoint{lat: 53.665144, lon: 9.787746, time_offset_ms: 75358},
      %Video.TimedPoint{lat: 53.665063, lon: 9.787772, time_offset_ms: 75692},
      %Video.TimedPoint{lat: 53.66498, lon: 9.787801, time_offset_ms: 76025},
      %Video.TimedPoint{lat: 53.664898, lon: 9.787833, time_offset_ms: 76359},
      %Video.TimedPoint{lat: 53.664826, lon: 9.787862, time_offset_ms: 76692},
      %Video.TimedPoint{lat: 53.66477, lon: 9.787881, time_offset_ms: 77026},
      %Video.TimedPoint{lat: 53.664732, lon: 9.787892, time_offset_ms: 77360},
      %Video.TimedPoint{lat: 53.664695, lon: 9.787903, time_offset_ms: 77693},
      %Video.TimedPoint{lat: 53.664646, lon: 9.78792, time_offset_ms: 78027},
      %Video.TimedPoint{lat: 53.664586, lon: 9.78794, time_offset_ms: 78360},
      %Video.TimedPoint{lat: 53.664519, lon: 9.787967, time_offset_ms: 78694},
      %Video.TimedPoint{lat: 53.664447, lon: 9.787997, time_offset_ms: 79028},
      %Video.TimedPoint{lat: 53.664374, lon: 9.788026, time_offset_ms: 79361},
      %Video.TimedPoint{lat: 53.664294, lon: 9.788055, time_offset_ms: 79695},
      %Video.TimedPoint{lat: 53.664215, lon: 9.788082, time_offset_ms: 80028},
      %Video.TimedPoint{lat: 53.664134, lon: 9.788117, time_offset_ms: 80362},
      %Video.TimedPoint{lat: 53.664051, lon: 9.788152, time_offset_ms: 80696},
      %Video.TimedPoint{lat: 53.663968, lon: 9.788172, time_offset_ms: 81029},
      %Video.TimedPoint{lat: 53.663882, lon: 9.788146, time_offset_ms: 81363},
      %Video.TimedPoint{lat: 53.663805, lon: 9.788107, time_offset_ms: 81696},
      %Video.TimedPoint{lat: 53.663724, lon: 9.788138, time_offset_ms: 82030},
      %Video.TimedPoint{lat: 53.663668, lon: 9.78823, time_offset_ms: 82364},
      %Video.TimedPoint{lat: 53.663611, lon: 9.788328, time_offset_ms: 82697},
      %Video.TimedPoint{lat: 53.663536, lon: 9.788381, time_offset_ms: 83031},
      %Video.TimedPoint{lat: 53.663453, lon: 9.788425, time_offset_ms: 83364},
      %Video.TimedPoint{lat: 53.663365, lon: 9.788475, time_offset_ms: 83698},
      %Video.TimedPoint{lat: 53.663284, lon: 9.788535, time_offset_ms: 84032},
      %Video.TimedPoint{lat: 53.663205, lon: 9.788594, time_offset_ms: 84365},
      %Video.TimedPoint{lat: 53.663134, lon: 9.78864, time_offset_ms: 84699},
      %Video.TimedPoint{lat: 53.663072, lon: 9.788657, time_offset_ms: 85032},
      %Video.TimedPoint{lat: 53.662991, lon: 9.788641, time_offset_ms: 85366},
      %Video.TimedPoint{lat: 53.662919, lon: 9.78858, time_offset_ms: 85700},
      %Video.TimedPoint{lat: 53.66287, lon: 9.788482, time_offset_ms: 86033},
      %Video.TimedPoint{lat: 53.662835, lon: 9.788373, time_offset_ms: 86367},
      %Video.TimedPoint{lat: 53.662794, lon: 9.788259, time_offset_ms: 86700},
      %Video.TimedPoint{lat: 53.662753, lon: 9.788146, time_offset_ms: 87034},
      %Video.TimedPoint{lat: 53.662709, lon: 9.788033, time_offset_ms: 87368},
      %Video.TimedPoint{lat: 53.662662, lon: 9.787926, time_offset_ms: 87701},
      %Video.TimedPoint{lat: 53.662614, lon: 9.787832, time_offset_ms: 88035},
      %Video.TimedPoint{lat: 53.662547, lon: 9.78775, time_offset_ms: 88368},
      %Video.TimedPoint{lat: 53.662479, lon: 9.787692, time_offset_ms: 88702},
      %Video.TimedPoint{lat: 53.66241, lon: 9.787665, time_offset_ms: 89036},
      %Video.TimedPoint{lat: 53.662354, lon: 9.787663, time_offset_ms: 89369},
      %Video.TimedPoint{lat: 53.66231, lon: 9.787679, time_offset_ms: 89703},
      %Video.TimedPoint{lat: 53.662278, lon: 9.787713, time_offset_ms: 90036},
      %Video.TimedPoint{lat: 53.662255, lon: 9.787749, time_offset_ms: 90370},
      %Video.TimedPoint{lat: 53.662235, lon: 9.787772, time_offset_ms: 90704},
      %Video.TimedPoint{lat: 53.662215, lon: 9.787795, time_offset_ms: 91037},
      %Video.TimedPoint{lat: 53.662193, lon: 9.78782, time_offset_ms: 91371},
      %Video.TimedPoint{lat: 53.662173, lon: 9.787848, time_offset_ms: 91704},
      %Video.TimedPoint{lat: 53.662152, lon: 9.787876, time_offset_ms: 92038},
      %Video.TimedPoint{lat: 53.662129, lon: 9.787901, time_offset_ms: 92372},
      %Video.TimedPoint{lat: 53.662106, lon: 9.787921, time_offset_ms: 92705},
      %Video.TimedPoint{lat: 53.662093, lon: 9.787932, time_offset_ms: 93039},
      %Video.TimedPoint{lat: 53.662073, lon: 9.787957, time_offset_ms: 93372},
      %Video.TimedPoint{lat: 53.662035, lon: 9.788006, time_offset_ms: 93706},
      %Video.TimedPoint{lat: 53.66199, lon: 9.788061, time_offset_ms: 94039},
      %Video.TimedPoint{lat: 53.661943, lon: 9.78813, time_offset_ms: 94373},
      %Video.TimedPoint{lat: 53.661889, lon: 9.788203, time_offset_ms: 94707},
      %Video.TimedPoint{lat: 53.661843, lon: 9.788279, time_offset_ms: 95040},
      %Video.TimedPoint{lat: 53.661789, lon: 9.788352, time_offset_ms: 95374},
      %Video.TimedPoint{lat: 53.661733, lon: 9.788415, time_offset_ms: 95707},
      %Video.TimedPoint{lat: 53.661686, lon: 9.788487, time_offset_ms: 96041},
      %Video.TimedPoint{lat: 53.661641, lon: 9.788562, time_offset_ms: 96375},
      %Video.TimedPoint{lat: 53.661588, lon: 9.788632, time_offset_ms: 96708},
      %Video.TimedPoint{lat: 53.661534, lon: 9.788704, time_offset_ms: 97042},
      %Video.TimedPoint{lat: 53.661492, lon: 9.788772, time_offset_ms: 97375},
      %Video.TimedPoint{lat: 53.66145, lon: 9.788849, time_offset_ms: 97709},
      %Video.TimedPoint{lat: 53.66142, lon: 9.788938, time_offset_ms: 98043},
      %Video.TimedPoint{lat: 53.66142, lon: 9.789044, time_offset_ms: 98376},
      %Video.TimedPoint{lat: 53.661421, lon: 9.789156, time_offset_ms: 98710},
      %Video.TimedPoint{lat: 53.661421, lon: 9.789262, time_offset_ms: 99043},
      %Video.TimedPoint{lat: 53.661426, lon: 9.789373, time_offset_ms: 99377},
      %Video.TimedPoint{lat: 53.661433, lon: 9.789477, time_offset_ms: 99711},
      %Video.TimedPoint{lat: 53.661434, lon: 9.789568, time_offset_ms: 100_044},
      %Video.TimedPoint{lat: 53.661436, lon: 9.789651, time_offset_ms: 100_378},
      %Video.TimedPoint{lat: 53.66144, lon: 9.78973, time_offset_ms: 100_711},
      %Video.TimedPoint{lat: 53.661456, lon: 9.789797, time_offset_ms: 101_045},
      %Video.TimedPoint{lat: 53.661489, lon: 9.789856, time_offset_ms: 101_379},
      %Video.TimedPoint{lat: 53.661533, lon: 9.789927, time_offset_ms: 101_712},
      %Video.TimedPoint{lat: 53.661577, lon: 9.790006, time_offset_ms: 102_046},
      %Video.TimedPoint{lat: 53.661608, lon: 9.790092, time_offset_ms: 102_379},
      %Video.TimedPoint{lat: 53.661645, lon: 9.790185, time_offset_ms: 102_713},
      %Video.TimedPoint{lat: 53.661684, lon: 9.790279, time_offset_ms: 103_047},
      %Video.TimedPoint{lat: 53.661713, lon: 9.790383, time_offset_ms: 103_380},
      %Video.TimedPoint{lat: 53.661733, lon: 9.790501, time_offset_ms: 103_714},
      %Video.TimedPoint{lat: 53.661751, lon: 9.790617, time_offset_ms: 104_047},
      %Video.TimedPoint{lat: 53.66175, lon: 9.790734, time_offset_ms: 104_381},
      %Video.TimedPoint{lat: 53.661762, lon: 9.790861, time_offset_ms: 104_715},
      %Video.TimedPoint{lat: 53.661779, lon: 9.790988, time_offset_ms: 105_048},
      %Video.TimedPoint{lat: 53.661786, lon: 9.79111, time_offset_ms: 105_382},
      %Video.TimedPoint{lat: 53.661797, lon: 9.791232, time_offset_ms: 105_715},
      %Video.TimedPoint{lat: 53.661804, lon: 9.791355, time_offset_ms: 106_049},
      %Video.TimedPoint{lat: 53.661814, lon: 9.791477, time_offset_ms: 106_383},
      %Video.TimedPoint{lat: 53.661819, lon: 9.791607, time_offset_ms: 106_716},
      %Video.TimedPoint{lat: 53.661825, lon: 9.791734, time_offset_ms: 107_050},
      %Video.TimedPoint{lat: 53.66183, lon: 9.791858, time_offset_ms: 107_383},
      %Video.TimedPoint{lat: 53.661833, lon: 9.791989, time_offset_ms: 107_717},
      %Video.TimedPoint{lat: 53.661835, lon: 9.792118, time_offset_ms: 108_051},
      %Video.TimedPoint{lat: 53.661841, lon: 9.792243, time_offset_ms: 108_384},
      %Video.TimedPoint{lat: 53.661841, lon: 9.79235, time_offset_ms: 108_718},
      %Video.TimedPoint{lat: 53.661822, lon: 9.792396, time_offset_ms: 109_051},
      %Video.TimedPoint{lat: 53.661818, lon: 9.792438, time_offset_ms: 109_385},
      %Video.TimedPoint{lat: 53.661822, lon: 9.792479, time_offset_ms: 109_719},
      %Video.TimedPoint{lat: 53.66183, lon: 9.79252, time_offset_ms: 110_052},
      %Video.TimedPoint{lat: 53.661832, lon: 9.792562, time_offset_ms: 110_386},
      %Video.TimedPoint{lat: 53.661833, lon: 9.792606, time_offset_ms: 110_719},
      %Video.TimedPoint{lat: 53.661832, lon: 9.792648, time_offset_ms: 111_053},
      %Video.TimedPoint{lat: 53.661833, lon: 9.792689, time_offset_ms: 111_387},
      %Video.TimedPoint{lat: 53.661831, lon: 9.792728, time_offset_ms: 111_720},
      %Video.TimedPoint{lat: 53.661833, lon: 9.792769, time_offset_ms: 112_054},
      %Video.TimedPoint{lat: 53.661839, lon: 9.792808, time_offset_ms: 112_387},
      %Video.TimedPoint{lat: 53.661848, lon: 9.792838, time_offset_ms: 112_721},
      %Video.TimedPoint{lat: 53.661852, lon: 9.792856, time_offset_ms: 113_055},
      %Video.TimedPoint{lat: 53.661855, lon: 9.792867, time_offset_ms: 113_388},
      %Video.TimedPoint{lat: 53.661854, lon: 9.792882, time_offset_ms: 113_722},
      %Video.TimedPoint{lat: 53.661854, lon: 9.792896, time_offset_ms: 114_055},
      %Video.TimedPoint{lat: 53.661858, lon: 9.792944, time_offset_ms: 114_389},
      %Video.TimedPoint{lat: 53.661862, lon: 9.793024, time_offset_ms: 114_723},
      %Video.TimedPoint{lat: 53.661857, lon: 9.793103, time_offset_ms: 115_056},
      %Video.TimedPoint{lat: 53.661841, lon: 9.793184, time_offset_ms: 115_390},
      %Video.TimedPoint{lat: 53.661819, lon: 9.793272, time_offset_ms: 115_723},
      %Video.TimedPoint{lat: 53.661799, lon: 9.793368, time_offset_ms: 116_057},
      %Video.TimedPoint{lat: 53.66178, lon: 9.793466, time_offset_ms: 116_391},
      %Video.TimedPoint{lat: 53.66176, lon: 9.793568, time_offset_ms: 116_724},
      %Video.TimedPoint{lat: 53.66174, lon: 9.79367, time_offset_ms: 117_058},
      %Video.TimedPoint{lat: 53.661722, lon: 9.79377, time_offset_ms: 117_391},
      %Video.TimedPoint{lat: 53.661701, lon: 9.79387, time_offset_ms: 117_725},
      %Video.TimedPoint{lat: 53.661683, lon: 9.793966, time_offset_ms: 118_059},
      %Video.TimedPoint{lat: 53.661666, lon: 9.794067, time_offset_ms: 118_392},
      %Video.TimedPoint{lat: 53.661647, lon: 9.794171, time_offset_ms: 118_726},
      %Video.TimedPoint{lat: 53.661636, lon: 9.794274, time_offset_ms: 119_059},
      %Video.TimedPoint{lat: 53.661628, lon: 9.794378, time_offset_ms: 119_393},
      %Video.TimedPoint{lat: 53.661618, lon: 9.794483, time_offset_ms: 119_727},
      %Video.TimedPoint{lat: 53.661606, lon: 9.794584, time_offset_ms: 120_060},
      %Video.TimedPoint{lat: 53.661594, lon: 9.794683, time_offset_ms: 120_394},
      %Video.TimedPoint{lat: 53.661581, lon: 9.794785, time_offset_ms: 120_727},
      %Video.TimedPoint{lat: 53.661568, lon: 9.794884, time_offset_ms: 121_061},
      %Video.TimedPoint{lat: 53.661553, lon: 9.79498, time_offset_ms: 121_395},
      %Video.TimedPoint{lat: 53.66154, lon: 9.795077, time_offset_ms: 121_728},
      %Video.TimedPoint{lat: 53.66153, lon: 9.795168, time_offset_ms: 122_062},
      %Video.TimedPoint{lat: 53.661522, lon: 9.795255, time_offset_ms: 122_395},
      %Video.TimedPoint{lat: 53.661512, lon: 9.795339, time_offset_ms: 122_729},
      %Video.TimedPoint{lat: 53.6615, lon: 9.795421, time_offset_ms: 123_063},
      %Video.TimedPoint{lat: 53.66149, lon: 9.7955, time_offset_ms: 123_396},
      %Video.TimedPoint{lat: 53.661481, lon: 9.795575, time_offset_ms: 123_730},
      %Video.TimedPoint{lat: 53.661467, lon: 9.795647, time_offset_ms: 124_063},
      %Video.TimedPoint{lat: 53.661452, lon: 9.795709, time_offset_ms: 124_397},
      %Video.TimedPoint{lat: 53.661442, lon: 9.795773, time_offset_ms: 124_731},
      %Video.TimedPoint{lat: 53.661442, lon: 9.795828, time_offset_ms: 125_064},
      %Video.TimedPoint{lat: 53.661454, lon: 9.795845, time_offset_ms: 125_398},
      %Video.TimedPoint{lat: 53.661463, lon: 9.795828, time_offset_ms: 125_731},
      %Video.TimedPoint{lat: 53.66147, lon: 9.795775, time_offset_ms: 126_065},
      %Video.TimedPoint{lat: 53.661476, lon: 9.795697, time_offset_ms: 126_399},
      %Video.TimedPoint{lat: 53.661483, lon: 9.795604, time_offset_ms: 126_732},
      %Video.TimedPoint{lat: 53.661481, lon: 9.795508, time_offset_ms: 127_066},
      %Video.TimedPoint{lat: 53.661482, lon: 9.795409, time_offset_ms: 127_399},
      %Video.TimedPoint{lat: 53.661487, lon: 9.795309, time_offset_ms: 127_733},
      %Video.TimedPoint{lat: 53.661502, lon: 9.795209, time_offset_ms: 128_067},
      %Video.TimedPoint{lat: 53.661527, lon: 9.795105, time_offset_ms: 128_400},
      %Video.TimedPoint{lat: 53.661545, lon: 9.794996, time_offset_ms: 128_734},
      %Video.TimedPoint{lat: 53.661567, lon: 9.794886, time_offset_ms: 129_067},
      %Video.TimedPoint{lat: 53.661586, lon: 9.794771, time_offset_ms: 129_401},
      %Video.TimedPoint{lat: 53.661601, lon: 9.794653, time_offset_ms: 129_735},
      %Video.TimedPoint{lat: 53.661614, lon: 9.794533, time_offset_ms: 130_068},
      %Video.TimedPoint{lat: 53.66163, lon: 9.79442, time_offset_ms: 130_402},
      %Video.TimedPoint{lat: 53.66164, lon: 9.794314, time_offset_ms: 130_735},
      %Video.TimedPoint{lat: 53.661657, lon: 9.794211, time_offset_ms: 131_069},
      %Video.TimedPoint{lat: 53.661681, lon: 9.794104, time_offset_ms: 131_403},
      %Video.TimedPoint{lat: 53.661704, lon: 9.793995, time_offset_ms: 131_736},
      %Video.TimedPoint{lat: 53.661728, lon: 9.793884, time_offset_ms: 132_070},
      %Video.TimedPoint{lat: 53.661752, lon: 9.793776, time_offset_ms: 132_403},
      %Video.TimedPoint{lat: 53.661779, lon: 9.793665, time_offset_ms: 132_737},
      %Video.TimedPoint{lat: 53.661806, lon: 9.793553, time_offset_ms: 133_071},
      %Video.TimedPoint{lat: 53.661826, lon: 9.793445, time_offset_ms: 133_404},
      %Video.TimedPoint{lat: 53.661848, lon: 9.793348, time_offset_ms: 133_738},
      %Video.TimedPoint{lat: 53.661865, lon: 9.793268, time_offset_ms: 134_071},
      %Video.TimedPoint{lat: 53.66188, lon: 9.793202, time_offset_ms: 134_405},
      %Video.TimedPoint{lat: 53.661894, lon: 9.793153, time_offset_ms: 134_739},
      %Video.TimedPoint{lat: 53.661902, lon: 9.793119, time_offset_ms: 135_072},
      %Video.TimedPoint{lat: 53.661906, lon: 9.793099, time_offset_ms: 135_406},
      %Video.TimedPoint{lat: 53.661901, lon: 9.793089, time_offset_ms: 135_739},
      %Video.TimedPoint{lat: 53.661905, lon: 9.793059, time_offset_ms: 136_073},
      %Video.TimedPoint{lat: 53.661908, lon: 9.792992, time_offset_ms: 136_407},
      %Video.TimedPoint{lat: 53.661907, lon: 9.792905, time_offset_ms: 136_740},
      %Video.TimedPoint{lat: 53.661903, lon: 9.792809, time_offset_ms: 137_074},
      %Video.TimedPoint{lat: 53.661901, lon: 9.792716, time_offset_ms: 137_407},
      %Video.TimedPoint{lat: 53.661903, lon: 9.792621, time_offset_ms: 137_741},
      %Video.TimedPoint{lat: 53.6619, lon: 9.792528, time_offset_ms: 138_075},
      %Video.TimedPoint{lat: 53.661873, lon: 9.792462, time_offset_ms: 138_408},
      %Video.TimedPoint{lat: 53.661825, lon: 9.792442, time_offset_ms: 138_742},
      %Video.TimedPoint{lat: 53.66177, lon: 9.792445, time_offset_ms: 139_075},
      %Video.TimedPoint{lat: 53.66173810479042, lon: 9.792444398203592, time_offset_ms: 139_276}
    ]
  end
end