defmodule Data.AutoGenerated.Video.Rendered_ae36499378cc6c6a822f9189e3c71e46 do
  @moduledoc "#{"alltagsroute-8: aus der Innenstadt zum Mümmelmannsberg"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "alltagsroute-8: aus der Innenstadt zum Mümmelmannsberg"
  end

  @impl Video.Rendered
  def hash() do
    "ae36499378cc6c6a822f9189e3c71e46"
  end

  @impl Video.Rendered
  def length_ms() do
    114_793
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-05-08-velo8/GX013831", "00:03:54.234", :end},
      {"2022-05-08-velo8/GX023831", :seamless, "00:00:27.689"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.53495463772455,
      maxLon: 10.149798,
      minLat: 53.527085,
      minLon: 10.112471715568862
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "Mai 2022"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.53495463772455, lon: 10.112471715568862, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.534945, lon: 10.112485, time_offset_ms: 87},
      %Video.TimedPoint{lat: 53.534908, lon: 10.112543, time_offset_ms: 420},
      %Video.TimedPoint{lat: 53.534857, lon: 10.112608, time_offset_ms: 754},
      %Video.TimedPoint{lat: 53.534798, lon: 10.112675, time_offset_ms: 1087},
      %Video.TimedPoint{lat: 53.534737, lon: 10.112746, time_offset_ms: 1421},
      %Video.TimedPoint{lat: 53.534667, lon: 10.112831, time_offset_ms: 1755},
      %Video.TimedPoint{lat: 53.534592, lon: 10.112915, time_offset_ms: 2088},
      %Video.TimedPoint{lat: 53.534519, lon: 10.113014, time_offset_ms: 2422},
      %Video.TimedPoint{lat: 53.534442, lon: 10.113124, time_offset_ms: 2755},
      %Video.TimedPoint{lat: 53.53436, lon: 10.113234, time_offset_ms: 3089},
      %Video.TimedPoint{lat: 53.534291, lon: 10.113345, time_offset_ms: 3423},
      %Video.TimedPoint{lat: 53.534226, lon: 10.113474, time_offset_ms: 3756},
      %Video.TimedPoint{lat: 53.534168, lon: 10.113606, time_offset_ms: 4090},
      %Video.TimedPoint{lat: 53.534107, lon: 10.113728, time_offset_ms: 4423},
      %Video.TimedPoint{lat: 53.534041, lon: 10.113836, time_offset_ms: 4757},
      %Video.TimedPoint{lat: 53.533984, lon: 10.113941, time_offset_ms: 5091},
      %Video.TimedPoint{lat: 53.53393, lon: 10.114046, time_offset_ms: 5424},
      %Video.TimedPoint{lat: 53.53387, lon: 10.114138, time_offset_ms: 5758},
      %Video.TimedPoint{lat: 53.533806, lon: 10.114222, time_offset_ms: 6091},
      %Video.TimedPoint{lat: 53.533746, lon: 10.114304, time_offset_ms: 6425},
      %Video.TimedPoint{lat: 53.533687, lon: 10.114403, time_offset_ms: 6759},
      %Video.TimedPoint{lat: 53.533626, lon: 10.114503, time_offset_ms: 7092},
      %Video.TimedPoint{lat: 53.533572, lon: 10.114601, time_offset_ms: 7426},
      %Video.TimedPoint{lat: 53.533533, lon: 10.114715, time_offset_ms: 7759},
      %Video.TimedPoint{lat: 53.533494, lon: 10.11484, time_offset_ms: 8093},
      %Video.TimedPoint{lat: 53.533447, lon: 10.114958, time_offset_ms: 8427},
      %Video.TimedPoint{lat: 53.533389, lon: 10.115068, time_offset_ms: 8760},
      %Video.TimedPoint{lat: 53.533327, lon: 10.115179, time_offset_ms: 9094},
      %Video.TimedPoint{lat: 53.533267, lon: 10.115288, time_offset_ms: 9427},
      %Video.TimedPoint{lat: 53.533206, lon: 10.115397, time_offset_ms: 9761},
      %Video.TimedPoint{lat: 53.533142, lon: 10.115506, time_offset_ms: 10095},
      %Video.TimedPoint{lat: 53.533076, lon: 10.115608, time_offset_ms: 10428},
      %Video.TimedPoint{lat: 53.533013, lon: 10.115712, time_offset_ms: 10762},
      %Video.TimedPoint{lat: 53.532956, lon: 10.115824, time_offset_ms: 11095},
      %Video.TimedPoint{lat: 53.532901, lon: 10.115932, time_offset_ms: 11429},
      %Video.TimedPoint{lat: 53.532845, lon: 10.116041, time_offset_ms: 11763},
      %Video.TimedPoint{lat: 53.532792, lon: 10.116158, time_offset_ms: 12096},
      %Video.TimedPoint{lat: 53.532749, lon: 10.116282, time_offset_ms: 12430},
      %Video.TimedPoint{lat: 53.53271, lon: 10.116409, time_offset_ms: 12763},
      %Video.TimedPoint{lat: 53.532673, lon: 10.116541, time_offset_ms: 13097},
      %Video.TimedPoint{lat: 53.532636, lon: 10.116671, time_offset_ms: 13431},
      %Video.TimedPoint{lat: 53.5326, lon: 10.116799, time_offset_ms: 13764},
      %Video.TimedPoint{lat: 53.532564, lon: 10.116922, time_offset_ms: 14098},
      %Video.TimedPoint{lat: 53.532531, lon: 10.117041, time_offset_ms: 14431},
      %Video.TimedPoint{lat: 53.532502, lon: 10.117161, time_offset_ms: 14765},
      %Video.TimedPoint{lat: 53.532472, lon: 10.117281, time_offset_ms: 15099},
      %Video.TimedPoint{lat: 53.532442, lon: 10.117398, time_offset_ms: 15432},
      %Video.TimedPoint{lat: 53.532409, lon: 10.117515, time_offset_ms: 15766},
      %Video.TimedPoint{lat: 53.53238, lon: 10.117634, time_offset_ms: 16099},
      %Video.TimedPoint{lat: 53.532347, lon: 10.117751, time_offset_ms: 16433},
      %Video.TimedPoint{lat: 53.532314, lon: 10.117875, time_offset_ms: 16767},
      %Video.TimedPoint{lat: 53.532282, lon: 10.118001, time_offset_ms: 17100},
      %Video.TimedPoint{lat: 53.532249, lon: 10.118123, time_offset_ms: 17434},
      %Video.TimedPoint{lat: 53.532216, lon: 10.118243, time_offset_ms: 17767},
      %Video.TimedPoint{lat: 53.532181, lon: 10.118367, time_offset_ms: 18101},
      %Video.TimedPoint{lat: 53.532149, lon: 10.118483, time_offset_ms: 18435},
      %Video.TimedPoint{lat: 53.532119, lon: 10.118593, time_offset_ms: 18768},
      %Video.TimedPoint{lat: 53.532089, lon: 10.118705, time_offset_ms: 19102},
      %Video.TimedPoint{lat: 53.532059, lon: 10.11881, time_offset_ms: 19435},
      %Video.TimedPoint{lat: 53.532029, lon: 10.118912, time_offset_ms: 19769},
      %Video.TimedPoint{lat: 53.532, lon: 10.119016, time_offset_ms: 20103},
      %Video.TimedPoint{lat: 53.531975, lon: 10.119121, time_offset_ms: 20436},
      %Video.TimedPoint{lat: 53.531957, lon: 10.119229, time_offset_ms: 20770},
      %Video.TimedPoint{lat: 53.53196, lon: 10.119343, time_offset_ms: 21103},
      %Video.TimedPoint{lat: 53.531959, lon: 10.119454, time_offset_ms: 21437},
      %Video.TimedPoint{lat: 53.53195, lon: 10.119553, time_offset_ms: 21771},
      %Video.TimedPoint{lat: 53.531953, lon: 10.119605, time_offset_ms: 22104},
      %Video.TimedPoint{lat: 53.531961, lon: 10.119657, time_offset_ms: 22438},
      %Video.TimedPoint{lat: 53.531957, lon: 10.119748, time_offset_ms: 22771},
      %Video.TimedPoint{lat: 53.531942, lon: 10.119858, time_offset_ms: 23105},
      %Video.TimedPoint{lat: 53.531925, lon: 10.119965, time_offset_ms: 23439},
      %Video.TimedPoint{lat: 53.531906, lon: 10.120067, time_offset_ms: 23772},
      %Video.TimedPoint{lat: 53.531885, lon: 10.120176, time_offset_ms: 24106},
      %Video.TimedPoint{lat: 53.531864, lon: 10.120281, time_offset_ms: 24439},
      %Video.TimedPoint{lat: 53.531842, lon: 10.120384, time_offset_ms: 24773},
      %Video.TimedPoint{lat: 53.531821, lon: 10.120493, time_offset_ms: 25107},
      %Video.TimedPoint{lat: 53.531799, lon: 10.120602, time_offset_ms: 25440},
      %Video.TimedPoint{lat: 53.531777, lon: 10.120712, time_offset_ms: 25774},
      %Video.TimedPoint{lat: 53.531752, lon: 10.120822, time_offset_ms: 26107},
      %Video.TimedPoint{lat: 53.531728, lon: 10.12093, time_offset_ms: 26441},
      %Video.TimedPoint{lat: 53.531705, lon: 10.12104, time_offset_ms: 26775},
      %Video.TimedPoint{lat: 53.531679, lon: 10.12115, time_offset_ms: 27108},
      %Video.TimedPoint{lat: 53.531653, lon: 10.121256, time_offset_ms: 27442},
      %Video.TimedPoint{lat: 53.531626, lon: 10.12136, time_offset_ms: 27775},
      %Video.TimedPoint{lat: 53.531597, lon: 10.12147, time_offset_ms: 28109},
      %Video.TimedPoint{lat: 53.531567, lon: 10.121583, time_offset_ms: 28443},
      %Video.TimedPoint{lat: 53.531535, lon: 10.121696, time_offset_ms: 28776},
      %Video.TimedPoint{lat: 53.531504, lon: 10.121815, time_offset_ms: 29110},
      %Video.TimedPoint{lat: 53.53147, lon: 10.121931, time_offset_ms: 29443},
      %Video.TimedPoint{lat: 53.531435, lon: 10.122048, time_offset_ms: 29777},
      %Video.TimedPoint{lat: 53.531398, lon: 10.122171, time_offset_ms: 30111},
      %Video.TimedPoint{lat: 53.531363, lon: 10.12229, time_offset_ms: 30444},
      %Video.TimedPoint{lat: 53.531329, lon: 10.122412, time_offset_ms: 30778},
      %Video.TimedPoint{lat: 53.531292, lon: 10.12254, time_offset_ms: 31111},
      %Video.TimedPoint{lat: 53.531255, lon: 10.122666, time_offset_ms: 31445},
      %Video.TimedPoint{lat: 53.531217, lon: 10.122795, time_offset_ms: 31779},
      %Video.TimedPoint{lat: 53.531179, lon: 10.122931, time_offset_ms: 32112},
      %Video.TimedPoint{lat: 53.531142, lon: 10.123064, time_offset_ms: 32446},
      %Video.TimedPoint{lat: 53.531106, lon: 10.123197, time_offset_ms: 32779},
      %Video.TimedPoint{lat: 53.531068, lon: 10.123336, time_offset_ms: 33113},
      %Video.TimedPoint{lat: 53.531032, lon: 10.123477, time_offset_ms: 33447},
      %Video.TimedPoint{lat: 53.530996, lon: 10.123617, time_offset_ms: 33780},
      %Video.TimedPoint{lat: 53.530961, lon: 10.123762, time_offset_ms: 34114},
      %Video.TimedPoint{lat: 53.530928, lon: 10.123905, time_offset_ms: 34447},
      %Video.TimedPoint{lat: 53.530894, lon: 10.12405, time_offset_ms: 34781},
      %Video.TimedPoint{lat: 53.530861, lon: 10.124203, time_offset_ms: 35115},
      %Video.TimedPoint{lat: 53.530829, lon: 10.124359, time_offset_ms: 35448},
      %Video.TimedPoint{lat: 53.530796, lon: 10.124518, time_offset_ms: 35782},
      %Video.TimedPoint{lat: 53.53076, lon: 10.124681, time_offset_ms: 36115},
      %Video.TimedPoint{lat: 53.530724, lon: 10.124844, time_offset_ms: 36449},
      %Video.TimedPoint{lat: 53.530686, lon: 10.125007, time_offset_ms: 36783},
      %Video.TimedPoint{lat: 53.53064, lon: 10.125177, time_offset_ms: 37116},
      %Video.TimedPoint{lat: 53.53058, lon: 10.125338, time_offset_ms: 37450},
      %Video.TimedPoint{lat: 53.530502, lon: 10.125479, time_offset_ms: 37783},
      %Video.TimedPoint{lat: 53.530403, lon: 10.125597, time_offset_ms: 38117},
      %Video.TimedPoint{lat: 53.530293, lon: 10.1257, time_offset_ms: 38451},
      %Video.TimedPoint{lat: 53.530179, lon: 10.125795, time_offset_ms: 38784},
      %Video.TimedPoint{lat: 53.530062, lon: 10.125895, time_offset_ms: 39118},
      %Video.TimedPoint{lat: 53.529946, lon: 10.126002, time_offset_ms: 39451},
      %Video.TimedPoint{lat: 53.529835, lon: 10.126118, time_offset_ms: 39785},
      %Video.TimedPoint{lat: 53.529727, lon: 10.126252, time_offset_ms: 40119},
      %Video.TimedPoint{lat: 53.529627, lon: 10.126403, time_offset_ms: 40452},
      %Video.TimedPoint{lat: 53.529536, lon: 10.126563, time_offset_ms: 40786},
      %Video.TimedPoint{lat: 53.529454, lon: 10.126741, time_offset_ms: 41119},
      %Video.TimedPoint{lat: 53.52938, lon: 10.126923, time_offset_ms: 41453},
      %Video.TimedPoint{lat: 53.529317, lon: 10.127107, time_offset_ms: 41787},
      %Video.TimedPoint{lat: 53.529281, lon: 10.12731, time_offset_ms: 42120},
      %Video.TimedPoint{lat: 53.529294, lon: 10.127516, time_offset_ms: 42454},
      %Video.TimedPoint{lat: 53.529337, lon: 10.127711, time_offset_ms: 42787},
      %Video.TimedPoint{lat: 53.529404, lon: 10.127897, time_offset_ms: 43121},
      %Video.TimedPoint{lat: 53.529482, lon: 10.128068, time_offset_ms: 43455},
      %Video.TimedPoint{lat: 53.529558, lon: 10.128235, time_offset_ms: 43788},
      %Video.TimedPoint{lat: 53.529633, lon: 10.128406, time_offset_ms: 44122},
      %Video.TimedPoint{lat: 53.529699, lon: 10.128583, time_offset_ms: 44455},
      %Video.TimedPoint{lat: 53.529749, lon: 10.128766, time_offset_ms: 44789},
      %Video.TimedPoint{lat: 53.529785, lon: 10.128954, time_offset_ms: 45123},
      %Video.TimedPoint{lat: 53.529807, lon: 10.129138, time_offset_ms: 45456},
      %Video.TimedPoint{lat: 53.529817, lon: 10.129314, time_offset_ms: 45790},
      %Video.TimedPoint{lat: 53.529824, lon: 10.129485, time_offset_ms: 46123},
      %Video.TimedPoint{lat: 53.529833, lon: 10.129654, time_offset_ms: 46457},
      %Video.TimedPoint{lat: 53.529841, lon: 10.129821, time_offset_ms: 46791},
      %Video.TimedPoint{lat: 53.529838, lon: 10.129993, time_offset_ms: 47124},
      %Video.TimedPoint{lat: 53.529828, lon: 10.130149, time_offset_ms: 47458},
      %Video.TimedPoint{lat: 53.529813, lon: 10.130284, time_offset_ms: 47791},
      %Video.TimedPoint{lat: 53.529798, lon: 10.130406, time_offset_ms: 48125},
      %Video.TimedPoint{lat: 53.52981, lon: 10.130519, time_offset_ms: 48459},
      %Video.TimedPoint{lat: 53.529864, lon: 10.130603, time_offset_ms: 48792},
      %Video.TimedPoint{lat: 53.52991, lon: 10.130712, time_offset_ms: 49126},
      %Video.TimedPoint{lat: 53.529934, lon: 10.130847, time_offset_ms: 49459},
      %Video.TimedPoint{lat: 53.529953, lon: 10.130982, time_offset_ms: 49793},
      %Video.TimedPoint{lat: 53.529972, lon: 10.131109, time_offset_ms: 50127},
      %Video.TimedPoint{lat: 53.529992, lon: 10.131236, time_offset_ms: 50460},
      %Video.TimedPoint{lat: 53.530009, lon: 10.131358, time_offset_ms: 50794},
      %Video.TimedPoint{lat: 53.530031, lon: 10.131481, time_offset_ms: 51127},
      %Video.TimedPoint{lat: 53.530048, lon: 10.131603, time_offset_ms: 51461},
      %Video.TimedPoint{lat: 53.530054, lon: 10.131726, time_offset_ms: 51795},
      %Video.TimedPoint{lat: 53.530066, lon: 10.131847, time_offset_ms: 52128},
      %Video.TimedPoint{lat: 53.530084, lon: 10.131971, time_offset_ms: 52462},
      %Video.TimedPoint{lat: 53.530102, lon: 10.132094, time_offset_ms: 52795},
      %Video.TimedPoint{lat: 53.530121, lon: 10.132216, time_offset_ms: 53129},
      %Video.TimedPoint{lat: 53.530141, lon: 10.132341, time_offset_ms: 53463},
      %Video.TimedPoint{lat: 53.530159, lon: 10.132464, time_offset_ms: 53796},
      %Video.TimedPoint{lat: 53.530175, lon: 10.132588, time_offset_ms: 54130},
      %Video.TimedPoint{lat: 53.53019, lon: 10.132713, time_offset_ms: 54463},
      %Video.TimedPoint{lat: 53.530206, lon: 10.132835, time_offset_ms: 54797},
      %Video.TimedPoint{lat: 53.530219, lon: 10.132958, time_offset_ms: 55131},
      %Video.TimedPoint{lat: 53.530229, lon: 10.133084, time_offset_ms: 55464},
      %Video.TimedPoint{lat: 53.530236, lon: 10.133201, time_offset_ms: 55798},
      %Video.TimedPoint{lat: 53.530238, lon: 10.133318, time_offset_ms: 56131},
      %Video.TimedPoint{lat: 53.530239, lon: 10.133431, time_offset_ms: 56465},
      %Video.TimedPoint{lat: 53.530236, lon: 10.133543, time_offset_ms: 56799},
      %Video.TimedPoint{lat: 53.530233, lon: 10.133654, time_offset_ms: 57132},
      %Video.TimedPoint{lat: 53.530227, lon: 10.133767, time_offset_ms: 57466},
      %Video.TimedPoint{lat: 53.530218, lon: 10.133879, time_offset_ms: 57799},
      %Video.TimedPoint{lat: 53.530208, lon: 10.133992, time_offset_ms: 58133},
      %Video.TimedPoint{lat: 53.530193, lon: 10.134105, time_offset_ms: 58467},
      %Video.TimedPoint{lat: 53.530177, lon: 10.134213, time_offset_ms: 58800},
      %Video.TimedPoint{lat: 53.530155, lon: 10.13432, time_offset_ms: 59134},
      %Video.TimedPoint{lat: 53.530133, lon: 10.134427, time_offset_ms: 59467},
      %Video.TimedPoint{lat: 53.530113, lon: 10.13453, time_offset_ms: 59801},
      %Video.TimedPoint{lat: 53.53009, lon: 10.134634, time_offset_ms: 60135},
      %Video.TimedPoint{lat: 53.530068, lon: 10.134733, time_offset_ms: 60468},
      %Video.TimedPoint{lat: 53.530047, lon: 10.134829, time_offset_ms: 60802},
      %Video.TimedPoint{lat: 53.530028, lon: 10.134921, time_offset_ms: 61135},
      %Video.TimedPoint{lat: 53.530013, lon: 10.135012, time_offset_ms: 61469},
      %Video.TimedPoint{lat: 53.529998, lon: 10.1351, time_offset_ms: 61803},
      %Video.TimedPoint{lat: 53.529985, lon: 10.135191, time_offset_ms: 62136},
      %Video.TimedPoint{lat: 53.529976, lon: 10.135286, time_offset_ms: 62470},
      %Video.TimedPoint{lat: 53.529966, lon: 10.135382, time_offset_ms: 62803},
      %Video.TimedPoint{lat: 53.529956, lon: 10.13548, time_offset_ms: 63137},
      %Video.TimedPoint{lat: 53.529949, lon: 10.135578, time_offset_ms: 63471},
      %Video.TimedPoint{lat: 53.529942, lon: 10.135673, time_offset_ms: 63804},
      %Video.TimedPoint{lat: 53.529939, lon: 10.135769, time_offset_ms: 64138},
      %Video.TimedPoint{lat: 53.529936, lon: 10.135863, time_offset_ms: 64471},
      %Video.TimedPoint{lat: 53.52993, lon: 10.135954, time_offset_ms: 64805},
      %Video.TimedPoint{lat: 53.529923, lon: 10.136046, time_offset_ms: 65139},
      %Video.TimedPoint{lat: 53.529918, lon: 10.136142, time_offset_ms: 65472},
      %Video.TimedPoint{lat: 53.529913, lon: 10.136233, time_offset_ms: 65806},
      %Video.TimedPoint{lat: 53.529907, lon: 10.136323, time_offset_ms: 66139},
      %Video.TimedPoint{lat: 53.529903, lon: 10.136411, time_offset_ms: 66473},
      %Video.TimedPoint{lat: 53.529898, lon: 10.136495, time_offset_ms: 66807},
      %Video.TimedPoint{lat: 53.529892, lon: 10.13659, time_offset_ms: 67140},
      %Video.TimedPoint{lat: 53.529886, lon: 10.136688, time_offset_ms: 67474},
      %Video.TimedPoint{lat: 53.529881, lon: 10.136781, time_offset_ms: 67807},
      %Video.TimedPoint{lat: 53.529873, lon: 10.136874, time_offset_ms: 68141},
      %Video.TimedPoint{lat: 53.529857, lon: 10.136967, time_offset_ms: 68475},
      %Video.TimedPoint{lat: 53.529845, lon: 10.137059, time_offset_ms: 68808},
      %Video.TimedPoint{lat: 53.529838, lon: 10.137153, time_offset_ms: 69142},
      %Video.TimedPoint{lat: 53.529832, lon: 10.13725, time_offset_ms: 69475},
      %Video.TimedPoint{lat: 53.529829, lon: 10.137344, time_offset_ms: 69809},
      %Video.TimedPoint{lat: 53.529828, lon: 10.137438, time_offset_ms: 70143},
      %Video.TimedPoint{lat: 53.529826, lon: 10.137532, time_offset_ms: 70476},
      %Video.TimedPoint{lat: 53.529824, lon: 10.137628, time_offset_ms: 70810},
      %Video.TimedPoint{lat: 53.529823, lon: 10.13773, time_offset_ms: 71143},
      %Video.TimedPoint{lat: 53.529824, lon: 10.137839, time_offset_ms: 71477},
      %Video.TimedPoint{lat: 53.529822, lon: 10.137946, time_offset_ms: 71811},
      %Video.TimedPoint{lat: 53.52982, lon: 10.138053, time_offset_ms: 72144},
      %Video.TimedPoint{lat: 53.529817, lon: 10.138163, time_offset_ms: 72478},
      %Video.TimedPoint{lat: 53.529814, lon: 10.138269, time_offset_ms: 72811},
      %Video.TimedPoint{lat: 53.529812, lon: 10.138369, time_offset_ms: 73145},
      %Video.TimedPoint{lat: 53.529812, lon: 10.138465, time_offset_ms: 73479},
      %Video.TimedPoint{lat: 53.529811, lon: 10.13856, time_offset_ms: 73812},
      %Video.TimedPoint{lat: 53.52981, lon: 10.138657, time_offset_ms: 74146},
      %Video.TimedPoint{lat: 53.529808, lon: 10.138754, time_offset_ms: 74479},
      %Video.TimedPoint{lat: 53.529807, lon: 10.13885, time_offset_ms: 74813},
      %Video.TimedPoint{lat: 53.529806, lon: 10.138947, time_offset_ms: 75147},
      %Video.TimedPoint{lat: 53.529805, lon: 10.139043, time_offset_ms: 75480},
      %Video.TimedPoint{lat: 53.529801, lon: 10.139134, time_offset_ms: 75814},
      %Video.TimedPoint{lat: 53.529796, lon: 10.139226, time_offset_ms: 76147},
      %Video.TimedPoint{lat: 53.5298, lon: 10.139329, time_offset_ms: 76481},
      %Video.TimedPoint{lat: 53.529796, lon: 10.139431, time_offset_ms: 76815},
      %Video.TimedPoint{lat: 53.529796, lon: 10.139535, time_offset_ms: 77148},
      %Video.TimedPoint{lat: 53.529795, lon: 10.139644, time_offset_ms: 77482},
      %Video.TimedPoint{lat: 53.529792, lon: 10.139755, time_offset_ms: 77815},
      %Video.TimedPoint{lat: 53.529787, lon: 10.139872, time_offset_ms: 78149},
      %Video.TimedPoint{lat: 53.529783, lon: 10.139993, time_offset_ms: 78483},
      %Video.TimedPoint{lat: 53.52978, lon: 10.14011, time_offset_ms: 78816},
      %Video.TimedPoint{lat: 53.529778, lon: 10.140226, time_offset_ms: 79150},
      %Video.TimedPoint{lat: 53.529774, lon: 10.140345, time_offset_ms: 79483},
      %Video.TimedPoint{lat: 53.529771, lon: 10.140458, time_offset_ms: 79817},
      %Video.TimedPoint{lat: 53.529769, lon: 10.140569, time_offset_ms: 80151},
      %Video.TimedPoint{lat: 53.529769, lon: 10.140679, time_offset_ms: 80484},
      %Video.TimedPoint{lat: 53.52977, lon: 10.140788, time_offset_ms: 80818},
      %Video.TimedPoint{lat: 53.529769, lon: 10.140894, time_offset_ms: 81151},
      %Video.TimedPoint{lat: 53.529765, lon: 10.141002, time_offset_ms: 81485},
      %Video.TimedPoint{lat: 53.52976, lon: 10.141107, time_offset_ms: 81819},
      %Video.TimedPoint{lat: 53.529753, lon: 10.141215, time_offset_ms: 82152},
      %Video.TimedPoint{lat: 53.529748, lon: 10.141328, time_offset_ms: 82486},
      %Video.TimedPoint{lat: 53.529745, lon: 10.14144, time_offset_ms: 82819},
      %Video.TimedPoint{lat: 53.529738, lon: 10.14155, time_offset_ms: 83153},
      %Video.TimedPoint{lat: 53.529734, lon: 10.141662, time_offset_ms: 83487},
      %Video.TimedPoint{lat: 53.529731, lon: 10.141775, time_offset_ms: 83820},
      %Video.TimedPoint{lat: 53.529728, lon: 10.141885, time_offset_ms: 84154},
      %Video.TimedPoint{lat: 53.529725, lon: 10.141997, time_offset_ms: 84487},
      %Video.TimedPoint{lat: 53.52972, lon: 10.142107, time_offset_ms: 84821},
      %Video.TimedPoint{lat: 53.529718, lon: 10.142218, time_offset_ms: 85155},
      %Video.TimedPoint{lat: 53.529722, lon: 10.142343, time_offset_ms: 85488},
      %Video.TimedPoint{lat: 53.529725, lon: 10.142469, time_offset_ms: 85822},
      %Video.TimedPoint{lat: 53.529726, lon: 10.142594, time_offset_ms: 86155},
      %Video.TimedPoint{lat: 53.529726, lon: 10.142711, time_offset_ms: 86489},
      %Video.TimedPoint{lat: 53.529722, lon: 10.142821, time_offset_ms: 86823},
      %Video.TimedPoint{lat: 53.529727, lon: 10.142942, time_offset_ms: 87104},
      %Video.TimedPoint{lat: 53.529723, lon: 10.143006, time_offset_ms: 87438},
      %Video.TimedPoint{lat: 53.529721, lon: 10.143123, time_offset_ms: 87771},
      %Video.TimedPoint{lat: 53.529726, lon: 10.143244, time_offset_ms: 88105},
      %Video.TimedPoint{lat: 53.529725, lon: 10.143367, time_offset_ms: 88438},
      %Video.TimedPoint{lat: 53.529723, lon: 10.143493, time_offset_ms: 88772},
      %Video.TimedPoint{lat: 53.529717, lon: 10.143622, time_offset_ms: 89106},
      %Video.TimedPoint{lat: 53.529706, lon: 10.143752, time_offset_ms: 89439},
      %Video.TimedPoint{lat: 53.529707, lon: 10.143886, time_offset_ms: 89773},
      %Video.TimedPoint{lat: 53.529709, lon: 10.144016, time_offset_ms: 90106},
      %Video.TimedPoint{lat: 53.529709, lon: 10.144147, time_offset_ms: 90440},
      %Video.TimedPoint{lat: 53.529708, lon: 10.14428, time_offset_ms: 90774},
      %Video.TimedPoint{lat: 53.529704, lon: 10.144414, time_offset_ms: 91107},
      %Video.TimedPoint{lat: 53.529706, lon: 10.14455, time_offset_ms: 91441},
      %Video.TimedPoint{lat: 53.5297, lon: 10.14469, time_offset_ms: 91774},
      %Video.TimedPoint{lat: 53.529694, lon: 10.144828, time_offset_ms: 92108},
      %Video.TimedPoint{lat: 53.529685, lon: 10.144968, time_offset_ms: 92442},
      %Video.TimedPoint{lat: 53.529678, lon: 10.145108, time_offset_ms: 92775},
      %Video.TimedPoint{lat: 53.529672, lon: 10.145246, time_offset_ms: 93109},
      %Video.TimedPoint{lat: 53.529661, lon: 10.145385, time_offset_ms: 93442},
      %Video.TimedPoint{lat: 53.52965, lon: 10.14552, time_offset_ms: 93776},
      %Video.TimedPoint{lat: 53.529647, lon: 10.145653, time_offset_ms: 94110},
      %Video.TimedPoint{lat: 53.529652, lon: 10.145777, time_offset_ms: 94443},
      %Video.TimedPoint{lat: 53.529649, lon: 10.14591, time_offset_ms: 94777},
      %Video.TimedPoint{lat: 53.529646, lon: 10.146047, time_offset_ms: 95110},
      %Video.TimedPoint{lat: 53.529646, lon: 10.14619, time_offset_ms: 95444},
      %Video.TimedPoint{lat: 53.529643, lon: 10.146332, time_offset_ms: 95778},
      %Video.TimedPoint{lat: 53.529638, lon: 10.146468, time_offset_ms: 96111},
      %Video.TimedPoint{lat: 53.529635, lon: 10.146608, time_offset_ms: 96445},
      %Video.TimedPoint{lat: 53.529627, lon: 10.146749, time_offset_ms: 96778},
      %Video.TimedPoint{lat: 53.529625, lon: 10.146893, time_offset_ms: 97112},
      %Video.TimedPoint{lat: 53.529629, lon: 10.147035, time_offset_ms: 97446},
      %Video.TimedPoint{lat: 53.529635, lon: 10.147187, time_offset_ms: 97779},
      %Video.TimedPoint{lat: 53.529639, lon: 10.147335, time_offset_ms: 98113},
      %Video.TimedPoint{lat: 53.529641, lon: 10.147485, time_offset_ms: 98446},
      %Video.TimedPoint{lat: 53.529642, lon: 10.147635, time_offset_ms: 98780},
      %Video.TimedPoint{lat: 53.529639, lon: 10.147778, time_offset_ms: 99114},
      %Video.TimedPoint{lat: 53.529634, lon: 10.147922, time_offset_ms: 99447},
      %Video.TimedPoint{lat: 53.529625, lon: 10.148068, time_offset_ms: 99781},
      %Video.TimedPoint{lat: 53.529618, lon: 10.148214, time_offset_ms: 100_114},
      %Video.TimedPoint{lat: 53.529625, lon: 10.148364, time_offset_ms: 100_448},
      %Video.TimedPoint{lat: 53.529634, lon: 10.148521, time_offset_ms: 100_782},
      %Video.TimedPoint{lat: 53.529641, lon: 10.148679, time_offset_ms: 101_115},
      %Video.TimedPoint{lat: 53.52964, lon: 10.148842, time_offset_ms: 101_449},
      %Video.TimedPoint{lat: 53.529638, lon: 10.149006, time_offset_ms: 101_782},
      %Video.TimedPoint{lat: 53.529635, lon: 10.14916, time_offset_ms: 102_116},
      %Video.TimedPoint{lat: 53.529634, lon: 10.14931, time_offset_ms: 102_450},
      %Video.TimedPoint{lat: 53.529623, lon: 10.149457, time_offset_ms: 102_783},
      %Video.TimedPoint{lat: 53.529601, lon: 10.149587, time_offset_ms: 103_117},
      %Video.TimedPoint{lat: 53.52955, lon: 10.149674, time_offset_ms: 103_450},
      %Video.TimedPoint{lat: 53.529481, lon: 10.149716, time_offset_ms: 103_784},
      %Video.TimedPoint{lat: 53.529409, lon: 10.14974, time_offset_ms: 104_118},
      %Video.TimedPoint{lat: 53.529333, lon: 10.149743, time_offset_ms: 104_451},
      %Video.TimedPoint{lat: 53.529249, lon: 10.149745, time_offset_ms: 104_785},
      %Video.TimedPoint{lat: 53.529169, lon: 10.149746, time_offset_ms: 105_118},
      %Video.TimedPoint{lat: 53.52909, lon: 10.149741, time_offset_ms: 105_452},
      %Video.TimedPoint{lat: 53.529009, lon: 10.149738, time_offset_ms: 105_786},
      %Video.TimedPoint{lat: 53.528929, lon: 10.149736, time_offset_ms: 106_119},
      %Video.TimedPoint{lat: 53.52885, lon: 10.149732, time_offset_ms: 106_453},
      %Video.TimedPoint{lat: 53.528766, lon: 10.149732, time_offset_ms: 106_786},
      %Video.TimedPoint{lat: 53.528689, lon: 10.149732, time_offset_ms: 107_120},
      %Video.TimedPoint{lat: 53.528648, lon: 10.149737, time_offset_ms: 107_454},
      %Video.TimedPoint{lat: 53.528616, lon: 10.149737, time_offset_ms: 107_787},
      %Video.TimedPoint{lat: 53.528564, lon: 10.149734, time_offset_ms: 108_121},
      %Video.TimedPoint{lat: 53.528499, lon: 10.149737, time_offset_ms: 108_454},
      %Video.TimedPoint{lat: 53.528427, lon: 10.149735, time_offset_ms: 108_788},
      %Video.TimedPoint{lat: 53.52835, lon: 10.149741, time_offset_ms: 109_122},
      %Video.TimedPoint{lat: 53.528271, lon: 10.149748, time_offset_ms: 109_455},
      %Video.TimedPoint{lat: 53.528189, lon: 10.149747, time_offset_ms: 109_789},
      %Video.TimedPoint{lat: 53.528109, lon: 10.149748, time_offset_ms: 110_122},
      %Video.TimedPoint{lat: 53.528032, lon: 10.149757, time_offset_ms: 110_456},
      %Video.TimedPoint{lat: 53.527956, lon: 10.149765, time_offset_ms: 110_790},
      %Video.TimedPoint{lat: 53.527881, lon: 10.149766, time_offset_ms: 111_123},
      %Video.TimedPoint{lat: 53.527815, lon: 10.149766, time_offset_ms: 111_457},
      %Video.TimedPoint{lat: 53.527746, lon: 10.149773, time_offset_ms: 111_790},
      %Video.TimedPoint{lat: 53.527676, lon: 10.14978, time_offset_ms: 112_124},
      %Video.TimedPoint{lat: 53.527605, lon: 10.149778, time_offset_ms: 112_458},
      %Video.TimedPoint{lat: 53.527538, lon: 10.149742, time_offset_ms: 112_791},
      %Video.TimedPoint{lat: 53.527469, lon: 10.149695, time_offset_ms: 113_125},
      %Video.TimedPoint{lat: 53.527396, lon: 10.149668, time_offset_ms: 113_458},
      %Video.TimedPoint{lat: 53.527325, lon: 10.149702, time_offset_ms: 113_792},
      %Video.TimedPoint{lat: 53.52725, lon: 10.149752, time_offset_ms: 114_126},
      %Video.TimedPoint{lat: 53.527167, lon: 10.149783, time_offset_ms: 114_459},
      %Video.TimedPoint{lat: 53.527085, lon: 10.149798, time_offset_ms: 114_793}
    ]
  end
end