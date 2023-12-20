defmodule Data.AutoGenerated.Video.Rendered_c80240e6ee7705a6403dd7e4a4d9bd8f do
  @moduledoc "#{"2020-10-24-wellingsbuetteler-landstrasse: Wellingsbütteler Landstraße"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2020-10-24-wellingsbuetteler-landstrasse: Wellingsbütteler Landstraße"
  end

  @impl Video.Rendered
  def hash() do
    "c80240e6ee7705a6403dd7e4a4d9bd8f"
  end

  @impl Video.Rendered
  def length_ms() do
    65205
  end

  @impl Video.Rendered
  def sources() do
    [{"2022-01-29-rickling/GX013208", "00:01:10.103", "00:02:15.441"}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.031711,
      minLat: 53.62569739820359,
      maxLon: 10.057741696696697,
      maxLat: 53.63666942042042
    }
  end

  @impl Video.Rendered
  def renderer() do
    2
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Januar 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 620, text: "Wellingsbütteler Landstraße"},
      %{timestamp: 64671, text: "Wellingsbüttler Weg"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.031788416167664, lat: 53.62569739820359, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.031736, lat: 53.625767, time_offset_ms: 287},
      %Video.TimedPoint{lon: 10.031711, lat: 53.62585, time_offset_ms: 620},
      %Video.TimedPoint{lon: 10.03173, lat: 53.625933, time_offset_ms: 954},
      %Video.TimedPoint{lon: 10.03179, lat: 53.626014, time_offset_ms: 1287},
      %Video.TimedPoint{lon: 10.031872, lat: 53.626086, time_offset_ms: 1621},
      %Video.TimedPoint{lon: 10.03195, lat: 53.626166, time_offset_ms: 1955},
      %Video.TimedPoint{lon: 10.032031, lat: 53.626253, time_offset_ms: 2288},
      %Video.TimedPoint{lon: 10.03213, lat: 53.626332, time_offset_ms: 2622},
      %Video.TimedPoint{lon: 10.032231, lat: 53.626409, time_offset_ms: 2955},
      %Video.TimedPoint{lon: 10.032334, lat: 53.62649, time_offset_ms: 3289},
      %Video.TimedPoint{lon: 10.032434, lat: 53.626569, time_offset_ms: 3623},
      %Video.TimedPoint{lon: 10.032536, lat: 53.626648, time_offset_ms: 3956},
      %Video.TimedPoint{lon: 10.032642, lat: 53.626726, time_offset_ms: 4290},
      %Video.TimedPoint{lon: 10.032745, lat: 53.626801, time_offset_ms: 4623},
      %Video.TimedPoint{lon: 10.032849, lat: 53.626878, time_offset_ms: 4957},
      %Video.TimedPoint{lon: 10.032957, lat: 53.626956, time_offset_ms: 5291},
      %Video.TimedPoint{lon: 10.033059, lat: 53.627031, time_offset_ms: 5624},
      %Video.TimedPoint{lon: 10.033163, lat: 53.627102, time_offset_ms: 5958},
      %Video.TimedPoint{lon: 10.033271, lat: 53.627174, time_offset_ms: 6291},
      %Video.TimedPoint{lon: 10.033374, lat: 53.627251, time_offset_ms: 6625},
      %Video.TimedPoint{lon: 10.033473, lat: 53.627326, time_offset_ms: 6959},
      %Video.TimedPoint{lon: 10.033577, lat: 53.627396, time_offset_ms: 7292},
      %Video.TimedPoint{lon: 10.033684, lat: 53.627461, time_offset_ms: 7626},
      %Video.TimedPoint{lon: 10.03379, lat: 53.627537, time_offset_ms: 7959},
      %Video.TimedPoint{lon: 10.033899, lat: 53.627623, time_offset_ms: 8293},
      %Video.TimedPoint{lon: 10.034008, lat: 53.62771, time_offset_ms: 8627},
      %Video.TimedPoint{lon: 10.034116, lat: 53.627793, time_offset_ms: 8960},
      %Video.TimedPoint{lon: 10.03423, lat: 53.627875, time_offset_ms: 9294},
      %Video.TimedPoint{lon: 10.034332, lat: 53.627954, time_offset_ms: 9627},
      %Video.TimedPoint{lon: 10.034435, lat: 53.628032, time_offset_ms: 9961},
      %Video.TimedPoint{lon: 10.034549, lat: 53.628113, time_offset_ms: 10295},
      %Video.TimedPoint{lon: 10.034662, lat: 53.628193, time_offset_ms: 10628},
      %Video.TimedPoint{lon: 10.034775, lat: 53.628279, time_offset_ms: 10962},
      %Video.TimedPoint{lon: 10.034892, lat: 53.628367, time_offset_ms: 11295},
      %Video.TimedPoint{lon: 10.035002, lat: 53.628445, time_offset_ms: 11629},
      %Video.TimedPoint{lon: 10.035111, lat: 53.628521, time_offset_ms: 11963},
      %Video.TimedPoint{lon: 10.035225, lat: 53.628604, time_offset_ms: 12296},
      %Video.TimedPoint{lon: 10.035335, lat: 53.628683, time_offset_ms: 12630},
      %Video.TimedPoint{lon: 10.035446, lat: 53.628757, time_offset_ms: 12963},
      %Video.TimedPoint{lon: 10.035562, lat: 53.628832, time_offset_ms: 13297},
      %Video.TimedPoint{lon: 10.035672, lat: 53.628904, time_offset_ms: 13631},
      %Video.TimedPoint{lon: 10.035781, lat: 53.628973, time_offset_ms: 13964},
      %Video.TimedPoint{lon: 10.035894, lat: 53.629047, time_offset_ms: 14298},
      %Video.TimedPoint{lon: 10.036005, lat: 53.62912, time_offset_ms: 14631},
      %Video.TimedPoint{lon: 10.036114, lat: 53.629189, time_offset_ms: 14965},
      %Video.TimedPoint{lon: 10.03623, lat: 53.629258, time_offset_ms: 15299},
      %Video.TimedPoint{lon: 10.036345, lat: 53.629326, time_offset_ms: 15632},
      %Video.TimedPoint{lon: 10.036459, lat: 53.629394, time_offset_ms: 15966},
      %Video.TimedPoint{lon: 10.036574, lat: 53.629462, time_offset_ms: 16299},
      %Video.TimedPoint{lon: 10.036686, lat: 53.629524, time_offset_ms: 16633},
      %Video.TimedPoint{lon: 10.036797, lat: 53.629593, time_offset_ms: 16967},
      %Video.TimedPoint{lon: 10.036908, lat: 53.629658, time_offset_ms: 17300},
      %Video.TimedPoint{lon: 10.037024, lat: 53.629724, time_offset_ms: 17634},
      %Video.TimedPoint{lon: 10.037139, lat: 53.62979, time_offset_ms: 17967},
      %Video.TimedPoint{lon: 10.037255, lat: 53.629859, time_offset_ms: 18301},
      %Video.TimedPoint{lon: 10.037364, lat: 53.629924, time_offset_ms: 18635},
      %Video.TimedPoint{lon: 10.037478, lat: 53.629991, time_offset_ms: 18968},
      %Video.TimedPoint{lon: 10.037594, lat: 53.630059, time_offset_ms: 19302},
      %Video.TimedPoint{lon: 10.037702, lat: 53.630119, time_offset_ms: 19635},
      %Video.TimedPoint{lon: 10.03782, lat: 53.63019, time_offset_ms: 19969},
      %Video.TimedPoint{lon: 10.037938, lat: 53.630256, time_offset_ms: 20303},
      %Video.TimedPoint{lon: 10.038058, lat: 53.630324, time_offset_ms: 20636},
      %Video.TimedPoint{lon: 10.038179, lat: 53.630395, time_offset_ms: 20970},
      %Video.TimedPoint{lon: 10.038301, lat: 53.630458, time_offset_ms: 21303},
      %Video.TimedPoint{lon: 10.038424, lat: 53.630525, time_offset_ms: 21637},
      %Video.TimedPoint{lon: 10.038549, lat: 53.630594, time_offset_ms: 21971},
      %Video.TimedPoint{lon: 10.038675, lat: 53.63066, time_offset_ms: 22304},
      %Video.TimedPoint{lon: 10.0388, lat: 53.63072, time_offset_ms: 22638},
      %Video.TimedPoint{lon: 10.038923, lat: 53.630771, time_offset_ms: 22971},
      %Video.TimedPoint{lon: 10.039049, lat: 53.630844, time_offset_ms: 23305},
      %Video.TimedPoint{lon: 10.039179, lat: 53.6309, time_offset_ms: 23639},
      %Video.TimedPoint{lon: 10.039301, lat: 53.63095, time_offset_ms: 23972},
      %Video.TimedPoint{lon: 10.039431, lat: 53.631, time_offset_ms: 24306},
      %Video.TimedPoint{lon: 10.039558, lat: 53.631043, time_offset_ms: 24639},
      %Video.TimedPoint{lon: 10.039673, lat: 53.631091, time_offset_ms: 24973},
      %Video.TimedPoint{lon: 10.03981, lat: 53.631132, time_offset_ms: 25307},
      %Video.TimedPoint{lon: 10.039958, lat: 53.631171, time_offset_ms: 25640},
      %Video.TimedPoint{lon: 10.040109, lat: 53.63122, time_offset_ms: 25974},
      %Video.TimedPoint{lon: 10.040251, lat: 53.63127, time_offset_ms: 26307},
      %Video.TimedPoint{lon: 10.040393, lat: 53.631312, time_offset_ms: 26641},
      %Video.TimedPoint{lon: 10.040537, lat: 53.631351, time_offset_ms: 26975},
      %Video.TimedPoint{lon: 10.040677, lat: 53.631399, time_offset_ms: 27308},
      %Video.TimedPoint{lon: 10.040817, lat: 53.631441, time_offset_ms: 27642},
      %Video.TimedPoint{lon: 10.040951, lat: 53.631476, time_offset_ms: 27975},
      %Video.TimedPoint{lon: 10.041086, lat: 53.63151, time_offset_ms: 28309},
      %Video.TimedPoint{lon: 10.04122, lat: 53.631553, time_offset_ms: 28643},
      %Video.TimedPoint{lon: 10.041351, lat: 53.631595, time_offset_ms: 28976},
      %Video.TimedPoint{lon: 10.041487, lat: 53.631633, time_offset_ms: 29310},
      %Video.TimedPoint{lon: 10.041623, lat: 53.631676, time_offset_ms: 29643},
      %Video.TimedPoint{lon: 10.041764, lat: 53.631729, time_offset_ms: 29977},
      %Video.TimedPoint{lon: 10.041906, lat: 53.631788, time_offset_ms: 30311},
      %Video.TimedPoint{lon: 10.042044, lat: 53.631846, time_offset_ms: 30644},
      %Video.TimedPoint{lon: 10.04218, lat: 53.631901, time_offset_ms: 30978},
      %Video.TimedPoint{lon: 10.042324, lat: 53.631961, time_offset_ms: 31311},
      %Video.TimedPoint{lon: 10.04246, lat: 53.632032, time_offset_ms: 31645},
      %Video.TimedPoint{lon: 10.042602, lat: 53.632095, time_offset_ms: 31979},
      %Video.TimedPoint{lon: 10.042753, lat: 53.632148, time_offset_ms: 32312},
      %Video.TimedPoint{lon: 10.042897, lat: 53.632197, time_offset_ms: 32646},
      %Video.TimedPoint{lon: 10.04304, lat: 53.632248, time_offset_ms: 32979},
      %Video.TimedPoint{lon: 10.043186, lat: 53.632301, time_offset_ms: 33313},
      %Video.TimedPoint{lon: 10.043328, lat: 53.632349, time_offset_ms: 33647},
      %Video.TimedPoint{lon: 10.043468, lat: 53.632397, time_offset_ms: 33980},
      %Video.TimedPoint{lon: 10.043614, lat: 53.632443, time_offset_ms: 34314},
      %Video.TimedPoint{lon: 10.043763, lat: 53.632494, time_offset_ms: 34647},
      %Video.TimedPoint{lon: 10.043917, lat: 53.632541, time_offset_ms: 34981},
      %Video.TimedPoint{lon: 10.044079, lat: 53.632592, time_offset_ms: 35315},
      %Video.TimedPoint{lon: 10.044237, lat: 53.632645, time_offset_ms: 35648},
      %Video.TimedPoint{lon: 10.044396, lat: 53.632692, time_offset_ms: 35982},
      %Video.TimedPoint{lon: 10.044552, lat: 53.632746, time_offset_ms: 36315},
      %Video.TimedPoint{lon: 10.044709, lat: 53.6328, time_offset_ms: 36649},
      %Video.TimedPoint{lon: 10.044861, lat: 53.632848, time_offset_ms: 36983},
      %Video.TimedPoint{lon: 10.045013, lat: 53.632898, time_offset_ms: 37316},
      %Video.TimedPoint{lon: 10.045167, lat: 53.632955, time_offset_ms: 37650},
      %Video.TimedPoint{lon: 10.045313, lat: 53.633004, time_offset_ms: 37983},
      %Video.TimedPoint{lon: 10.045465, lat: 53.633054, time_offset_ms: 38317},
      %Video.TimedPoint{lon: 10.045616, lat: 53.6331, time_offset_ms: 38651},
      %Video.TimedPoint{lon: 10.045761, lat: 53.633138, time_offset_ms: 38984},
      %Video.TimedPoint{lon: 10.045899, lat: 53.633185, time_offset_ms: 39318},
      %Video.TimedPoint{lon: 10.046035, lat: 53.633233, time_offset_ms: 39651},
      %Video.TimedPoint{lon: 10.046176, lat: 53.633278, time_offset_ms: 39985},
      %Video.TimedPoint{lon: 10.046317, lat: 53.633324, time_offset_ms: 40319},
      %Video.TimedPoint{lon: 10.046452, lat: 53.633368, time_offset_ms: 40652},
      %Video.TimedPoint{lon: 10.046579, lat: 53.633418, time_offset_ms: 40986},
      %Video.TimedPoint{lon: 10.046705, lat: 53.633457, time_offset_ms: 41319},
      %Video.TimedPoint{lon: 10.046829, lat: 53.633499, time_offset_ms: 41653},
      %Video.TimedPoint{lon: 10.046955, lat: 53.633537, time_offset_ms: 41987},
      %Video.TimedPoint{lon: 10.047069, lat: 53.633564, time_offset_ms: 42320},
      %Video.TimedPoint{lon: 10.047184, lat: 53.633596, time_offset_ms: 42654},
      %Video.TimedPoint{lon: 10.047303, lat: 53.633634, time_offset_ms: 42987},
      %Video.TimedPoint{lon: 10.047424, lat: 53.633668, time_offset_ms: 43321},
      %Video.TimedPoint{lon: 10.047551, lat: 53.633705, time_offset_ms: 43655},
      %Video.TimedPoint{lon: 10.047681, lat: 53.633745, time_offset_ms: 43988},
      %Video.TimedPoint{lon: 10.047818, lat: 53.633792, time_offset_ms: 44322},
      %Video.TimedPoint{lon: 10.047951, lat: 53.633835, time_offset_ms: 44655},
      %Video.TimedPoint{lon: 10.048085, lat: 53.633882, time_offset_ms: 44989},
      %Video.TimedPoint{lon: 10.048225, lat: 53.633929, time_offset_ms: 45322},
      %Video.TimedPoint{lon: 10.048367, lat: 53.633973, time_offset_ms: 45656},
      %Video.TimedPoint{lon: 10.048512, lat: 53.634014, time_offset_ms: 45990},
      %Video.TimedPoint{lon: 10.048651, lat: 53.634055, time_offset_ms: 46323},
      %Video.TimedPoint{lon: 10.048791, lat: 53.634093, time_offset_ms: 46657},
      %Video.TimedPoint{lon: 10.048933, lat: 53.634135, time_offset_ms: 46990},
      %Video.TimedPoint{lon: 10.049086, lat: 53.634185, time_offset_ms: 47324},
      %Video.TimedPoint{lon: 10.049251, lat: 53.634235, time_offset_ms: 47658},
      %Video.TimedPoint{lon: 10.049418, lat: 53.634284, time_offset_ms: 47991},
      %Video.TimedPoint{lon: 10.049587, lat: 53.634326, time_offset_ms: 48325},
      %Video.TimedPoint{lon: 10.049759, lat: 53.634371, time_offset_ms: 48658},
      %Video.TimedPoint{lon: 10.049932, lat: 53.634416, time_offset_ms: 48992},
      %Video.TimedPoint{lon: 10.050108, lat: 53.634463, time_offset_ms: 49326},
      %Video.TimedPoint{lon: 10.050284, lat: 53.634522, time_offset_ms: 49659},
      %Video.TimedPoint{lon: 10.050456, lat: 53.634576, time_offset_ms: 49993},
      %Video.TimedPoint{lon: 10.050629, lat: 53.634628, time_offset_ms: 50326},
      %Video.TimedPoint{lon: 10.050805, lat: 53.63468, time_offset_ms: 50660},
      %Video.TimedPoint{lon: 10.050975, lat: 53.634734, time_offset_ms: 50994},
      %Video.TimedPoint{lon: 10.051144, lat: 53.63479, time_offset_ms: 51327},
      %Video.TimedPoint{lon: 10.051317, lat: 53.634846, time_offset_ms: 51661},
      %Video.TimedPoint{lon: 10.051484, lat: 53.634903, time_offset_ms: 51994},
      %Video.TimedPoint{lon: 10.051624, lat: 53.634956, time_offset_ms: 52328},
      %Video.TimedPoint{lon: 10.051746, lat: 53.635009, time_offset_ms: 52662},
      %Video.TimedPoint{lon: 10.05188, lat: 53.635069, time_offset_ms: 52995},
      %Video.TimedPoint{lon: 10.052048, lat: 53.635111, time_offset_ms: 53329},
      %Video.TimedPoint{lon: 10.052229, lat: 53.63515, time_offset_ms: 53662},
      %Video.TimedPoint{lon: 10.052395, lat: 53.635208, time_offset_ms: 53996},
      %Video.TimedPoint{lon: 10.052562, lat: 53.635262, time_offset_ms: 54330},
      %Video.TimedPoint{lon: 10.052728, lat: 53.635316, time_offset_ms: 54663},
      %Video.TimedPoint{lon: 10.05289, lat: 53.635367, time_offset_ms: 54997},
      %Video.TimedPoint{lon: 10.053052, lat: 53.635418, time_offset_ms: 55330},
      %Video.TimedPoint{lon: 10.053219, lat: 53.635468, time_offset_ms: 55664},
      %Video.TimedPoint{lon: 10.053376, lat: 53.635519, time_offset_ms: 55998},
      %Video.TimedPoint{lon: 10.053534, lat: 53.635566, time_offset_ms: 56331},
      %Video.TimedPoint{lon: 10.053697, lat: 53.63562, time_offset_ms: 56665},
      %Video.TimedPoint{lon: 10.053858, lat: 53.635669, time_offset_ms: 56998},
      %Video.TimedPoint{lon: 10.054018, lat: 53.635717, time_offset_ms: 57332},
      %Video.TimedPoint{lon: 10.054178, lat: 53.635769, time_offset_ms: 57666},
      %Video.TimedPoint{lon: 10.054339, lat: 53.635821, time_offset_ms: 57999},
      %Video.TimedPoint{lon: 10.054501, lat: 53.635872, time_offset_ms: 58333},
      %Video.TimedPoint{lon: 10.054658, lat: 53.635914, time_offset_ms: 58666},
      %Video.TimedPoint{lon: 10.054811, lat: 53.635953, time_offset_ms: 59000},
      %Video.TimedPoint{lon: 10.054966, lat: 53.635997, time_offset_ms: 59334},
      %Video.TimedPoint{lon: 10.055125, lat: 53.636052, time_offset_ms: 59667},
      %Video.TimedPoint{lon: 10.055278, lat: 53.636102, time_offset_ms: 60001},
      %Video.TimedPoint{lon: 10.055431, lat: 53.636149, time_offset_ms: 60334},
      %Video.TimedPoint{lon: 10.05559, lat: 53.636191, time_offset_ms: 60668},
      %Video.TimedPoint{lon: 10.055747, lat: 53.636233, time_offset_ms: 61002},
      %Video.TimedPoint{lon: 10.055896, lat: 53.636272, time_offset_ms: 61335},
      %Video.TimedPoint{lon: 10.056049, lat: 53.636313, time_offset_ms: 61669},
      %Video.TimedPoint{lon: 10.056207, lat: 53.63635, time_offset_ms: 62002},
      %Video.TimedPoint{lon: 10.056366, lat: 53.636385, time_offset_ms: 62336},
      %Video.TimedPoint{lon: 10.056532, lat: 53.636421, time_offset_ms: 62670},
      %Video.TimedPoint{lon: 10.056685, lat: 53.636446, time_offset_ms: 63003},
      %Video.TimedPoint{lon: 10.056839, lat: 53.636467, time_offset_ms: 63337},
      %Video.TimedPoint{lon: 10.057001, lat: 53.636496, time_offset_ms: 63670},
      %Video.TimedPoint{lon: 10.057156, lat: 53.636531, time_offset_ms: 64004},
      %Video.TimedPoint{lon: 10.057315, lat: 53.636572, time_offset_ms: 64338},
      %Video.TimedPoint{lon: 10.057485, lat: 53.636615, time_offset_ms: 64671},
      %Video.TimedPoint{lon: 10.057645, lat: 53.636649, time_offset_ms: 65005},
      %Video.TimedPoint{lon: 10.057741696696697, lat: 53.63666942042042, time_offset_ms: 65205}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "ev`heB_ihcRA@CBC@C@CBC@CBE@EBCBEBE@GBEBGBGDGBIBGBKDIDG@IBGBIBG@G@IBG@G@G?G@G@I?G@G?G?G?G?G?G?G?GAI?GAG?GAGAGAGAGAGCGAGCGAGCGCGCICGCGCGEGCGEGCGEGEIEGEGEGEGEGEGGEEGEGGGEGGGEEGGGGEEGGGGEEGGGGGEGGEGGEGGGGGGGEGGGGGGGGGGGEGGGGGGGGGGGGGGEGGGGGGGGGGIGGGGGGGGGIGGGGIIGGGGGIGGIGGIGGIGGGGIIGGGIGGGIIGGIGGGIGIGGGIGIGIGIGIGGGIGIGIGIEIGIGIGIGIGIGIGIGIGIEIGIGIGIGIGIEIGIGIGIGIGIGIGIGIGIGIGKGIGIGIGIGIGKGIGIGIGIGKGIGIGIIIGIGIGIGIEIGIGIGIGIGIGIGIGIGIGIGIEIGIGIGIGIGIGIGIGKGIGIGIGIGIGIGIGKGIGIEIGIGIGIGKGIGIGIGKGIGIGIGKEIGIGKGIGIGIGKGIGIGIEKGIGIGIGKGIEIGIGIGIEIGKGIGIEIGIGIEIGIGIGIGKEIGIGIGIGIEKGIGIGIGIEKGIGIGIGKGIEIGIGIGKGIGKGIGIGKGIEIGKGIGKGIGKGIGIGKGIGIGKEIGIGKGIGIGIEIGKGIGIEIGIGKGIEIGIGIEIGIGIEIGIGKEIGIEIGIEIGIGIEIGKEIGIEIGIEIGKEIGIEIGKGIEIGKEIGIGKEIGIEKGIGIGKEIGIEKGIGIEIGKGIGIEKGIGIGIEKGIGIGIGKGIGIEIGKGIGIGIEIGIGIGIGIEIGIGIGIEIGIGIGIEIGIGIEIGIGIEIGIGIEKGIGIEIGIEIGIGKEIGIEIGIEKGIEIEIGIEIGKEIEIGIEKGIEIEIEIGKEIEIEIGIEIEKGIEIEIGIEIEKGIEIGKGIEIGIEKGIGIEKGIGIGKGIEIGKGIGKGIGIGKGIIKGIGKGIGKGIIIGKGKIIGKGIGKIIGKGIIIGKGIIKGKIIGIGKGIIKGIGKIIGKIIGKGIIKGIGIGKIIGKGIGKIIGIGKGIIKGIGKGIGIGKGIGKIIGIGKGIGKGIGKGKIIGKGIGKGKGIGKGIIKGKGKGIGKGIGKGIIKGIGKGIGKGIGIGKGIGIGIGIEIGKGIGIGIGIGIGIEIGIGIGIGIGIGIGIEIGKGIGIGIGIGIEIGKGIGIGIGKGIGKGIGKGIGKGIGKGIGKGKGKIIGKGKGIGKGKGIGKGKGIGKGKGIGKGKGKGIGKGIGKGKGIGKGIGKGIGKGKIIGKGKGIGKGKIIGKGIGKIKGKGIIKGKGIGKIKGIGKIKGKIKGIGKIKGKIKGKIKGKIKGKGKIKGIGKIKGKGIGKGKIKGIGKGIGKGIGKGIEKGIGKGIGKGIGIGKEIGKGIGKGIEIGKGIGIEKGIGIGKGIEKGIGIGKGIEKGIGKGIGKGIGKGKGIIKGKGKGIGKGKIKGKGIGKGKGKGIGKGIIKGKGIGKGKGIGKGIGKGIGKGIEKGIGKGIGKGIGKEIGKGKGIGIEKGIGKGIEKGIGKEKGIGIEKGIGKEKGIGKGKEIGKGKGIEKGKGKGIEKGKGKGKGKEKGIGKGKEIGKGKEKGIGKEIGKGIEKGIEKGIEKGIGKEIGKEIGKEIGIEKGIEKGIEKGIEKGIEIEKGIEKGIEIGKEIGIEKGIEKGIEKGKGIEKGIEKGKGIEKGKGKGIEKGKGIGKEIGKGKEIGKGKEIGKGKGIEKGKGIEKGIGKEKGIEKGIEKGIGIEKGKEIGIEKGIEKEIGIEKGIEKGIEKEIGIEKGIEKEIGKEKGKEIGKEIGKEKEKGIEKGKGKEKEKGIEKGKEKGIEKGKEKEKGIEKGKEKEIGKEKGKEKGIEKEKGIEKEKGIEKGKEKEIGKEKGIEKEKGIEKGKEKEIGKEKEIGKEKGIEKEKGKEKGIEKGKEKEKGIEKGKEKGKEKEIEKGKEIEKGKEIEKEKEIGKEIEKEIEIEKEKEIGIEKEIEKEIEKGIEKEKEIGKEIEKGIEKEKGIEKGKEKGIEKEIGKEIGKEKEIGKEIEKGIEKEKGIEKEIEKGIEKEIEKGIEKEIEKEIGKEKEKGIEKEKEIGKEKEKGKEIEKGKEKEKGIEKEKEKGIEKEKGKEIEKGKEKEKGIEKEKEKGIEKEKGIEKEKGKEIGKEKEKGKEIGKEKEKGKEKGKEKGIEKGKEKGIEKEKGIEKEKGIEKEIEIGKEIEKEIEKGIEIEKEIGKEIEIEKGKEIEKEIGKEKGIEKEKGIEKEKGKEIEKGKEIEKGKEKGIEKGKEKEKGKEIGKEKEKGKEKGKEKEIGKEKEIGKEKEIEKEIEKEIGKEIEIEKEIEIEIEKEIEIEIEKEIEKEIEKGIEKEKGKEIEKGKEKGKGKEMGKEKGKEKGKEKGKEKGKEKGKEIEKGKEKEKGIEKEKGKEKEKGIEKEKEKGKEKEKGKEKEIGKEKGKEKEKGKEKGKEKEKGKEKGKEKGKEKGKEMGKEKGKEKGKEKGKEKGMEKGKEKGKEKGMEKGKEKEKGKEKEKGKEKEKEKGKEKEKEKEKEKGKEKEKEKEKEKGKEKEKEMGKEKEKGKEKEKGKEMEKGKEKEKGKEMEKGKEKGMEKEKGKEKGMEKGKEKEMGKEMGKEKGKEMEKGKEKGMEKGMEKEKGKEMEKGMEKEKGMEKEKEMGKEKEKEMEKGKEMEKEKEMEKEKEKEKEMEKEKEMEKEKEKEKEMCKEKEKEKEKCKEKEKCKEKEKCKEKCKEKEICKEKEKEKEKCKGKEKEMEKEKGMEKEMGMEKGMGMEMGMEKGMEMGKEMGKEMEKEMEKGMEKEKCMEKEKEMEKEMEKCKEMEKEKCKEMEKCKEMCKEKEKCKEKCKEKCKEMCKEKCKCKEKCKEKCKEMCKEKCMEKCKEMCKEMCKEMCMEKCMEKCMEMCKEKCMCMEKCMCKEKCMCKEMCKCKCKEMCKCKCKCKEKCKCKCKEKCKCKCKEKCKCKCKCIEKCKCKCKCIEKCKCKCKCKCKEKCMCKCKEMCKCMCKCMCMCKEMCMCMCMCMCMCMCMCMCMCOCMCMCMCMCOCMCMCMCOCMEMCOCMCMCOCMCMCOCMEOCOCMCOEMCOCMEOCOEMCOEOCOEMCOCMEOCMEOCMEOCMEMCMEOCMEMCOEMCMEMCMCMEOCMEMCMCMCMEMCMCMEMCMCMCMCMCMEMCMCMCOCMCMCMCMCMCMCMCMCMEMCMCMCOCMCMCMCMCMCMCMCMCMCOCMCMCMCMCMEMCMCMCMEOCMCMCMEMCMCOEMCMCMEMCMCMCMEMCMCMCMEMCMCMCMCMEMCMCMCOCMCMCMCKCMCMCMCMCMCMCMCMCKCMAMCMCKCMCMAKCMCMCKAMCKCMAKCMCMCKAMCMCKCMAMCKCMAKCMCMCKCMAMCKCMCMCKAMCMCMCKCMCMCKCMCMCMCKCMEMCMCMCMCKCMCMCMEKCMCMCKCMCKCMCMEKCMCKCMCMCKCMCKCMCKCMCKCMCMCKCMCMCKCMCMCKCMCMCKCMCMCMCMCKCMAMCKCMCMEMCMCKCMCMCMCMCKCMCMEMCKCMCMCKEMCMCMCMEKCOEMCKCMEMCMEMCMEMEMCMEOEMCMEMEMCMEMEMEMEMEOCMEMEMEMEMEMEOEMEMEMEOCMEMEMEMEMEMEMEMEMEMEMEMEMEMEMCMEMEMEMEMEMEMEKCMEMEMEMEMCKEMEMEMCKEMEMEKCMEMEKEMCMEKEMEMCMEMEMEMEMEMEMEMEMEOEMEMEMEMEOEMEMGMEMEMEMEMEMGMEMEMGMEMEMGMEMGMEMGMEMGMEMEMGMEMGKEMEMGMEMEMGMEMEMEMEMGMEMEOEMEMEMEMEMEMEOEMEMEOEMEMEOCMEOEMEOEMCOEMEOEOCMEOCMEMEOCMEOCMEOEMCMEMCOCMEMCMEMCMEMCOEMCMEMCMCMEMCMEMCMEOCMEMCMEMCMEMEOCMEMCMEMCMEOCMEMCMEMEOCMEMEMCOEMCMEOEMCMEOEMCOEMEMCOEMCMEMCOEMEMCMEOCMCMEMCMEMCMEMCMCMEMCMEMCMCMEMCMCMEMCMEMCMCMEMCMEMCMCMEMCMCMEMCMCMEMCMCMEOCMEMCMCMCMEMCOCMEMCMCOEMCMEMCOCMEMCMCOEMCOEMCOEMCOEMCOEMCOEMCOEMCOEMCOEMCOEMCOEOCMCOEOCMEOCMCOEMCOEOCMCOEOCMCOEOCMEOCOEOCOEOCOEOCOEOCOEOCOEOCQEOCOEOEOCOEOCOEOEOCOEOCOEOEOCOEOEOCOEOCOEOEOCOEOCOEOCMEOCOEOCOEOCOEOCOCMEOCOEOCOEOCOCMEOCOEOCOEOCOEMCOEOEOCOEOCOEOEMCOEOEOCOEOEOCMEOEOCOEOEOEMCOEOEOCOEOEMCOEOEOEOCOEOCOEMEOCOEOCMEOCOEOCMEOCMEOCMEOCMEOCOCMEOCMEMCOCOEMCOEMCOEOCMEOCMEOCMEOCOEMCOEMCOEMCOEOEMCOEOEMCOEOEMEOCOEOEMEOEOCOEOEOEMEOCOEMEOCMEOEOCMEOEMCMEOCMEMCMEOCMCMEMCMEOCMCMEMCOEMCOEMCOEMCOEMCOEMCOEOCOEMCOEMCOEOCMEOCMCOEOCOEMCOCMEOCMCOEOCMCOEOCMCOCMCOCMEMCOCMCOCMCMCMCOCMCMCMCOCMCMCMCMCMCMCMCMCMCMEMCMCMCMCMCMEMCMCMCMEMCMCMEMCMCMEKCMCMEMCMCMEMCMCKEMCMEMCMCMEMCKCMEMCMCMEKCMCMEMCMCMEMCMCMEMCMCMCMEMCMCMEMCMCMCMEMCMCMEMCMCMCMEMCMCMEMCMCMCOEMCMCMEMCMCMEMCMCMCMEMCMCMCKEMCMCMCMEKCMCMCMEKCMCKCMEMCKCMEKCMCKEMCMCKEMCKEMCKCMEKCMEMCKCKEMCKCMEKCKCMCKEKCMCKCKCKCMCKCKCKCKCKCMCKCKCKCKCKCKCMCKCKCKCMCKCKCKCKEMCKCKCMCKCKCKCKCMCKCKCMCKCKCMCKCKCMCKCMCKCMCKAMCKCKCMCKAKCKCKAKCKCKAKCKAICKAKCIAKAICKAICKAIAKCIAKCIAKCIAKCIAKAKCICKAICKAKCIAKCKCKAICKAKCKCIAKCKCKCKCKAKCKCKCKCKAKCKCKCMCKCKCKAKCKCKCKCKAKCKCKCKCKAKCKCKCIAMCKCKAKCKCKCKAKCKCKCKAKCKCMCKCKAKCKCMCKCKCMCKAMCKCKCMCKCKCMCKCMAKCKCMCKCMCKCKCMCKCMCMCKCKCMCMEKCMCKCMCMCMEMCKCMCMEMCMCMEMCMCMEMCMCMEKCMCMCMEMCMCKCMEMCKCMCMEKCMCMCKCMCKEMCKCMCKCMEMCKCMCMEKCMCMCKEMCMCKEMCMCMEKCMCMCMEKCMCMEMCMEMCKCMEMCMCMEMCMCOEMCMEMCMCMCMEMCMCMEMCMCMCMEMCMCMCMEMCMCOCMCMEMCMCMCMCMCMCMEOCMCMCMCOCMCMCMCMEMCOCMCOCMCMCMCMCMCMCMCOCMEMCMCMCMCMCMCMCMCMCMCMCMCMCMCMCMCMCKCOCMCMCKCMAMCMCMCMCMCMCMCMCMCMCMCKCMCMCMCMCMCMCMCMCMCOCMCMCKCOCMCMCMCMEMCMCMCMCMEOCMCOEMCOCMEOCMCOEOCMEOCOEOCOEOCMEOCOEOCOEOCOEOCOEOCOEOCOEQCOEOEQCOEOCOEQCOCOEOCQEOEQCOCOEQCOEQCOEOCQEOCQCOEOCQCOEOCQCOEQCOCQEOCOCQCOCOCOEQCOCQCOCOCQCOEQCOCOCQCOCQEQCOCQCOCQEQCOCQCOEQCQCOCQEQCOCQCOEQCQCOCQEQCOCQCOEQCOCQCQEOCQCQCOEQCOCQCQEOCQCQEQCOCQCQEOCQCQEOCQEQCQCOEQCQEOCQEQCOEQEQCQEQEQEQEQCQEQEQEQEQEQEQEQEQCOEQEQEQEOEQEQCQEOEQEOCQEOEQCOEQEQEOCQEOCQEOEQCOEQEQCOEQEQCOEQEQCOEQCOEQEQCQEOCQEOEQCOEQCQEQEQCOEQCQEOEQCQEQCQEQEOCQEQEQCOEQEQCOEQEQCQEOCQEOEQCOEOEQCOEQEQEOCOEQEOCQEOEOCQEQEOEQCOEOEQEQEOCOEQEOEQEOCQEOEQEOCOEQEQEOEQCOEQEQEOEQCOEQEQEOEQEQEOCQEQEOEQEOCQEOEQEQEOEQEOEQCOEQEOEQEOEQEOEOCOEOEOEOEMEOCOEOEMEMCOEMEMCMEMEMCMEMEMCMEKCMEKCMEKEMCKEKEMCKEKCKEKCKEKCKEKEKCKEKCKEKEMCKEKEKEMEKCMEKEMEMEKEMEMCMEMEMEMEMCMEMEOCMEMEOCOEMCOEOCOCOEOCOCOCOEQCOCQCOCQCOCQCOCQEQCQCOCQCQCQCQCQCQCQCQEQCQCQCQCQCQEOCQCQEQCOEQCOEQEOCQEOCQEOEQEOEQCOEOEQEOEOCOEQEOEQEOCOEQEOEOCOEQEOCOEQEOEOCQEOEOCOEQEOEOCQEOEOCQEOEQEOCOEQEOCQEOEOCOEQEOCOEOEOCQEOCOEOEOCOEOCOEOCQEOEOCOEOCOEOCOEOCOEOCOEOEOCQEOCOEOCOEOCOEOCQEOCOEOCOEOEOCOEOCQEOCOEQCOEOCOEQCOEOCQEOEQCOEOCOEQCOEOCOEOCQEOCOEMCOEOCOEOCOEOCOEOCMEOCOEOCOEMCOEOCOCOEOCOEMCOEOCOCOEOCOEMCOCOEOCOEOCMEOCQEOCOEOCOEOEOCOEOCQEOEOEQCOEOCOEOEOCQEOEOCOEOCOEOCQEOCOEOCOEOCOEOCOEOCOCOEOCOEOCOEOCOCOEOCOEOCMCOEOCOEQCMEOCOCOEOCOEOCOEOCOEOCOEOCOEOCOEOCOEOEOCOEOCOEOEOCOEOCOEOEOCOEOCOEOEQCOEOCOEOEOCOEOCOEOEOCOEOCOEOEQCOEOCOEOCOEOCOEOCQEOEOCOCOEOCOEOCOCOEOCQCMEOCOCOCOEOCOCOCOCOCOCMCOEOCOCMCOCOCMCOCOCOCMCOCMCOCMCOCMCOCOAMCOCMCOCMCOCMEOCOCMCOCOCMCOCOEMCOCOCOEMCOCOCOEMCOCOEOCOEOCOEMCOEQEOCOEOEOEOCOEOEOCOEOEOCOEOEOCOEOEMCOEOCMEOCOEMCOEOCMEOCMEOCOEMCOCMEOCOEMCOEOCMCOEOCMCOEOCMEOCOCMCOEOCMCOCOEMCOCOCOEOCOCMCOCOCOCOEOCOCOCOCOCMCOCOEOCOCOCOCOCOCOCOCOEMCOCOCOCOCOCOCOCOCMCOEOCMCOCOCMCOCMCOCMCOAMCOCMCMCOCMCMCOCMCMCOCMCOCOCMCOCMCOCMCOCMCOCOCOCMCOCOCMCOCOCOCMCOCOCOCOCMCOAOCOCOCOCOCOCOCOAOCMCOCOCOCOAOCOCOCOAOCMCOCOAOCOCOCOCOAOCMCOCOAOCOCOCQAOCOCOCQCOAOCQCOCOCQAQCOCQCOAOCQAOCOCOAOCOAOCOAOAMCOAOAMCOAOAMCOAMAOAMAOCMAOAMAOAMAOAOCMAOAMAOAMAOAMAOAOCMAOAOAMAOAOCMAOAOAOCOAOAQCOAOCOAOCOAQCOAOCOAOCOAOCOAOCOAOCOCOAOCOCMAOCOCMAOCOCMCOAOCMCOCOCMAOCOCOCOCOCOCMCOCOCOCOCOCOCOCOCOCOCOCOCOCQCOCOEQCOCOCQCQCOCQEOCQCQCOCQCOCQCOCQCOCQCOCQCQCOCQCOCQCOCQCOCQCQCQCQCSCSCUCOCQAMCMAMAKCIAIAIAIAG?GAEAGAE?E",
      precision: 6
    }
  end
end
