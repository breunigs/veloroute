defmodule Data.AutoGenerated.Video.Rendered_d763295b172404e6733296718edd6740 do
  @moduledoc "#{"2022-06-01-ueberseering: Überseering im Uhrzeigersinn"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-06-01-ueberseering: Überseering im Uhrzeigersinn"
  end

  @impl Video.Rendered
  def hash() do
    "d763295b172404e6733296718edd6740"
  end

  @impl Video.Rendered
  def length_ms() do
    68853
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-08-06-rsw-bad-bramstedt-rev/GX014414", :start, :end},
      {"2022-08-06-rsw-bad-bramstedt-rev/GX014415", :start, :end}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.017357,
      minLat: 53.600615282282284,
      maxLon: 10.024859,
      maxLat: 53.606847
    }
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
  def coords() do
    [
      %Video.TimedPoint{lon: 10.017698, lat: 53.600655, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.017678, lat: 53.60065, time_offset_ms: 334},
      %Video.TimedPoint{lon: 10.017622, lat: 53.600647, time_offset_ms: 667},
      %Video.TimedPoint{lon: 10.017554, lat: 53.600667, time_offset_ms: 1001},
      %Video.TimedPoint{lon: 10.017499, lat: 53.600713, time_offset_ms: 1334},
      %Video.TimedPoint{lon: 10.017465, lat: 53.60077, time_offset_ms: 1668},
      %Video.TimedPoint{lon: 10.017444, lat: 53.600833, time_offset_ms: 2002},
      %Video.TimedPoint{lon: 10.01743, lat: 53.600898, time_offset_ms: 2335},
      %Video.TimedPoint{lon: 10.017422, lat: 53.600964, time_offset_ms: 2669},
      %Video.TimedPoint{lon: 10.017413, lat: 53.601036, time_offset_ms: 3002},
      %Video.TimedPoint{lon: 10.017401, lat: 53.601109, time_offset_ms: 3336},
      %Video.TimedPoint{lon: 10.017387, lat: 53.601185, time_offset_ms: 3670},
      %Video.TimedPoint{lon: 10.017379, lat: 53.601266, time_offset_ms: 4003},
      %Video.TimedPoint{lon: 10.017374, lat: 53.601347, time_offset_ms: 4337},
      %Video.TimedPoint{lon: 10.017367, lat: 53.601429, time_offset_ms: 4670},
      %Video.TimedPoint{lon: 10.017362, lat: 53.601514, time_offset_ms: 5004},
      %Video.TimedPoint{lon: 10.017359, lat: 53.601601, time_offset_ms: 5338},
      %Video.TimedPoint{lon: 10.017358, lat: 53.601688, time_offset_ms: 5671},
      %Video.TimedPoint{lon: 10.017357, lat: 53.601777, time_offset_ms: 6005},
      %Video.TimedPoint{lon: 10.017358, lat: 53.601866, time_offset_ms: 6338},
      %Video.TimedPoint{lon: 10.017359, lat: 53.601954, time_offset_ms: 6672},
      %Video.TimedPoint{lon: 10.017371, lat: 53.602045, time_offset_ms: 7006},
      %Video.TimedPoint{lon: 10.01742, lat: 53.60213, time_offset_ms: 7339},
      %Video.TimedPoint{lon: 10.017518, lat: 53.602196, time_offset_ms: 7673},
      %Video.TimedPoint{lon: 10.017643, lat: 53.602242, time_offset_ms: 8006},
      %Video.TimedPoint{lon: 10.017779, lat: 53.602264, time_offset_ms: 8340},
      %Video.TimedPoint{lon: 10.017915, lat: 53.602259, time_offset_ms: 8674},
      %Video.TimedPoint{lon: 10.018044, lat: 53.602236, time_offset_ms: 9007},
      %Video.TimedPoint{lon: 10.018174, lat: 53.602216, time_offset_ms: 9341},
      %Video.TimedPoint{lon: 10.018308, lat: 53.602207, time_offset_ms: 9674},
      %Video.TimedPoint{lon: 10.01845, lat: 53.602199, time_offset_ms: 10008},
      %Video.TimedPoint{lon: 10.018592, lat: 53.602191, time_offset_ms: 10342},
      %Video.TimedPoint{lon: 10.018736, lat: 53.602187, time_offset_ms: 10675},
      %Video.TimedPoint{lon: 10.018885, lat: 53.602185, time_offset_ms: 11009},
      %Video.TimedPoint{lon: 10.019033, lat: 53.602188, time_offset_ms: 11342},
      %Video.TimedPoint{lon: 10.019173, lat: 53.602203, time_offset_ms: 11676},
      %Video.TimedPoint{lon: 10.019305, lat: 53.602233, time_offset_ms: 12010},
      %Video.TimedPoint{lon: 10.019432, lat: 53.602279, time_offset_ms: 12343},
      %Video.TimedPoint{lon: 10.019527, lat: 53.602344, time_offset_ms: 12677},
      %Video.TimedPoint{lon: 10.019585, lat: 53.602419, time_offset_ms: 13010},
      %Video.TimedPoint{lon: 10.0196, lat: 53.602502, time_offset_ms: 13344},
      %Video.TimedPoint{lon: 10.01959, lat: 53.602591, time_offset_ms: 13678},
      %Video.TimedPoint{lon: 10.019583, lat: 53.60268, time_offset_ms: 14011},
      %Video.TimedPoint{lon: 10.019572, lat: 53.60276, time_offset_ms: 14345},
      %Video.TimedPoint{lon: 10.019552, lat: 53.602833, time_offset_ms: 14678},
      %Video.TimedPoint{lon: 10.01955, lat: 53.602918, time_offset_ms: 15012},
      %Video.TimedPoint{lon: 10.019553, lat: 53.603002, time_offset_ms: 15346},
      %Video.TimedPoint{lon: 10.019568, lat: 53.603083, time_offset_ms: 15679},
      %Video.TimedPoint{lon: 10.019585, lat: 53.60317, time_offset_ms: 16013},
      %Video.TimedPoint{lon: 10.019596, lat: 53.603259, time_offset_ms: 16346},
      %Video.TimedPoint{lon: 10.019596, lat: 53.603346, time_offset_ms: 16680},
      %Video.TimedPoint{lon: 10.019598, lat: 53.60343, time_offset_ms: 17014},
      %Video.TimedPoint{lon: 10.019582, lat: 53.603514, time_offset_ms: 17347},
      %Video.TimedPoint{lon: 10.019536, lat: 53.603592, time_offset_ms: 17681},
      %Video.TimedPoint{lon: 10.019461, lat: 53.603662, time_offset_ms: 18014},
      %Video.TimedPoint{lon: 10.019354, lat: 53.603713, time_offset_ms: 18348},
      %Video.TimedPoint{lon: 10.019231, lat: 53.603744, time_offset_ms: 18682},
      %Video.TimedPoint{lon: 10.019105, lat: 53.603769, time_offset_ms: 19015},
      %Video.TimedPoint{lon: 10.018987, lat: 53.603793, time_offset_ms: 19349},
      %Video.TimedPoint{lon: 10.018879, lat: 53.603817, time_offset_ms: 19682},
      %Video.TimedPoint{lon: 10.018753, lat: 53.603827, time_offset_ms: 20016},
      %Video.TimedPoint{lon: 10.018616, lat: 53.603834, time_offset_ms: 20350},
      %Video.TimedPoint{lon: 10.018475, lat: 53.603837, time_offset_ms: 20683},
      %Video.TimedPoint{lon: 10.018332, lat: 53.603845, time_offset_ms: 21017},
      %Video.TimedPoint{lon: 10.018205, lat: 53.603877, time_offset_ms: 21350},
      %Video.TimedPoint{lon: 10.018119, lat: 53.603926, time_offset_ms: 21684},
      %Video.TimedPoint{lon: 10.018017, lat: 53.603948, time_offset_ms: 22018},
      %Video.TimedPoint{lon: 10.017946, lat: 53.603986, time_offset_ms: 22351},
      %Video.TimedPoint{lon: 10.017929, lat: 53.604046, time_offset_ms: 22685},
      %Video.TimedPoint{lon: 10.017936, lat: 53.604114, time_offset_ms: 23018},
      %Video.TimedPoint{lon: 10.01795, lat: 53.604185, time_offset_ms: 23352},
      %Video.TimedPoint{lon: 10.017964, lat: 53.604257, time_offset_ms: 23686},
      %Video.TimedPoint{lon: 10.017979, lat: 53.60433, time_offset_ms: 24019},
      %Video.TimedPoint{lon: 10.017996, lat: 53.604403, time_offset_ms: 24353},
      %Video.TimedPoint{lon: 10.018012, lat: 53.604478, time_offset_ms: 24686},
      %Video.TimedPoint{lon: 10.018028, lat: 53.604553, time_offset_ms: 25020},
      %Video.TimedPoint{lon: 10.018044, lat: 53.604629, time_offset_ms: 25354},
      %Video.TimedPoint{lon: 10.018061, lat: 53.604706, time_offset_ms: 25687},
      %Video.TimedPoint{lon: 10.018075, lat: 53.604781, time_offset_ms: 26021},
      %Video.TimedPoint{lon: 10.018091, lat: 53.604858, time_offset_ms: 26354},
      %Video.TimedPoint{lon: 10.018108, lat: 53.604935, time_offset_ms: 26688},
      %Video.TimedPoint{lon: 10.018128, lat: 53.605011, time_offset_ms: 27022},
      %Video.TimedPoint{lon: 10.018148, lat: 53.605085, time_offset_ms: 27355},
      %Video.TimedPoint{lon: 10.018167, lat: 53.605153, time_offset_ms: 27689},
      %Video.TimedPoint{lon: 10.018185, lat: 53.605219, time_offset_ms: 28022},
      %Video.TimedPoint{lon: 10.018194, lat: 53.60528, time_offset_ms: 28356},
      %Video.TimedPoint{lon: 10.018205, lat: 53.60534, time_offset_ms: 28690},
      %Video.TimedPoint{lon: 10.018231, lat: 53.605405, time_offset_ms: 29023},
      %Video.TimedPoint{lon: 10.018262, lat: 53.605467, time_offset_ms: 29357},
      %Video.TimedPoint{lon: 10.018298, lat: 53.605535, time_offset_ms: 29690},
      %Video.TimedPoint{lon: 10.018325, lat: 53.605601, time_offset_ms: 30024},
      %Video.TimedPoint{lon: 10.018349, lat: 53.605673, time_offset_ms: 30358},
      %Video.TimedPoint{lon: 10.018377, lat: 53.605749, time_offset_ms: 30691},
      %Video.TimedPoint{lon: 10.018406, lat: 53.605829, time_offset_ms: 31025},
      %Video.TimedPoint{lon: 10.018431, lat: 53.605909, time_offset_ms: 31358},
      %Video.TimedPoint{lon: 10.018464, lat: 53.605985, time_offset_ms: 31692},
      %Video.TimedPoint{lon: 10.018519, lat: 53.606058, time_offset_ms: 32026},
      %Video.TimedPoint{lon: 10.018585, lat: 53.606127, time_offset_ms: 32359},
      %Video.TimedPoint{lon: 10.018672, lat: 53.606194, time_offset_ms: 32693},
      %Video.TimedPoint{lon: 10.018767, lat: 53.606252, time_offset_ms: 33026},
      %Video.TimedPoint{lon: 10.018871, lat: 53.606307, time_offset_ms: 33360},
      %Video.TimedPoint{lon: 10.018989, lat: 53.606363, time_offset_ms: 33694},
      %Video.TimedPoint{lon: 10.019117, lat: 53.606415, time_offset_ms: 34027},
      %Video.TimedPoint{lon: 10.019248, lat: 53.606461, time_offset_ms: 34361},
      %Video.TimedPoint{lon: 10.019385, lat: 53.606505, time_offset_ms: 34694},
      %Video.TimedPoint{lon: 10.019528, lat: 53.606546, time_offset_ms: 35028},
      %Video.TimedPoint{lon: 10.019672, lat: 53.606585, time_offset_ms: 35362},
      %Video.TimedPoint{lon: 10.019823, lat: 53.606619, time_offset_ms: 35695},
      %Video.TimedPoint{lon: 10.019978, lat: 53.606646, time_offset_ms: 36029},
      %Video.TimedPoint{lon: 10.020129, lat: 53.606675, time_offset_ms: 36362},
      %Video.TimedPoint{lon: 10.020282, lat: 53.606701, time_offset_ms: 36696},
      %Video.TimedPoint{lon: 10.020434, lat: 53.606726, time_offset_ms: 37030},
      %Video.TimedPoint{lon: 10.020584, lat: 53.606745, time_offset_ms: 37363},
      %Video.TimedPoint{lon: 10.020734, lat: 53.606765, time_offset_ms: 37697},
      %Video.TimedPoint{lon: 10.020885, lat: 53.606782, time_offset_ms: 38030},
      %Video.TimedPoint{lon: 10.021037, lat: 53.606799, time_offset_ms: 38364},
      %Video.TimedPoint{lon: 10.02119, lat: 53.606814, time_offset_ms: 38698},
      %Video.TimedPoint{lon: 10.021342, lat: 53.606829, time_offset_ms: 39031},
      %Video.TimedPoint{lon: 10.021499, lat: 53.606839, time_offset_ms: 39365},
      %Video.TimedPoint{lon: 10.02166, lat: 53.606847, time_offset_ms: 39698},
      %Video.TimedPoint{lon: 10.02182, lat: 53.606845, time_offset_ms: 40032},
      %Video.TimedPoint{lon: 10.021984, lat: 53.606839, time_offset_ms: 40366},
      %Video.TimedPoint{lon: 10.022148, lat: 53.606826, time_offset_ms: 40699},
      %Video.TimedPoint{lon: 10.022308, lat: 53.606811, time_offset_ms: 41033},
      %Video.TimedPoint{lon: 10.022466, lat: 53.606797, time_offset_ms: 41366},
      %Video.TimedPoint{lon: 10.022625, lat: 53.60679, time_offset_ms: 41700},
      %Video.TimedPoint{lon: 10.022778, lat: 53.606797, time_offset_ms: 42034},
      %Video.TimedPoint{lon: 10.022944, lat: 53.606806, time_offset_ms: 42367},
      %Video.TimedPoint{lon: 10.023112, lat: 53.606795, time_offset_ms: 42701},
      %Video.TimedPoint{lon: 10.023274, lat: 53.606767, time_offset_ms: 43034},
      %Video.TimedPoint{lon: 10.02343, lat: 53.606728, time_offset_ms: 43368},
      %Video.TimedPoint{lon: 10.023583, lat: 53.606681, time_offset_ms: 43702},
      %Video.TimedPoint{lon: 10.023726, lat: 53.606627, time_offset_ms: 44035},
      %Video.TimedPoint{lon: 10.023859, lat: 53.606562, time_offset_ms: 44369},
      %Video.TimedPoint{lon: 10.023983, lat: 53.606488, time_offset_ms: 44702},
      %Video.TimedPoint{lon: 10.02409, lat: 53.60641, time_offset_ms: 45036},
      %Video.TimedPoint{lon: 10.024188, lat: 53.606326, time_offset_ms: 45370},
      %Video.TimedPoint{lon: 10.024278, lat: 53.606236, time_offset_ms: 45703},
      %Video.TimedPoint{lon: 10.024361, lat: 53.606145, time_offset_ms: 46037},
      %Video.TimedPoint{lon: 10.024436, lat: 53.606049, time_offset_ms: 46370},
      %Video.TimedPoint{lon: 10.024498, lat: 53.60595, time_offset_ms: 46704},
      %Video.TimedPoint{lon: 10.024534, lat: 53.60585, time_offset_ms: 47038},
      %Video.TimedPoint{lon: 10.02457, lat: 53.605755, time_offset_ms: 47371},
      %Video.TimedPoint{lon: 10.024632, lat: 53.605666, time_offset_ms: 47705},
      %Video.TimedPoint{lon: 10.024677, lat: 53.60557, time_offset_ms: 48038},
      %Video.TimedPoint{lon: 10.024711, lat: 53.605475, time_offset_ms: 48372},
      %Video.TimedPoint{lon: 10.024739, lat: 53.60538, time_offset_ms: 48706},
      %Video.TimedPoint{lon: 10.02476, lat: 53.605283, time_offset_ms: 49039},
      %Video.TimedPoint{lon: 10.024768, lat: 53.605188, time_offset_ms: 49373},
      %Video.TimedPoint{lon: 10.024764, lat: 53.605095, time_offset_ms: 49706},
      %Video.TimedPoint{lon: 10.024756, lat: 53.604998, time_offset_ms: 50040},
      %Video.TimedPoint{lon: 10.024752, lat: 53.604903, time_offset_ms: 50374},
      %Video.TimedPoint{lon: 10.024749, lat: 53.604805, time_offset_ms: 50707},
      %Video.TimedPoint{lon: 10.024748, lat: 53.604708, time_offset_ms: 51041},
      %Video.TimedPoint{lon: 10.024755, lat: 53.604605, time_offset_ms: 51374},
      %Video.TimedPoint{lon: 10.024754, lat: 53.604507, time_offset_ms: 51708},
      %Video.TimedPoint{lon: 10.024767, lat: 53.60441, time_offset_ms: 52042},
      %Video.TimedPoint{lon: 10.024778, lat: 53.604319, time_offset_ms: 52375},
      %Video.TimedPoint{lon: 10.024792, lat: 53.604222, time_offset_ms: 52709},
      %Video.TimedPoint{lon: 10.024794, lat: 53.604131, time_offset_ms: 53042},
      %Video.TimedPoint{lon: 10.024783, lat: 53.604047, time_offset_ms: 53376},
      %Video.TimedPoint{lon: 10.024782, lat: 53.603963, time_offset_ms: 53710},
      %Video.TimedPoint{lon: 10.024786, lat: 53.603879, time_offset_ms: 54043},
      %Video.TimedPoint{lon: 10.024789, lat: 53.603794, time_offset_ms: 54377},
      %Video.TimedPoint{lon: 10.02479, lat: 53.603706, time_offset_ms: 54710},
      %Video.TimedPoint{lon: 10.024792, lat: 53.60362, time_offset_ms: 55044},
      %Video.TimedPoint{lon: 10.024794, lat: 53.603532, time_offset_ms: 55378},
      %Video.TimedPoint{lon: 10.024795, lat: 53.603444, time_offset_ms: 55711},
      %Video.TimedPoint{lon: 10.024799, lat: 53.603353, time_offset_ms: 56045},
      %Video.TimedPoint{lon: 10.024805, lat: 53.603267, time_offset_ms: 56378},
      %Video.TimedPoint{lon: 10.024805, lat: 53.603182, time_offset_ms: 56712},
      %Video.TimedPoint{lon: 10.024807, lat: 53.603092, time_offset_ms: 57046},
      %Video.TimedPoint{lon: 10.024825, lat: 53.603006, time_offset_ms: 57379},
      %Video.TimedPoint{lon: 10.024833, lat: 53.602917, time_offset_ms: 57713},
      %Video.TimedPoint{lon: 10.024829, lat: 53.602824, time_offset_ms: 58046},
      %Video.TimedPoint{lon: 10.024826, lat: 53.602737, time_offset_ms: 58380},
      %Video.TimedPoint{lon: 10.024826, lat: 53.602652, time_offset_ms: 58714},
      %Video.TimedPoint{lon: 10.024837, lat: 53.602571, time_offset_ms: 59047},
      %Video.TimedPoint{lon: 10.024842, lat: 53.602484, time_offset_ms: 59381},
      %Video.TimedPoint{lon: 10.02485, lat: 53.602393, time_offset_ms: 59714},
      %Video.TimedPoint{lon: 10.024843, lat: 53.602299, time_offset_ms: 60048},
      %Video.TimedPoint{lon: 10.024828, lat: 53.602207, time_offset_ms: 60382},
      %Video.TimedPoint{lon: 10.02482, lat: 53.602116, time_offset_ms: 60715},
      %Video.TimedPoint{lon: 10.024814, lat: 53.602019, time_offset_ms: 61049},
      %Video.TimedPoint{lon: 10.024805, lat: 53.601932, time_offset_ms: 61382},
      %Video.TimedPoint{lon: 10.024778, lat: 53.601921, time_offset_ms: 61612},
      %Video.TimedPoint{lon: 10.024777, lat: 53.601918, time_offset_ms: 61946},
      %Video.TimedPoint{lon: 10.024773, lat: 53.6019, time_offset_ms: 62279},
      %Video.TimedPoint{lon: 10.024775, lat: 53.601863, time_offset_ms: 62613},
      %Video.TimedPoint{lon: 10.024782, lat: 53.60181, time_offset_ms: 62946},
      %Video.TimedPoint{lon: 10.024793, lat: 53.60175, time_offset_ms: 63280},
      %Video.TimedPoint{lon: 10.024809, lat: 53.601682, time_offset_ms: 63614},
      %Video.TimedPoint{lon: 10.024836, lat: 53.601617, time_offset_ms: 63947},
      %Video.TimedPoint{lon: 10.024852, lat: 53.60155, time_offset_ms: 64281},
      %Video.TimedPoint{lon: 10.024859, lat: 53.601481, time_offset_ms: 64614},
      %Video.TimedPoint{lon: 10.024859, lat: 53.601406, time_offset_ms: 64948},
      %Video.TimedPoint{lon: 10.024856, lat: 53.601327, time_offset_ms: 65282},
      %Video.TimedPoint{lon: 10.024847, lat: 53.601251, time_offset_ms: 65615},
      %Video.TimedPoint{lon: 10.024844, lat: 53.601171, time_offset_ms: 65949},
      %Video.TimedPoint{lon: 10.024841, lat: 53.601094, time_offset_ms: 66282},
      %Video.TimedPoint{lon: 10.02484, lat: 53.601017, time_offset_ms: 66616},
      %Video.TimedPoint{lon: 10.024834, lat: 53.600939, time_offset_ms: 66949},
      %Video.TimedPoint{lon: 10.024825, lat: 53.600862, time_offset_ms: 67283},
      %Video.TimedPoint{lon: 10.024816, lat: 53.600785, time_offset_ms: 67617},
      %Video.TimedPoint{lon: 10.024804, lat: 53.600714, time_offset_ms: 67950},
      %Video.TimedPoint{lon: 10.024788, lat: 53.600658, time_offset_ms: 68284},
      %Video.TimedPoint{lon: 10.024793, lat: 53.600633, time_offset_ms: 68617},
      %Video.TimedPoint{lon: 10.024796543543545, lat: 53.600615282282284, time_offset_ms: 68853}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "wwofeBiwlbR???@?????@?????@?????@???@???@???@A??@?@?@?@???@?@?B?@?@?@?@AB?@?B?@?@?BAB?@?B?BAB?BAB?B?BAB?BADAB?DADADADADAFADAFADAFCHAFCFAHCFCFCDCFCDCFCDCFEDCDCDEDCDEDCBEDCDEBEDCBEBEDCBEBEBEBCBEBEBEBE@EBEBE@EBE@EBE@EBE@EBE@E@EBE@E@E@G@E@EBE@E@E@G@E@E@E@G?E@E@E@G@E@E@E?G@E@E@E?G@E@E?E@G?E@E@E?G@E?E@E?G@E?E@E?E@G?E@E?E@G?E@E?G@E?E?G@E?G@E?G@E?G@G?E@G?E@G?G?E@G?G@E?G@G?E@G@G?E@G?G@E?G@G?E@G@E?G@G?E@G?G@E@G?G@E@G?G@E?G@G@G?E@G@G?E@G?G@G@G?E@G?G@G@G?G@G?G@G?G@G?G@G?G@G?G@G?G@I?G@G?G?G@G?G@G?G?G@G?G?G@G?G?G?G@G?G?I@G?G?G@G?G?G?G@G?G?G@G?G?G@G?G?I?G@G?G?G@G?G?G@G?G?G@I?G?G?G@G?I?G@G?G?G?G@I?G?G?I@G?G?G?I@G?G?G?I?G@G?I?G?G?I@G?G?I?G?G?I@G?I?G?G?G?I?G?I@G?G?I?G?G?I?G?G?I?G?I?G@G?G?I?G?G?I?G?I?G?I?G?G?I?G?G?I?G?I?G?I?G?I@G?I?G?I?G?G?I?I?G?G?I?G?I?GAI?G?I?G?I?G?I?G?G?I?G?I?G?G?I?G?I?G?GAI?G?G?I?G?G?IAG?I?G?GAI?G?IAG?I?GAI?GAI?GAIAIAG?IAGAIAGAICGAIAGCGAICGAICGCGCICGCGEGCIEGCGEGEGEGEGEGEGEEGGEGGEGGGGGEGGGEGEGGIEIEGGIEIEIEIEIEKEIEIEKEICKEKEICKEKCKEKCKCMEKCKCMCKCKCMCKCKCMAKCMCKAMCKAMCMAKAMAKAMAMAMAKAMAMAK?MAM?KAM?MAM?K?M?M?K?M?M?K?M?M?M?K@M?M@K?M@K?M@M?K@M@K@M?M@K@M@K@M@K@M@M@K@K@M@K@M@K@M@K@M@K@M@K@M@K@M@K@M@K@M@K@M?K@M@K@M@K?M@K@M@M?K@M@K?M@M?K@M@K?M@M?K@M?M@K?M@M?M?M@M?M@M?K@M?M?M@M?O@M?M@M?M?M@O?M@M?M?M@M?M@O?M?M@M?M?M@M?M@M?M?M@M?O?M@M?M?M@M?M?M@M?M?O?M@M?M?M?M@O?M?M?M?M@O?M?M?M?M?O@M?O?M?M?O?M?O?M@M?O?O?M?O?M?M?O?M?O?M?O?M?O?M?O?MAO?M?O?M?O?MAO?M?M?OAM?MAM?O?MAM?MAM?MAMAM?MAMAM?MAMAMAMAMAMAKAMAMAMAKAMAMAMAKCMAKAMCKAMAMCKAMCKAMCKCKAMCKCMCKCMCKCMCKCMCKCMCKEMCKEKCMCKEKCKEKEKCIEKEKEICKEIEIEIEIEIEIEIEIGIEIEGEIGGEGEGGGEGGGEGGGEEGGEEGEGGEEGEEEGCGEGEECGEGCGCECGCGCGCGCGAGCGAECGAGAGAGAGAIAGAGAG?GAG?GAI?G?GAI?G?G?I?G?G?I?G@I?G?I?G@I?G?I@G?I?G@I?G@I?I?G@I?G@I?G@I?G?I@I?G@G?I@G?G?I@G?G@I?G@G?G@G?G@I?G@G?G@G@G?G@E@G?G@G@G?G@E@G?G@G@E@G?E@G@G?E@G@E@G?E@G@E?G@G@G?E@G?G@G?G@G?G@G?G@I?G?G@I?G?G?I?G@G?I?G?G?I?G?G?I?G?G?GAG?I?G?G?G?IAG?G?G?GAG?G?GAI?GAG?GAG?GAG?GAG?GAGAG?GAGAG?GAGAG?GAGAIAG?GAGAGAIAG?GAIAGAG?IAGAIAGAG?IAGAGAI?GAIAGAI?GAI?GAIAG?IAG?IAG?IAG?IAG?GAI?G?IAG?I?G?GAI?G?G?I?G?GAI?G?I?G?G?G?I?G?G?I?G?G?G?I?G?G?G?G?G?I?G?G?G?G?I?G?G@G?G?G@I?G?G@G?G@I@G?G@G@G@I@G?GBG@G@G@I@GBG@G@GBGBG@GBGBGBEBGBGBGBGBGDGBGDEBGDGBEDGDGDGDEDGDGDEFGDEFGDEFGFEDGFEFGFEFEFEHEFEFEHEFEHEFEHEHEHCFEHEJCHEHEHCJCHEHCJCHEJCHCJCJCJCHCJCJCJAHCJCJCJAJCJCJAJCJALCJAJCJAJCLAJCJAJALCJAJCLAJAJCLAJALAJCJAJAJCLAJAJAJCJAJAJAJAJCJAJAJAJCJAJAJAJAHCJAJAHAJAJAHCJAHAJAHAJAHAJAHAHAJAHAJAHAHAJAHAHAJ?JAHAJAJAJ?HAJAJAJ?JAJAL?JAJ?LAJAL?JAJ?LAJ?L?LAL?JAL?LAL?J?LAL?L?LAL?L?LAL?L?LAL?L?L?LAL?L?L?LAL?L?L?LAL?L?L?L?LAL?L?LAN?L?L?LAL?LAN?L?LAL?LAL?NALAL?LALALALAJ?LALCLALALAJALCLAJALCJALCJCLCJAJCJCJCHCJCJCHCJCHCHCHCJCHCFCHCHCHCHCHCHAFCHCHCHCFCHAHCHCFCHAHCFCHAHCFCHAHCFCHAHCFCHAFCFAFCFCFAFCFCFCFADCFCDCDADCDCDCDCDABCDCBCDCBCBCBCBCBCBEBCBC@CBEBC@EBC@E@EBE@E@E@E@E@E?E@E@E?G@E?E@G?E?E?G?E?G?E?G?E?GAE?G?E?GAE?GAE?GAE?GAE?GAG?EAGAE?GAGAE?GAE?GAEAG?GAEAGAE?GAGAE?GAEAG?EAGAGAE?GAGAE?GAEAGAG?EAGAGAE?GAEAGAG?EAGAGAG?EAGAEAG?GAEAGAG?EAGAGAEAG?EAGAGAEAGAG?EAGAGAEAG?EAGAGAEAG?GAGAEAGAGAG?EAGAGAGAEAG?GAGAEAGAG?GAEAGAGAG?EAGAGAGAE?GAGAGAEAG?GAGAEAGAG?EAGAGAGAG?EAGAGAGAE?GAGAGAGAE?GAGAGAGAE?GAGAGAGAGAG?EAGAGAGAGAG?GAGAGAEAGAG?GAGAEAG?GAGAGAEAG?GAGAEAG?GAEAG?GAGAEAG?GAGAEAG?GAGAEAG?GAGAGAGAE?GAGAGAGAG?GAGAEAGAG?GAGAGAGAGAE?GAGAGAGAGAE?GAGAGAGAGAGAEAGAGAG?GAGAEAGAGAGAGAEAGAGAGAGAGAEAGAGAGAEAGAGAGAGAEAGAGAGAEAGAGAGAGAEAGAGAEAGAGAEAGAEAGAEAGAEAGAEAGAEAGAE?EAGAEAEAGAEAEAGAEAEAGAE?GAEAEAGAEAEAGAE?GAEAEAEAG?EAEAE?EAGAEAE?EAE?EAEAE?EAE?EAEAE?EAE?EAE?EAE?EAE?EAEAE?EAC?EAE?EAEAE?EAEAE?EAEAEAE?EAEAEAEAEAEAEAGAEAEAGAEAECGAEAEAECGAEAECEAGAECEAECEAGCEAEAECEAECEAECEAECEAECGAECEAECECGAECECGAECECGAECGCECGAECGCECGAECECGAECGAECEAGCEAECEAGCEAEAECGAECEAEAGCEAEAEAGCEAGAECGAEAEAGCEAGAEAGCGAEAGCGAEAGCGAEAGAGCEAGAGCEAGAGCGAGAECGAGAGCGAGCEAGAGCGAGCGAGCGAGAGCGAGCGAGCGAGAGCGAGCGAGCGAGAGCGAGAGCGAGCGAGAGCGAGAGCGAGCGAGAGCGAGCGAGAGCGAGCGAECGAGCGCGAECGCGAGCGCECGCGAECGCGCECGEGCECGCGEECGCGEECGEGEGCEEGEECGEGEEEGEEEGEGEEEGEEEGEEEGGEEEEGEEGGEEEEGGEEGEEGGEGGEEGGGEGEGGGEGGGEGEIGGEIGGEGEIGGEIEGEIEGGIEGEIEIEGEIEGEIEIEGEIEIEGEICIEGEIEIEICIEIEGEIEICIEIEIEICIEIEIEKCIEIEIEICKEIEICKEIEKEIEKCKEIEKEKEKCIEKEKEMEKCIEMEKEKEKCKEKEKEMCKEKEKCMEKEMCKEKEMCKEMCKEMCKEKCMEKCMEKCMEKCMCKEMCKCKEMCKCMEMCKCMEKCMCKCMEKCMCMCMEKCMCMCMEKCMCMCMCMEMCMCKCMCMCMEMCMCMCMCMCMCMCMCMEMCMCMCOCMCMCMCMCMCMCOCMCMCMCMCOCMCMCMCMCMCMCMCOCMCMCOAMCMCMCMCOCMAMCOCMCOCMCMAOCOCMCOAMCOCOAMCOCMAOCMAOCMAOCOCOAMCOAOCMAOAMCOAOCOAOCMAOAOCMAOCMAOAOCOAMCOAMAOCOAMCOAMAOCOAMCOAMAOCMAOCMAOAOCMAOAOCMAOCMAOAMCOAOAMCOAOAMAOCOAMAOCMAOAOAOCMAOAMAOCMAOAOAMCOAOAMAOAMAOCMAOAMAOAOAMAOAMAOAMCOAMAOAMAOAMAOAMAO?MAMAOAMAOAMAOAMAOAMAOAMAOAMAOAMAOAMAOAMAOAMAOAMAOAM?OAMAOAMAOAOAMAOAMAO?OAMAOAMAOAMAO?MAOAMAOAOAMAO?MAOAMAOAMAO?OAMAOAOAM?OAMAOAMAOAO?MAOAOAM?OAMAOAOAM?OAOAMAO?OAMAOAM?OAOAMAO?MAOAOAO?MAOAM?OAOAM?OAMAO?MAOAO?MAOAO?OAM?OAOAM?OAO?OAO?OAO?MAO?OAO?OAO?OAO?O?OAO?OAO?OAO?O?OAO?Q?OAO?O?O?OAO?O?O?O?O?O?O?OAO?O?M?O?O@O?O?O?O?O?O?O?O?O@O?O?Q?O?O@O?O?O?O@O?O?Q@O?O?Q@O?O@O?O?O@O?Q@O?O@Q?O@O?Q@O@O?O@Q?O@O@O?O@O@Q?O@O@O?O@O@O@O?O@O@O?O@O@O@O?Q@O@M@O?O@O@O?O@O@O@O?O@O@O?O@O@O?O@M@Q?O@M@O?O@O?O@O@M?O@O?Q@M?O@O?O?O@O?O?O@O?O?O?O@O?O?M?O?O?O?O?M?O?O?M?O?M?OAM?O?O?MAO?M?O?OAM?OAO?M?QAO?O?OAO?O?OAQ?OAO?Q?O?QAO?O?Q?O?O?Q?O?O?Q?O?O?Q@O?O?Q@O?O@Q?Q@O?O@Q@O@O?O@O@Q@O@O@Q@O@OBO@Q@O@O@OBO@OBO@OBO@OBO@OBO@OBOBO@OBOBOBO@MBOBOBOBOBMBOBOBOBMBOBOBMBOBOBOBODMBOBOBMDOBOBMDOBOBODMBODMBODMBODMBMDOBMDOBMDMDOBMDMDMBMDMDMDMBMDMDMDMDMBMDMDMDMDKFMDMDMDKDMDMDKFMDMDKFMDKDMFKDMDKFMDKFMDKFMFKDKFMFKDKFMFKFKDKFKFKFKDKFKFKFKFKDIFKFIFKFIDKFIFKFIFIFKFIDIFIFIFKFIFIFIFIFIFIFIFIFIHIFIFIFIFIHIFIFIFGHIFIFIFGHIFIHIFGFIHIFGHIFGHIFIHGFIHGFIHGFGHIFGHGFIHGFIHGFGHGFGHIFGHGHGFGHGFGHGFGHGHGFGHGFGHGHGHGFGHGHGHGFEHGHGHGHEHGFGHEHGHEHGFEHGHEHGHEHEHGHEHEHEHEHEHEHEHEHEHEFCHEHEHCHEHCHEHCHCHCHEHCHCHCHCHCHCHCHCHCHAHCHCHCHCHCFCHAHCHCHCFCHCHCHCFCHCHCFCHCFCHCHEFCHCFEHCFEHCFEHEFCHEFEHCFEHEFEHCFEHEFCHEHEFEHCHEFCHEHEFCHEHCHCHEHCFCHEHCHCHCFCHCHCHCHCFCHCHCHCFCHCHAFCHCHCHAFCHCHAHCFCHAHCFAHCHAHCFAHCHAHCFAHCHAHAFCHAHAFCHAHAHCFAHAHAHCHAHAFAHAHAHAHAHAHAHAHAFAHAHAHAHAFAH?HAHAH?HAFAH?HAF?HAH?H?HAF?H?HAF?H?H?F?HAH?F?H?H?F?H?H?F?H?H@F?H?H?F?H?F@H?H?F?H@H?H?H@F?H?H?H@H?F?H@H?H@H?H?H@H?F?H@H?H?H?H@F?H?H@F?H?H?H?F@H?H?H?F@H?H?F?H?H@H?H?H?F?H?H@H?H?H?H?H?H?H@H?F?H?H?H?H?H?H@H?H?F?H?H?H?F?H?H?H?H?H?F?H?H?H?H?H?F?H?JAH?H?H?H?H?HAJ?H?H?HAJ?H?H?HAH?H?H?J?H?HAH?H?H?H?H?F?H?HAH?H?H?H?H?F?HAH?H?H?HAH?F?HAH?H?HAH?HAF?HAH?HAH?HAHAF?HAH?HAF?HAHAF?HAF?HAHAF?HAF?HAF?HAFAH?FAH?FAH?HAFAH?HAHAF?HAH?HAHAH?HAHAH?HAF?HAH?HAF?H?HAH?FAH?H?H?FAH?F?H?H?F?H?F?H?F?H?F?F?H@F?H?F?F@F?H?F@F?F?F@F?H?F@F?F?F@F?F?F?H@F?F?F@F?H?F?F?F?F@F?H?F?F?F?F?H?F?F?F?F?H?F?F?F?F?HAF?F?F?F?H?F?FAF?F?H?F?F?FAF?H?F?F?F?FAH?F?F?F?F?H?FAF?F?H?F?F?F?H?F?FAH?F?H?F?F?H?F?H?F?H?FAH?F?F?H?F?F?H?F?H?F?F?H?FAF?F?H?F?F?H?F?F?F?H?FAF?F?H?F?F?H?F?F?H?FAH?F?F?H?F?H?F?F?H?F?HAF?F?H?F?H?F?F?H?F?H?F?F?HAF?H?F?F?H?F?F?H?F?HAF?H?F?H?F?H?HAF?H?F?H?H?FAH?F?H?FAH?F?H?FAH?F?H?FAF?H?F?F?HAF?F?H?FAF?F?F?H?FAF?F?H?F?F?F?F?FAH?F?F?F?H?F?F?F?F?H?F?F?H?F?FAH?F?H?F?H?F?H?FAH?H?F?HAF?H?FAF?H?FAH?FAH?FAFAH?FAF?HAFAF?FAHAF?FAFAH?FAFAH?FAFAH?FAF?HAF?HAF?FAH?F?HAF?H?FAH?F?H?F?HAH?F?H?F?H?H?H?F?H?H?H@F?H?F?H?H?F?H@F?H?H?F?H?F@F?H?F?F?H?F?H@F?F?F?H?F?F?F?H?F?F?H?F?F?F@H?FAF?F?H?F?F?F?H?F?F?FAF?F?F?HAF?F?FAF?F?FAF?F?FAF?FAF?F?FAF?FAF?F?HAF?F?FAF?HAF?F?FAH?F?FAH?F?HAF?F?HAF?H?FAH?F?H?FAH?F?HAF?H?HAF?H?H?F?HAF?H?F?H?H?F?H?H?F?H?H?F@H?H?F?H@H?H?F@H?H@F?H@H?F@H?H@F?H@F@H?H@F?H@H@F?H@F@H?F@H?H@F@H?F@H?F@H?F@H?H@F?H@F?H@F?H?F@H?F@H?F?H@H?H@F?H?H@H?F?H@H?H?H@H?H?H@H?H@H?H?H@H?H@H?J@L@NBL@NDNBLBJBHBH@FBD@F@D@B@B@B@B?B@@@B?@@@?@??@@?@????@@?????@?????????@??@????????????????@???????????@???????@??@??@???@?????@???@??@@?@???@?@???@?@?@@@?@?@?@?@?@?@?B?@@B?@?B?B?@?B?B?D?B?B?D?D?D?F?D?F?FAF?F?FAD?F?DAD?DAF?DAD?D?DAD?DAD?DADAD?DAF?DAD?DADAD?FADAD?DAFAD?DAFADAD?FADAFADAFADAFADAFADAFADADAFADAFADADAFADADAFCDADADAFADADADAFADADADAFADADAFADADADAFADADAFAD?DAFADAD?FADAD?FADAF?DAD?FAD?DAF?DAF?D?DAF?D?FAD?F?D?FAD?F?F?DAF?D?F?F?D?F?F?F?F?D?F?F?F?F?D?F?F?F?F?F?F?F?F?F?F@F?F?F?F?F?F@F?F?D?F@F?F?F?F@F?F?D@F?F?F@F?D?F@F?F?D?F@F?F?F@D?F?F@F?F?F?F@F?F?F?F@F?F?F?F@F?F?F?F?F?F@F?F?F?F?F?F@F?F?F?D?F?F?F@F?F?D?F?F?F?F?D?F@F?F?F?F?D?F?F?F?F@D?F?F?F?F?F?F?D@F?F?F?F?F@F?F?F?D?F@F?F?F?F@F?F?F@F?F?D@F?F?F@F?F?F@F?D@F?F?F@F?F@F?D@F?F?F@F?F@D?F@F?F@F?F?F@F?D@F?F@F?F@F?F@F?F@D?F@F?F@F?F@F@D?F@F?F@F@D?F@F@F?F@D@F@F?F@F@F@F?F@F@F@F?F@F?F@F?F@D?D@D?B?B?B@B?B?B?@?B@@?@?@?@?@?@?@?@?@???@?@???@???@???@???@???@???@???@???@???@?????@?????@?",
      precision: 6
    }
  end
end
