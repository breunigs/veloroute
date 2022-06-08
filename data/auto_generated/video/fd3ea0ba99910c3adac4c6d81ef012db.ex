defmodule Data.AutoGenerated.Video.Rendered_fd3ea0ba99910c3adac4c6d81ef012db do
  @moduledoc "#{"pinneberg-veloroute-2: vom Bahnhof nach Halstenbek"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "pinneberg-veloroute-2: vom Bahnhof nach Halstenbek"
  end

  @impl Video.Rendered
  def hash() do
    "fd3ea0ba99910c3adac4c6d81ef012db"
  end

  @impl Video.Rendered
  def length_ms() do
    102_043
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-05-31-pinneberg/GX014171", "00:00:53.420", :end},
      {"2022-05-31-pinneberg/GX014172", :start, "00:00:48.372"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.654466251497006,
      maxLon: 9.83096,
      minLat: 53.638986,
      minLon: 9.799729514970059
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
      %Video.TimedPoint{lat: 53.654466251497006, lon: 9.799729514970059, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.654402, lon: 9.799812, time_offset_ms: 290},
      %Video.TimedPoint{lat: 53.654331, lon: 9.799903, time_offset_ms: 623},
      %Video.TimedPoint{lat: 53.654266, lon: 9.800002, time_offset_ms: 957},
      %Video.TimedPoint{lat: 53.654204, lon: 9.800108, time_offset_ms: 1290},
      %Video.TimedPoint{lat: 53.654146, lon: 9.800213, time_offset_ms: 1624},
      %Video.TimedPoint{lat: 53.654091, lon: 9.80032, time_offset_ms: 1958},
      %Video.TimedPoint{lat: 53.654044, lon: 9.80043, time_offset_ms: 2291},
      %Video.TimedPoint{lat: 53.654001, lon: 9.800532, time_offset_ms: 2625},
      %Video.TimedPoint{lat: 53.653963, lon: 9.800616, time_offset_ms: 2958},
      %Video.TimedPoint{lat: 53.653924, lon: 9.800668, time_offset_ms: 3292},
      %Video.TimedPoint{lat: 53.653875, lon: 9.800674, time_offset_ms: 3626},
      %Video.TimedPoint{lat: 53.653819, lon: 9.800645, time_offset_ms: 3959},
      %Video.TimedPoint{lat: 53.653759, lon: 9.800614, time_offset_ms: 4293},
      %Video.TimedPoint{lat: 53.653691, lon: 9.800587, time_offset_ms: 4626},
      %Video.TimedPoint{lat: 53.653618, lon: 9.800566, time_offset_ms: 4960},
      %Video.TimedPoint{lat: 53.653545, lon: 9.800616, time_offset_ms: 5293},
      %Video.TimedPoint{lat: 53.653479, lon: 9.80069, time_offset_ms: 5627},
      %Video.TimedPoint{lat: 53.653421, lon: 9.800755, time_offset_ms: 5961},
      %Video.TimedPoint{lat: 53.653363, lon: 9.800828, time_offset_ms: 6294},
      %Video.TimedPoint{lat: 53.653308, lon: 9.800905, time_offset_ms: 6628},
      %Video.TimedPoint{lat: 53.653254, lon: 9.800978, time_offset_ms: 6961},
      %Video.TimedPoint{lat: 53.653195, lon: 9.801054, time_offset_ms: 7295},
      %Video.TimedPoint{lat: 53.653134, lon: 9.801137, time_offset_ms: 7629},
      %Video.TimedPoint{lat: 53.653078, lon: 9.801219, time_offset_ms: 7962},
      %Video.TimedPoint{lat: 53.653022, lon: 9.8013, time_offset_ms: 8296},
      %Video.TimedPoint{lat: 53.652962, lon: 9.801386, time_offset_ms: 8629},
      %Video.TimedPoint{lat: 53.652907, lon: 9.801469, time_offset_ms: 8963},
      %Video.TimedPoint{lat: 53.652845, lon: 9.801559, time_offset_ms: 9297},
      %Video.TimedPoint{lat: 53.652785, lon: 9.801654, time_offset_ms: 9630},
      %Video.TimedPoint{lat: 53.652723, lon: 9.801747, time_offset_ms: 9964},
      %Video.TimedPoint{lat: 53.652661, lon: 9.801843, time_offset_ms: 10297},
      %Video.TimedPoint{lat: 53.6526, lon: 9.801932, time_offset_ms: 10631},
      %Video.TimedPoint{lat: 53.65254, lon: 9.802017, time_offset_ms: 10965},
      %Video.TimedPoint{lat: 53.652479, lon: 9.802104, time_offset_ms: 11298},
      %Video.TimedPoint{lat: 53.652418, lon: 9.802194, time_offset_ms: 11632},
      %Video.TimedPoint{lat: 53.652362, lon: 9.802284, time_offset_ms: 11965},
      %Video.TimedPoint{lat: 53.65231, lon: 9.802362, time_offset_ms: 12299},
      %Video.TimedPoint{lat: 53.652261, lon: 9.802438, time_offset_ms: 12633},
      %Video.TimedPoint{lat: 53.652216, lon: 9.802496, time_offset_ms: 12966},
      %Video.TimedPoint{lat: 53.652171, lon: 9.802535, time_offset_ms: 13300},
      %Video.TimedPoint{lat: 53.652125, lon: 9.802596, time_offset_ms: 13633},
      %Video.TimedPoint{lat: 53.652082, lon: 9.802667, time_offset_ms: 13967},
      %Video.TimedPoint{lat: 53.652039, lon: 9.802745, time_offset_ms: 14301},
      %Video.TimedPoint{lat: 53.651991, lon: 9.802803, time_offset_ms: 14634},
      %Video.TimedPoint{lat: 53.651943, lon: 9.802855, time_offset_ms: 14968},
      %Video.TimedPoint{lat: 53.651894, lon: 9.802917, time_offset_ms: 15301},
      %Video.TimedPoint{lat: 53.651845, lon: 9.802979, time_offset_ms: 15635},
      %Video.TimedPoint{lat: 53.651793, lon: 9.80304, time_offset_ms: 15969},
      %Video.TimedPoint{lat: 53.651741, lon: 9.803105, time_offset_ms: 16302},
      %Video.TimedPoint{lat: 53.651696, lon: 9.803178, time_offset_ms: 16636},
      %Video.TimedPoint{lat: 53.651649, lon: 9.803245, time_offset_ms: 16969},
      %Video.TimedPoint{lat: 53.651609, lon: 9.80332, time_offset_ms: 17303},
      %Video.TimedPoint{lat: 53.651582, lon: 9.803386, time_offset_ms: 17637},
      %Video.TimedPoint{lat: 53.651556, lon: 9.803433, time_offset_ms: 17970},
      %Video.TimedPoint{lat: 53.651518, lon: 9.803488, time_offset_ms: 18304},
      %Video.TimedPoint{lat: 53.651465, lon: 9.803567, time_offset_ms: 18637},
      %Video.TimedPoint{lat: 53.651406, lon: 9.803655, time_offset_ms: 18971},
      %Video.TimedPoint{lat: 53.651341, lon: 9.803751, time_offset_ms: 19305},
      %Video.TimedPoint{lat: 53.65127, lon: 9.803847, time_offset_ms: 19638},
      %Video.TimedPoint{lat: 53.651194, lon: 9.803954, time_offset_ms: 19972},
      %Video.TimedPoint{lat: 53.651117, lon: 9.804067, time_offset_ms: 20305},
      %Video.TimedPoint{lat: 53.651045, lon: 9.804196, time_offset_ms: 20639},
      %Video.TimedPoint{lat: 53.650968, lon: 9.804323, time_offset_ms: 20973},
      %Video.TimedPoint{lat: 53.650889, lon: 9.804443, time_offset_ms: 21306},
      %Video.TimedPoint{lat: 53.650804, lon: 9.804564, time_offset_ms: 21640},
      %Video.TimedPoint{lat: 53.650721, lon: 9.804681, time_offset_ms: 21973},
      %Video.TimedPoint{lat: 53.650639, lon: 9.804794, time_offset_ms: 22307},
      %Video.TimedPoint{lat: 53.650559, lon: 9.804909, time_offset_ms: 22641},
      %Video.TimedPoint{lat: 53.650479, lon: 9.805019, time_offset_ms: 22974},
      %Video.TimedPoint{lat: 53.650393, lon: 9.80513, time_offset_ms: 23308},
      %Video.TimedPoint{lat: 53.650312, lon: 9.805245, time_offset_ms: 23641},
      %Video.TimedPoint{lat: 53.650233, lon: 9.805361, time_offset_ms: 23975},
      %Video.TimedPoint{lat: 53.650152, lon: 9.805478, time_offset_ms: 24309},
      %Video.TimedPoint{lat: 53.650074, lon: 9.805591, time_offset_ms: 24642},
      %Video.TimedPoint{lat: 53.649995, lon: 9.805705, time_offset_ms: 24976},
      %Video.TimedPoint{lat: 53.649913, lon: 9.805821, time_offset_ms: 25309},
      %Video.TimedPoint{lat: 53.649834, lon: 9.805937, time_offset_ms: 25643},
      %Video.TimedPoint{lat: 53.649754, lon: 9.806054, time_offset_ms: 25977},
      %Video.TimedPoint{lat: 53.649671, lon: 9.806177, time_offset_ms: 26310},
      %Video.TimedPoint{lat: 53.649589, lon: 9.806295, time_offset_ms: 26644},
      %Video.TimedPoint{lat: 53.649507, lon: 9.806412, time_offset_ms: 26977},
      %Video.TimedPoint{lat: 53.649425, lon: 9.806533, time_offset_ms: 27311},
      %Video.TimedPoint{lat: 53.649344, lon: 9.806652, time_offset_ms: 27645},
      %Video.TimedPoint{lat: 53.649263, lon: 9.806772, time_offset_ms: 27978},
      %Video.TimedPoint{lat: 53.64918, lon: 9.806897, time_offset_ms: 28312},
      %Video.TimedPoint{lat: 53.649098, lon: 9.807018, time_offset_ms: 28645},
      %Video.TimedPoint{lat: 53.649018, lon: 9.807133, time_offset_ms: 28979},
      %Video.TimedPoint{lat: 53.648935, lon: 9.807252, time_offset_ms: 29313},
      %Video.TimedPoint{lat: 53.648856, lon: 9.807367, time_offset_ms: 29646},
      %Video.TimedPoint{lat: 53.648775, lon: 9.807479, time_offset_ms: 29980},
      %Video.TimedPoint{lat: 53.648694, lon: 9.807588, time_offset_ms: 30313},
      %Video.TimedPoint{lat: 53.648615, lon: 9.80769, time_offset_ms: 30647},
      %Video.TimedPoint{lat: 53.648535, lon: 9.807789, time_offset_ms: 30981},
      %Video.TimedPoint{lat: 53.648457, lon: 9.807892, time_offset_ms: 31314},
      %Video.TimedPoint{lat: 53.648384, lon: 9.807993, time_offset_ms: 31648},
      %Video.TimedPoint{lat: 53.648313, lon: 9.808091, time_offset_ms: 31981},
      %Video.TimedPoint{lat: 53.64824, lon: 9.808196, time_offset_ms: 32315},
      %Video.TimedPoint{lat: 53.648169, lon: 9.808295, time_offset_ms: 32649},
      %Video.TimedPoint{lat: 53.648101, lon: 9.80839, time_offset_ms: 32982},
      %Video.TimedPoint{lat: 53.648031, lon: 9.808483, time_offset_ms: 33316},
      %Video.TimedPoint{lat: 53.647961, lon: 9.808577, time_offset_ms: 33649},
      %Video.TimedPoint{lat: 53.647892, lon: 9.808673, time_offset_ms: 33983},
      %Video.TimedPoint{lat: 53.647824, lon: 9.808771, time_offset_ms: 34317},
      %Video.TimedPoint{lat: 53.647758, lon: 9.80887, time_offset_ms: 34650},
      %Video.TimedPoint{lat: 53.647692, lon: 9.808968, time_offset_ms: 34984},
      %Video.TimedPoint{lat: 53.647625, lon: 9.809068, time_offset_ms: 35317},
      %Video.TimedPoint{lat: 53.647559, lon: 9.809166, time_offset_ms: 35651},
      %Video.TimedPoint{lat: 53.647495, lon: 9.809261, time_offset_ms: 35985},
      %Video.TimedPoint{lat: 53.647428, lon: 9.809351, time_offset_ms: 36318},
      %Video.TimedPoint{lat: 53.647363, lon: 9.809445, time_offset_ms: 36652},
      %Video.TimedPoint{lat: 53.647299, lon: 9.80954, time_offset_ms: 36985},
      %Video.TimedPoint{lat: 53.647236, lon: 9.80964, time_offset_ms: 37319},
      %Video.TimedPoint{lat: 53.647174, lon: 9.809739, time_offset_ms: 37653},
      %Video.TimedPoint{lat: 53.647113, lon: 9.809837, time_offset_ms: 37986},
      %Video.TimedPoint{lat: 53.647052, lon: 9.809937, time_offset_ms: 38320},
      %Video.TimedPoint{lat: 53.64699, lon: 9.810033, time_offset_ms: 38653},
      %Video.TimedPoint{lat: 53.646928, lon: 9.81013, time_offset_ms: 38987},
      %Video.TimedPoint{lat: 53.646863, lon: 9.810227, time_offset_ms: 39321},
      %Video.TimedPoint{lat: 53.646798, lon: 9.810322, time_offset_ms: 39654},
      %Video.TimedPoint{lat: 53.646735, lon: 9.810416, time_offset_ms: 39988},
      %Video.TimedPoint{lat: 53.64667, lon: 9.810511, time_offset_ms: 40321},
      %Video.TimedPoint{lat: 53.646605, lon: 9.810607, time_offset_ms: 40655},
      %Video.TimedPoint{lat: 53.646541, lon: 9.810705, time_offset_ms: 40989},
      %Video.TimedPoint{lat: 53.64648, lon: 9.810803, time_offset_ms: 41322},
      %Video.TimedPoint{lat: 53.646416, lon: 9.810906, time_offset_ms: 41656},
      %Video.TimedPoint{lat: 53.646354, lon: 9.811005, time_offset_ms: 41989},
      %Video.TimedPoint{lat: 53.646291, lon: 9.811104, time_offset_ms: 42323},
      %Video.TimedPoint{lat: 53.646227, lon: 9.811204, time_offset_ms: 42657},
      %Video.TimedPoint{lat: 53.646165, lon: 9.811301, time_offset_ms: 42990},
      %Video.TimedPoint{lat: 53.646102, lon: 9.811399, time_offset_ms: 43324},
      %Video.TimedPoint{lat: 53.646038, lon: 9.811499, time_offset_ms: 43657},
      %Video.TimedPoint{lat: 53.645974, lon: 9.811596, time_offset_ms: 43991},
      %Video.TimedPoint{lat: 53.645912, lon: 9.811702, time_offset_ms: 44325},
      %Video.TimedPoint{lat: 53.645858, lon: 9.811821, time_offset_ms: 44658},
      %Video.TimedPoint{lat: 53.645816, lon: 9.811951, time_offset_ms: 44992},
      %Video.TimedPoint{lat: 53.645788, lon: 9.812094, time_offset_ms: 45325},
      %Video.TimedPoint{lat: 53.645777, lon: 9.812248, time_offset_ms: 45659},
      %Video.TimedPoint{lat: 53.645784, lon: 9.8124, time_offset_ms: 45993},
      %Video.TimedPoint{lat: 53.645804, lon: 9.812551, time_offset_ms: 46326},
      %Video.TimedPoint{lat: 53.645827, lon: 9.812703, time_offset_ms: 46660},
      %Video.TimedPoint{lat: 53.645843, lon: 9.812855, time_offset_ms: 46993},
      %Video.TimedPoint{lat: 53.645852, lon: 9.813012, time_offset_ms: 47327},
      %Video.TimedPoint{lat: 53.645853, lon: 9.813164, time_offset_ms: 47661},
      %Video.TimedPoint{lat: 53.645851, lon: 9.813315, time_offset_ms: 47994},
      %Video.TimedPoint{lat: 53.645849, lon: 9.813461, time_offset_ms: 48328},
      %Video.TimedPoint{lat: 53.645847, lon: 9.813615, time_offset_ms: 48661},
      %Video.TimedPoint{lat: 53.645846, lon: 9.813765, time_offset_ms: 48995},
      %Video.TimedPoint{lat: 53.645844, lon: 9.813919, time_offset_ms: 49329},
      %Video.TimedPoint{lat: 53.645842, lon: 9.814077, time_offset_ms: 49662},
      %Video.TimedPoint{lat: 53.645841, lon: 9.814232, time_offset_ms: 49996},
      %Video.TimedPoint{lat: 53.645838, lon: 9.814389, time_offset_ms: 50329},
      %Video.TimedPoint{lat: 53.645836, lon: 9.814546, time_offset_ms: 50663},
      %Video.TimedPoint{lat: 53.645836, lon: 9.814703, time_offset_ms: 50997},
      %Video.TimedPoint{lat: 53.645834, lon: 9.81486, time_offset_ms: 51330},
      %Video.TimedPoint{lat: 53.645831, lon: 9.815017, time_offset_ms: 51664},
      %Video.TimedPoint{lat: 53.645824, lon: 9.815168, time_offset_ms: 51997},
      %Video.TimedPoint{lat: 53.645799, lon: 9.815315, time_offset_ms: 52331},
      %Video.TimedPoint{lat: 53.645748, lon: 9.815446, time_offset_ms: 52665},
      %Video.TimedPoint{lat: 53.645684, lon: 9.815556, time_offset_ms: 52998},
      %Video.TimedPoint{lat: 53.645627, lon: 9.815644, time_offset_ms: 53332},
      %Video.TimedPoint{lat: 53.645596, lon: 9.815694, time_offset_ms: 53665},
      %Video.TimedPoint{lat: 53.645625, lon: 9.815715, time_offset_ms: 53671},
      %Video.TimedPoint{lat: 53.645618, lon: 9.815723, time_offset_ms: 54005},
      %Video.TimedPoint{lat: 53.645592, lon: 9.815757, time_offset_ms: 54338},
      %Video.TimedPoint{lat: 53.645561, lon: 9.815811, time_offset_ms: 54672},
      %Video.TimedPoint{lat: 53.645538, lon: 9.815863, time_offset_ms: 55005},
      %Video.TimedPoint{lat: 53.645526, lon: 9.815951, time_offset_ms: 55339},
      %Video.TimedPoint{lat: 53.645526, lon: 9.816073, time_offset_ms: 55673},
      %Video.TimedPoint{lat: 53.645554, lon: 9.816199, time_offset_ms: 56006},
      %Video.TimedPoint{lat: 53.64561, lon: 9.8163, time_offset_ms: 56340},
      %Video.TimedPoint{lat: 53.645672, lon: 9.816391, time_offset_ms: 56673},
      %Video.TimedPoint{lat: 53.645734, lon: 9.816477, time_offset_ms: 57007},
      %Video.TimedPoint{lat: 53.645792, lon: 9.81656, time_offset_ms: 57341},
      %Video.TimedPoint{lat: 53.645834, lon: 9.816657, time_offset_ms: 57674},
      %Video.TimedPoint{lat: 53.645828, lon: 9.816776, time_offset_ms: 58008},
      %Video.TimedPoint{lat: 53.645802, lon: 9.816905, time_offset_ms: 58341},
      %Video.TimedPoint{lat: 53.645776, lon: 9.81705, time_offset_ms: 58675},
      %Video.TimedPoint{lat: 53.645747, lon: 9.817197, time_offset_ms: 59009},
      %Video.TimedPoint{lat: 53.645718, lon: 9.817343, time_offset_ms: 59342},
      %Video.TimedPoint{lat: 53.645685, lon: 9.817487, time_offset_ms: 59676},
      %Video.TimedPoint{lat: 53.645648, lon: 9.817633, time_offset_ms: 60009},
      %Video.TimedPoint{lat: 53.645616, lon: 9.817774, time_offset_ms: 60343},
      %Video.TimedPoint{lat: 53.645576, lon: 9.81791, time_offset_ms: 60677},
      %Video.TimedPoint{lat: 53.645521, lon: 9.818035, time_offset_ms: 61010},
      %Video.TimedPoint{lat: 53.645467, lon: 9.818155, time_offset_ms: 61344},
      %Video.TimedPoint{lat: 53.64541, lon: 9.81827, time_offset_ms: 61677},
      %Video.TimedPoint{lat: 53.645346, lon: 9.818371, time_offset_ms: 62011},
      %Video.TimedPoint{lat: 53.645272, lon: 9.818439, time_offset_ms: 62345},
      %Video.TimedPoint{lat: 53.645191, lon: 9.818489, time_offset_ms: 62678},
      %Video.TimedPoint{lat: 53.645104, lon: 9.818531, time_offset_ms: 63012},
      %Video.TimedPoint{lat: 53.645015, lon: 9.818551, time_offset_ms: 63345},
      %Video.TimedPoint{lat: 53.644924, lon: 9.818567, time_offset_ms: 63679},
      %Video.TimedPoint{lat: 53.644833, lon: 9.818579, time_offset_ms: 64013},
      %Video.TimedPoint{lat: 53.64473, lon: 9.81859, time_offset_ms: 64346},
      %Video.TimedPoint{lat: 53.644619, lon: 9.818606, time_offset_ms: 64680},
      %Video.TimedPoint{lat: 53.644506, lon: 9.818626, time_offset_ms: 65013},
      %Video.TimedPoint{lat: 53.644397, lon: 9.818649, time_offset_ms: 65347},
      %Video.TimedPoint{lat: 53.644293, lon: 9.818693, time_offset_ms: 65681},
      %Video.TimedPoint{lat: 53.644188, lon: 9.818749, time_offset_ms: 66014},
      %Video.TimedPoint{lat: 53.644089, lon: 9.818808, time_offset_ms: 66348},
      %Video.TimedPoint{lat: 53.643991, lon: 9.818863, time_offset_ms: 66681},
      %Video.TimedPoint{lat: 53.643889, lon: 9.818909, time_offset_ms: 67015},
      %Video.TimedPoint{lat: 53.643789, lon: 9.818954, time_offset_ms: 67349},
      %Video.TimedPoint{lat: 53.643687, lon: 9.818992, time_offset_ms: 67682},
      %Video.TimedPoint{lat: 53.64358, lon: 9.819024, time_offset_ms: 68016},
      %Video.TimedPoint{lat: 53.643477, lon: 9.819055, time_offset_ms: 68349},
      %Video.TimedPoint{lat: 53.643375, lon: 9.819083, time_offset_ms: 68683},
      %Video.TimedPoint{lat: 53.64327, lon: 9.819115, time_offset_ms: 69017},
      %Video.TimedPoint{lat: 53.643169, lon: 9.819156, time_offset_ms: 69350},
      %Video.TimedPoint{lat: 53.643069, lon: 9.819197, time_offset_ms: 69684},
      %Video.TimedPoint{lat: 53.642964, lon: 9.819223, time_offset_ms: 70017},
      %Video.TimedPoint{lat: 53.642861, lon: 9.819227, time_offset_ms: 70351},
      %Video.TimedPoint{lat: 53.642757, lon: 9.819239, time_offset_ms: 70685},
      %Video.TimedPoint{lat: 53.642653, lon: 9.819256, time_offset_ms: 71018},
      %Video.TimedPoint{lat: 53.642547, lon: 9.819275, time_offset_ms: 71352},
      %Video.TimedPoint{lat: 53.642438, lon: 9.819293, time_offset_ms: 71685},
      %Video.TimedPoint{lat: 53.642323, lon: 9.819312, time_offset_ms: 72019},
      %Video.TimedPoint{lat: 53.64221, lon: 9.819329, time_offset_ms: 72353},
      %Video.TimedPoint{lat: 53.642093, lon: 9.819338, time_offset_ms: 72686},
      %Video.TimedPoint{lat: 53.641977, lon: 9.819342, time_offset_ms: 73020},
      %Video.TimedPoint{lat: 53.641859, lon: 9.819356, time_offset_ms: 73353},
      %Video.TimedPoint{lat: 53.641746, lon: 9.81938, time_offset_ms: 73687},
      %Video.TimedPoint{lat: 53.641629, lon: 9.819381, time_offset_ms: 74021},
      %Video.TimedPoint{lat: 53.641517, lon: 9.819361, time_offset_ms: 74354},
      %Video.TimedPoint{lat: 53.641405, lon: 9.819356, time_offset_ms: 74688},
      %Video.TimedPoint{lat: 53.641293, lon: 9.819355, time_offset_ms: 75021},
      %Video.TimedPoint{lat: 53.641182, lon: 9.819354, time_offset_ms: 75355},
      %Video.TimedPoint{lat: 53.641071, lon: 9.819352, time_offset_ms: 75689},
      %Video.TimedPoint{lat: 53.64096, lon: 9.819354, time_offset_ms: 76022},
      %Video.TimedPoint{lat: 53.640857, lon: 9.819393, time_offset_ms: 76356},
      %Video.TimedPoint{lat: 53.640783, lon: 9.819511, time_offset_ms: 76689},
      %Video.TimedPoint{lat: 53.640749, lon: 9.819677, time_offset_ms: 77023},
      %Video.TimedPoint{lat: 53.640728, lon: 9.819849, time_offset_ms: 77357},
      %Video.TimedPoint{lat: 53.640707, lon: 9.820026, time_offset_ms: 77690},
      %Video.TimedPoint{lat: 53.640687, lon: 9.820211, time_offset_ms: 78024},
      %Video.TimedPoint{lat: 53.64067, lon: 9.820389, time_offset_ms: 78357},
      %Video.TimedPoint{lat: 53.640657, lon: 9.820565, time_offset_ms: 78691},
      %Video.TimedPoint{lat: 53.640644, lon: 9.820745, time_offset_ms: 79025},
      %Video.TimedPoint{lat: 53.640634, lon: 9.820921, time_offset_ms: 79358},
      %Video.TimedPoint{lat: 53.640623, lon: 9.821099, time_offset_ms: 79692},
      %Video.TimedPoint{lat: 53.640608, lon: 9.821288, time_offset_ms: 80025},
      %Video.TimedPoint{lat: 53.640593, lon: 9.821472, time_offset_ms: 80359},
      %Video.TimedPoint{lat: 53.640574, lon: 9.821659, time_offset_ms: 80693},
      %Video.TimedPoint{lat: 53.640555, lon: 9.821856, time_offset_ms: 81026},
      %Video.TimedPoint{lat: 53.64054, lon: 9.822056, time_offset_ms: 81360},
      %Video.TimedPoint{lat: 53.640531, lon: 9.822264, time_offset_ms: 81693},
      %Video.TimedPoint{lat: 53.64053, lon: 9.82248, time_offset_ms: 82027},
      %Video.TimedPoint{lat: 53.640544, lon: 9.822688, time_offset_ms: 82361},
      %Video.TimedPoint{lat: 53.640562, lon: 9.822892, time_offset_ms: 82694},
      %Video.TimedPoint{lat: 53.640579, lon: 9.823098, time_offset_ms: 83028},
      %Video.TimedPoint{lat: 53.640596, lon: 9.823295, time_offset_ms: 83361},
      %Video.TimedPoint{lat: 53.640607, lon: 9.823491, time_offset_ms: 83695},
      %Video.TimedPoint{lat: 53.64062, lon: 9.823696, time_offset_ms: 84029},
      %Video.TimedPoint{lat: 53.640621, lon: 9.823896, time_offset_ms: 84362},
      %Video.TimedPoint{lat: 53.640602, lon: 9.824088, time_offset_ms: 84696},
      %Video.TimedPoint{lat: 53.640567, lon: 9.824278, time_offset_ms: 85029},
      %Video.TimedPoint{lat: 53.640533, lon: 9.824459, time_offset_ms: 85363},
      %Video.TimedPoint{lat: 53.640502, lon: 9.824644, time_offset_ms: 85697},
      %Video.TimedPoint{lat: 53.640471, lon: 9.824833, time_offset_ms: 86030},
      %Video.TimedPoint{lat: 53.640442, lon: 9.825015, time_offset_ms: 86364},
      %Video.TimedPoint{lat: 53.640417, lon: 9.825195, time_offset_ms: 86697},
      %Video.TimedPoint{lat: 53.640392, lon: 9.825374, time_offset_ms: 87031},
      %Video.TimedPoint{lat: 53.640369, lon: 9.825548, time_offset_ms: 87365},
      %Video.TimedPoint{lat: 53.640353, lon: 9.82572, time_offset_ms: 87698},
      %Video.TimedPoint{lat: 53.640333, lon: 9.825896, time_offset_ms: 88032},
      %Video.TimedPoint{lat: 53.640312, lon: 9.826074, time_offset_ms: 88365},
      %Video.TimedPoint{lat: 53.640282, lon: 9.826245, time_offset_ms: 88699},
      %Video.TimedPoint{lat: 53.64024, lon: 9.826412, time_offset_ms: 89033},
      %Video.TimedPoint{lat: 53.640194, lon: 9.826572, time_offset_ms: 89366},
      %Video.TimedPoint{lat: 53.640149, lon: 9.826724, time_offset_ms: 89700},
      %Video.TimedPoint{lat: 53.640101, lon: 9.826875, time_offset_ms: 90033},
      %Video.TimedPoint{lat: 53.640049, lon: 9.827021, time_offset_ms: 90367},
      %Video.TimedPoint{lat: 53.64, lon: 9.827165, time_offset_ms: 90701},
      %Video.TimedPoint{lat: 53.63995, lon: 9.827314, time_offset_ms: 91034},
      %Video.TimedPoint{lat: 53.639909, lon: 9.827468, time_offset_ms: 91368},
      %Video.TimedPoint{lat: 53.639888, lon: 9.82763, time_offset_ms: 91701},
      %Video.TimedPoint{lat: 53.639887, lon: 9.827797, time_offset_ms: 92035},
      %Video.TimedPoint{lat: 53.639908, lon: 9.827955, time_offset_ms: 92369},
      %Video.TimedPoint{lat: 53.639948, lon: 9.828096, time_offset_ms: 92702},
      %Video.TimedPoint{lat: 53.639988, lon: 9.828232, time_offset_ms: 93036},
      %Video.TimedPoint{lat: 53.640027, lon: 9.828366, time_offset_ms: 93369},
      %Video.TimedPoint{lat: 53.640075, lon: 9.828496, time_offset_ms: 93703},
      %Video.TimedPoint{lat: 53.640128, lon: 9.82863, time_offset_ms: 94037},
      %Video.TimedPoint{lat: 53.640169, lon: 9.828773, time_offset_ms: 94370},
      %Video.TimedPoint{lat: 53.640187, lon: 9.828923, time_offset_ms: 94704},
      %Video.TimedPoint{lat: 53.64019, lon: 9.829075, time_offset_ms: 95037},
      %Video.TimedPoint{lat: 53.640189, lon: 9.829222, time_offset_ms: 95371},
      %Video.TimedPoint{lat: 53.640181, lon: 9.829365, time_offset_ms: 95705},
      %Video.TimedPoint{lat: 53.640161, lon: 9.829507, time_offset_ms: 96038},
      %Video.TimedPoint{lat: 53.64013, lon: 9.829633, time_offset_ms: 96372},
      %Video.TimedPoint{lat: 53.64008, lon: 9.829742, time_offset_ms: 96705},
      %Video.TimedPoint{lat: 53.640013, lon: 9.829829, time_offset_ms: 97039},
      %Video.TimedPoint{lat: 53.639937, lon: 9.829888, time_offset_ms: 97373},
      %Video.TimedPoint{lat: 53.639866, lon: 9.829932, time_offset_ms: 97706},
      %Video.TimedPoint{lat: 53.639794, lon: 9.829967, time_offset_ms: 98040},
      %Video.TimedPoint{lat: 53.639721, lon: 9.830007, time_offset_ms: 98373},
      %Video.TimedPoint{lat: 53.639653, lon: 9.830045, time_offset_ms: 98707},
      %Video.TimedPoint{lat: 53.639576, lon: 9.830086, time_offset_ms: 99041},
      %Video.TimedPoint{lat: 53.639503, lon: 9.830137, time_offset_ms: 99374},
      %Video.TimedPoint{lat: 53.639432, lon: 9.830194, time_offset_ms: 99708},
      %Video.TimedPoint{lat: 53.639363, lon: 9.830269, time_offset_ms: 100_041},
      %Video.TimedPoint{lat: 53.639292, lon: 9.830368, time_offset_ms: 100_375},
      %Video.TimedPoint{lat: 53.639228, lon: 9.830475, time_offset_ms: 100_709},
      %Video.TimedPoint{lat: 53.639165, lon: 9.830591, time_offset_ms: 101_042},
      %Video.TimedPoint{lat: 53.639102, lon: 9.830708, time_offset_ms: 101_376},
      %Video.TimedPoint{lat: 53.639039, lon: 9.830826, time_offset_ms: 101_709},
      %Video.TimedPoint{lat: 53.638986, lon: 9.83096, time_offset_ms: 102_043}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "ezxieBiccuQ@A@CBCBCBEBEBCBEDEBGDEDGDGDGFIDGFIHKFKFIHKFIFIDIFIFIDGFIFIDIFGDIFIDIFGDIDIFIDIFGDIDIFIDIDGDIFIDIDIFIDIDIDIDIDIFIDIDIDIDKFIDIDIDKDIDIFIDKDIDKDIDIDIDKDIDIDIDKDIDIDKDIDIDIDIDKDIDIDKBIDIDIDIDKDIBIDIDKDIDIDKBIDIDKDIBIDKDIDKBIDKDIBIDKBIDKDIBKDIBKDIBKDIBKDIBKDIBKDIBKBIDKBIBIDKBIBKDIBIBKBIDIBKBIBIDIBIBKBIDIBIBIBIBIBIBGDIBIBIBIBGBIDGBIBGBGBGBGBGDGBGBEBGBEBEBGBEBEBEBCBEBCBEBC@CBCBCBCBCBA@CBCBABCBA@ABABABCBABAB?@ABABAB?BAB?DAB?BAB?B?D?B?B?D?B?D?B?D@B?D@D?D@D@D@D?B@D@DBD@D@D@D@DBD@D@DBD@D@DBD@DBD@DBD@FBD@DBD@DBD@D@DBD@DBF@DBD@DBF@D@DBF@DBF@D@FBD@D@FBD@F@F@DBF@D@F@F@D@F@D@F?F@D@F?F@D?F?D@F?DAF?D?F?DAFAD?FADAFAFCDAFCDAFCFCFEDCFCFEDCFEFEDEFEDEFEFEDEFGDEFEDGFEDGFEDGFGDEDGDEFGDEDGDEDGDEDEDGDEDEDGDEDEDEBGDEDEDEDGBEDEDEDGDEDGBEDGDEDEDGDGDEDGDEDGBGDGDEDGDGDEDGDGDGBGDEDGDGDGDEBGDGDGDGDEBGDGDGDEBGDGDGDEBGDGDEBGDGDEBGDGDEBGDEDGBGDEDGBEDGDGDEBGDGDEDGDGBEDGDGDGDGDEDGDGDGBGDGDGDGDEDGDGDGDGDIDGFGDGDGDGDGDGDIDGDGDGDIDGDGDGDGDGDIDGDGDGDGDGDIDGDGBGDGDGDGDGBGDGDGDGBGDGDGDGDGBGDGDGDGBGDGDGBGDGDGDGDGBGDGDGDGDGDGDIDGDGBGDIDGFIDGDGDIDGDIDGDGDIDGDGDIBGDGDGDIDGDGBGDGDGDGBGDGDGBGDGDGDGBGDGDGDIDGDGDIBGDGDIDGDIDGDIFGDIDIDGDIDIDGDIFGDIDIDGDIDIDGDIDIDIDGDIDIDGFIDIDGDIDIDGDIDIDGDIDIDIDGDIDIDGDIDIDGDIFIDGDIDIDGDIDIDGDIDIDIFIDGDIDIDIDIDGFIDIDIDIDGDIDIDGFIDIDGDIDIDGDIDGDIDGDIDGDIDGDIFGDIDGDGDIDGDIDGDGDIDGDGDGDIBGDGDGDIDGDGDGDIDGDGDGDGDIDGDGDIDGDGDIDGDGDIDGDGFIDGDIDGDGDIDGDGDIDGDIDGDIDGDIDGDIFGDIDGDIDIDGDIDGDIDGDIDGDIDIDGDIDGDIDGDIDIBGDIDGDIDGDGDIBGDGDIDGBGDGDIBGDGDGBGDGDGBGDGBGDGBGDEBGDGDGBGDGBGDGBGDEDGBGDGBGDGBEDGBGDGDGBEDGBEDGBEBGDEBGDEBEDEBEBGDEBCBEBEDEBEBCBEBCDEBCBEBCBEBCBCBEBCBCBCBEBCBCBCBCBEBCBCBCBEBCDCBEBCBEBCBEBCDEBEBCDEBEBEBEDEBEDEBEBEBEDGBEBEDEBGBEDEBGBEBEDGBEBGBEBGDGBEBGBEBGDEBGBGBGDEBGBGBGDEBGBGBEDGBGBGDGBEBGDEBGBGDEBEBGDEBGBEDEBEBGDEBEBEBEDEBEBEDEBEBCDEBEBEDEBCBEBEDEBCBEDEBCBEBEDCBEBEDCBEBEDEBCBEDEBEDEBEDCBEDEBEBEDEBGDEDEBEDEBEBEDEBEDEBEDGBEDEBEDEBEDEBEDEBEDEBEBEDEBEDEBEDEBEDGBEDEBEDEBEDEBEDEDEBEDGBEDEDEBEDEBEDGBEDEDEBGDEDEBGDEBEDGDEBEDGBEDGDEBEDGBEBEDGBEDGBEDGBEBGDEBGDEBEBGDEBGBEDGBEBGBEDGBEBGDEBGBEDGBEBGBEDGBEBGDGBEBGBGDEBGBGBEDGBGBGBEDGBGBGBGBGBEDGBGBIBEBGBGBGBGBGBE@GBGBEBG@EBE@GBEBE@EBE@E@EBE@C@EBE@C@EBC@E@C@E@CBC@C@E@C@C@C@CBC@C@C@C@C@C@EBC@C@CBC@E@CBC@EBC@EBC@EBC@EBEBCBEBEBEBEBEBGBEBEBGDGBEDGDGBGDGDGBGDGDIDGDGDGDIBGDGDGDIDGDGDIDGDGDIDGDIBGDGDIDGDIDGDIDGDIDGFIDGDIDIDGDIDIFGDIDIDGDIFIDIDIFGDIDIFIDGDIFIDIFIDIDIFGDIFIDIFIDIFIDGFIDIFIFIDIFIDIFIFIDIFIFIDIFKFIFIDIFIFKFIFKDIFKFIFIFKFIDKFIFKFKFIFKDIFKFKFIFKFKFKDIFKFKFKDKFIFKFKDKFMFKFKDKFKFKDKFMFKDKFMFKDKFMFKDKFMFKDKFMFKFMFKDKFMFKFKDMFKFMFKFKFMFKDKFMFKFKFKFKFMFKFKDKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKHKFKFKFKFKHMFKFKHKFKFKFKFKHKFKFKFKHKFKFKFKFKHKFKFIFKFKFKHKFKFIFKFKFKFIFKHKFKFKFIFKFKFIFKFIFKFKHKFIFKFKFIFKFIFKFKFKFIFKFKFIFKFKFIFKFKFKFIFKFKFIFKFKFIFKFKFIFKFIFKFKFIFKFIFKFIFKFIFKFIFIFKFIFKFIHKFIFKFKFIHKFIFKFIFKHKFIFKHKFIFKFKHIFKFIFKFKHKFIFKFKFIFKFKFIHKFKFKFIFKFKFKFIFKFKFIFKFKFKFKFIFKFKDIFKFKFKFKFIFKFKFKFIFKFKFKFKFKFIFKFKFKFKFIFKFKFKHKFKFKFKFIFKFKFKFIFKFKFKDIFKFKFKFIFKFKFIFKFKFIDKFIFKFKFIFKFKFIFKFKFIDKFIFKFKFIFKFKFKFIFKFKFIFKFKFIFKFKFKFKFIFKFKFKHKFKFKFKFIFKFKFKFKFIFKFKFKHKDIFKFKFKFIFKFKFKFKFIFKFKFKFIFKFKFKFIFKFKFKFKDKFIFKFKFKFIFKFKFKFKFKFKFKFIFKFKFKHMFKFKFKFKFKFKHKFMFKFKHKFKFKFKFMFKFKFKHKFKFKFKFKFKFKFIFKFKHKFKFKFKFKFKFIFKFKFKFKHKFKFIFKFKFKFKFKFKFKHKFIFKFKFKFKFKFKFKFKFKHKFKFIFKFKFKFKFKFMHKFKFKFKFKFKFKFKFKFKFKFKFKFKHKFIFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKFKHKFKFKFKFKFKFKFKFKFKFKFKFKFKHMFKFKFKFKFKFMHKFMFKFKFKFKHKFMFKFKFKFMFKHKFKFKFKFKFKFKFMHKFKFKFKFKFIFKFKFKFKFKFKFKFIFKFKFKFIFKFKFKFIFKFKFKFIFKFKFKFKFIFKFKFKHKFKFKFKFKFKHKFKFKFKFKFKFIFKFKHKFKFKFKFIFKFKFKFIFKFKFKFIDKFKFIFKFKFIFKFKFIFKFKFIFKFIFKFKFIFKHKFIFKFIFKFIFKFIFKFKFIFKFIFKFIFKFIFKHIFKFIFKFIFKFIFIFKFIFIFKFIFIFIFIFKFIFIFIFIFIFIDIFIFIFIFIFIFIFIFIFIFIFIFIFIFIFIFIDIHIFIFIDIFIFIFIFIFIFIFIFKFIFIFIFIFIFIFIFKFIFIFIFIDKFIFIFIFIDIFIFIFKFIDIFIFIDIFIFIDIFIFIDIFIDIFIFGDIFIDIFIDIFIFIDIFIDIFIDIFIDIFGDIFIDIFIDIFIFIDIFIFIDKFIDIFIFIDIFKFIFIDKFIFIDIFIDIFKFIDIFIFIDIFIDIFIDIFIDIFIFIDIFIDIFIDIFIDGFIDIFIDIDIFGDIFIDIFIDGFIDIDGFIDIDGFIDIFGDIDIFGDIFIDGFIDIFGDIDIFGFIDIFGDIDIFGDIFIDGFIFIDIDGFIFIDGFIDIFIDGFIDIFGDIFIDIDGFIDIFIDGFIDIFIDGFIDIFIDGDIFIDIFIDGFIDIDIFIDGFIDIFIDIDIFIDIFGDIDIFIDIFIDIDIFIDIFGDIDIFIDIDIFIDIDIFIDIDIFIDIDIFIDGDIFIDIDIDIFIDIDIFIDGDIDIFIDIDIDIFIDIDGFIDIDIDIFIDIDIFIDIDIFIDIDIFIDIFIDIDIFIDIFIDIDIFIDIDIFIDIDIFIDIDIFIDGDIDIFIDIDIFIDIDIFIDGDIDIFIDIDIDGFIDIDIDGDIFIDGDIDIDGFIDIDGDIDGFIDIDGDIFIDGDIFGDIDIFGDIDGFIDIDGDIFGDIDGFIDIDGFIDIDGDIFGDIDIDGFIDIDGFIDIDGDIDIFGDIDIDIFGDIDIDGDIFIDIDIDGDIFIDIDGDIDIDIFIDGDIDIDIFIDIDIDIDIDGFIDIDIDIDIDIFIDIDIDIDIDIDIFIDIDIDIDIDIDIDIDIFIDIDIDIDIDIDGDIDIDIDIDIFIDIDIDIDIDIDGDIDIDIDIDIDIDIDIDGDIDIDIDIDIFIDIDIDIDIDIDIDIDIDIDIDIDIDIDGDIDIFIDIDIDIDIDIDIDIDGDIFIDIDIDIDGDIDIDIDGDIDIDIFIDIDGDIDIDIDGDIDIDIDIFGDIDIDIDIDGDIDIFIDIDIDIDGFIDIDIDIFIDIDIDIFGDIDIDIFIDGDIDIFIDIDIFIDGDIDIFIDIDGDIFIDIDGDIDIFGDIDIDIDGFIDIDGDIDIDGDIFIDGDIDIDGDIDIFGDIDGDIDIFIDGDIDIDIFIDGDIDIFIDIDGDIFIDIDGDIFIDIDIFGDIDIDIDGFIDIDIDIFGDIDIDIFIDGDIDIDIFIDIDIDIFGDIDIDIDIFIDIDIDIFIDGDIDIDIDIDIFIDIDIDGDIDIDIDIDIDGDIDIDIDIDIDIDGFIDIDIDIDIDIDIDIFKDIDIDIDIFIDKDIDIFIDIDKDIDIFIDIDIDIDIDIFIDIDIDIDIDIDIDIDIDIFGDIDIDIDIDIDIDIDIDIFIDIDGDIDIDIDIFIDIDIDIDIDIDIDIFIDIDIDIFIDIDIDIDIDIFIDIDIDIFIDIDIDIDIDIFIDIDIDIDGDIDIFIDIDIDIDIDGDIDIDIDIDGDIFIDIDIDIDGDIDIDIDIFIDIDGDIDIDIDIFIDIDIDIDIDIFIDIDIDIDIFIDIDIDIFIDIDIDIFIDIDIDIDGDIFIDIDIDIDIFIDIDIDGDIDIDIFIDIDIDIDIDIDIDIFIDIDIDIDIDIDKDIFIDIDKDIDKDIDIDKDIDKDIDKDIDKDKBKDIDKDKDKBKDKDKDKBKDKBKDKDKBKBKDKBKDMBKBKDKBMBKBKDMBKBKBMBMBKBMBKBMBK@MBKBMBM@MBMBM@MBM@MBM@MBM@MBM@O@M@MBM@M@O@M@M@O@M@O@M?O@M@O@O?M@O?O@O?M@O?M?O@O?M?O?O?M?O?O?M?O?M?O?M?OAM?O?OAM?O?MAO?MAOAM?OAMAO?OAMAOAM?OAMAOAOAMAOAMAOAOAMAOAMAOAMAOAOAMAOAMAOAMCOAOAMAOAOAMAOAOAMAOAMAOAOAMAOAMAOAOAM?OAMAOAOAMAO?MAOAO?MAOAMAO?OAO?MAOAO?OAM?OAO?OAO?OAO?O?MAO?O?OAM?O?OAO?O?M?O?M?OAO?M?O?M?O?O?M?O?M?O?M?O?M?O?M?O?O?M?O?O?M?O?M?O?O?O?M?M?O@M?O?M?O?M?O?M?M?O?M@M?M?M?M?O?M?M?M?O?M@M?M?O?M?O?M?O?M?O?O@M?O?O?O?M?O?O?O?O?M?O@O?M?O?M?O?O?M?O?M?O?M?O?M?O@M?O?M?O?M?M?O?M?O?M?O?O?M?O@O?M?O?M?O?O?M?O?O?O?M@O?O?M?O?O?O?O?O?M?O@O?O?O?O?O?O?O?O?O?O?O@M?O?O?O?O?O?O?M?O?O?M?O?O?O@M?O?O?O?M?O?O?M?O?O?O@O?M?O?O?O?O?O?M?O@O?O?O?O?O?O?M?O@O?O?O?O?O?M?O?O@O?O?M?O?O?O?O?O?O?M?O?O@O?O?O?M?O?O?O?O?M?O?O?O?O?O?O?M?O?O?O?O?M?O?O?O@O?O?O?O?O?M?O?O?O?O?O?O@M?O?O?O?O?M?O?O?O@O?O?O?M?O?O@O?O?O?O?O?M@O?O?O?M@O?O?O?M@O?M?O@O?M@O?M@O?O?M@M@O?M@M@O?M@O@M@O@M?M@O@MBM@M@O@M@MBO@MBM@MBM@MBMBM@MBMBMBMBMBKBMDMBKBMDMBKDMBMDKBKDMDKDKBKDKDMDKDKDKDKDKDKDKFKDIDKDKDKFIDKDIDKDIFIDKDIFKDIDIDIFKDIHQFSHSFOFQDKBKDKBIBG@GBG@E@EBE@E?C@E@C@C@A?C@C?A@C@A?C@A?A?C@A?A@C?AA??????A?????????A???????A??@A?????A??@A?A??@A?A?A@A?A@A?A@A?A@C@A?A@C@A?C@C@A@C@C@C@C@C@E@C@E@CBE@E@EBE@GBE@EBGBGBE@GBGBGBIBGDI@E@E@EBE@C@E@C@E@E@C?E@E@C@E@E@E@E@E@E?G@E@E@G@G?E@G@G@I?G@G@I?G@I?I@I@K?I@K?K?I@K?M?K?K?K?M?K?M?K?KAM?K?KAM?KAKAM?KAMAKAKAMAKAKCMAKAKCMCKAKCKAKCICKCKCKCKCICKEICKCIEKCIEICKEIEICIEIEKEICIEGEIEIEIEIEIEIEIEGEIEIEGEIEIEGGIEIEGEIEGEIEGEIEGEIEGGGEIEGEIEGEGEIEGEIGGEGEIEGEGEGEIEGEGEIEGEGEICGEGEGEIEGEICGEGEICGEIEGCIEGCIEICICGCICIEICIAICGCICIAICIAIAICGAIAIAGAI?IAIAI?GAI?IAK?I?I?I?K?K?I?K?K?K@K?K?K@K@K?M@K@K@M@M@K@M@K@M@K@M@M@K@MBM@K@M@MBM@M@MBM@M@MBM@M@MBO@M@MBO@M@OBM@MBM@O@MBO@MBO@M@MBO@M@MBM@OBM@OBM@MBO@M@MBO@MBM@OBM@OBM@MBM@O@MBM@OBM@MBO@MBM@MBO@MBM@MBM@OBMBM@MBO@MBMBM@MBM@OBMBM@MBMBO@MBMBMBM@OBMBMBO@MBOBMBMBOBM@OBMBMBOBM@MBMBOBM@MBMBOBM@MBMBM@MBMBM@MBMBM@MBKBM@MBMBMBMBM@MBMBKBMBMBMBMBK@MDMBMBKBMBMBKBMBKDMBKBMDMBKDMBKBMDKDMBKDKBMDKDMBKDKDMDKBKDKDKBMDKDKDKBKDKDKBKDKDKDKBKDKDKBKDKDKDKBKDIDKDKDKBKDKDKDIDKDKBKDIDKDKDKDIDKDIDKDIDKDIDKDIDIDIDKDIFIDIDIDIFIDIDIDGFIDIDGFGDIDGFGDGFGDGFGDGFEDGFGDEFGFEDGFEFEDEFEFEDEFEFGFCFEFEFEFEFEDCFEFCFEHEFCFEFCFEFCFCFEFCFCHEFCFCFCHEFCFCHCFCHCFCFCHCFCHCFAFCHCFAHCFCFAHAFCHAFAHCFAFAHAFAHAFCHAFAFAH?FAHAFAHAFAHAFAHAFAH?FAHAHAFAH?FAHAFAH?FAHAFAH?HAFAF?HAFAH?FAHAF?HAF?HAFAH?FAH?HAF?HAHAH?HAF?HAJAH?HAH?HAHAJ?HAH?HAJAH?HAJAH?HAJAH?JAHAH?JAHAJAH?JAJAHAJAHAJ?HAJAJAHAJAJAHAJAJAH?JAJAHAJAJAJAHAJAHCJAJAHAJAHAJAJAHAJAHAHAJCHAJAHAJCHAJAHCHAJAHCHAJCHAHCJCHCHAHCJCHCHCHCHCJCHCHEHCHCHCJEHCHCHEHCJEHCHEHEJCHEHEJCHEHEJEHEHCHEJEHEHEHEHCHEHEHEJEHEFEHEHCHEHEHEHEHEHEHEHCHEHEHEHEFEHEHCHEHEHEHEHCHEHEHCHEHEFCHEHEHCHEHCHEHCHEHEHCHCHEHCHEHCHCJEHCHEHCHCHEHCHCHCHEHCHCHEHCHCHCHEHCHCHCHCHEHCHCHCHCHCHCHEHCHCJCHCHCHCHCHCHCHCHCHCHCHAJCHCHCHCHAHCHCJCHCHAHCJCHAHCJCHAHCJCHCJAHCHAHCJCHAHCJAHCHCHAJCHAHCHAJCHAHCHCHAHCHAJCHAHCHAHCHAHCHAHAHCJAHCHAHCHAHCHAHAHCHAHCHAHCJAHCHAHCHAJCHAHCHAHCHAJCHCHAJCHCHAHCHCJCHAHCHCHCJCHAHCHCHCHCHCHCHCJCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHCHAHCHCHCHCHAHCHCJAHCHAHCHAJCHAHCHAJAHAHAJCHAHAH?HAHAJAHAH?HAHAJ?HAH?HAH?HAH?J?HAH?H?HAH?HAH?J?HAH?HAH?HAJ?HAH?HAH?JAHAH?HAH?HAJAH?HAHAJAH?HAHAHAJ?HAHAHAHAJ?HAHAHAHAJAHAH?HAHAJAHAHAHAJAHAHAH?JAHAHAJAHAHAJAHAHAHAJAHAJAH?HAJAHAJAHAJAHAHAJAHAJAH?JAHAJAHAJAHAJAJAHAJAJAH?JAJAHAJAJAJAJAJAHAJAJAHAJAJAJ?HAJAJAHAJAHAJ?JAHAJAJAH?JAHAJAJ?HAJAJ?JAJAH?JAJ?JAJAJ?HAJ?JAJ?J?JAJ?JAH?J?JAJ?J?JAH?J?JAJ?H?J?JAJ?J?HAJ?J?JAH?J?JAJ?JAJ?HAJ?JAJ?JAJ?JAJAJ?JAJAJAJ?JAHAJAJAJAJAHAJAJAJAHAJAH?JAJAHAJAJAHAJAHAJAJAH?JAJAJ?HAJ?JAJ?HAJ?J?J?J?J?J?J?J?H?J?J?J@H?J@J?J@H?J@J?H@J@J@H?J@J@H@J?H@J@H@J?H@J@J?H@J?H@J?J@H?J@H?J@H?J?J@H?J?H?J?H@J?J?H?J?J@H?J?H?J?J?H?J?J?H?J@H?J?J?H?J?H?J?H?J?J?H?J?H?J?H?J?H?J@H?J?J?H?J?H?J?H?J?H?J?H?J?H?J@H?J?H?J?J?H?J?H?J?H?J?H?J?H?J?J?H?J?H?J?J?H?JAH?J?J?HAJ?HAJ?HAHAJAH?HCJAHAJAHCHAHCHCJCHCHCHCHEHCHEFEHEFEHGFEHGFGFGFGFIFGFIFIFIFIDKFKFKDKDKDKFKDMBKDMDMDMBMDMBMDMBOBMBOBOBOBOBQBOBO@OBQBO@QBO@O@QBQ@O@OBQ@O@Q@O@QBO@Q@O@Q@Q@O@Q@O@Q@O@Q@QBQ@Q@O@Q@Q@Q@Q@O@Q@Q@Q@Q@Q@Q@O@Q@Q@Q@Q@S@Q@Q@Q@Q@Q@Q@S@Q@Q@S@Q@Q@S@Q@Q@Q@Q@Q@S@Q@Q@Q@Q@Q@Q?Q@Q@Q@Q@Q@Q@O?Q@Q@Q@Q?O@Q@Q@Q?Q@Q@O@Q?Q@Q@O?Q@Q@Q?Q@O@Q?Q@O@Q?Q@Q@Q?Q@Q@Q?Q@O@Q?Q@Q?Q@Q@S?Q@Q@Q?Q@O?Q@Q@Q?Q@Q?Q@Q?Q@Q@Q?O@Q?Q@Q?Q@Q?O@Q?Q@O?Q@Q?Q@O?Q@Q?Q@Q@Q?O@Q?Q@Q?Q@Q?O@Q@Q?Q@Q?Q@Q@Q?Q@Q@S?Q@Q@S?Q@S@Q?S@Q@S@S?Q@Q@S@Q?S@Q@Q@S?Q@S@Q@Q?Q@Q@S@Q?Q@Q@Q@Q@S?Q@Q@Q@Q@Q?Q@S@Q@Q@Q@S?Q@Q@Q@Q@S@Q@S@Q@Q@S@Q?Q@S@Q@S@Q@S@S@Q@S@S@S@Q@S@S@S@S@S@S?S@S@S@Q@S@S@S@S?S@S@S@S@S@S?S@S@S@S?S@S@S?S@S@S?S@S@S?S@U?S@S?S@U?S@U?S@S?U@S?U@S?U?S@S?U?S?U@U?U?S?U@S?U?U?S?U?U?U?U?U?U?S?UAU?S?U?SAU?U?SAU?SAU?SAS?UASAU?SAUAS?SASAUAS?SASAUASAU?SASASAUASAS?SAUASASASASASAU?SASASAUASASASAU?SASASAUASASAUAS?SAUASASASAS?SASAUASASASAS?SASASAQASAS?SASASAQ?SASASAQ?SASAS?SAQAS?SAQ?SASAQ?SAS?SAQ?SASAS?SAS?SASAS?SAU?SASAS?SAU?SAUAS?SAS?SAS?U?SAS?S?UAS?S?S?SAS?S?S?S?U?S?S?Q@S?S?S?S@Q?S@S?S@S?Q@S@Q?S@Q@S@Q@S@S@Q@S@Q@Q@S@Q@SBQ@S@SBQ@SBQ@SBS@QBSBS@SBQBS@QBSBQBS@QBQBS@QBQBSBQ@QBQBQ@QBQBQ@QBQBQ@QBQBQ@QBQ@QBQBQ@QBQBS@QBQ@QBQ@QBQBS@QBQ@SBQ@QBQ@QBSBQ@SBQ@QBS@QBSBQ@SBQ@SBS@QBS@QBSBQ@QBS@QBQ@SBQ@QBQ@Q@SBQ@QBQ@QBQ@QBQ@Q@QBQ@Q@QBQ@QBQ@S@QBQ@Q@QBQ@Q@Q@QBQ@Q@Q@QBQ@Q@O@QBQ@Q@Q@QBQ@Q@Q@QBQ@Q@Q@QBQ@Q@Q@QBQ@Q@O@Q@QBQ@Q@Q@Q@OBQ@Q@O@Q@Q@O@QBQ@Q@O@Q@Q@O@Q@O@Q@Q@Q@O@Q@O@Q?Q@O@Q@O@Q@Q@O@Q?O@Q@O@Q@O@Q@Q@Q@O?Q@Q@O@Q@Q@O@Q@Q@Q@Q@Q@Q@O@Q@Q@Q@O@Q@Q@Q@Q@Q@QBQ@Q@Q@Q@Q@Q@Q@O@QBQ@Q@O@QBQ@Q@Q@OBQ@O@QBO@QBO@QBQ@OBQ@OBQBO@OBQBO@QBOBQBOBQBO@OBQBOBOBQBODQBOBOBQBOBOBOBQDOBOBOBQDOBOBOBODOBOBOBQDOBOBOBODMBOBODOBOBOBODMBOBOBMDOBMBOBODMBOBMDOBMBOBMDOBMBOBMDOBOBMDOBMDOBOBMDOBMDOBODMBMBODMBODMBODMBODMBODMBMDOBMDMDOBMDOBMDMBMDOBMDMBMDODMBMDOBMDMBMBMDMBMDMBODMBMDMBMBMDMBODMBMDMBODMBODMBMDOBODMBODMBOBMDOBMDOBOBMDOBMBODOBMBOBMBOBOBMDOBOBMBO@OBOBOBMBO@OBOBM@OBO@OBO@O@OBO@O@O@O@O@O@O@O@O@O?O@Q@O?O@O@O?Q?O@O?O?Q@O?O?O?Q?O?Q?O?O?OAQ?O?OAO?OAO?QAOAO?MAOAOAOAOAOAOAOAMCOAOAMAOCMAOCMAOCMAOCMCMAOCMCMCMCMCOAMCMCMCMCMCMCMCMCMCMCMCKCMCMCMCMCKCMCMCMCMCMCKCMCMCMCKCMCMCMCKCMCMCKCMCMAKCMCMEKCMCKCMCMCKCMCKCMCKCMEMCKCMCKCMEKCMCKEMCKCMEKCMEKCMEKCMCKEMEMCMEKCMEMCKEMCMEKCMEMEMCMEMCMEMCMCKEMCMEMCOCKCMEOCMCMCMCMCOCMCMCMCMAOCMCMAMCMAOCMAMAOCMAMAMAOAMAMAOAMAOAMAOAM?OAMAM?OAO?MAO?MAO?M?OAO?M?OAO?M?O?OAM?O?M?O?M?O?M?O?O?M?M?O?M?M?O?M?M?O?M?M?O@M?M?M?M?O?M@M?M?O@M?M?M@M?M?M@M?M@O?M@M?M@M?M@M@M?M@M@O@M?M@M@M@O@M@M@M@M@O@M@M@KBM@M@M@M@KBM@M@KBM@KBM@KBK@KBM@KBKBK@KBKBKBKBI@KDKBKBKBIBKBKBIDKBIBKDIBKDIBIDKDIBIDIDIBIDIDIDIDGDIDIDGFIDGDIDGFIDGFGDGDGFGDGFGDGFGFEDGFGDEFGFEDEFEFGFEFEDEFEFEFEDEFEFCFEDEFCFEDCFEFCDEFCDCFEDCFCDCFCDCFCDCFCDCFCDCFCDCFCDCFCDCFCDCFADCFCFCDCFCDCFCDAFCFCDCFCFCDCFCFCDCFCFCFCDCFCFCDCFCFCDCFADCFCDCFCDCFCDCFCDCDAFCDCDCDCFCDADCFCDCFCDCFCDCFCFCDCFCFCDCFCFCFCFCFEFCDCFCFEFCFCFEFCDCFEFCFCFEDCFEFCFCDEFCFEDEFCDEFCFEDCFEDEFCDEFEFCDEFEDEFCDEFEDEFEDEFEDEFEDEDEFEDEFGDEFEDEFGDEFGDEFGDEDGFGDGFEDGDGFGDGFGDGFGDIFGDIFGDIFIFGDIFIFIDIFIDIFIFIDKFIDIDIFIDIFKDIDIFIDIDIDKFIDIDIDKDIFIDKDIDIDKDIFKDKDIDKDIFKDKDKDIDKDKFKDKDIDKDKFKDIDKDKDKDKFKDIDKDKDKDKDIDKFKDKDKDKDKDIDKFKDKDKDKDKDKFIDKDKDKDKDKDKDKDKFKDKDKDKDMDKDKDMDMFODMFODODODKDMBIDKBIBIBIBG@IBEBG@E@G@C@E",
      precision: 6
    }
  end
end