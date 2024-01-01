defmodule Data.AutoGenerated.Video.Rendered_8b8637099f36f92c58c625d36b6d82bf do
  @moduledoc "#{"2022-01-15-rothenbaumchaussee: Rothenbaumchaussee Fahrtrichtung Süden"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-01-15-rothenbaumchaussee: Rothenbaumchaussee Fahrtrichtung Süden"
  end

  @impl Video.Rendered
  def hash() do
    "8b8637099f36f92c58c625d36b6d82bf"
  end

  @impl Video.Rendered
  def length_ms() do
    67090
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-01-08-rothenbaumchaussee/GX013107", "00:00:14.481", "00:00:28.629"},
      {"2023-11-25-random/GX016706", "00:00:01.768", :end},
      {"2023-11-25-random/GX016707", :start, "00:00:28.022"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    false
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.988355,
      minLat: 53.561567,
      maxLon: 9.989791,
      maxLat: 53.58135756456457
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Januar 2022"}, %{timestamp: 13881, text: "November 2023"}]
  end

  @impl Video.Rendered
  def street_names() do
    [%{timestamp: 865, text: "Rothenbaumchaussee"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.98844151951952, lat: 53.58135756456457, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.988464, lat: 53.581341, time_offset_ms: 197},
      %Video.TimedPoint{lon: 9.988487, lat: 53.581303, time_offset_ms: 531},
      %Video.TimedPoint{lon: 9.9885, lat: 53.581253, time_offset_ms: 865},
      %Video.TimedPoint{lon: 9.9885, lat: 53.581194, time_offset_ms: 1198},
      %Video.TimedPoint{lon: 9.988505, lat: 53.581125, time_offset_ms: 1532},
      %Video.TimedPoint{lon: 9.98851, lat: 53.58106, time_offset_ms: 1865},
      %Video.TimedPoint{lon: 9.988517, lat: 53.58099, time_offset_ms: 2199},
      %Video.TimedPoint{lon: 9.988528, lat: 53.580918, time_offset_ms: 2533},
      %Video.TimedPoint{lon: 9.988541, lat: 53.580844, time_offset_ms: 2866},
      %Video.TimedPoint{lon: 9.988554, lat: 53.580774, time_offset_ms: 3200},
      %Video.TimedPoint{lon: 9.988565, lat: 53.580703, time_offset_ms: 3533},
      %Video.TimedPoint{lon: 9.98857, lat: 53.580637, time_offset_ms: 3867},
      %Video.TimedPoint{lon: 9.988576, lat: 53.58057, time_offset_ms: 4201},
      %Video.TimedPoint{lon: 9.988579, lat: 53.580502, time_offset_ms: 4534},
      %Video.TimedPoint{lon: 9.98858, lat: 53.580439, time_offset_ms: 4868},
      %Video.TimedPoint{lon: 9.988588, lat: 53.580372, time_offset_ms: 5201},
      %Video.TimedPoint{lon: 9.988605, lat: 53.580305, time_offset_ms: 5535},
      %Video.TimedPoint{lon: 9.98861, lat: 53.580233, time_offset_ms: 5869},
      %Video.TimedPoint{lon: 9.988612, lat: 53.580159, time_offset_ms: 6202},
      %Video.TimedPoint{lon: 9.988622, lat: 53.580087, time_offset_ms: 6536},
      %Video.TimedPoint{lon: 9.988637, lat: 53.580016, time_offset_ms: 6869},
      %Video.TimedPoint{lon: 9.988646, lat: 53.579948, time_offset_ms: 7203},
      %Video.TimedPoint{lon: 9.988656, lat: 53.579882, time_offset_ms: 7537},
      %Video.TimedPoint{lon: 9.988666, lat: 53.579817, time_offset_ms: 7870},
      %Video.TimedPoint{lon: 9.988676, lat: 53.579755, time_offset_ms: 8204},
      %Video.TimedPoint{lon: 9.988683, lat: 53.579694, time_offset_ms: 8537},
      %Video.TimedPoint{lon: 9.988695, lat: 53.579631, time_offset_ms: 8871},
      %Video.TimedPoint{lon: 9.98871, lat: 53.579565, time_offset_ms: 9205},
      %Video.TimedPoint{lon: 9.98872, lat: 53.579504, time_offset_ms: 9538},
      %Video.TimedPoint{lon: 9.98873, lat: 53.579444, time_offset_ms: 9872},
      %Video.TimedPoint{lon: 9.988742, lat: 53.579386, time_offset_ms: 10205},
      %Video.TimedPoint{lon: 9.988755, lat: 53.579326, time_offset_ms: 10539},
      %Video.TimedPoint{lon: 9.988763, lat: 53.579272, time_offset_ms: 10873},
      %Video.TimedPoint{lon: 9.988767, lat: 53.579221, time_offset_ms: 11206},
      %Video.TimedPoint{lon: 9.988769, lat: 53.579169, time_offset_ms: 11540},
      %Video.TimedPoint{lon: 9.988774, lat: 53.579116, time_offset_ms: 11873},
      %Video.TimedPoint{lon: 9.988782, lat: 53.579052, time_offset_ms: 12207},
      %Video.TimedPoint{lon: 9.988795, lat: 53.578983, time_offset_ms: 12541},
      %Video.TimedPoint{lon: 9.988807, lat: 53.578916, time_offset_ms: 12874},
      %Video.TimedPoint{lon: 9.988819, lat: 53.57885, time_offset_ms: 13208},
      %Video.TimedPoint{lon: 9.988826, lat: 53.578789, time_offset_ms: 13541},
      %Video.TimedPoint{lon: 9.988836, lat: 53.578727, time_offset_ms: 13875},
      %Video.TimedPoint{lon: 9.988849898203593, lat: 53.578762646706586, time_offset_ms: 13881},
      %Video.TimedPoint{lon: 9.988852, lat: 53.578708, time_offset_ms: 14115},
      %Video.TimedPoint{lon: 9.988862, lat: 53.578628, time_offset_ms: 14448},
      %Video.TimedPoint{lon: 9.98887, lat: 53.578549, time_offset_ms: 14782},
      %Video.TimedPoint{lon: 9.98888, lat: 53.578468, time_offset_ms: 15115},
      %Video.TimedPoint{lon: 9.988886, lat: 53.578388, time_offset_ms: 15449},
      %Video.TimedPoint{lon: 9.988894, lat: 53.578309, time_offset_ms: 15783},
      %Video.TimedPoint{lon: 9.9889, lat: 53.578229, time_offset_ms: 16116},
      %Video.TimedPoint{lon: 9.988903, lat: 53.578149, time_offset_ms: 16450},
      %Video.TimedPoint{lon: 9.988901, lat: 53.578064, time_offset_ms: 16783},
      %Video.TimedPoint{lon: 9.988897, lat: 53.577977, time_offset_ms: 17117},
      %Video.TimedPoint{lon: 9.988888, lat: 53.577885, time_offset_ms: 17451},
      %Video.TimedPoint{lon: 9.98888, lat: 53.577795, time_offset_ms: 17784},
      %Video.TimedPoint{lon: 9.988876, lat: 53.577703, time_offset_ms: 18118},
      %Video.TimedPoint{lon: 9.988873, lat: 53.577611, time_offset_ms: 18451},
      %Video.TimedPoint{lon: 9.988868, lat: 53.577518, time_offset_ms: 18785},
      %Video.TimedPoint{lon: 9.988863, lat: 53.577421, time_offset_ms: 19119},
      %Video.TimedPoint{lon: 9.988861, lat: 53.577326, time_offset_ms: 19452},
      %Video.TimedPoint{lon: 9.988855, lat: 53.577235, time_offset_ms: 19786},
      %Video.TimedPoint{lon: 9.988848, lat: 53.577144, time_offset_ms: 20119},
      %Video.TimedPoint{lon: 9.988845, lat: 53.57705, time_offset_ms: 20453},
      %Video.TimedPoint{lon: 9.988839, lat: 53.576957, time_offset_ms: 20787},
      %Video.TimedPoint{lon: 9.988834, lat: 53.576864, time_offset_ms: 21120},
      %Video.TimedPoint{lon: 9.988834, lat: 53.576765, time_offset_ms: 21454},
      %Video.TimedPoint{lon: 9.988826, lat: 53.576668, time_offset_ms: 21787},
      %Video.TimedPoint{lon: 9.988821, lat: 53.576568, time_offset_ms: 22121},
      %Video.TimedPoint{lon: 9.988816, lat: 53.576467, time_offset_ms: 22455},
      %Video.TimedPoint{lon: 9.988811, lat: 53.576367, time_offset_ms: 22788},
      %Video.TimedPoint{lon: 9.988806, lat: 53.576266, time_offset_ms: 23122},
      %Video.TimedPoint{lon: 9.988798, lat: 53.576162, time_offset_ms: 23455},
      %Video.TimedPoint{lon: 9.988793, lat: 53.576061, time_offset_ms: 23789},
      %Video.TimedPoint{lon: 9.988786, lat: 53.575961, time_offset_ms: 24123},
      %Video.TimedPoint{lon: 9.988778, lat: 53.575858, time_offset_ms: 24456},
      %Video.TimedPoint{lon: 9.988766, lat: 53.575759, time_offset_ms: 24790},
      %Video.TimedPoint{lon: 9.988762, lat: 53.575656, time_offset_ms: 25123},
      %Video.TimedPoint{lon: 9.988758, lat: 53.575552, time_offset_ms: 25457},
      %Video.TimedPoint{lon: 9.988752, lat: 53.575449, time_offset_ms: 25791},
      %Video.TimedPoint{lon: 9.988747, lat: 53.575347, time_offset_ms: 26124},
      %Video.TimedPoint{lon: 9.98874, lat: 53.575247, time_offset_ms: 26458},
      %Video.TimedPoint{lon: 9.988735, lat: 53.575144, time_offset_ms: 26791},
      %Video.TimedPoint{lon: 9.988731, lat: 53.575036, time_offset_ms: 27125},
      %Video.TimedPoint{lon: 9.988725, lat: 53.574931, time_offset_ms: 27459},
      %Video.TimedPoint{lon: 9.988716, lat: 53.574826, time_offset_ms: 27792},
      %Video.TimedPoint{lon: 9.988709, lat: 53.574721, time_offset_ms: 28126},
      %Video.TimedPoint{lon: 9.9887, lat: 53.574616, time_offset_ms: 28459},
      %Video.TimedPoint{lon: 9.988696, lat: 53.574511, time_offset_ms: 28793},
      %Video.TimedPoint{lon: 9.988688, lat: 53.574404, time_offset_ms: 29127},
      %Video.TimedPoint{lon: 9.98868, lat: 53.574301, time_offset_ms: 29460},
      %Video.TimedPoint{lon: 9.988673, lat: 53.574203, time_offset_ms: 29794},
      %Video.TimedPoint{lon: 9.988669, lat: 53.574103, time_offset_ms: 30127},
      %Video.TimedPoint{lon: 9.988663, lat: 53.573997, time_offset_ms: 30461},
      %Video.TimedPoint{lon: 9.988655, lat: 53.573891, time_offset_ms: 30795},
      %Video.TimedPoint{lon: 9.988649, lat: 53.573781, time_offset_ms: 31128},
      %Video.TimedPoint{lon: 9.988644, lat: 53.573671, time_offset_ms: 31462},
      %Video.TimedPoint{lon: 9.988636, lat: 53.573559, time_offset_ms: 31795},
      %Video.TimedPoint{lon: 9.988629, lat: 53.573445, time_offset_ms: 32129},
      %Video.TimedPoint{lon: 9.988623, lat: 53.573328, time_offset_ms: 32463},
      %Video.TimedPoint{lon: 9.988618, lat: 53.573211, time_offset_ms: 32796},
      %Video.TimedPoint{lon: 9.988613, lat: 53.573096, time_offset_ms: 33130},
      %Video.TimedPoint{lon: 9.988608, lat: 53.572977, time_offset_ms: 33463},
      %Video.TimedPoint{lon: 9.988602, lat: 53.572853, time_offset_ms: 33797},
      %Video.TimedPoint{lon: 9.988595, lat: 53.572725, time_offset_ms: 34131},
      %Video.TimedPoint{lon: 9.988589, lat: 53.572598, time_offset_ms: 34464},
      %Video.TimedPoint{lon: 9.988584, lat: 53.572472, time_offset_ms: 34798},
      %Video.TimedPoint{lon: 9.988579, lat: 53.572348, time_offset_ms: 35131},
      %Video.TimedPoint{lon: 9.988576, lat: 53.572225, time_offset_ms: 35465},
      %Video.TimedPoint{lon: 9.988559, lat: 53.572111, time_offset_ms: 35799},
      %Video.TimedPoint{lon: 9.98855, lat: 53.571992, time_offset_ms: 36132},
      %Video.TimedPoint{lon: 9.988545, lat: 53.57187, time_offset_ms: 36466},
      %Video.TimedPoint{lon: 9.988552, lat: 53.571751, time_offset_ms: 36799},
      %Video.TimedPoint{lon: 9.988567, lat: 53.571631, time_offset_ms: 37133},
      %Video.TimedPoint{lon: 9.988557, lat: 53.57151, time_offset_ms: 37467},
      %Video.TimedPoint{lon: 9.98854, lat: 53.571399, time_offset_ms: 37800},
      %Video.TimedPoint{lon: 9.98853, lat: 53.571318, time_offset_ms: 38134},
      %Video.TimedPoint{lon: 9.988526, lat: 53.571267, time_offset_ms: 38467},
      %Video.TimedPoint{lon: 9.988525, lat: 53.571235, time_offset_ms: 38801},
      %Video.TimedPoint{lon: 9.988556, lat: 53.57121, time_offset_ms: 39068},
      %Video.TimedPoint{lon: 9.988556, lat: 53.571198, time_offset_ms: 39402},
      %Video.TimedPoint{lon: 9.988551, lat: 53.57115, time_offset_ms: 39735},
      %Video.TimedPoint{lon: 9.988548, lat: 53.571072, time_offset_ms: 40069},
      %Video.TimedPoint{lon: 9.988545, lat: 53.57098, time_offset_ms: 40402},
      %Video.TimedPoint{lon: 9.988543, lat: 53.57088, time_offset_ms: 40736},
      %Video.TimedPoint{lon: 9.988535, lat: 53.570773, time_offset_ms: 41070},
      %Video.TimedPoint{lon: 9.98853, lat: 53.570665, time_offset_ms: 41403},
      %Video.TimedPoint{lon: 9.988547, lat: 53.570552, time_offset_ms: 41737},
      %Video.TimedPoint{lon: 9.988563, lat: 53.570431, time_offset_ms: 42070},
      %Video.TimedPoint{lon: 9.988567, lat: 53.570304, time_offset_ms: 42404},
      %Video.TimedPoint{lon: 9.98856, lat: 53.570178, time_offset_ms: 42738},
      %Video.TimedPoint{lon: 9.988556, lat: 53.57005, time_offset_ms: 43071},
      %Video.TimedPoint{lon: 9.988552, lat: 53.569922, time_offset_ms: 43405},
      %Video.TimedPoint{lon: 9.988546, lat: 53.569796, time_offset_ms: 43738},
      %Video.TimedPoint{lon: 9.988537, lat: 53.569674, time_offset_ms: 44072},
      %Video.TimedPoint{lon: 9.98853, lat: 53.569548, time_offset_ms: 44406},
      %Video.TimedPoint{lon: 9.988521, lat: 53.569423, time_offset_ms: 44739},
      %Video.TimedPoint{lon: 9.988513, lat: 53.569298, time_offset_ms: 45073},
      %Video.TimedPoint{lon: 9.988508, lat: 53.569174, time_offset_ms: 45406},
      %Video.TimedPoint{lon: 9.988501, lat: 53.569052, time_offset_ms: 45740},
      %Video.TimedPoint{lon: 9.988483, lat: 53.568935, time_offset_ms: 46074},
      %Video.TimedPoint{lon: 9.988452, lat: 53.56882, time_offset_ms: 46407},
      %Video.TimedPoint{lon: 9.988433, lat: 53.568706, time_offset_ms: 46741},
      %Video.TimedPoint{lon: 9.98842, lat: 53.568596, time_offset_ms: 47074},
      %Video.TimedPoint{lon: 9.988402, lat: 53.568487, time_offset_ms: 47408},
      %Video.TimedPoint{lon: 9.988387, lat: 53.568377, time_offset_ms: 47742},
      %Video.TimedPoint{lon: 9.98839, lat: 53.568259, time_offset_ms: 48075},
      %Video.TimedPoint{lon: 9.988379, lat: 53.568142, time_offset_ms: 48409},
      %Video.TimedPoint{lon: 9.988367, lat: 53.568026, time_offset_ms: 48742},
      %Video.TimedPoint{lon: 9.98836, lat: 53.567907, time_offset_ms: 49076},
      %Video.TimedPoint{lon: 9.988356, lat: 53.567785, time_offset_ms: 49410},
      %Video.TimedPoint{lon: 9.988355, lat: 53.567664, time_offset_ms: 49743},
      %Video.TimedPoint{lon: 9.988367, lat: 53.567542, time_offset_ms: 50077},
      %Video.TimedPoint{lon: 9.9884, lat: 53.567415, time_offset_ms: 50410},
      %Video.TimedPoint{lon: 9.988435, lat: 53.56729, time_offset_ms: 50744},
      %Video.TimedPoint{lon: 9.988473, lat: 53.567163, time_offset_ms: 51078},
      %Video.TimedPoint{lon: 9.988513, lat: 53.567041, time_offset_ms: 51411},
      %Video.TimedPoint{lon: 9.988549, lat: 53.566918, time_offset_ms: 51745},
      %Video.TimedPoint{lon: 9.988586, lat: 53.566799, time_offset_ms: 52078},
      %Video.TimedPoint{lon: 9.98862, lat: 53.566679, time_offset_ms: 52412},
      %Video.TimedPoint{lon: 9.988656, lat: 53.566557, time_offset_ms: 52746},
      %Video.TimedPoint{lon: 9.988687, lat: 53.566436, time_offset_ms: 53079},
      %Video.TimedPoint{lon: 9.988722, lat: 53.566317, time_offset_ms: 53413},
      %Video.TimedPoint{lon: 9.988757, lat: 53.566195, time_offset_ms: 53746},
      %Video.TimedPoint{lon: 9.988793, lat: 53.566073, time_offset_ms: 54080},
      %Video.TimedPoint{lon: 9.988829, lat: 53.565951, time_offset_ms: 54414},
      %Video.TimedPoint{lon: 9.988865, lat: 53.56583, time_offset_ms: 54747},
      %Video.TimedPoint{lon: 9.988899, lat: 53.565706, time_offset_ms: 55081},
      %Video.TimedPoint{lon: 9.988936, lat: 53.565579, time_offset_ms: 55414},
      %Video.TimedPoint{lon: 9.988975, lat: 53.56545, time_offset_ms: 55748},
      %Video.TimedPoint{lon: 9.989017, lat: 53.565321, time_offset_ms: 56082},
      %Video.TimedPoint{lon: 9.989055, lat: 53.565196, time_offset_ms: 56415},
      %Video.TimedPoint{lon: 9.989093, lat: 53.56507, time_offset_ms: 56749},
      %Video.TimedPoint{lon: 9.989127, lat: 53.564945, time_offset_ms: 57082},
      %Video.TimedPoint{lon: 9.989161, lat: 53.56482, time_offset_ms: 57416},
      %Video.TimedPoint{lon: 9.989191, lat: 53.564694, time_offset_ms: 57750},
      %Video.TimedPoint{lon: 9.98922, lat: 53.564567, time_offset_ms: 58083},
      %Video.TimedPoint{lon: 9.989246, lat: 53.56444, time_offset_ms: 58417},
      %Video.TimedPoint{lon: 9.989273, lat: 53.564313, time_offset_ms: 58750},
      %Video.TimedPoint{lon: 9.989302, lat: 53.564186, time_offset_ms: 59084},
      %Video.TimedPoint{lon: 9.989335, lat: 53.564056, time_offset_ms: 59418},
      %Video.TimedPoint{lon: 9.989369, lat: 53.56393, time_offset_ms: 59751},
      %Video.TimedPoint{lon: 9.989398, lat: 53.563806, time_offset_ms: 60085},
      %Video.TimedPoint{lon: 9.989412, lat: 53.563681, time_offset_ms: 60418},
      %Video.TimedPoint{lon: 9.989427, lat: 53.563562, time_offset_ms: 60752},
      %Video.TimedPoint{lon: 9.989456, lat: 53.563449, time_offset_ms: 61085},
      %Video.TimedPoint{lon: 9.989488, lat: 53.563338, time_offset_ms: 61419},
      %Video.TimedPoint{lon: 9.989525, lat: 53.563228, time_offset_ms: 61753},
      %Video.TimedPoint{lon: 9.989559, lat: 53.563118, time_offset_ms: 62086},
      %Video.TimedPoint{lon: 9.989593, lat: 53.56301, time_offset_ms: 62420},
      %Video.TimedPoint{lon: 9.989624, lat: 53.562901, time_offset_ms: 62753},
      %Video.TimedPoint{lon: 9.989657, lat: 53.562789, time_offset_ms: 63087},
      %Video.TimedPoint{lon: 9.989687, lat: 53.562682, time_offset_ms: 63421},
      %Video.TimedPoint{lon: 9.989715, lat: 53.562581, time_offset_ms: 63754},
      %Video.TimedPoint{lon: 9.989739, lat: 53.562481, time_offset_ms: 64088},
      %Video.TimedPoint{lon: 9.989757, lat: 53.562379, time_offset_ms: 64421},
      %Video.TimedPoint{lon: 9.989771, lat: 53.562278, time_offset_ms: 64755},
      %Video.TimedPoint{lon: 9.989788, lat: 53.562184, time_offset_ms: 65089},
      %Video.TimedPoint{lon: 9.989791, lat: 53.562089, time_offset_ms: 65422},
      %Video.TimedPoint{lon: 9.989789, lat: 53.561988, time_offset_ms: 65756},
      %Video.TimedPoint{lon: 9.989782, lat: 53.561878, time_offset_ms: 66089},
      %Video.TimedPoint{lon: 9.989769, lat: 53.561767, time_offset_ms: 66423},
      %Video.TimedPoint{lon: 9.989724, lat: 53.561662, time_offset_ms: 66757},
      %Video.TimedPoint{lon: 9.989631, lat: 53.561567, time_offset_ms: 67090}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "y`jeeBsus`R????@A@??A@??A@?@A@??A@?@A@?@A@?@A@A@?@A@A@?@ABA@?@ABA@?BA@ABABAB?BABABABABADABADADADCDAFADAD?BADADAD?DAD?DAB?DAD?D?DAD?D?DAD?D?D?DAF?D?D?DAF?D?D?F?D?DAF?D?F?D?FAF?D?F?D?FAD?F?D?FAD?F?D?DAF?D?D?FAD?D?D?FAD?D?D?DAF?D?DAD?F?D?DAF?D?DAF?D?FAD?F?DAF?DAF?D?FAD?FAD?F?FAD?FAD?FAD?FAF?DAF?DAF?FAD?FAFAD?FAF?DAF?FADAF?FAF?DAFAF?DAFAF?FAFAD?FAFAD?FADAF?FAD?FADAF?DAFAD?FAD?FADAF?DAFAD?FAD?FAD?FADAF?FAD?FAD?FAFAD?FAD?FAF?DAD?F?DAF?DAF?D?DAF?DAD?F?DAD?D?FAD?D?D?FAD?D?DAF?D?D?FAD?D?D?FAD?D?FAD?D?F?DAF?D?D?FAD?D?F?D?FAD?F?D?F?DAD?F?D?F?D?FAD?D?F?D?D?F?DAD?D?F?D?D?D?D?DAD?D?D?F?D?DAD?D?D?D?DAF?D?D?DAF?D?DAF?D?DAF?D?DAF?DAD?FAD?DAF?DAFAD?DAF?DADAD?FAD?DAFAD?FAD?DAFAD?DAF?DAF?DAF?DAF?DAF?DAF?F?DAF?F?DAF?D?F?FAD?F?F?FAD?F?F?F?DAF?F?D?FAF?F?D?F?FAD?F?FAD?F?FAD?F?FAD?F?DAF?FAD?FAD?FAF?DAF?DAFAD?FAF?DAFAF?DAFAD?FAF?DAFAD?FADAF?DAFAD?FAD?FAD?FADAF?DAD?FAD?FAD?DAF?DAD?FAD?DAF?DAD?FAD?DAD?FAD?DAF?DAD?FAD?DAD?F?DAD?DAF?DAD?FADAD?FAD?DAD?FAD?DAF?DAD?DAD?DAF?DAD?DAD?D?FAD?DAD?DAD?DAD?DAD?D?DAD?DAD?DAD?DAD?F?DAD?DAD?DAD?D?DAD?DAD?DAD?DAD?DAD?DAD?DAD?DAD?FAD?DAD?DADAF?DAD?DADAF?DAFAD?DADAF?DADAFAD?FADAF?DADAD?FADAD?DAF?DADAD?DAD?FADAD?DAD?DAD?DAD?DAD?DAD?DAD?DADAD?DAD?DAB?DAD?FAD?BAD?DAD?DAD?DAD?DADAD?DAD?DAB?DADAD?DAD?DAD?DADAD?BAD?DADAF?DAD?DADAD?DADAD?DAD?DADAD?DAD?DAD?DAD?DAD?BAD?DAD?B?DAD?BAD?D?BAD?D?BAD?B?DAB?D?DAB?D?B?DAB?D?B?DAB?D?B?D?BAD?B?D?B?D?BAD?B?D?B?D?BAD?B?D?B?D?BAD?B?D?D?BAD?B?D?B?D?BAD?B?D?D?BAD?B?D?DAB?D?D?BAD?D?DAD?D?DAD?D?DAD?DAF?D?DAF?DAD?FAD?FAD?DAF?DAF?DAF?DAFAD?FAD?FADAF?DAF?DAFAD?FADAF?DAF?DADAF?DAFAD?DAF?DADAF?DAD?FADAD?FAD?FADAD?FAD?DAF?DADAF?DAD?FAD?DAD?DAF?DAD?DAD?DAF?DAF?JCLAHAFAHAFAFADADAF?DABADAD?BAD?BABAB?BAB?BA@?BAB?@AB?@?@A@?@?????I@A?@?@?@AB?BA@?BAB?DAB?BAD?BAD?DAFAD?FAHAFAJAH?LCLALALAJAF?HAF?FAF?FAH?F?FAF?FAF?FAF?FAF?F?FAF?DAF?FAF?F?FAF?FAF?FAF?FAH?FAF?F?FAF?FAF?FAF?FAF?F?FAF?FAF?F?FAF?F?FAF?FAF?F?FAF?F?FAF?F?FAF?F?FAF?FAF?F?FAF?F?FAF?F?DAF?F?FAF?F?FAF?FAF?F?FAF?F?FAF?F?F?FAF?F?FAF?F?F?FAF?F?F?FAF?F?F?F?F?FAF?F?F?F?F?F?FAF?F?F?F?F?F?F?F?F?F?H?F?F?F?H?F?F?H?F@F?F?H?F?F?F?H?F@F?H?F?F?F?H@F?F?H?F?F@H?F?F?H@F?H?F@H?F?H@F?H?F@H?F?H@H?F@H?H?F@H?H@F?H@F?H?F@H?H@F?H?F@H?F@H?F?H@F?H@F?H?F@H?F?H@F?H?F?H@F?H?H@F?H?F?H@F?H?H?F?H@F?H?H?F?H@F?H?H?F?H?H@F?H?F?H?H@F?H?F?H?H?F@H?F?H?H?F@H?F?H?H?F@H?F?H?H@F?H?H?F?H@H?F?H?H@F?H?H?H@H?F?H?H@H?H?H?H@F?H?H?H?H@H?F?H?H?H@H?H?F?H?H?H@H?F?H?H?H?H@F?H?H?F?H?H@F?H?H?F?H@F?H?F?H@F?H?H?F@H?F?H@F?H?F@H?F?H?F@H?F?H@F?H?H@F?H?F@H?F?H@F?H?F?H@H?F?H?H@F?H?H?F@H?F?H?H?H@F?H?H?H?F@H?H?F?H@H?F?H?H?F@H?H?F?H@F?H?H@F?H?H?F@H?F?H?H@F?H?H@F?H?H?F@H?F?H?H?F@H?H?F?H?H@F?H?H?H?H?F?H?H@H?H?H?H?H?H?H?H?H@H?H?H?H?H?H?H@F?H?H?H@H?H?H?F@H?H?H@H?H?F@H?H?H@H?H?H@H?H?F@H?H?H?H@H?H?H@H?H?H?H@H?H?H?H@H?J?H?H@H?H?H?H@H?H?H?H@H?H?H?H@H?H?H?H@H?H?H?H@H?H?J?H@H?F?J?H@H?H?F?H@H?H?H?H@H?H?H?H@H?H?H?H@H?H?H?J@H?H?H@H?H?H?H@H?H?H@J?H?H@H?H?J@H?H@H?J?H@H?H?H@J?H?H@H?H?H@J?H?H@H?H?H@H?H?H?H@H?H?H@H?H?H?H@H?H?H@H?H?H@H?H?H?H@H?H?H@H?H?H@H?H@H?H?H@H?H?H@H?H@J?H?H@H?H@J?H?H@H?H@J?H@H?H@H?H@H?H@H?H@H?H@H?H@H?F@H?H@H?H@H?H@H?H?H@H?H@H?H?H@H?H?J@H?H?H@H?J?H?H@H?H?H?H?J@H?H?H?J@H?H?H?H?H@H?J?H?H?H@J?H?H?H@H?H?J?H@H?H?H?H@J?H?H?H@H?H?J?H@H?H?H@H?H?H?H@J?H?H@H?H?H?J@H?H?H?H@H?H?H@H?H?H?J@H?H?H@H?H?H?H@H?H?H@F?H?H@H?H?H@H?H?H@H?H?H?H@J?H?H@H?H?H?H@H?J?H@H?H?H?J@H?H?H?H?J@H?H?J?H@H?J?H?H?J@H?J?H?H@J?H?J?H@H?J?H?H@J?H?H?J@H?H?H?H@J?H?H@J?H?H@H?H?H@J?H?H@J?H?H@H?J@H?H?H@J?H@H?J@H?H?H@H?J@H?H?H@J?H@H?H?J@H?H@H?H?J@H?H?J@H?H@H?H?J@H?H@H?J?H@H?J@H?H?H@J?H@H?H?J@H?H@H?H?J@H?H?J@H?H?H?H@J?H?H@H?J?H?H@H?J?H?H@H?H?J@H?J?H?H@H?J?H@H?J@H?J?H@H?J?H@H?J@H?H?H@J?H@H?H?J@H?H@H?J?H@H?H@H?J?H@H?H@H?H?H@H?H?H@H?H?H@H?F@H?H?H@H?H?H?F@H?H?H@H?H?H?H@F?H?H@H?H?H?H@H?H?H?H?H@H?H?H?H@H?J?H?H@H?J?H?H@H?H?J@H?J?H@H?H?J?H@H?J?H@H?J?H@H?J@H?H?H@H?J?H@H?J?H@H?J@H?H?H@J?H?J@H?J?H@H?J?H@J?H?J@J?H?J@H?J?H?J@H?H?J@J?H?J?H@J?H?H@J?H?J?H@J?H?J?H@J?H?J@H?J?H@J?J?H@J?H?J@J?H?J@H?J@J?H?J@H?J?J@H?J@J?H?J@J?H?J@H?J?J@H?J@J?J?H@J?J?H@J?J?H@J?J?J@J?J?H?J@J?J?J@J?J?H@J?J?J?J@H?J?J@J?J?J?J@J?J?J@H?J?J?J@J?J?J?H@J?J?J?H@J?J?J?J@J?H?J?J@H?J?J?H@J?J?J?H@J?J?J?H@J?J?J?J@J?H?J?J@J?J?J?J@J?J?J?J@J?J?J?J@J?J?L?J@J?J?J@J?J?J?J@L?J?J@J?L?J@J?J?L@J?J?L@J?J?J@L?J?J@L?J?L@J?L?J@J?L?J@J?L?J@L?J?J@L?J?L?J@J?L?J@L?J?J@L?J?J?J@L?J?J@L?J?J?L@J?J?L?J@J?J?L@J?J?L?J@J?J?L?J@J?J?L?J@J?J?L?J@J?J?L?J?J@J?L?J?J@J?J?J?J?L@J?J?J?J?J@L?J?J?J@J?L?J?J@J?J?J@J?J@J?J@J?J@J?J@H?J@J@H?J@J@H?J@H@J@J?H@J@J?H@J@J?J@J?J@J@J?J@H?J@J?L@H?J@J?J?J@J?J@J?J?L@J?J?J@J?J?J?J@J?J?J?L@J?J?J?J?J?J?J?J?J?J?J?J?JAJ?J?J?JAJ?J?JAJ?J?HAJ?JAJ?JAJ?JAJ?JAJAJ?JAJ?JAJAJ?JAJ?JAJ?J?JAJ?J?JAJ?J?J?J?J?J?J?J@J?L?J@J?J@J?J@J?J@J?J@J@J?J@H@J@J?J@J@H@J?J@J@J@H@J?H@J@H@H?H@J@H@H?H@F@H?H@H?F@F?H@F@H?F@F?F?F@F?F@F?F?D@F?D?F?D@D?D?D?D?D?DAD?B?D?BAD?B?BAB?B?BAB?B?@AB?@?BA@?B?@A@?@?BA@?@?@?@A@?@?@AB?@?@A@?@A@?@?BA@?@A@?@?@A@???@?@A@???@?@A??@?????@???@??A@???@???@?@?@A@?@?@?@?@AB?@?@?BAB?@?B?B?DAB?B?D?D?BAD?F?D?F?F?F?H@F?H?H?H@H?H?F?H?F@H?F?F?H?F@H?F?H?F?H?F@H?H?F?H?H?F@H?H?F?H?H?H?F?H@H?H?H?H?F?H?H@H?H?H?H?H?H?H@H?H?H?H?J@H?H?H?J@H?H?H?J@H?H?J@H?H?J@H?J?H@H?J?H@H?J?H@J?H?H@J?H?J?H?H@J?H?J?H?H?J?H?H?J?HAJ?H?J?HAJ?HAJ?JAH?JAHAJ?JAHAJAJ?HAJAJAJAJ?JAHAJAJAJAJ?JAJAJAL?JAJAJAJ?JAJAJ?LAJ?JAJ?LAJ?JAJ?J?LAJ?J?L?JAL?J?J?L?J?J?J?L?J?L?J?J?J?L?J@J?J?L?J@J?L?J?J@L?J?J@J?L?J?L@J?J?L?J@L?J?J?L@J?L?J?J@L?J?L?J?J@L?J?L?J?J@L?J?J?L?J@L?J?L?J?J@L?J?J?L@J?J?L?J@L?J?J?L@J?J?L?J@J?L?J@J?L?J@J?J?J@J?L?J@J?J@J?L?J@J?J@J?J?J@J?J@J?J?J@L?J@J?J?J@L?J@J?J?J@L?J@J?L?J@J?L?J@J?J@L?J?J@J?L@J?J?L@J?J@L?J@J?J?L@J?J@J?L@J?J?J@J?L@J?J@L?J?J@J?J@L?J?J@J?L@J?J?J@J?L?J@J?J?L@J?J?J@L?J?J@J?J?L?J@J?J?L@J?J?J?J@J?J?L@J?J?J?J@J?J@J?J?L@J?J?J@J?J@J?J@J?J@J@J?J@J@J?J@J@J@H@J?J@J@J@J@H@J@J@J@H@J@JBJ@J@J@HBJ@J@JBJ@HBJ@J@JBJ@HBJ@J@HBJ@J@J@HBJ@J@J@H@J@JBH@J@J@H@J@J@J@H?J@H@J@J@H@J?J@H@J@H@J?H@J@H?J@H@J@H?J@H@J@H?H@J@H@J?H@J@H@J@H?H@J@H@J@H?J@H@J@H@H@J@H?J@H@J@H@J?H@H@J@H?J@H@J@H?J@H?J@H?J@H?J@H?J@J?J?H?J@J?J?J?J?H?J?L?J?H@J?J?J?J?J?J?J?J@J?J?H?J@J?J?J@H?J@J?J@J?J@J?H@J?J@J?J@J?H@J@J?J@J?H@J?J@J@J?H@J?J@J?H@J?J@J?J@J?J@H?J@J?J@J?J?J@J?J?J@J?J?J@J?J?H@J?L?J@J?J?J?J@J?J?J?J@J?J?L?J?J@J?J?J?J?J?J?J@J?J?J?L?J?J?J?J?J?J?J?J?J?J?J?J?JAJ?J?J?LAJ?J?JAJ?JAJ?JAJ?JAJAJ?JAJAJALAJAJAJAJALAJAJAJCLAJALCJAJCLCJALCJAJCLCJAJCJCLAJCLCJAJCJCJCLAJCJCJALCJCJCJALCJCJCJCJALCJCLCJCJCJALCJCJCLCJCLCJCJCLCJAJCJCLCJCJCJCLCJCJCJCLCJCJCJCJCJCJCJCJCJALCJCJCJCJCJCJCJCJCLAJCJCJCJCJCJCLAJCJCJCJCJAJCJCJCJCLCHAJCJCLCJCJCHAJCJCJCJCJAJCJCJCJCJAJCJCJCJCJAJCJCJAJCHCJCLAJCJCJCJAJCHCJAJCLCJCJAJCJCJCJAJCJCJCJCJALCJCJCJAJCJCJAJCJCJCJAJCJCLAJCJAJCJCJAJCJCJAJCJAJCJCJAJCJAJCJCJAJCJCJAJCJCJAJCJCJCJAJCHCJCJAJCJCJAJCLCJCJCJAJCJCJCJAJCJCLCJAJCJCJCJAJCJCJCJCJALCJCJCJAJCJCJCJCJAJCJCJCLCJAJCJCJCJAJCJCJCJCJCJALCJCJCJAJCJCJCJCJAJCJCJCJCLAJCJCJCJCJAJCJCJCJCJAJCLCJCJCJAJCJCJCJAJCJCJCJALCJCJCJAJCJCJALCJCJCJAJCLCJCJAJCJCLCJAJCLCJCJCLAJCJCLCJCLCJCJALCJCJCLCJCJCLCJALCJCLCJCJCLCJCLCJCLCJCLCJCJCLCJCLCJCLCJCLCJCJCLCJCLCJCLCJCLCJCLCJCJCLEJCJCLCJCLCJCJCJCLAJCJCLCJCJCLCJCJCJCJCJCLAJCJCLCJCJCJCLCJCJAJCLCJCJCLCJCJCLAJCJCJCLCJCJALCJCJCJCLAJCJCJCLAJCJCLCJAJCJCJALCJCJAJCLCJCJAJCJCLAJCJCJALCJCJAJCLCJAJCJALCJCJALCJCJAJCJALCJAJCJALCJALCJAJCJALCJAJCJALCJALCJAJCLAJCJALCJALAJCJALCJAJCLAJAJCLAJAJCLAJCJALAJCJALAJCJALAJCJALAJCJALAJAJCLAJAJCLAJALCJAJALCJAJCLAJALCJAJAJCLAJAJCLAJCLAJCJAJALCJAJCLAJCJALAJCJALCJAJCLAJCLAJCLCJAJCLAJCLCJALCJALCLCJAJCLCJALCJCLAJCLCJAJCLCJCJALCJCJALCJCJALCJAJCJCLAJCJAJCLCJAJCJAJCLAJCJAJCJALAJCJAJAJCLAJAJAJAJALAJAJAJALAJAJALAJAJAJ?LAJAJAJAJ?JALAJ?JAJAJAJ?JAJAJAJ?JAJAJAJAJAJ?JAJAJAJAHAJAJAJCJAHAJAJAJCHAJAJCHAJAJCHAJCHAJAHCJAJCHAJCHAJCJCHAJCHAJCHAJCHCJAHCJCHAJCHAJCHCJCJAHCJCHCJAHCHCJCHAJCJCHCJCHAHCJCHCJCHAJCHCJCHAJCJCHCJAHCJCHCJAHCJCHCJAHCHCJAHCJCHAJCHCJCHAHCJCHAHCJCHAJCHCJAHCHCJAHCHAJCHCJAHCJCHAJCHAHCJAHCJCHAJCHAHCJCHAJCHAJCJCHAJCHAJCHCJAHCJAJCJCHAJCHCJAHCJCHAJCJAHCJAHCHCJAHCHAJCHAJCHAHCJAHCHAHCJAHCHAHAJCHAHCHAHCHAHAHCJAHCHAHAHCHAHAHCHAHAHCHAHAHCHAHAHAHCHAHAHAHAHCHAHAFAHAHAHAHAHAHAJCHAHAHAHAHAHAHAH?JAHAHAHAHAHAHAHAH?HAJAHAHAH?HAHAHAHAH?HAJAHAH?HAHAHAH?HAHAFAHAH?HAHAHAF?HAHAFAH?HAHAF?HAFAH?HAF?HAHAF?HAH?F?HAH?HAF?H?H?FAH?H?H?F?HAH?H?F?H?H?H?H?H?H?H?H?F?H?H?J?H?H?H@H?H?H?H?J?H@H?J?H?H?J@H?J?H@H?J?J@H?J?H@J?H@J?H?J@H?J@J?H@J@H?J@H?J@H@J?H@J@J@H@J@H@H@J@HBJ@H@JBH@HBJBHBH@HBJBHDHBHBHDJBHDHDHBHDHFHDHDJFHFJHJFJHJHJHHFHFFFFFDDFDDDDDBBDBBDB@BB",
      precision: 6
    }
  end
end
