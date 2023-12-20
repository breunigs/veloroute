defmodule Data.AutoGenerated.Video.Rendered_42873d3cb992f3dc01b0951f1b88e861 do
  @moduledoc "#{"2022-06-01-ueberseering: Überseering gegen Uhrzeigersinn"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-06-01-ueberseering: Überseering gegen Uhrzeigersinn"
  end

  @impl Video.Rendered
  def hash() do
    "42873d3cb992f3dc01b0951f1b88e861"
  end

  @impl Video.Rendered
  def length_ms() do
    101_119
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-08-06-rsw-bad-bramstedt-rev/GX014417", :start, :end},
      {"2022-08-06-rsw-bad-bramstedt-rev/GX014411", :start, :end},
      {"2022-08-06-rsw-bad-bramstedt-rev/GX014412", :start, "00:00:22.506"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{minLon: 10.013827, minLat: 53.600545, maxLon: 10.025561, maxLat: 53.607194}
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "August 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Überseering"},
      %{timestamp: 22351, text: "Hebebrandstraße"},
      %{timestamp: 26910, text: "Überseering"},
      %{timestamp: 53931, text: "Sydneystraße"},
      %{timestamp: 79614, text: "Überseering"},
      %{timestamp: 87954, text: ""},
      %{timestamp: 93625, text: "New-York-Ring"},
      %{timestamp: 95960, text: ""}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.025336, lat: 53.600553, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.025358, lat: 53.600552, time_offset_ms: 334},
      %Video.TimedPoint{lon: 10.025415, lat: 53.600545, time_offset_ms: 667},
      %Video.TimedPoint{lon: 10.025495, lat: 53.600548, time_offset_ms: 1001},
      %Video.TimedPoint{lon: 10.025556, lat: 53.600581, time_offset_ms: 1334},
      %Video.TimedPoint{lon: 10.025552, lat: 53.600629, time_offset_ms: 1668},
      %Video.TimedPoint{lon: 10.025548, lat: 53.600687, time_offset_ms: 2002},
      %Video.TimedPoint{lon: 10.025543, lat: 53.60075, time_offset_ms: 2335},
      %Video.TimedPoint{lon: 10.02554, lat: 53.600823, time_offset_ms: 2669},
      %Video.TimedPoint{lon: 10.025545, lat: 53.6009, time_offset_ms: 3002},
      %Video.TimedPoint{lon: 10.025538, lat: 53.600976, time_offset_ms: 3336},
      %Video.TimedPoint{lon: 10.025534, lat: 53.601055, time_offset_ms: 3670},
      %Video.TimedPoint{lon: 10.025542, lat: 53.601134, time_offset_ms: 4003},
      %Video.TimedPoint{lon: 10.025541, lat: 53.601208, time_offset_ms: 4337},
      %Video.TimedPoint{lon: 10.025533, lat: 53.601285, time_offset_ms: 4670},
      %Video.TimedPoint{lon: 10.025524, lat: 53.601355, time_offset_ms: 5004},
      %Video.TimedPoint{lon: 10.025517, lat: 53.601419, time_offset_ms: 5338},
      %Video.TimedPoint{lon: 10.02551, lat: 53.601491, time_offset_ms: 5671},
      %Video.TimedPoint{lon: 10.025536, lat: 53.601561, time_offset_ms: 6005},
      %Video.TimedPoint{lon: 10.025561, lat: 53.601643, time_offset_ms: 6338},
      %Video.TimedPoint{lon: 10.025558, lat: 53.601726, time_offset_ms: 6672},
      %Video.TimedPoint{lon: 10.025552, lat: 53.601809, time_offset_ms: 7006},
      %Video.TimedPoint{lon: 10.025549, lat: 53.601892, time_offset_ms: 7339},
      %Video.TimedPoint{lon: 10.025534, lat: 53.601972, time_offset_ms: 7673},
      %Video.TimedPoint{lon: 10.025521, lat: 53.60204, time_offset_ms: 8006},
      %Video.TimedPoint{lon: 10.025528, lat: 53.602118, time_offset_ms: 8340},
      %Video.TimedPoint{lon: 10.025528, lat: 53.602187, time_offset_ms: 8674},
      %Video.TimedPoint{lon: 10.025526, lat: 53.602262, time_offset_ms: 9007},
      %Video.TimedPoint{lon: 10.025522, lat: 53.60234, time_offset_ms: 9341},
      %Video.TimedPoint{lon: 10.025506, lat: 53.60241, time_offset_ms: 9674},
      %Video.TimedPoint{lon: 10.025496, lat: 53.602485, time_offset_ms: 10008},
      %Video.TimedPoint{lon: 10.025494, lat: 53.60256, time_offset_ms: 10342},
      %Video.TimedPoint{lon: 10.025495, lat: 53.602626, time_offset_ms: 10675},
      %Video.TimedPoint{lon: 10.025493, lat: 53.602694, time_offset_ms: 11009},
      %Video.TimedPoint{lon: 10.025486, lat: 53.602753, time_offset_ms: 11342},
      %Video.TimedPoint{lon: 10.025485, lat: 53.602829, time_offset_ms: 11676},
      %Video.TimedPoint{lon: 10.025482, lat: 53.602906, time_offset_ms: 12010},
      %Video.TimedPoint{lon: 10.025471, lat: 53.602976, time_offset_ms: 12343},
      %Video.TimedPoint{lon: 10.025459, lat: 53.603048, time_offset_ms: 12677},
      %Video.TimedPoint{lon: 10.025448, lat: 53.603118, time_offset_ms: 13010},
      %Video.TimedPoint{lon: 10.025453, lat: 53.603208, time_offset_ms: 13344},
      %Video.TimedPoint{lon: 10.025461, lat: 53.603286, time_offset_ms: 13678},
      %Video.TimedPoint{lon: 10.025455, lat: 53.603346, time_offset_ms: 14011},
      %Video.TimedPoint{lon: 10.025451, lat: 53.603416, time_offset_ms: 14345},
      %Video.TimedPoint{lon: 10.025448, lat: 53.603479, time_offset_ms: 14678},
      %Video.TimedPoint{lon: 10.025431, lat: 53.60354, time_offset_ms: 15012},
      %Video.TimedPoint{lon: 10.025418, lat: 53.603608, time_offset_ms: 15346},
      %Video.TimedPoint{lon: 10.025418, lat: 53.603676, time_offset_ms: 15679},
      %Video.TimedPoint{lon: 10.025413, lat: 53.603746, time_offset_ms: 16013},
      %Video.TimedPoint{lon: 10.025433, lat: 53.603829, time_offset_ms: 16346},
      %Video.TimedPoint{lon: 10.025496, lat: 53.603908, time_offset_ms: 16680},
      %Video.TimedPoint{lon: 10.025537, lat: 53.60399, time_offset_ms: 17014},
      %Video.TimedPoint{lon: 10.025548, lat: 53.604081, time_offset_ms: 17347},
      %Video.TimedPoint{lon: 10.02552, lat: 53.604173, time_offset_ms: 17681},
      %Video.TimedPoint{lon: 10.025479, lat: 53.604255, time_offset_ms: 18014},
      %Video.TimedPoint{lon: 10.025478, lat: 53.604338, time_offset_ms: 18348},
      %Video.TimedPoint{lon: 10.025486, lat: 53.60442, time_offset_ms: 18682},
      %Video.TimedPoint{lon: 10.025494, lat: 53.604492, time_offset_ms: 19015},
      %Video.TimedPoint{lon: 10.025499, lat: 53.604567, time_offset_ms: 19349},
      %Video.TimedPoint{lon: 10.025501, lat: 53.604644, time_offset_ms: 19682},
      %Video.TimedPoint{lon: 10.025488, lat: 53.604716, time_offset_ms: 20016},
      %Video.TimedPoint{lon: 10.02546, lat: 53.604793, time_offset_ms: 20350},
      %Video.TimedPoint{lon: 10.025447, lat: 53.604874, time_offset_ms: 20683},
      %Video.TimedPoint{lon: 10.025441, lat: 53.604946, time_offset_ms: 21017},
      %Video.TimedPoint{lon: 10.025431, lat: 53.605015, time_offset_ms: 21350},
      %Video.TimedPoint{lon: 10.025431, lat: 53.605099, time_offset_ms: 21684},
      %Video.TimedPoint{lon: 10.025464, lat: 53.605195, time_offset_ms: 22018},
      %Video.TimedPoint{lon: 10.025513, lat: 53.605267, time_offset_ms: 22351},
      %Video.TimedPoint{lon: 10.025508, lat: 53.605374, time_offset_ms: 22573},
      %Video.TimedPoint{lon: 10.025499, lat: 53.605384, time_offset_ms: 22907},
      %Video.TimedPoint{lon: 10.025482, lat: 53.605411, time_offset_ms: 23240},
      %Video.TimedPoint{lon: 10.025467, lat: 53.605438, time_offset_ms: 23574},
      %Video.TimedPoint{lon: 10.025453, lat: 53.605465, time_offset_ms: 23907},
      %Video.TimedPoint{lon: 10.025443, lat: 53.605492, time_offset_ms: 24241},
      %Video.TimedPoint{lon: 10.025431, lat: 53.605515, time_offset_ms: 24575},
      %Video.TimedPoint{lon: 10.025419, lat: 53.605536, time_offset_ms: 24908},
      %Video.TimedPoint{lon: 10.025401, lat: 53.605573, time_offset_ms: 25242},
      %Video.TimedPoint{lon: 10.025381, lat: 53.605624, time_offset_ms: 25575},
      %Video.TimedPoint{lon: 10.025359, lat: 53.605681, time_offset_ms: 25909},
      %Video.TimedPoint{lon: 10.025302, lat: 53.605734, time_offset_ms: 26243},
      %Video.TimedPoint{lon: 10.025226, lat: 53.605782, time_offset_ms: 26576},
      %Video.TimedPoint{lon: 10.025184, lat: 53.605849, time_offset_ms: 26910},
      %Video.TimedPoint{lon: 10.025156, lat: 53.605917, time_offset_ms: 27243},
      %Video.TimedPoint{lon: 10.025112, lat: 53.605982, time_offset_ms: 27577},
      %Video.TimedPoint{lon: 10.025059, lat: 53.606046, time_offset_ms: 27911},
      %Video.TimedPoint{lon: 10.024992, lat: 53.606104, time_offset_ms: 28244},
      %Video.TimedPoint{lon: 10.024914, lat: 53.606161, time_offset_ms: 28578},
      %Video.TimedPoint{lon: 10.024848, lat: 53.606225, time_offset_ms: 28911},
      %Video.TimedPoint{lon: 10.024794, lat: 53.606288, time_offset_ms: 29245},
      %Video.TimedPoint{lon: 10.024742, lat: 53.606351, time_offset_ms: 29579},
      %Video.TimedPoint{lon: 10.02468, lat: 53.606416, time_offset_ms: 29912},
      %Video.TimedPoint{lon: 10.02462, lat: 53.606478, time_offset_ms: 30246},
      %Video.TimedPoint{lon: 10.024559, lat: 53.60654, time_offset_ms: 30579},
      %Video.TimedPoint{lon: 10.024492, lat: 53.6066, time_offset_ms: 30913},
      %Video.TimedPoint{lon: 10.02442, lat: 53.606656, time_offset_ms: 31247},
      %Video.TimedPoint{lon: 10.024338, lat: 53.606707, time_offset_ms: 31580},
      %Video.TimedPoint{lon: 10.024254, lat: 53.606757, time_offset_ms: 31914},
      %Video.TimedPoint{lon: 10.024172, lat: 53.606805, time_offset_ms: 32247},
      %Video.TimedPoint{lon: 10.024083, lat: 53.606851, time_offset_ms: 32581},
      %Video.TimedPoint{lon: 10.023983, lat: 53.606896, time_offset_ms: 32915},
      %Video.TimedPoint{lon: 10.023877, lat: 53.606939, time_offset_ms: 33248},
      %Video.TimedPoint{lon: 10.023761, lat: 53.60698, time_offset_ms: 33582},
      %Video.TimedPoint{lon: 10.023636, lat: 53.607019, time_offset_ms: 33915},
      %Video.TimedPoint{lon: 10.023508, lat: 53.607051, time_offset_ms: 34249},
      %Video.TimedPoint{lon: 10.023382, lat: 53.607081, time_offset_ms: 34583},
      %Video.TimedPoint{lon: 10.02325, lat: 53.607106, time_offset_ms: 34916},
      %Video.TimedPoint{lon: 10.023121, lat: 53.607131, time_offset_ms: 35250},
      %Video.TimedPoint{lon: 10.022988, lat: 53.607149, time_offset_ms: 35583},
      %Video.TimedPoint{lon: 10.022846, lat: 53.607159, time_offset_ms: 35917},
      %Video.TimedPoint{lon: 10.022709, lat: 53.607167, time_offset_ms: 36251},
      %Video.TimedPoint{lon: 10.022574, lat: 53.607169, time_offset_ms: 36584},
      %Video.TimedPoint{lon: 10.022439, lat: 53.607172, time_offset_ms: 36918},
      %Video.TimedPoint{lon: 10.022306, lat: 53.607175, time_offset_ms: 37251},
      %Video.TimedPoint{lon: 10.022169, lat: 53.607177, time_offset_ms: 37585},
      %Video.TimedPoint{lon: 10.02203, lat: 53.607177, time_offset_ms: 37919},
      %Video.TimedPoint{lon: 10.021897, lat: 53.607175, time_offset_ms: 38252},
      %Video.TimedPoint{lon: 10.021768, lat: 53.607181, time_offset_ms: 38586},
      %Video.TimedPoint{lon: 10.021645, lat: 53.607194, time_offset_ms: 38919},
      %Video.TimedPoint{lon: 10.021511, lat: 53.607191, time_offset_ms: 39253},
      %Video.TimedPoint{lon: 10.02139, lat: 53.607169, time_offset_ms: 39587},
      %Video.TimedPoint{lon: 10.021268, lat: 53.607143, time_offset_ms: 39920},
      %Video.TimedPoint{lon: 10.021139, lat: 53.607131, time_offset_ms: 40254},
      %Video.TimedPoint{lon: 10.021012, lat: 53.607124, time_offset_ms: 40587},
      %Video.TimedPoint{lon: 10.02088, lat: 53.607112, time_offset_ms: 40921},
      %Video.TimedPoint{lon: 10.020749, lat: 53.607099, time_offset_ms: 41255},
      %Video.TimedPoint{lon: 10.02062, lat: 53.607085, time_offset_ms: 41588},
      %Video.TimedPoint{lon: 10.020488, lat: 53.607067, time_offset_ms: 41922},
      %Video.TimedPoint{lon: 10.020357, lat: 53.60705, time_offset_ms: 42255},
      %Video.TimedPoint{lon: 10.020224, lat: 53.607032, time_offset_ms: 42589},
      %Video.TimedPoint{lon: 10.020097, lat: 53.607011, time_offset_ms: 42923},
      %Video.TimedPoint{lon: 10.019968, lat: 53.606992, time_offset_ms: 43256},
      %Video.TimedPoint{lon: 10.019846, lat: 53.60698, time_offset_ms: 43590},
      %Video.TimedPoint{lon: 10.019712, lat: 53.606961, time_offset_ms: 43923},
      %Video.TimedPoint{lon: 10.019581, lat: 53.606936, time_offset_ms: 44257},
      %Video.TimedPoint{lon: 10.019455, lat: 53.606912, time_offset_ms: 44591},
      %Video.TimedPoint{lon: 10.019331, lat: 53.606883, time_offset_ms: 44924},
      %Video.TimedPoint{lon: 10.019211, lat: 53.606852, time_offset_ms: 45258},
      %Video.TimedPoint{lon: 10.019096, lat: 53.606824, time_offset_ms: 45591},
      %Video.TimedPoint{lon: 10.018978, lat: 53.606793, time_offset_ms: 45925},
      %Video.TimedPoint{lon: 10.01886, lat: 53.60676, time_offset_ms: 46259},
      %Video.TimedPoint{lon: 10.018748, lat: 53.606721, time_offset_ms: 46592},
      %Video.TimedPoint{lon: 10.018642, lat: 53.606676, time_offset_ms: 46926},
      %Video.TimedPoint{lon: 10.018535, lat: 53.606636, time_offset_ms: 47259},
      %Video.TimedPoint{lon: 10.018431, lat: 53.60659, time_offset_ms: 47593},
      %Video.TimedPoint{lon: 10.018336, lat: 53.606535, time_offset_ms: 47927},
      %Video.TimedPoint{lon: 10.018251, lat: 53.606475, time_offset_ms: 48260},
      %Video.TimedPoint{lon: 10.018167, lat: 53.606414, time_offset_ms: 48594},
      %Video.TimedPoint{lon: 10.018091, lat: 53.606349, time_offset_ms: 48927},
      %Video.TimedPoint{lon: 10.018021, lat: 53.60628, time_offset_ms: 49261},
      %Video.TimedPoint{lon: 10.017959, lat: 53.606209, time_offset_ms: 49595},
      %Video.TimedPoint{lon: 10.0179, lat: 53.606138, time_offset_ms: 49928},
      %Video.TimedPoint{lon: 10.017829, lat: 53.60608, time_offset_ms: 50262},
      %Video.TimedPoint{lon: 10.01774, lat: 53.606053, time_offset_ms: 50595},
      %Video.TimedPoint{lon: 10.017659, lat: 53.606048, time_offset_ms: 50929},
      %Video.TimedPoint{lon: 10.017594, lat: 53.606033, time_offset_ms: 51263},
      %Video.TimedPoint{lon: 10.017562, lat: 53.605995, time_offset_ms: 51596},
      %Video.TimedPoint{lon: 10.017532, lat: 53.605946, time_offset_ms: 51930},
      %Video.TimedPoint{lon: 10.017498, lat: 53.605888, time_offset_ms: 52263},
      %Video.TimedPoint{lon: 10.01747, lat: 53.605821, time_offset_ms: 52597},
      %Video.TimedPoint{lon: 10.017416, lat: 53.605756, time_offset_ms: 52931},
      %Video.TimedPoint{lon: 10.017365, lat: 53.605684, time_offset_ms: 53264},
      %Video.TimedPoint{lon: 10.017342, lat: 53.605611, time_offset_ms: 53598},
      %Video.TimedPoint{lon: 10.017312, lat: 53.605546, time_offset_ms: 53931},
      %Video.TimedPoint{lon: 10.017242, lat: 53.605498, time_offset_ms: 54265},
      %Video.TimedPoint{lon: 10.017173, lat: 53.605463, time_offset_ms: 54599},
      %Video.TimedPoint{lon: 10.017113, lat: 53.605429, time_offset_ms: 54932},
      %Video.TimedPoint{lon: 10.01704, lat: 53.60541, time_offset_ms: 55266},
      %Video.TimedPoint{lon: 10.016958, lat: 53.605392, time_offset_ms: 55599},
      %Video.TimedPoint{lon: 10.016877, lat: 53.605381, time_offset_ms: 55933},
      %Video.TimedPoint{lon: 10.016793, lat: 53.605381, time_offset_ms: 56266},
      %Video.TimedPoint{lon: 10.016698, lat: 53.605382, time_offset_ms: 56600},
      %Video.TimedPoint{lon: 10.01659, lat: 53.605382, time_offset_ms: 56934},
      %Video.TimedPoint{lon: 10.016471, lat: 53.605385, time_offset_ms: 57267},
      %Video.TimedPoint{lon: 10.016346, lat: 53.605386, time_offset_ms: 57601},
      %Video.TimedPoint{lon: 10.016221, lat: 53.605378, time_offset_ms: 57934},
      %Video.TimedPoint{lon: 10.01609, lat: 53.605366, time_offset_ms: 58268},
      %Video.TimedPoint{lon: 10.015959, lat: 53.605357, time_offset_ms: 58602},
      %Video.TimedPoint{lon: 10.015835, lat: 53.605339, time_offset_ms: 58935},
      %Video.TimedPoint{lon: 10.015708, lat: 53.605309, time_offset_ms: 59269},
      %Video.TimedPoint{lon: 10.01557, lat: 53.605295, time_offset_ms: 59602},
      %Video.TimedPoint{lon: 10.015435, lat: 53.605284, time_offset_ms: 59936},
      %Video.TimedPoint{lon: 10.015303, lat: 53.605276, time_offset_ms: 60270},
      %Video.TimedPoint{lon: 10.015178, lat: 53.605273, time_offset_ms: 60603},
      %Video.TimedPoint{lon: 10.015047, lat: 53.60526, time_offset_ms: 60937},
      %Video.TimedPoint{lon: 10.014919, lat: 53.605255, time_offset_ms: 61270},
      %Video.TimedPoint{lon: 10.014802, lat: 53.605252, time_offset_ms: 61604},
      %Video.TimedPoint{lon: 10.014691, lat: 53.605261, time_offset_ms: 61938},
      %Video.TimedPoint{lon: 10.014572, lat: 53.60527, time_offset_ms: 62271},
      %Video.TimedPoint{lon: 10.014452, lat: 53.605279, time_offset_ms: 62605},
      %Video.TimedPoint{lon: 10.014322, lat: 53.605268, time_offset_ms: 62938},
      %Video.TimedPoint{lon: 10.01419, lat: 53.60526, time_offset_ms: 63272},
      %Video.TimedPoint{lon: 10.014055, lat: 53.605252, time_offset_ms: 63606},
      %Video.TimedPoint{lon: 10.013941, lat: 53.605243, time_offset_ms: 63939},
      %Video.TimedPoint{lon: 10.013877, lat: 53.605225, time_offset_ms: 64273},
      %Video.TimedPoint{lon: 10.013844, lat: 53.605193, time_offset_ms: 64606},
      %Video.TimedPoint{lon: 10.013827, lat: 53.605152, time_offset_ms: 64940},
      %Video.TimedPoint{lon: 10.013829, lat: 53.605098, time_offset_ms: 65274},
      %Video.TimedPoint{lon: 10.013858, lat: 53.605041, time_offset_ms: 65607},
      %Video.TimedPoint{lon: 10.013895, lat: 53.604986, time_offset_ms: 65941},
      %Video.TimedPoint{lon: 10.013942, lat: 53.604939, time_offset_ms: 66274},
      %Video.TimedPoint{lon: 10.013997, lat: 53.604937, time_offset_ms: 66608},
      %Video.TimedPoint{lon: 10.01407, lat: 53.604959, time_offset_ms: 66942},
      %Video.TimedPoint{lon: 10.014175, lat: 53.604962, time_offset_ms: 67275},
      %Video.TimedPoint{lon: 10.014292, lat: 53.604965, time_offset_ms: 67609},
      %Video.TimedPoint{lon: 10.014411, lat: 53.604965, time_offset_ms: 67942},
      %Video.TimedPoint{lon: 10.014519, lat: 53.604958, time_offset_ms: 68276},
      %Video.TimedPoint{lon: 10.014622, lat: 53.604963, time_offset_ms: 68610},
      %Video.TimedPoint{lon: 10.014716, lat: 53.604973, time_offset_ms: 68943},
      %Video.TimedPoint{lon: 10.014795, lat: 53.605003, time_offset_ms: 69277},
      %Video.TimedPoint{lon: 10.014896, lat: 53.605024, time_offset_ms: 69610},
      %Video.TimedPoint{lon: 10.015001, lat: 53.605049, time_offset_ms: 69944},
      %Video.TimedPoint{lon: 10.015109, lat: 53.605069, time_offset_ms: 70278},
      %Video.TimedPoint{lon: 10.01522, lat: 53.605069, time_offset_ms: 70611},
      %Video.TimedPoint{lon: 10.015341, lat: 53.605065, time_offset_ms: 70945},
      %Video.TimedPoint{lon: 10.015469, lat: 53.60506, time_offset_ms: 71278},
      %Video.TimedPoint{lon: 10.0156, lat: 53.605047, time_offset_ms: 71612},
      %Video.TimedPoint{lon: 10.015685, lat: 53.605036, time_offset_ms: 71946},
      %Video.TimedPoint{lon: 10.015721, lat: 53.605037, time_offset_ms: 72279},
      %Video.TimedPoint{lon: 10.015757, lat: 53.60504, time_offset_ms: 72613},
      %Video.TimedPoint{lon: 10.015895, lat: 53.605043, time_offset_ms: 72946},
      %Video.TimedPoint{lon: 10.016047, lat: 53.605058, time_offset_ms: 73280},
      %Video.TimedPoint{lon: 10.016175, lat: 53.605061, time_offset_ms: 73614},
      %Video.TimedPoint{lon: 10.016258, lat: 53.605067, time_offset_ms: 73947},
      %Video.TimedPoint{lon: 10.016299, lat: 53.605065, time_offset_ms: 74281},
      %Video.TimedPoint{lon: 10.016363, lat: 53.605046, time_offset_ms: 74614},
      %Video.TimedPoint{lon: 10.0165, lat: 53.605058, time_offset_ms: 74948},
      %Video.TimedPoint{lon: 10.016686, lat: 53.605066, time_offset_ms: 75282},
      %Video.TimedPoint{lon: 10.016807, lat: 53.605078, time_offset_ms: 75615},
      %Video.TimedPoint{lon: 10.016885, lat: 53.605104, time_offset_ms: 75949},
      %Video.TimedPoint{lon: 10.016932, lat: 53.605124, time_offset_ms: 76282},
      %Video.TimedPoint{lon: 10.016996, lat: 53.605134, time_offset_ms: 76616},
      %Video.TimedPoint{lon: 10.017087, lat: 53.605134, time_offset_ms: 76950},
      %Video.TimedPoint{lon: 10.01718, lat: 53.605135, time_offset_ms: 77283},
      %Video.TimedPoint{lon: 10.01727, lat: 53.605133, time_offset_ms: 77617},
      %Video.TimedPoint{lon: 10.017345, lat: 53.605133, time_offset_ms: 77950},
      %Video.TimedPoint{lon: 10.017386, lat: 53.605131, time_offset_ms: 78284},
      %Video.TimedPoint{lon: 10.017446, lat: 53.605127, time_offset_ms: 78613},
      %Video.TimedPoint{lon: 10.017472, lat: 53.605123, time_offset_ms: 78947},
      %Video.TimedPoint{lon: 10.017542, lat: 53.605111, time_offset_ms: 79280},
      %Video.TimedPoint{lon: 10.01762, lat: 53.605083, time_offset_ms: 79614},
      %Video.TimedPoint{lon: 10.017688, lat: 53.605036, time_offset_ms: 79947},
      %Video.TimedPoint{lon: 10.017717, lat: 53.604973, time_offset_ms: 80281},
      %Video.TimedPoint{lon: 10.017708, lat: 53.604901, time_offset_ms: 80615},
      %Video.TimedPoint{lon: 10.017692, lat: 53.604825, time_offset_ms: 80948},
      %Video.TimedPoint{lon: 10.017673, lat: 53.604741, time_offset_ms: 81282},
      %Video.TimedPoint{lon: 10.017653, lat: 53.604657, time_offset_ms: 81615},
      %Video.TimedPoint{lon: 10.017631, lat: 53.604571, time_offset_ms: 81949},
      %Video.TimedPoint{lon: 10.017609, lat: 53.604481, time_offset_ms: 82283},
      %Video.TimedPoint{lon: 10.017605, lat: 53.604393, time_offset_ms: 82616},
      %Video.TimedPoint{lon: 10.017642, lat: 53.604309, time_offset_ms: 82950},
      %Video.TimedPoint{lon: 10.017698, lat: 53.604229, time_offset_ms: 83283},
      %Video.TimedPoint{lon: 10.017714, lat: 53.604145, time_offset_ms: 83617},
      %Video.TimedPoint{lon: 10.017696, lat: 53.604057, time_offset_ms: 83951},
      %Video.TimedPoint{lon: 10.017682, lat: 53.603962, time_offset_ms: 84284},
      %Video.TimedPoint{lon: 10.017662, lat: 53.603871, time_offset_ms: 84618},
      %Video.TimedPoint{lon: 10.0176, lat: 53.603787, time_offset_ms: 84951},
      %Video.TimedPoint{lon: 10.017501, lat: 53.603715, time_offset_ms: 85285},
      %Video.TimedPoint{lon: 10.017421, lat: 53.603639, time_offset_ms: 85619},
      %Video.TimedPoint{lon: 10.017366, lat: 53.603553, time_offset_ms: 85952},
      %Video.TimedPoint{lon: 10.017308, lat: 53.603466, time_offset_ms: 86286},
      %Video.TimedPoint{lon: 10.017235, lat: 53.603385, time_offset_ms: 86619},
      %Video.TimedPoint{lon: 10.017185, lat: 53.603296, time_offset_ms: 86953},
      %Video.TimedPoint{lon: 10.017162, lat: 53.603206, time_offset_ms: 87287},
      %Video.TimedPoint{lon: 10.01714, lat: 53.603116, time_offset_ms: 87620},
      %Video.TimedPoint{lon: 10.017105, lat: 53.603029, time_offset_ms: 87954},
      %Video.TimedPoint{lon: 10.017072, lat: 53.602943, time_offset_ms: 88287},
      %Video.TimedPoint{lon: 10.017047, lat: 53.602861, time_offset_ms: 88621},
      %Video.TimedPoint{lon: 10.017027, lat: 53.602777, time_offset_ms: 88954},
      %Video.TimedPoint{lon: 10.017018, lat: 53.602695, time_offset_ms: 89288},
      %Video.TimedPoint{lon: 10.017014, lat: 53.602617, time_offset_ms: 89622},
      %Video.TimedPoint{lon: 10.017024, lat: 53.602552, time_offset_ms: 89955},
      %Video.TimedPoint{lon: 10.016999, lat: 53.602507, time_offset_ms: 90289},
      %Video.TimedPoint{lon: 10.01695, lat: 53.60248, time_offset_ms: 90622},
      %Video.TimedPoint{lon: 10.01689, lat: 53.602476, time_offset_ms: 90956},
      %Video.TimedPoint{lon: 10.016832, lat: 53.602475, time_offset_ms: 91290},
      %Video.TimedPoint{lon: 10.016795, lat: 53.602473, time_offset_ms: 91623},
      %Video.TimedPoint{lon: 10.01678, lat: 53.602458, time_offset_ms: 91957},
      %Video.TimedPoint{lon: 10.016781, lat: 53.60243, time_offset_ms: 92290},
      %Video.TimedPoint{lon: 10.016796, lat: 53.602405, time_offset_ms: 92624},
      %Video.TimedPoint{lon: 10.016829, lat: 53.602392, time_offset_ms: 92958},
      %Video.TimedPoint{lon: 10.016896, lat: 53.602383, time_offset_ms: 93291},
      %Video.TimedPoint{lon: 10.016973, lat: 53.602378, time_offset_ms: 93625},
      %Video.TimedPoint{lon: 10.017031, lat: 53.602356, time_offset_ms: 93958},
      %Video.TimedPoint{lon: 10.017049, lat: 53.602304, time_offset_ms: 94292},
      %Video.TimedPoint{lon: 10.017045, lat: 53.602242, time_offset_ms: 94626},
      %Video.TimedPoint{lon: 10.017047, lat: 53.602173, time_offset_ms: 94959},
      %Video.TimedPoint{lon: 10.017048, lat: 53.602099, time_offset_ms: 95293},
      %Video.TimedPoint{lon: 10.017037, lat: 53.602023, time_offset_ms: 95626},
      %Video.TimedPoint{lon: 10.017037, lat: 53.601946, time_offset_ms: 95960},
      %Video.TimedPoint{lon: 10.017034, lat: 53.601871, time_offset_ms: 96294},
      %Video.TimedPoint{lon: 10.017028, lat: 53.601794, time_offset_ms: 96627},
      %Video.TimedPoint{lon: 10.017026, lat: 53.601719, time_offset_ms: 96961},
      %Video.TimedPoint{lon: 10.017022, lat: 53.60164, time_offset_ms: 97294},
      %Video.TimedPoint{lon: 10.017018, lat: 53.60156, time_offset_ms: 97628},
      %Video.TimedPoint{lon: 10.017012, lat: 53.601482, time_offset_ms: 97962},
      %Video.TimedPoint{lon: 10.017011, lat: 53.601401, time_offset_ms: 98295},
      %Video.TimedPoint{lon: 10.017007, lat: 53.60132, time_offset_ms: 98629},
      %Video.TimedPoint{lon: 10.017004, lat: 53.601239, time_offset_ms: 98962},
      %Video.TimedPoint{lon: 10.017003, lat: 53.601157, time_offset_ms: 99296},
      %Video.TimedPoint{lon: 10.016998, lat: 53.601076, time_offset_ms: 99630},
      %Video.TimedPoint{lon: 10.016995, lat: 53.600999, time_offset_ms: 99963},
      %Video.TimedPoint{lon: 10.016991, lat: 53.600921, time_offset_ms: 100_297},
      %Video.TimedPoint{lon: 10.016989, lat: 53.600846, time_offset_ms: 100_630},
      %Video.TimedPoint{lon: 10.01698, lat: 53.600776, time_offset_ms: 100_964},
      %Video.TimedPoint{lon: 10.016975359281437, lat: 53.60074769161677, time_offset_ms: 101_119}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "mqofeBix{bR???????A???A?????A???A???A???A???A?A?A@A???A?C?A?A?A?C?A?A?C?C?A?C?C?C?C?C?C?EAC?E?E?C?E?GAE?E?GAE?GAG?GAG?GAGAIAG?IAGAGAGAEAEAGAEAEACCEAEACCEACACCCACACCCAACCAACCAACACCAACACAAACACAC?CACACAEAC?EAC?EAC?EAE?C?EAE?E?E?E?E?E?E?E?E@E?E?E?E?E?E@E?G?E?E@E?E?E?E?E@G?E?E?E@E?G?E?E?E@G?E?E?G?E@G?E?G?E?G?G@E?G?G?G?E?G?G?G?E?G?G?G?G?G?E?G?G?G?G?G?G?G?G?E?G?G?G?G?G?G?E?G?G?G?G?E?G?G?G?E@G?G?G?G?E@G?G?G?G@E?G?G?G?G@G?G?G?E@G?G?G?G?G?G?G?G?G@G?G?GAG?G?G?G?G?G?G?G?GAG?G?G?G?GAG?G?G?G?GAG?G?E?G?G?G?E?G?GAE?G?G?E?G?G@E?G?G?E?G?G?E?G@G?G?G?G@E?G?G?G@G?G?G@G?G@G?G?E@G?G@G?G?E@G?G@E?G@G?E?G@E?G@E?G?E@G?E@E?G?E@E?E@G?E?E@E?E?G@E?E@E?E?E@E?E?E@G?E?E@E?E?G?E@G?E?G?E@G?E?G?E?G?G?E?G?G?E?G?EAG?E?GAE?GAE?GAE?GAEAE?GAEAGAEAGAEAGAEAGAGAGAECGAGAGAGAGAGCGAGAGAIAGAGAIAGAGAGAGAG?IAGAG?GAG?GAG?I?GAG?G?G?G?G?I?G?G?G?G?G?G@G?I?G?G?G?G@G?G?I?G@G?G?G?G@I?G?G?G@G?G?G?I@G?G?G?G@I?G?G?G@G?G?I?G@G?G?G@G?G@G?I@G?G@G?G@G?I@G?G@G@G?G@G?G@G@G?G@G@E?G@G@E?G@E@G?E@G?E@G?E@E?E?G@E?E@G?E?E@G?E?G?G?E@G?G?G?E?G?G?G?G?G?G?GAG?G?G?G?G?E?G?GAG?E?G?E?G?E?E?G?E?G?EAE?G?E?G?E?E?G?E@G?E?G?G?E?G?G?E?G?G?G?G?E?G@G?G?G?E?G?G?G@G?G?G?G?G@G?G?G?G@G?G?G@E?G@G?G?G@E?G@G?E@G?G@E?G@E?G@E@G?E@G?E@E@G?E@G?E@G@E?G@G?E@G@G?E@G?G@E?G@G?G@G?E@G?G@G?G?E@G?G?G@G?G?E?G@G?G?G?G?G?E@G?G?G?E?G?E?G?E?G?G?E?E?G?E?G?E?E?E@G?E?E?E?E?G?E?E?G?E?E?G?E?E?G?E?G?E?G?E@G?E?E?G?E?E@E?G?E?E?E?E@E?E?E?E?E@C?E?E?E?E@C?E?E?E?E@E?E?G?E?E@G?E?G?E?G@G?E?G?G?G?G?G@G?G?G?G?G?G?G@G?G?G?G?G?G?G@G?G?G?G?E@G?G?G@G?E?G?G@E?G@G?E?G@E?G@E?G?E@G?E@G?E@G?E@G?E@E?G@G?E@G@E?G@E?G@E?G@G@E?G@G?E@G@E?G@E?G@E?G@E?G@E?E@G?E@E?G@E?G?E@E?G?E@G?G?E@G?G?G?G?I@G?G?G?I?I?G?I?I?IAG?I?I?GAI?G?I?GAI?G?IAG?G?G?IAG?G?G?GAG?G?E?G?G?EAG?E?G?E?E?E?E?E?E?G@C?E?E?E?E?E?C?E@E?E?E?E?E?G@E?E?E?G?E@E?G?E?G@G?E?G?G?E@G?E?G?E@G?E?G?E@E?E?G?E@E?E?E@G?E?E@E?E?E@E?E?E@E?E@E?E@E?E@E?C@E?E@E@E?E@E?G@E@E?E@E@E?E@E@G?E@E@G?E@E@G?E@E@G?G@E?E@G?E@G?E@G?E?E@G?E?G@E?G?E@E?G?E?G?E@E?G?E?E?G?E@E?G?E?G?E?E?G?E?E?G?E?E?G?E?G?E?G?E?G?GAE?G?GAG?G?GAGAG?GAGAGAGAGAIAGCGAGAGCICGAGCGCGCGCGCGCGEGCGCGEGCIEGEGCGEGEGCGEGEGCGEGCIEGEGCGCGEGCGCGCGCGCGCGCGCGCGCGAGCGAGCIAGAGCIAGAIAGAIAGAI?GAIAG?I?IAG?I?G?I?G?I@I?G?I@G@I?G@I@I@G@I@I@IBG@I@GBI@GBIBG@IBG@IBGBGBI@GBGBG@IBGBG@GBG@GBG@G@G@GBG@G@G@I@G@G?G@G@G?G@G?G@G?G?G@I?G?G?G?G?G?G?I?G?G?GAG?G?I?GAG?G?GAI?G?GAG?G?GAG?GAG?G?EAG?G?GAE?GAG?E?GAE?G?EAG?E?GAE?G?EAG?E?GAG?E?G?GAE?G?GAE?G?G?GAE?G?G?G?GAE?G?G?G?G?GAG?G?E?G?G?G?G?G?G?G?G?E@G?G?G?E?G@G?E?G@G?E@G?E@G?E@G?E@G@E?G@E@G?G@E@G@G@E@G@G@E@G@G@G@G@E@GBG@G@G@G@G@G@G@G@G@GBG@G@G@G?I@G@G@G@G@G@I?G@G@G?G@G@G?G@G?E@G?G@G?G@E?G?G@E?G@E?G?E@G?E@G?E?E@G?E?G@E?G@E?E?G@E?E?G@E?E?G@E?E?G@E?G?E@G?E?G?G@G?G?G?G?E?G?G?I?G?G?I?GAG?I?GAG?IAG?IAIAGAIAIAIAIAICIAICICIAICICICGCICGCICGCGCGCGCGAGCGCGCECGAECGAECGCEAGCGAGCIAICIAKCKAMCQ?SAW?U?U@Q@M@K@I@G@G@E@C@C?C@A@C?A@??A?A??@??A???A??@A???A?A@??A?A@??A@A?A?A@A?A@A?A@A@A?A@A?A@A?A@A?A@C@A?A@A?A@A@A?C@A?A@A@A?C@A@A?C@A@A?A@C@A@C?A@A@C?A@C@A@C?A@A@C@A?C@A@C@A?C@A@A@C?A@A@C?A@A?C@A@A?A@A?C@A@A?A@A?A@A?C@A?A@A?A@A?A@A?A@A?A@A?A@A?A@A?A@A??@A?A?A@A?A@A?A@A?A@A???A@A?A@A?A@A?A@A?A@A?C@A?A@A@C?A@C@A?C@A@C@C@A?C@C@C@C@C@C@C@E@C@C@E@C@EBE@C@E@E@EBE@E@EBE@E@E@EBE@C@EBE@E@E@EBE@E@EBC@EBE@EBE@EBEBC@EBEBEBC@EBEBEBCBEBEDCBEBEDCBEDEBEDCDEDEBCDEDEDCDEDCFEDEDCDEDEFCDEDEDCFEDEDCDEDEDCDEDEDEDCDEDEDEDEDEBEDEDEBEDGBEDEBGBEDEBGBEBEBGBEBGBEBEBGBE@GBEBEBGBE@GBEBE@GBEBEBE@GBEBEBGBE@EBEBGBEBEBEBGBEBEBEBGDEBEBEBGDEBEBEDEBGDEBEDEBGDEBEDEBEDGDEDEBEDEDEDEDEDEDEDGDEDEDEDEDEDCDEDEDEFEDEDEDEFEDEDCFEDEFEDEFEDEFEFEDCFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFGDEFEDEFEDGFEDEDEFEDGDEDEFEDEDGDEDEDEDEDEDGDEBEDEDEDEDEBEDEDGBEDEDEBEDEDEBEDEDEBEDEBEDEDGBEDEDEBEDEDEBEDEDGDEBEDEDEDGDEDEDGDEDEDEDGDEDGDEDEDEFGDEDEDEDEDGDEDEDEDEDEDGDEDEDEDEDEDEDEDEDEDEDEDEDGDEDEDEDEDEDEDEDEDEDEFGDEDEDEDEDEDEDEFEDEDEDEFEDEDEDEFEDEDEDEFGDEFEDCDEFEDEFEDEDEFEFEDEFEDCFEDEFEDEFCDEFEFEDCFEFEDCFEFEDCFEFEFEFCFEFCFEFEDCFEFEFCHEFCFEFCFEFCFEFEFCFEHCFEFCFEFCFEHCFEFEFCFEHCFEFCFCFEFCHEFCFEFCFEFCFCHEFCFCFEFCFEFCFCHEFCFCFCFEFCFCHEFCFCFEHCFCFCFEHCFCHEFCHCFCHEFCHCFCHEHCFCHEHCHCFCHEHCHCHEHCHCHCHEHCHCHCHEHCHCJCHCHEHCHCHCJCHEHCHCJCHCHCJCHCHCJEHCHCJCHCJCJCHCJCHCJEJCHCJCJCJCJCHCJCJCJCJCJCJCJCJCJCJCJCJCLCJCJCLCJCJCLCJCJCLCJAJCJCLCJCLCJAJCLCJAJCLCJAJCLCJAJCLCJAJCLAJCJCLAJCJALCJAJCLAJCJAJCLAJCJALCJAJALCJAJCJALAJCLAJCLAJALCJALALCJALAJCLALAJALCJALAJCLAJALALCJALAJAJALCJALAJALAJCLAJALAJALAJAJALAJALALAJALAJALAJALALAJALALAJAL?LAJALAL?JALALAL?LAL?LALAL?LAL?NALAL?LAL?LAL?NAL?LAL?L?LAL?LAJ?LAL?L?LAL?L?JAL?L?LAJ?L?L?LAL?J?L?LAL?L?J?L?LAL?J?L?L?L?J?LAL?J?L?L?L?J?LAL?L?J?L?L?J?LAL?L?L?J?L?L?JAL?L?J?L?L?L?JAL?L?J?L?L?J?LAL?J?L?J?L?L?J?LAL?J?L?L?L?J?L?LAL?J?L?L?L?L?L?L?L?J?L?L?LAL?L?L?L?L?L?L?L?L?L?L?L?L?L?L?L?J?L?L?L?L?L?L@J?L?L?L?L?J?L?L?J?L?L?J?L?JAL?J?L?L?J?L?J?LAJ?J?L?JAL?J?L?JAL?JAJ?J?LAJ?JAL?J?JAJ?JAL?JAJ?J?JAJ?JAL?J?JAJ?J?JAL?J?J?LAJ?L?J?L?J?L?L?J?L@L?L?L@J?L?L@J?J@L?J@L@J?J@J@L@J@J?J@J@J@J@J@J@J@J@J@J@J@JBJ@J@J@J@J@L@JBJ@J@J@L@J@J@JBJ@L@J@J@J@J@L@J?L@J@J@J@L@J?J@L@J?L@J@L?J@J@L?J@L?J@J?L@J?J@L?J@L?J?J@J?L@J?J@L?J@J?J?L@J?J@L?J@L?J@L?J@L?J@L@L?J@L?L@L?J@L@J?L@L?J@L@L?J@L@J?L@J@L?L@J?L@J@L?J@L@J?L@J@L?J@L@J?L@J@L?J@L@J@J?L@J@L?J@J@L@J?L@J@J@L@L?J@L@J@L@J?L@J@L@L@J@L@L?J@L@L@J@L@J@L@L?J@L@J@L@L@J@L?J@L@J@L@L@J@L@J?L@J@L@J@L@L@J@L?J@L@L@J@L@J@L@L@L@J@L@L@J@L@J?L@J@L@J@L@J@L@J@J@L@J@J@L@J@L@J@J@J@L@J@J@L@J@L@J@L@J@L@L@J@L@J@L@J@L?J@L@J@J@J@L?J@J@J@L?J@H@J@J?J@J@J?J@J@J?J@J@J@J?J@J@J@L?J@L@J@L@L@J@L@L?L@L@J@L@LBL@J@L@L@L@J@L@L@L@J@LBJ@L@L@J@LBL@J@L@J@LBJ@L@J@L@JBL@J@J@LBJ@J@L@JBJ@J@L@JBJ@J@L@JBJ@J@J@JBL@J@JBJ@LBJ@J@LBJ@JBJ@LBJ@JBJ@J@LBJ@JBJ@JBJ@LBJ@JBJBJ@JBJ@JBJ@JBJ@JBJ@JBJ@JBJ@H@JBJ@JBJ@HBJ@JBJ@H@JBJ@HBJ@J@HBJ@JBH@JBJ@JBH@JBJ@JBJ@HBJ@JBJ@JBJ@JBJBJ@JBJ@HBJBJ@JBJ@JBJBJ@JBJBH@JBJBJ@JBJBJBJ@HBJBJBJ@HBJBJBJBHBJ@JBJBHBJBHBJBJBHBJBHBJBHBJBHBJBHBJDHBJBHBHBJBHBJBHDJBHBHBJBHBHDJBHBHBJBHBJBHBHDHBJBHBHBHBJBHBHBHBHBJBHBHDHBHBJBHBHBHDHBJBHBHBHDHBHBJDHBHDHBHBHDHBHDHBHDHBHDHBHDHDHBHDFDHBHDHDHDFBHDHDFDHDHBFDHDFDHDFDHDFDHDFDFDHBFDHDFDFDFDHDFDFDFDHDFDFDFDHDFDFDFDFFFDFDHDFDFDFDFDFDFDFDFDFFFDFDFDFDFFFDFDFDFDFFFDDDFDFFFDDDFDFFDDFDFFFDDFFDDDFFFDDDFFDDFFDDFFDDFFDDFFDDDFFDDFDDFFDDDFDDFFDDDFDDDFFDDFDDDFDFDDDFDDDFFDDFDFDDDFDDDFFFDDDFDDDFFDDFDDDFFDDDDFFDDDFFDDFDDDFDFDFDDDFDFBFDFDFBFDFBFBFBFDFBFBHBF@FBFBF@FBHBF@F@HBF@F@H@FBF@F@H@F@F@F@F?H@F@F@F@F@F?F@F@F@F@F?D@F@D@F?D@D@F@D@D?D@D@D@D@B?D@B@D@B@D@B?D@B@B@B@B@B@B@B@B@B@B@B@B@B@BB@@B@B@BBB@@BB@BBBBB@BBBB@BBBBBBBBBBBBBBBBD@BBDBBBDBBBD@BBDBDBB@DBDBDBD@BBDBD@DBDBD@DBDBD@DBDBD@DBDBD@DBDBF@DBDBD@FBDBD@DBFBDBD@FBDBDBFBDBDBF@DBDBDBFDDBDBFBDBDBFDDBDBFDDBDBFDDBDDFBDDFBDDFDDBFDDBFDDBFDFDDBFBFDFBDDFBFBDBFBFBDBFBFBDBFBFBDBF@FBD@FBFBD@FBF@DBF@DBF@DBF@DBF@DBF@DBDBF@DBDBFBDBDBDBDBDBDBDBDBBBDDDBDDDBBDDDDDBBDDBDDDBDDFDDBDBFDDBDBFDDBDBFBDBFBDBFDD@DBFBDBDBFBDBDBF@DBDBDBF@DBDBD@FBDBD@DBD@FBD@DBD@DBD@F@DBD@D@DBD@D@D@DBF@D@D@D@D@FBD@D@D@F@D@D@F@D@F@D@F@F@D@F@F@F@F@D@F@H@F@F@F@F@F@H?F@F@F@F@F?H@F@F?F@F@F?F@F@H?F@F?D@F?F@H?D@F?F?F@F?F@F?F?F?F@F?F?D?F@F?F?F?F?F@F?H?F?F?F?F?F?H?F?F?H?F?F?H?F?H?H?F?H?H?H?F?H?H?H?H?H?H?H?H?H?H?H?J?H?H?H?J?H?J?H?J?H?J?H?J?JAH?J?J?H?J?J?J?J?J?J?J?JAJ?J?J?J?J?J?J?J?J?L?JAJ?J?L?J?J?J?J?L?J?J?L?J?J?J?L@J?J?J?L?J?J?J@L?J?J?J@L?J?J@J?J?L@J?J@J?L?J@J?J@L?J@L?J@L?J@L?J@L?J@L?L@J@L?L@J?L@J?L@L?J@L?L@J@L?J@L?J@L?L@J?L@J@L?J@L?J@J@L?J@J@L@J?J@J@L@J?J@J@J@J@J@J@L@J@J@J@J@J@J@L@J@JBL@J@J@L@JBJ@L@LBJ@L@J@LBJ@L@L@J@L@J@L@L@J@L@L@L@L@L@J@L@L@L?L@L@L@L?J@L@L?L@L@L?L@J?L@L?L@J@L?L@L?L@J?L@L?J@L?L@J?L@L?L@J?L@L?J?L@L?J@L?L?J@L?J?L@J?L?J@L?J?J@L?J?J?J@L?J?J?J@J?L?J@J?J?J@J?J?L@J?J?L@J?L@J?J@L?L?J@L?L@J?L@L?J@L?L@J?L@J?L@L?J?L@J?L@L?J?J@L?J?L@J?L?J?J@L?J?J?J?L@J?J?J?J?J?J?J?J@H?J?J?J?J?H?JAJ?H?J?H?J?H?J?HAJ?H?J?HAH?J?HAJ?H?JAH?J?HAJ?H?JAJ?JAH?JAJ?J?JAJ?JAH?JAL?JAJ?J?JAJ?JAJ?HAL?J?JAJ?JAJ?J?HAJ?J?J?JAJ?J?J?J?J?J?J?J?J?L?J?J?J?L?J?L@J?L?J@L?L?J@L?J@L?J?L@L?J@L?L@J?L?J@L?J@L?L@J?L@L?J?L@J?L@L?J?L@L?L@L?L@L?J?L@L?L@L?L@L?L?L@L?L@L?L@J?L@L?L@L@J?L@L?L@J@J@L@J?J@J@J@H@H@H@H@H@F@F@F@F@D@F@D@D@D@B@D@B@D@B@B?B@B@B@B@B@B@B@@@B@B@@@B@@BB@@@B@@@B@@@@BB@@@@BB@@@@B@@@BB@@B@@@B@@@B@B@B@@@B@B@B@B@B@B?B@D@B@B?D@B?B@D?D?B@D?B?D?D?D?D?B?D?DAD?D?DADAD?BADAD?DADADADADCDADADADCDADCDADADCDCDADCDCDADCBCDCDCDCDCDCDCDEFCDEDEDEDEDEBEDEDEBEBEDEBEBEBEBC@EBE@CBE@C@C@C@C@C@C@C?C@C?A@C?C@A?C?A@C?C?A?C@C?A?C?C?C?C?C?C?C?C?C?E?C?E?C?E?E?EAE?G?E?G?GAG?G?GAI?GAI?IAI?IAKAI?IAK?IAI?KAK?IAK?IAK?K?IAK?K?K?KAK?I?K?KAK?K?K?K?K?K?KAK?K?K?K?K?K?K?K?K?M?K?K?K?K?K?K?K?K?M?K?K?K?K?I?K?K@K?K?I?K?K?I?K@K?I?I?K?I?K?I?K@I?I?I?K?I?I?K?I?I?I?K?I?IAI?I?I?K?I?IAI?I?IAI?I?IAI?IAI?IAI?GAI?IAI?GAIAG?IAGAG?IAGAGAG?GAIAGAGAGAGAGAGAGAGAGAGAGAGAIAGAGAGAGAIAGCGAIAGAIAGCIAGAIAICIAIAIAICIAIAIAICIAIAKAIAICIAKAIAIAICKAIAIAKAICKAIAKAIAIAKCIAIAKAIAKAIAKAIAIAKAIAKAIAI?KAIAKAIAK?IAI?IAKAI?KAI?I?IAK?I?KAI?I?K?I?KAI?I?K?I?K?I?K?K?K?K?I?K?K@K?K?K?K?K?K?K@K?K?M?K?K@K?K?M?K@K?M?K?K@M?K?K?M@K?M?K@M?K?M@K?M@K?M@M?M?M@M@M?M@M?M@M@M?O@M@O?O@M@O@M?O@M@M@M?M@M?I@K?I@I?I?G@G?G?E?G@E?E?E?C?E?C@E?C?C?C?A?C?C?A?C?A?A?A?A?A?A?C?A?A?A?A?A?A?A?A?A?A?A?A?A?A?A?A?C?A?A?C?A?C?C?E?C?E?E?E?G?G?GAI?I?K?M?MAO?OAQ?Q?QAS?SAQ?SAQ?QAO?OAQ?OAO?MAOAO?OAQ?OAO?MAOAO?OAM?OAM?O?MAO?MAM?M?MAM?M?MAO?M?MAM?M?MAK?M?K?K?KAK?I?I?I?G?I?G?G?E?G?G?E?E?E?C?E?E?C?C?E?C?C?C?C@A?C?C?A?C?A?C?A?C?A?C@A?C?C?C?A?C?C@C?C?E?C?C@C?E?C?E@E?E?E?E@E?G?G@G?I?G@K?I?I?M@K?M?M?M?O?O?O?Q?O?OAQ?QAO?QAQ?QAQ?QAS?QAS?SAQAU?SAU?SAS?QASAQ?OAQ?QAOAO?OAMAM?MAOAKAMAKAK?KAKAKAIAKAIAKCIAIAIAIAIAGAIAGCIAGAGAGAGAGAEAGAEAEAGAEAEAEAE?EACAEAE?CAEAC?CACAC?EAC?CAC?CAC?CAEAC?CAE?CAC?CAE?CAE?CAE?E?CAE?EAE?EAE?EAE?G?EAG?GAG?G?GAG?G?IAG?I?I?IAI?I?I?I?IAI?I?I?I?I?I?I?K?I?I?I?G?I?I?I?I?I?I?I?G?I?I?I?I?I?I?I?I?G?I?K?I?I?I?I?I?I?I@I?G?I?I?G?I?G?G?G?G?G?G?G@G?G?G?E?G?G?E?E?E?E@E?E?E?C?E?C?C?E?C@C?A?C?C?C?C?C?A?C?C@C?C?C?C?E?C?C@C?C?E?C?C@E?C?C?C?E@C?C?A?C?C?C@A?C?A?C?A?A@C?A?A?A?A?A?A@C?A?C?A@C?C?C?C@C?C@E?C?E@E?C@E@G?E@E@E?G@E@E@G?E@G@G@E@G@GBG@I@G@GBG@IBIBG@IBIBG@GBIBGBGBG@GBGBEBGBGDEBGBGBEDEBGBEDEBEDEBEDEBEDCBEDCDEDCBCDCDCDCDCBCDCDADCDAFCDADADADADADAF?DAFAD?DAF?D?F?D?FAF@D?F?D?F?F@D?F?F@F?D@F?F@F?D@F@F?F@D@F?F@F@F@D@F?F@F@F@F@F?F@F@F@F@F@F@H@F@F@F@H@F?F@F@H@F@F@F@F@H@F@F@F@H@F@F@F@H@F@F@F@F@H@F@F@F@F@F@H@F@F@F@H@F@FBF@H@F@F@F@H@F@F@F@H@F@F@H@FBH@F@H@F@F@H@F@H@F@H@F@H@H@F@H@F@H@F@H?F@H@F?H@F?H@F?H@F?H?F?F?H?F?F?H?F?FAH?FAF?FAHAFAFAFAFAHAFAFCFAFAHCFCFCFAFCFCHCFCFEFCFCFCFEHCFCFEFCFCFEFCHCFEFCFCFCFCFCFCFCFCFCFAFCFAFCHAFAFCFAFAF?FAFAFAF?HAF?F?FAF?F?H?F?F?F@H?F?F@H?F?H@F@F?H@F@H?F@H@F?H@H@F@H@H?F@H@H@H@F?H@H@H@H@F?H@H@H@F@H@H?F@H@H@F@H@H@F@H@F@HBF@H@FBH@FBF@HBFBF@HBFBHBFDFBFBHDFBFDFDHDFDFDFDFDFFFDFFFDFFFFFFFFFFFFFFDHFFFFFHDFFHFFFHFHDFFHFFFHDFFHFFFHDFFFFFDHFFFFFFDFFFFFFFFDDFFFFDFFFDFFFDFDFFFDFDFDHFFDFDFDFDHDFDFDFDHDFBFDHDFDFDHDFDFDHDFBFDHDFDFDHDFDFDHDFDFFFDHDFDFDFFHDFDFDFFFDFDHFFDFDFFFDFDFFHDFDFDFDFDFFHDFDFDFDHDFBFDHDFBHDFDHBFDHBFBFBHBFDHBF@HBFBHBFBH@FBF@HBF@HBF@H@FBH@F@HBF@F@H@F@H@FBH@F@H@F@H@HBF@H@F@HBF@H@F@FBH@F@HBF@H@FBH@FBF@HBF@FBH@FBHBF@FBHBF@FBHBF@FBHBF@FBHBF@FBHBF@HBFBF@HBFBF@HBF@FBF@HBF@FBF@FBH@FBF@F@FBF@F@F@FBF@F@F@FBH@F@F@F@F@F@FBF@H@F@F@F@F@H@F@F@F@H@F@F@F@F?H@F@F@F@F?F@H@F?F@F?F@F@F?F@H?F@F?F@F?F?F@F?F?F@H?F?F@F?F?F?F@F?F?F?F?F?F?F?F?F?D?F?F?F?F?F?D?F?F?D?F?F?D?F@D?D@F?D?D@D@D@D?B@D@D@B@DBB@D@BBB@B@BBB@BBBBB@@BBBB@@BBB@B@@BB@B@BBB@B@B@B@B@B@B@B@D@B@B@B@D?B@B@D@B?D@B@D?D@D@D?D@D@D?D@F@D?F@D@F@D?F@D@D@F@D@D@D@D?D@B@D@B?D@B@B?B@B?B@B?B@@?B?@@B?@?@@@?B?@?@@@?@?@???@@@?@???@@@???@?@??@@???@@????@@??@??@??@??@???@@????@??@@???@???@?@@??@?@???@?@???@?@???@?@?@??A@?@?@???@?@A??@?@?@A??@?@A@???@A@?@A??@A@??A@?@A??@A@A??@A@A?A@A??@A@A?A@A@C@A?A@C@A@C@C@C@C@CBE@CBE@E@E@E@E@E@G@E@G?G@E@I@G@G@G@G@I@G@G@I?G@G@I@G@G@G@E?G@E@E@G@E@E@E?C@E@C@E@E@C@C@C@C@E@C@C@A@C@C@C@CBA@C@CBA@CBC@ABCBABCBCBABCBADABCDABADCBADADADADADAD?FADAD?D?FAD?D?DAF?D?D?F?D?D?F?D?D?F?D?D?F?D?F?D?F?D?F?D?F?D?FAD?F?F?D?F?F?D?F?D?F?F?D?F?F?F?D?F?F@F?D?F?F?F?D@F?F?F?F?D@F?F?F@F?D?F@F?F?F@F?D?F@F?F?F?F@F?D?F?F@F?F?D?F?F?F@F?F?F?F?D?F?F?F?F@D?F?F?F?D?F?F?F?D@F?F?F?D?F?F@D?F?F?F?D@F?F?F?F?F@F?D?F?F@F?F?F?F?F@D?F?F?F@F?D?F?F?F@F?D?F?F?D?F@F?F?D?F?F?D@F?F?F?D?F?F?F@F?F?D?F?F?F@F?F?F?F?F@F?F?F?F?F?F@F?F?F?F?F@F?F?F?F@F?F?F?F?F@F?F?F?F@F?F?F?F@F?F?F?F?F@D?F?F?F@F?F?F?F@D?F?F?F?F@F?F?F?F?F?F@F?F?F?F?F?F?H@F?F?F?F?F?F?F?F@F?F?F?F?F?F?F@F?F?F?H?F?F?F@F?F?F?F?F?F@F?F?F?F?F?F@F?F?F?F?H?F@F?F?F?F?F?F?F?F?F@F?F?F?F?F?H?F?F?F@F?F?F?F?F?F?H?F?F@F?F?F?F?F?F@F?F?F?H?F?F@F?F?F?F?F@F?F?F?F?F@F?F?F?F?D@F?F?F?F?F@F?D?F?F?F?D@F?F?F?F?F?F@F?D?F?F?F?F@F?F?F?F?F@F?D?F?F?F?F?F@F?F?D?F?F?F@F?D?F?F?F@F?F?F?F@F?F?F?F@F?H@H?H@F?H@F?F?F@D?F@D?D?B@D?B?B?B@B?B?B?B@@?B?@?@?@@@?@?@?",
      precision: 6
    }
  end
end
