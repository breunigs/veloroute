defmodule Data.AutoGenerated.Video.Rendered_e10a3429f2f5fcf14e15598a308c47bc do
  @moduledoc "#{"br-nord-n3: vom Eulenkamp zur Steilshooper Straße"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "br-nord-n3: vom Eulenkamp zur Steilshooper Straße"
  end

  @impl Video.Rendered
  def hash() do
    "e10a3429f2f5fcf14e15598a308c47bc"
  end

  @impl Video.Rendered
  def length_ms() do
    68813
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2023-10-23-brnrod/GX016529", "00:00:14.481", "00:00:17.317"},
      {"2023-10-23-brnrod/GX016529", "00:00:37.004", :end},
      {"2023-10-23-brnrod/GX016530", :start, :end},
      {"2023-10-23-brnrod/GX016531", :start, "00:00:09.007"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.050041,
      minLat: 53.578951,
      maxLon: 10.065453147147148,
      maxLat: 53.589303
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Oktober 2023"}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 531, text: "Elsässer Straße"},
      %{timestamp: 15071, text: "Straßburger Straße"},
      %{timestamp: 16072, text: "Elsässer Straße"},
      %{timestamp: 34753, text: "Augustenburger Ufer"},
      %{timestamp: 36421, text: ""},
      %{timestamp: 38089, text: "Adlerstraße"},
      %{timestamp: 41091, text: "Wachtelstraße"},
      %{timestamp: 59106, text: "Bramfelder Straße"},
      %{timestamp: 61140, text: "Wachtelstraße"},
      %{timestamp: 67479, text: "Steilshooper Straße"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.065453147147148, lat: 53.57896815615616, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.065365, lat: 53.578951, time_offset_ms: 197},
      %Video.TimedPoint{lon: 10.065232, lat: 53.578973, time_offset_ms: 531},
      %Video.TimedPoint{lon: 10.06513, lat: 53.579033, time_offset_ms: 865},
      %Video.TimedPoint{lon: 10.06502, lat: 53.579097, time_offset_ms: 1198},
      %Video.TimedPoint{lon: 10.064898, lat: 53.579157, time_offset_ms: 1532},
      %Video.TimedPoint{lon: 10.064768, lat: 53.579207, time_offset_ms: 1865},
      %Video.TimedPoint{lon: 10.064647, lat: 53.579264, time_offset_ms: 2199},
      %Video.TimedPoint{lon: 10.064536, lat: 53.579324, time_offset_ms: 2533},
      %Video.TimedPoint{lon: 10.064444981981984, lat: 53.57937917117117, time_offset_ms: 2569},
      %Video.TimedPoint{lon: 10.064438, lat: 53.579383, time_offset_ms: 2594},
      %Video.TimedPoint{lon: 10.064348, lat: 53.579435, time_offset_ms: 2928},
      %Video.TimedPoint{lon: 10.06427, lat: 53.579486, time_offset_ms: 3262},
      %Video.TimedPoint{lon: 10.064202, lat: 53.579547, time_offset_ms: 3595},
      %Video.TimedPoint{lon: 10.064158, lat: 53.579617, time_offset_ms: 3929},
      %Video.TimedPoint{lon: 10.064117, lat: 53.579694, time_offset_ms: 4262},
      %Video.TimedPoint{lon: 10.064078, lat: 53.579775, time_offset_ms: 4596},
      %Video.TimedPoint{lon: 10.064049, lat: 53.579854, time_offset_ms: 4930},
      %Video.TimedPoint{lon: 10.064008, lat: 53.579925, time_offset_ms: 5263},
      %Video.TimedPoint{lon: 10.063953, lat: 53.580002, time_offset_ms: 5597},
      %Video.TimedPoint{lon: 10.063905, lat: 53.580071, time_offset_ms: 5930},
      %Video.TimedPoint{lon: 10.063867, lat: 53.580131, time_offset_ms: 6264},
      %Video.TimedPoint{lon: 10.063836, lat: 53.580184, time_offset_ms: 6598},
      %Video.TimedPoint{lon: 10.063799, lat: 53.580225, time_offset_ms: 6931},
      %Video.TimedPoint{lon: 10.063761, lat: 53.580253, time_offset_ms: 7265},
      %Video.TimedPoint{lon: 10.063722, lat: 53.580296, time_offset_ms: 7598},
      %Video.TimedPoint{lon: 10.063688, lat: 53.580367, time_offset_ms: 7932},
      %Video.TimedPoint{lon: 10.063662, lat: 53.580445, time_offset_ms: 8266},
      %Video.TimedPoint{lon: 10.063628, lat: 53.580524, time_offset_ms: 8599},
      %Video.TimedPoint{lon: 10.063594, lat: 53.580609, time_offset_ms: 8933},
      %Video.TimedPoint{lon: 10.063556, lat: 53.580684, time_offset_ms: 9266},
      %Video.TimedPoint{lon: 10.063517, lat: 53.580765, time_offset_ms: 9600},
      %Video.TimedPoint{lon: 10.063465, lat: 53.580845, time_offset_ms: 9934},
      %Video.TimedPoint{lon: 10.063405, lat: 53.580922, time_offset_ms: 10267},
      %Video.TimedPoint{lon: 10.063354, lat: 53.580997, time_offset_ms: 10601},
      %Video.TimedPoint{lon: 10.06333, lat: 53.581062, time_offset_ms: 10934},
      %Video.TimedPoint{lon: 10.063317, lat: 53.581125, time_offset_ms: 11268},
      %Video.TimedPoint{lon: 10.063304, lat: 53.581178, time_offset_ms: 11602},
      %Video.TimedPoint{lon: 10.063281, lat: 53.581214, time_offset_ms: 11935},
      %Video.TimedPoint{lon: 10.063261, lat: 53.581248, time_offset_ms: 12269},
      %Video.TimedPoint{lon: 10.063255, lat: 53.58129, time_offset_ms: 12602},
      %Video.TimedPoint{lon: 10.063258, lat: 53.581328, time_offset_ms: 12936},
      %Video.TimedPoint{lon: 10.063275, lat: 53.581355, time_offset_ms: 13270},
      %Video.TimedPoint{lon: 10.063306, lat: 53.581372, time_offset_ms: 13603},
      %Video.TimedPoint{lon: 10.063325, lat: 53.581382, time_offset_ms: 13937},
      %Video.TimedPoint{lon: 10.063334, lat: 53.581387, time_offset_ms: 14070},
      %Video.TimedPoint{lon: 10.063332, lat: 53.581396, time_offset_ms: 14404},
      %Video.TimedPoint{lon: 10.063307, lat: 53.581431, time_offset_ms: 14737},
      %Video.TimedPoint{lon: 10.063279, lat: 53.581486, time_offset_ms: 15071},
      %Video.TimedPoint{lon: 10.063253, lat: 53.581545, time_offset_ms: 15404},
      %Video.TimedPoint{lon: 10.063194, lat: 53.581577, time_offset_ms: 15738},
      %Video.TimedPoint{lon: 10.063121, lat: 53.581603, time_offset_ms: 16072},
      %Video.TimedPoint{lon: 10.063066, lat: 53.581657, time_offset_ms: 16405},
      %Video.TimedPoint{lon: 10.063029, lat: 53.581728, time_offset_ms: 16739},
      %Video.TimedPoint{lon: 10.062996, lat: 53.581799, time_offset_ms: 17072},
      %Video.TimedPoint{lon: 10.062959, lat: 53.581868, time_offset_ms: 17406},
      %Video.TimedPoint{lon: 10.062919, lat: 53.581945, time_offset_ms: 17740},
      %Video.TimedPoint{lon: 10.062881, lat: 53.582016, time_offset_ms: 18073},
      %Video.TimedPoint{lon: 10.062845, lat: 53.58206, time_offset_ms: 18407},
      %Video.TimedPoint{lon: 10.062774, lat: 53.582087, time_offset_ms: 18740},
      %Video.TimedPoint{lon: 10.062673, lat: 53.58211, time_offset_ms: 19074},
      %Video.TimedPoint{lon: 10.062591, lat: 53.582154, time_offset_ms: 19408},
      %Video.TimedPoint{lon: 10.062554, lat: 53.582217, time_offset_ms: 19741},
      %Video.TimedPoint{lon: 10.062515, lat: 53.582288, time_offset_ms: 20075},
      %Video.TimedPoint{lon: 10.062471, lat: 53.582369, time_offset_ms: 20408},
      %Video.TimedPoint{lon: 10.062427, lat: 53.582448, time_offset_ms: 20742},
      %Video.TimedPoint{lon: 10.06238, lat: 53.58253, time_offset_ms: 21076},
      %Video.TimedPoint{lon: 10.062337, lat: 53.58261, time_offset_ms: 21409},
      %Video.TimedPoint{lon: 10.06229, lat: 53.582688, time_offset_ms: 21743},
      %Video.TimedPoint{lon: 10.062239, lat: 53.582762, time_offset_ms: 22076},
      %Video.TimedPoint{lon: 10.062185, lat: 53.582839, time_offset_ms: 22410},
      %Video.TimedPoint{lon: 10.062136, lat: 53.582925, time_offset_ms: 22744},
      %Video.TimedPoint{lon: 10.062091, lat: 53.583012, time_offset_ms: 23077},
      %Video.TimedPoint{lon: 10.062047, lat: 53.583096, time_offset_ms: 23411},
      %Video.TimedPoint{lon: 10.062007, lat: 53.583179, time_offset_ms: 23744},
      %Video.TimedPoint{lon: 10.061975, lat: 53.583258, time_offset_ms: 24078},
      %Video.TimedPoint{lon: 10.061942, lat: 53.58333, time_offset_ms: 24412},
      %Video.TimedPoint{lon: 10.0619, lat: 53.583405, time_offset_ms: 24745},
      %Video.TimedPoint{lon: 10.061852, lat: 53.583489, time_offset_ms: 25079},
      %Video.TimedPoint{lon: 10.061799, lat: 53.583577, time_offset_ms: 25412},
      %Video.TimedPoint{lon: 10.061741, lat: 53.583666, time_offset_ms: 25746},
      %Video.TimedPoint{lon: 10.061674, lat: 53.583753, time_offset_ms: 26080},
      %Video.TimedPoint{lon: 10.061601, lat: 53.583823, time_offset_ms: 26413},
      %Video.TimedPoint{lon: 10.061518, lat: 53.583888, time_offset_ms: 26747},
      %Video.TimedPoint{lon: 10.061434, lat: 53.583963, time_offset_ms: 27080},
      %Video.TimedPoint{lon: 10.061355, lat: 53.584048, time_offset_ms: 27414},
      %Video.TimedPoint{lon: 10.061273, lat: 53.584139, time_offset_ms: 27748},
      %Video.TimedPoint{lon: 10.061195, lat: 53.584227, time_offset_ms: 28081},
      %Video.TimedPoint{lon: 10.061115, lat: 53.584316, time_offset_ms: 28415},
      %Video.TimedPoint{lon: 10.061031, lat: 53.584408, time_offset_ms: 28748},
      %Video.TimedPoint{lon: 10.060945, lat: 53.5845, time_offset_ms: 29082},
      %Video.TimedPoint{lon: 10.060843, lat: 53.584584, time_offset_ms: 29416},
      %Video.TimedPoint{lon: 10.060744, lat: 53.584664, time_offset_ms: 29749},
      %Video.TimedPoint{lon: 10.060669, lat: 53.584729, time_offset_ms: 30083},
      %Video.TimedPoint{lon: 10.060603, lat: 53.584783, time_offset_ms: 30416},
      %Video.TimedPoint{lon: 10.060552, lat: 53.584829, time_offset_ms: 30750},
      %Video.TimedPoint{lon: 10.060512, lat: 53.584865, time_offset_ms: 31084},
      %Video.TimedPoint{lon: 10.060479, lat: 53.584879, time_offset_ms: 31417},
      %Video.TimedPoint{lon: 10.06043, lat: 53.584903, time_offset_ms: 31751},
      %Video.TimedPoint{lon: 10.060359, lat: 53.584947, time_offset_ms: 32084},
      %Video.TimedPoint{lon: 10.06027, lat: 53.585002, time_offset_ms: 32418},
      %Video.TimedPoint{lon: 10.060173, lat: 53.585062, time_offset_ms: 32752},
      %Video.TimedPoint{lon: 10.060072, lat: 53.585127, time_offset_ms: 33085},
      %Video.TimedPoint{lon: 10.059975, lat: 53.58519, time_offset_ms: 33419},
      %Video.TimedPoint{lon: 10.059886, lat: 53.585246, time_offset_ms: 33752},
      %Video.TimedPoint{lon: 10.059812, lat: 53.585297, time_offset_ms: 34086},
      %Video.TimedPoint{lon: 10.059768, lat: 53.585354, time_offset_ms: 34419},
      %Video.TimedPoint{lon: 10.059764, lat: 53.585414, time_offset_ms: 34753},
      %Video.TimedPoint{lon: 10.059745, lat: 53.585465, time_offset_ms: 35087},
      %Video.TimedPoint{lon: 10.059724, lat: 53.585514, time_offset_ms: 35420},
      %Video.TimedPoint{lon: 10.059684, lat: 53.585573, time_offset_ms: 35754},
      %Video.TimedPoint{lon: 10.059619, lat: 53.58563, time_offset_ms: 36087},
      %Video.TimedPoint{lon: 10.05954, lat: 53.585678, time_offset_ms: 36421},
      %Video.TimedPoint{lon: 10.05946, lat: 53.585725, time_offset_ms: 36755},
      %Video.TimedPoint{lon: 10.059376, lat: 53.585777, time_offset_ms: 37088},
      %Video.TimedPoint{lon: 10.059295, lat: 53.585826, time_offset_ms: 37422},
      %Video.TimedPoint{lon: 10.059225, lat: 53.585869, time_offset_ms: 37755},
      %Video.TimedPoint{lon: 10.05916, lat: 53.585906, time_offset_ms: 38089},
      %Video.TimedPoint{lon: 10.059109, lat: 53.585935, time_offset_ms: 38423},
      %Video.TimedPoint{lon: 10.059073, lat: 53.585961, time_offset_ms: 38756},
      %Video.TimedPoint{lon: 10.059032, lat: 53.585984, time_offset_ms: 39090},
      %Video.TimedPoint{lon: 10.058985, lat: 53.586006, time_offset_ms: 39423},
      %Video.TimedPoint{lon: 10.058943, lat: 53.586025, time_offset_ms: 39757},
      %Video.TimedPoint{lon: 10.058894, lat: 53.586029, time_offset_ms: 40091},
      %Video.TimedPoint{lon: 10.058824, lat: 53.586028, time_offset_ms: 40424},
      %Video.TimedPoint{lon: 10.058738, lat: 53.586032, time_offset_ms: 40758},
      %Video.TimedPoint{lon: 10.058652, lat: 53.586052, time_offset_ms: 41091},
      %Video.TimedPoint{lon: 10.058581, lat: 53.586093, time_offset_ms: 41425},
      %Video.TimedPoint{lon: 10.058523, lat: 53.586135, time_offset_ms: 41759},
      %Video.TimedPoint{lon: 10.058447, lat: 53.586179, time_offset_ms: 42092},
      %Video.TimedPoint{lon: 10.058366, lat: 53.586228, time_offset_ms: 42426},
      %Video.TimedPoint{lon: 10.058278, lat: 53.586284, time_offset_ms: 42759},
      %Video.TimedPoint{lon: 10.058186, lat: 53.586338, time_offset_ms: 43093},
      %Video.TimedPoint{lon: 10.058098, lat: 53.586391, time_offset_ms: 43427},
      %Video.TimedPoint{lon: 10.058024, lat: 53.58644, time_offset_ms: 43760},
      %Video.TimedPoint{lon: 10.057941, lat: 53.586493, time_offset_ms: 44094},
      %Video.TimedPoint{lon: 10.057853, lat: 53.58654, time_offset_ms: 44427},
      %Video.TimedPoint{lon: 10.05778, lat: 53.5866, time_offset_ms: 44761},
      %Video.TimedPoint{lon: 10.0577, lat: 53.586651, time_offset_ms: 45095},
      %Video.TimedPoint{lon: 10.05762, lat: 53.586702, time_offset_ms: 45428},
      %Video.TimedPoint{lon: 10.057547, lat: 53.586748, time_offset_ms: 45762},
      %Video.TimedPoint{lon: 10.057459, lat: 53.586786, time_offset_ms: 46095},
      %Video.TimedPoint{lon: 10.057346, lat: 53.586821, time_offset_ms: 46429},
      %Video.TimedPoint{lon: 10.05722, lat: 53.586858, time_offset_ms: 46763},
      %Video.TimedPoint{lon: 10.057092, lat: 53.586894, time_offset_ms: 47096},
      %Video.TimedPoint{lon: 10.056971, lat: 53.586928, time_offset_ms: 47430},
      %Video.TimedPoint{lon: 10.056848, lat: 53.586964, time_offset_ms: 47763},
      %Video.TimedPoint{lon: 10.056722, lat: 53.586999, time_offset_ms: 48097},
      %Video.TimedPoint{lon: 10.056598, lat: 53.587034, time_offset_ms: 48431},
      %Video.TimedPoint{lon: 10.056474, lat: 53.587069, time_offset_ms: 48764},
      %Video.TimedPoint{lon: 10.056349, lat: 53.587105, time_offset_ms: 49098},
      %Video.TimedPoint{lon: 10.056225, lat: 53.587139, time_offset_ms: 49431},
      %Video.TimedPoint{lon: 10.056102, lat: 53.587174, time_offset_ms: 49765},
      %Video.TimedPoint{lon: 10.055984, lat: 53.587213, time_offset_ms: 50099},
      %Video.TimedPoint{lon: 10.055864, lat: 53.587247, time_offset_ms: 50432},
      %Video.TimedPoint{lon: 10.055746, lat: 53.587283, time_offset_ms: 50766},
      %Video.TimedPoint{lon: 10.055625, lat: 53.587319, time_offset_ms: 51099},
      %Video.TimedPoint{lon: 10.055504, lat: 53.587357, time_offset_ms: 51433},
      %Video.TimedPoint{lon: 10.055379, lat: 53.587395, time_offset_ms: 51767},
      %Video.TimedPoint{lon: 10.055254, lat: 53.58743, time_offset_ms: 52100},
      %Video.TimedPoint{lon: 10.05513, lat: 53.587462, time_offset_ms: 52434},
      %Video.TimedPoint{lon: 10.055002, lat: 53.58749, time_offset_ms: 52767},
      %Video.TimedPoint{lon: 10.05488, lat: 53.587525, time_offset_ms: 53101},
      %Video.TimedPoint{lon: 10.05476, lat: 53.587559, time_offset_ms: 53435},
      %Video.TimedPoint{lon: 10.054636, lat: 53.58759, time_offset_ms: 53768},
      %Video.TimedPoint{lon: 10.054508, lat: 53.587623, time_offset_ms: 54102},
      %Video.TimedPoint{lon: 10.054375, lat: 53.587659, time_offset_ms: 54435},
      %Video.TimedPoint{lon: 10.05424, lat: 53.587694, time_offset_ms: 54769},
      %Video.TimedPoint{lon: 10.054104, lat: 53.587729, time_offset_ms: 55103},
      %Video.TimedPoint{lon: 10.05397, lat: 53.587769, time_offset_ms: 55436},
      %Video.TimedPoint{lon: 10.053838, lat: 53.587808, time_offset_ms: 55770},
      %Video.TimedPoint{lon: 10.053709, lat: 53.58785, time_offset_ms: 56103},
      %Video.TimedPoint{lon: 10.053576, lat: 53.587889, time_offset_ms: 56437},
      %Video.TimedPoint{lon: 10.053443, lat: 53.587929, time_offset_ms: 56771},
      %Video.TimedPoint{lon: 10.05331, lat: 53.587964, time_offset_ms: 57104},
      %Video.TimedPoint{lon: 10.05318, lat: 53.588001, time_offset_ms: 57438},
      %Video.TimedPoint{lon: 10.05305, lat: 53.588039, time_offset_ms: 57771},
      %Video.TimedPoint{lon: 10.052929, lat: 53.588075, time_offset_ms: 58105},
      %Video.TimedPoint{lon: 10.05284, lat: 53.588116, time_offset_ms: 58439},
      %Video.TimedPoint{lon: 10.052808, lat: 53.588168, time_offset_ms: 58772},
      %Video.TimedPoint{lon: 10.052805, lat: 53.588199, time_offset_ms: 59106},
      %Video.TimedPoint{lon: 10.052802, lat: 53.588205, time_offset_ms: 59439},
      %Video.TimedPoint{lon: 10.052801, lat: 53.588206, time_offset_ms: 59773},
      %Video.TimedPoint{lon: 10.052759, lat: 53.588197, time_offset_ms: 59806},
      %Video.TimedPoint{lon: 10.052753, lat: 53.588202, time_offset_ms: 60140},
      %Video.TimedPoint{lon: 10.052708, lat: 53.58822, time_offset_ms: 60473},
      %Video.TimedPoint{lon: 10.052625, lat: 53.588244, time_offset_ms: 60807},
      %Video.TimedPoint{lon: 10.052512, lat: 53.588254, time_offset_ms: 61140},
      %Video.TimedPoint{lon: 10.052381, lat: 53.588252, time_offset_ms: 61474},
      %Video.TimedPoint{lon: 10.052245, lat: 53.588271, time_offset_ms: 61808},
      %Video.TimedPoint{lon: 10.052115, lat: 53.58831, time_offset_ms: 62141},
      %Video.TimedPoint{lon: 10.051982, lat: 53.588352, time_offset_ms: 62475},
      %Video.TimedPoint{lon: 10.051845, lat: 53.588391, time_offset_ms: 62808},
      %Video.TimedPoint{lon: 10.051715, lat: 53.588435, time_offset_ms: 63142},
      %Video.TimedPoint{lon: 10.051579, lat: 53.588466, time_offset_ms: 63476},
      %Video.TimedPoint{lon: 10.051442, lat: 53.588504, time_offset_ms: 63809},
      %Video.TimedPoint{lon: 10.05131, lat: 53.588547, time_offset_ms: 64143},
      %Video.TimedPoint{lon: 10.051175, lat: 53.588586, time_offset_ms: 64476},
      %Video.TimedPoint{lon: 10.051042, lat: 53.588632, time_offset_ms: 64810},
      %Video.TimedPoint{lon: 10.050911, lat: 53.588681, time_offset_ms: 65144},
      %Video.TimedPoint{lon: 10.050775, lat: 53.588725, time_offset_ms: 65477},
      %Video.TimedPoint{lon: 10.050636, lat: 53.588768, time_offset_ms: 65811},
      %Video.TimedPoint{lon: 10.050499, lat: 53.58881, time_offset_ms: 66144},
      %Video.TimedPoint{lon: 10.050367, lat: 53.58885, time_offset_ms: 66478},
      %Video.TimedPoint{lon: 10.05024, lat: 53.588886, time_offset_ms: 66812},
      %Video.TimedPoint{lon: 10.050136, lat: 53.588921, time_offset_ms: 67145},
      %Video.TimedPoint{lon: 10.050066, lat: 53.588965, time_offset_ms: 67479},
      %Video.TimedPoint{lon: 10.050041, lat: 53.589032, time_offset_ms: 67812},
      %Video.TimedPoint{lon: 10.050046, lat: 53.589117, time_offset_ms: 68146},
      %Video.TimedPoint{lon: 10.050048, lat: 53.589209, time_offset_ms: 68480},
      %Video.TimedPoint{lon: 10.050049, lat: 53.589303, time_offset_ms: 68813}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "eleeeB{_jeR?D?B@F?D?F?F@F?F?F?H?H?F?J?H?JAH?LAL?NALANANAPALALALCJALCJCLCJCJCJCJCJCHCJEJCHEJCHEJEHCJEHEHEJEHEHEJEHEJEHEJEHEJGHEJEHEJEHGJEJEJEHEJGJEHEJEJEHEJEJEJEJEJGJEJEJEJEJEJEJELEJCJEJEJELEJEJCJELEJEJCLEJEJCLEJEJCLEJELCJEJCJELEJCJEJELCJEJELCJEJEJEJEJCJEJELEJEJEJEHCJEJEJEJEJEJEJEJEHEJEJEJEHEJEJEJGJEJGLGLIPIPOXOZO\\Wd@_@v@KTCBCDADCDCDCDCFCDCFCDEHCFEFCFEHEHEFEJEHEHGJEJGHEJGHCFEHEFEFCFEFEFCDEFCFEDCFEDEFEFCDEFEDEFEDEFEDEFEDEFEDEDEDEFEDEDGDEDEDEDEBGDEDEDEBGDEBEDGBEDEBGBEDGBEBGDEBGBEBGBGDEBGBGBGBEBGDGBGBGBGBGBGBEBGBGBGBGBGDGBGBGBGBGBGBGBGBGBG@GBIBGBGBGBGBGBGBG@GBGBGBG@GBGBG@GBGBG@GBGBGBG@GBGBG@GBEBG@GBEBGBG@GBEBGBEBGBE@GBEBGBEBGBEBGBEBGBEDGBEBGDGBGBGDEBGDGBGDGDGDGBGDGDGDGBGDGDGDEBGDGBGDGDEBGDGBEDGBEDGBGDEBGDEBEBGBEDEBGBEBEBEDGBEBEBEBEBEBEBEBEBEBE@EBEBEBEBEBEBE@EBEBCBEBEBE@EBCBEBEBCBEBE@CBEBEBCBCBEBC@EBCBCBCBCBE@CBCBCBCBA@CBCBC@CBABC@CBA@CBA@CBA@CBA@CBA@A@CBA@A@CBA@A@CBA@A@CBA@CBA@CBA@CBCBA@CBC@CBCBCBC@CBCBCBCBEBCBEBCBEBEBEBEBGBEBEDGBGBEBGBGBGBGBGBGBEBGBGBG@GBGBG@GBG@GBGBE@GBG@GBG@GBG@G@GBG@GBG@GBG@GBE@GBGBG@GBG@GBG@GBGBG@GBGBG@GBGBG@GBGBG@IBGBGBG@GBIBGBGBI@GBIBGBGBGBG@GBGBGBIBG@GBEBGBGBG@GBEBGBG@GBEBGBGBE@GBGBGBEBGBGBGBGBGBGBG@GBGDGBGBGBGBGBGBGBGBGDGBGBGBGDGBGBGDGBGDGBGDGBIDGBGDGDGBGDEDGBGDGDGDGDGBGDGDGDGDGDGDGBGDGDGDEDGDGDGBGDGDGDGDGDEBGDGDGBGDGDGBGDGBEDGBGBGDGBEBGBEBGBGBE@GBEBE@GBE@EBE@G@EBE@E@E@G@E@EBE@E@E@G@E@E?E@E@G@E@E@E@G@E?E@G@E@E@E@E?G@E@E@E@E@E@E?E@E@E@E@C@E@E@E@C@E@C@E?C@C@C@E@C@C@C@C@C?C@C@A@C@C@C?A@C@C@A?C@C@A@C?A@C@C@A?C@A@C?C@A@C@A?C@C?A@C@C?A@C@C?C@A?C@C?C@C@C?C@E?C?C@C?C@E?C?C?E@C?C?E?C?C?CAE?C?C?EAC?CAC?EACACAEACACACACACACACACACCCAAACAAACAAACAA?AAAACAAAAAA?AAAAAAA?AAAAAAA??AA?AAAA??AAAAA??AA?AA??AA??AA??A??AA??AA????AA???AA????AA??????AA????A??A??A????AA??????AA???????A???????????A??A????A?????A?????A???A???A?A???A?A?A?A?A@A?A?A?A?C?A@C?C?C@C?C@C@E?E@E@EBG@G@GDIBIBIBIDGBGDGBGBGBEBEBGBEBE@EDGBEBEBEBEBEBEBCBEBCDEBCBCBCBCBCBCDCBCBCBCBADCBCBABCDABCDABCBADCBCDADCBADCDABCDADCDABCDADCDCDADCDADCDCDCDADCDCDCDCDCDCDCDCDEDCDCDEDCDEDEDCDEDEBEDEDEDEBEDEDGBEDEBGDEBGBEDGBGBEBGBGBEBGBGBEBGBEBGBGBEBG@GBEBGBEBG@EBGBGBE@GBEBG@EBEBGBE@GBEBGBE@GBEBE@GBEBEBG@EBGBEBGBE@GBEBGBEBGBGBGBEBGBGBGBGBGBGBGBGBGBGBGBEDGBGBGBGBGBGBGBGDGBGBGBGDGBGBEBGDGBEBEBGDEBEBEBCDEBEBCBEBCBCBCBCBCBABCBCBABCBCBABCBABCBABABCBADCBADABCDABADCDADABCFADCDADAFCDAFCFAFCFAHCFAFCHAHCFCHAHCHCHAHCHCHAHCHCFAHCHCHCFCHCFCFCFCFCHCFCDCFCFEFCDCFCDEDCDCFEDCDEBEDCDEDCBEDEBEDEBCBEDEBEBGDEBEBEBEBGBEBEBGBEBEBGBEBEBGBGBEBGBEBGBGBEBGBGBGBEBGDGBGBGBGBGBGDGBGBIBGDGBGBGDGBGBGBIBGDGBGBGBGDGBGBGBGBEBGDGBGBGBGBGDGBGBGBGBGDGBGBGDGBGBGBGDGBGBGDIBGBGDGBGBGDGBGBIDGBGBGBGDGBGBGBGDGBGBGBGDGBGBGBGBGDGBGBGBGBGDGBGBGDEBGBGBGDGBGBGDGBGDGBEBGDGBGBGDGBEDGBGDGBEDGBGBGDEBGDGBEDGBGDEBGDGBGDEBGDGDEBGDGBGDEBGDGDGBEDGBGDGDGBGDGBGDEBGDGDIBGDGBGDGDGBGDIBGDGBIDGBGDIBGDGBIDGBGDIBGDIBGBGDIBGBGDIBGBIDGBGBIDGBGBIBGDGBIBGBGDIBGBGBGDIBGBGBGBGBIDGBGBGBGBIBGDGBGBGBGBIBGBGBGBGBIBGDGBGBGBIBGBGBG@GBGBGBGBIBGBG@GBGBGBGBG@GBGBG@GBGBGBG@GBGBE@GBGBG@EBG@GBGBE@GBEBG@GBE@GBEBG@EBGBE@GBEBG@EBGBEBGBGBE@GBGBEBGBGBEBGBGBGBEBGDGBGBGBGBGBGDGBGBGBGDGBGBGDGBGDIBGBGDIBGDGBGDIBGDGBIDGDIBGDGBIDGDIBGDGDIBGDIDGBGDIDGBIDGDGDIBGDIDGDIDGDGBIDGDIDGDIDGDIDGDGDIDGDIDGDIFGDIDGDGDIFGDIDGFGDIFIDGFGDGFIFGDGFGDGFGDGFEDGFGDGFEFGDEFGDEFGDEFEDGFEFEDGFEFEDGFEFEFGFEDEFEFGFEFEFEFGFEFEFGDEFEFGFEFEHGFEFGFEFGFGHEFGFGFGHEFGFGFGFGHGFGFEFGFGFGFIHGFGFGFGFGFGFGFGFGFIFGFGFGFIFGFGFIFGFIFGFIFGFGFIFGHIFIFGFIFIFGHIFGFIFGFIFGFIFGFIFGFIFGFIFGFIFGFGFIFGFIDGFGFIFGFGFIFGFGFIFGDIFGFGFIFGFIFGFGFIFGFIFGFIFGFIFGFIFGHIFGFIFIFGFIHGFIFIFGFIHIFGFIFGFIHGFIFIFGHIFIFGHIFGFIFGHIFIFGHIFGHIFGHIFGHIFGHGHIFGHIHGHGFIHGHGHIHGHGHIHGHGHGHGHGHIHGHGHGJGHIHGHGHGHGHGHGHIHGJGHGHGHGFGHGHGFEHGFGHGFEHGFEFGFEFEFGFEFEFGFEDEFEFEDEFEFEDEFEDEFEDEFEDEFEDEFEDCDEFEDEDCDEFEDEDCDEDCDEDEDCDEDCDEDEDCDEDCDEDCDEDCDEBCDCDCDCBCDCBCDCBCDCBABCBCBABCBABCBABABABC@ABABA@ABA@ABA@?@ABA@A@?@A@A@?@A@AB?@A@A@?@A@ABA@A@?BA@ABA@ABABA@ABABABA@ABABADABCBABADCDABCDADCDCDCFCFCDCFCFEFCFEFCHEFCFEHCFEHEFCFEHEFEHCFEHEFEHCFEHEHEFEHEHEFCHEHEFEHEHEFEHEHEHEHEFEHEHEHEHEFEHEHEHEHEHEHEHEHEFGJEHEHEHEHGHEHEHEHGHEJEHGHEHEHEHGHEHEHEHGHEJEHEHGFEHEHEHEHGHEHEHEHEHEHEFGHEHEHEFEHEHEHEFEHEFEHEHCFEHEFEHEFEFEHCFEFEFEFCFEFEFEFCFEFCFEDEFCFEDEFCDEDEFCDEDEDCDEDEDCBEDEDCBEDEBEDCBEBEBEBEBEBCBEBE@EBE@CBE@E@EBE@E@E@E@E@C@E@E@E@E@E@E@E@E?E@E@E@C@E?E@E@C@E?E@C@E@C?E@C@E@C?C@E@C@E@C@C?E@C@C@E@C@C@C@E@C@C@E@C@C@C@EBC@E@C@C@EBE@CBE@CBE@EBEBC@EBEBEBEBEBEDEBEBEBEDEBEDEBEDEDEDEBEDEDEDEDEDEFEDEDEFEDEDEFCDEDEFCDEFEFEDCFEFCDEFCFEDCFEFCFEFCDEFCFCFEFCDCFEFCFEFCFCFEFCDCFEFCFCFEFCFCFEFCFEFCFCFEFCFEFCFEFCHEFEFCFEHCFEFEHCFEFEHCFEFEHCFEFCFEHEFCFEFCHEFCFEFCFEFEHCFEFCFCFEFCDCFEFCFEFCFCFCDEFCFCFCDEFCFCDCFCDCFCDEFCDCFCDCFCDCFCDCFCDCFCDCFCDCDCFCDCDCFCDCDADCDCDCDADCDCDABCDCDABCDABCDABCDABABCBADABCBABABABCBABABABABCBABABABA@ABABABABABC@ABABABABABABABA@ABCBABABABABABABADABCBABABABADABABABADCBABADABABADABADABABADABABABADAB?BABABADAB?BABAB?BABAB?BAB?BABAB?@AB?BAB?B?BAB?BAB?@?BAB?BAB?B?BAB?B?BAB?D?B?BAD?B?DAD?B?DAD?D?D?DAD?F?D?FAD?F?F?FAF?D?H?FAF?H?F?FAH?F?HAF?H?HAF?HAF?H?FAH?FAHAF?HAFAF?HAFAFAHAFAFAHAFAFAFAHAFCFAFAFCFAFAFCFCFAFCDAFCFCFCFAFCFCDCFCFCDCFCDCFCDCFCDCDCFCDCDCDADCDCDCDCDCDCDCDCDCFCDCDCDCDCDCFCDCDEFCDCFCDCFEFCDCFEFCFCFEDCFCFEFCFCFEFCFCFEFCFEDCHCFEFCFEFCFEFCFEFCFEHEFCFEFEHCFEFEHCFEHEFEHEFEHCHEFEHEFEHCFEHEFEHEHCFEHEFEHCFEHEHEFCHEFEHEHCFEHEFEHCFEHEFCHEHEFEHCFEHEFEHCFEFEHCFEHEFCFEFCHEFEFCFEFCFEFCFEDCFCFEFCDCFEFCDCFEDCFCFEDCFEFCFEFCFEFCFEFCFEFEFCFEHEFCFEFEHCFEFCHEFEFCFEHCFEFCFEHCFEFCFEFCHEFCFEFCFEFCFEFCFEFEFCFEFEFCFEFEFEFEFCFEFEFEFEFEFEFEFCFEFEFEFEFCFEFEFEDCFEFCFEFEFCFEFEDCFEFCFEFCFEFCFEFEFCFEFCFEFEFCFEFCFEFEFCFEFCFEFCFEFCFCFEFCFEFCDCFCFEFCDCFCFCFEDCFCFCDCFCFCFCDCFCFCFCFCFCFCFCFCFAFCFCHCFCFCFCHAFCHCHCFCHCHCHAHCHCHCJCHCHAJCHCJCJCHCJCJAJCJCJCJCJCJCJAJCJCJCLCJCJCJALCJCLCJCLCJCJCLAJCJCLCJCLCJCLAJCLCJCLCJCLCJALCJCJCLCJAJCJCLCJAJCLCJCJAJCJCJAJCJCJAJCJCJCJAJCJCJAJCJCJCJAJCJCJCJALCJCJCJAJCJCLCJCJAJCJCJCLAJCJCJCLCJAJCJCLCJAJCJCLCJCLAJCJCJCLAJCJCJCJALCJCJCLAJCJCJCJAJCLCJCJAJCLCJAJCJCJCJAJCLCJCJAJCJCLCJAJCJCLCJCJAJCJCLCJAJCJCJCJALCJCJCLAJCJCJCJCLAJCJCLCJCJAJCLCJCJAJCJCLCJAJCJCLCJAJCJCLCJAJCJCJALCJCJCJAJCJCJALCJCJCJAJCJCJCJALCJCJCJCJAJCJCJCJCJAJCLCJCJCJCJAJCJCJCJCJCHCLCJAJCJCHCJCJCJAJCJCJCJCJCJAJCJCJCJCJAJCJCJCJAJCJCHCJAJCJCJCJAJCJCJCJAHCJCJAJCJCJCJCJAJCHCJCJAJCJCJCJCJAJCJCJCJCJCJAJCJCJCLCJCJAJCJCJCJCJAJCJCJCJCJCJCJAJCJCJCJCJCJCJCJAJCLCJCJCJCJCJCJCLAJCJCJCJCJCLCJCJCLCJAJCLCJCJCJCJCLAJCLCJCJCJALCJCJCJCLAJCJCLCJAJCJCJALCJCJAJCLCJAJCJCJAJCJALCJCJAJCLAJCJAJCJAJCLAJCJCLAJCJAJCLAJCLAJCJALCJAJCLAJCJALCJAJCJALCJCJAJCLCJAJCJAJCJCLCJAJCJCJAJCJCJAJCJCLCJAJCJCJAJCJCJAJCJCJAJCJCJAJCJCJAHCJALCJCJAJCJAJCJCJALCJAJCJCJAJCLAJCJCJAJCJALCJCJALCJAJCJCLAJCJALCJCLAJCJCLAJCLCJCJALCLCJALCJCLCLAJCLCLCJCLALCLCJCLCLAJCLCLCJALCLCLCJCLALCJCLCLAJCLCLCLALCJCLCLAJCLCLCLALCJCLCLALCJCLCLAJCLCLCLCLAJCLCLCJCLCLCLALCJCLCLCLCLCJCLCLCLCLCJCLCLCJCLCLCJCLCLCLCJCLCJALCLCJCLCJCLCJCLCJCLCJCLCJCLCJCLCLCJCLCJCLCJCLCJCLEJCLCJCLCJCLCJCLCJCJCLCLCJCLCJCLCJCLCLCJCLCLCJCLCJCLCLCJCLCJCLCLCLCJCLCLCJALCLCJCLCLCLCJCLCLCJCLCJCLCLCLAJCLCJCLCLCLAJCLCJCLCLAJCLCJCLCJALCJCLCLCJALCJCLCJCLAJCJCLCLCJCLAJCJCLCJCLCJCLCLAJCLCJCLCLCJCLCJCLCLCJCLAJCLCJCJCLCJCLCJCLCJCJAJCLCJCJCJCJCJCLCHCJCJCJCHCJCHEJCHCHCHCHCHEFCHCFCFEHCFEFCFEDCFEDCDEFEDEDGFGDIHIFIFGFGFEDGDCBEDEBCBC@ABC@ABC@A@A@A@A@A@A@??A@A@??A@??A??@A????@A????@A???????A@??????????????????A@???????????????????????????????????????@?????????@???@A@?D?@A@?@?@?????@???????@A??????@?????@A??@???@?@A@???@A@?@?BA@?@A@?BAB?@AB?BABAD?BADADAFADAFAHAFAJAHCLCLALCJAJCJAJCJALCJAJALCJAHAJAHAJ?JAHAJAJ?JAJAJ?JAJ?JAJ?J?JAJ?L?JAJ?J?L?JAL?J?L?J?LAL?L?J?LAJ?L?LAJ?LAL?LAJ?LALAL?JALALALALAJALALAJALALCJALALCJALCLAJCLALCJCLAJCLCLCJCLCJALCLCJCLCJCLCLCJCLCLCJCLCJELCLCJCLCLCLCJCLCLCLCJCLCLCLCLCJCLCLCLELCJCLCLCLCLCLCJCLCLCLCJCLCLCLCJCLCLCJELCJCLCLCJCLCLCJCLCJCLCLCJCLCJALCLCJCLCJALCJCLALCJCLCLAJCLCJALCLCJALCLCLCLALCJCLCLCLALCLCLCLCLCLCJCLCLCLCLCJCLCLCLCJCLCLCJCLCLCJCLCLELCJCLCJCLCLCJCLCJCLCLCLCJCLCLCJCLCLCJCLCLCJELCLCJCLCLCJCLCLCLCJELCJCLCLCJELCLCLCJELCLCJELCJCLELCJCLELCJELCJCLEJCLCLEJCLELCJCLEJCLCLEJCLCJELCLCLEJCLCLELCJCLCLELCLCJCLCLELCJCLCLCLCLELCLCJCLCLCLELCLCLCLCLELCLCLCLCJCLCLCLELCLCLCLCLCLCLELCLCJCLCLCLCLCLCLCJCLELCLCLCJCLCLCJCLCLCJCLCLCJCLCLCJCLCJCLCJALCJCLCLCJCJCLCJCLCJCLCJALCJCLCJCJCJCJCJAJCJCJCJCJCHCJCHCJCHAHCHCJCHCFCHCHCFCFCHCFCFCFCFCFCDCFCDCDCFCDCDCDCDCBCDCDEBCDCBCBEDCBEBCBEBCBEBEBEBEBE@EBEBE@G@EBE@G@G@E@G@G@G@G?G@G?G@G?G?G@G?I?G?I?G?G?I?G?I?G?I?G?IAG?I?I?G?I?G?IAG?I?I?I?G?I?I?G?IAI?K?I?K?K?I?K?I?I?G?G?E?GAE?E?E?E?E?C?C?E?A?",
      precision: 6
    }
  end
end
