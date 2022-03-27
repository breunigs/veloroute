defmodule Data.AutoGenerated.Video.Rendered_327f571058c788d6c7652aa7ee915255 do
  @moduledoc "#{"freizeitroute-4: Walter-Hammer-Weg Richtung Osten (Nebenstrecke FR4)"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "freizeitroute-4: Walter-Hammer-Weg Richtung Osten (Nebenstrecke FR4)"
  end

  @impl Video.Rendered
  def hash() do
    "327f571058c788d6c7652aa7ee915255"
  end

  @impl Video.Rendered
  def length_ms() do
    120_872
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2021-04-25-freizeitroute4/GX011401", "00:04:34.941", :end},
      {"2021-04-25-freizeitroute4/GX021401", :start, "00:01:16.743"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.516811,
      maxLon: 10.163794,
      minLat: 53.508814,
      minLon: 10.133107965034966
    }
  end

  @impl Video.Rendered
  def renderer() do
    1
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.5167613046953, lon: 10.133107965034966, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.51679, lon: 10.133143, time_offset_ms: 334},
      %Video.TimedPoint{lat: 53.516811, lon: 10.133211, time_offset_ms: 668},
      %Video.TimedPoint{lat: 53.5168, lon: 10.133289, time_offset_ms: 1001},
      %Video.TimedPoint{lat: 53.51643, lon: 10.134073, time_offset_ms: 3671},
      %Video.TimedPoint{lat: 53.516062, lon: 10.134813, time_offset_ms: 6674},
      %Video.TimedPoint{lat: 53.515925, lon: 10.135038, time_offset_ms: 7675},
      %Video.TimedPoint{lat: 53.515831, lon: 10.135224, time_offset_ms: 8342},
      %Video.TimedPoint{lat: 53.515685, lon: 10.13553, time_offset_ms: 9343},
      %Video.TimedPoint{lat: 53.51564, lon: 10.135646, time_offset_ms: 9677},
      %Video.TimedPoint{lat: 53.515568, lon: 10.135889, time_offset_ms: 10344},
      %Video.TimedPoint{lat: 53.515546, lon: 10.135981, time_offset_ms: 10678},
      %Video.TimedPoint{lat: 53.515498, lon: 10.136272, time_offset_ms: 13347},
      %Video.TimedPoint{lat: 53.515469, lon: 10.136347, time_offset_ms: 14014},
      %Video.TimedPoint{lat: 53.515458, lon: 10.1365, time_offset_ms: 14682},
      %Video.TimedPoint{lat: 53.515368, lon: 10.136939, time_offset_ms: 16016},
      %Video.TimedPoint{lat: 53.51524, lon: 10.137675, time_offset_ms: 18018},
      %Video.TimedPoint{lat: 53.515158, lon: 10.137949, time_offset_ms: 19019},
      %Video.TimedPoint{lat: 53.515079, lon: 10.138121, time_offset_ms: 19687},
      %Video.TimedPoint{lat: 53.51503, lon: 10.138194, time_offset_ms: 20020},
      %Video.TimedPoint{lat: 53.514974, lon: 10.138251, time_offset_ms: 20354},
      %Video.TimedPoint{lat: 53.514838, lon: 10.138311, time_offset_ms: 21021},
      %Video.TimedPoint{lat: 53.514776, lon: 10.138372, time_offset_ms: 21355},
      %Video.TimedPoint{lat: 53.514604, lon: 10.138606, time_offset_ms: 22356},
      %Video.TimedPoint{lat: 53.514474, lon: 10.138716, time_offset_ms: 23023},
      %Video.TimedPoint{lat: 53.514108, lon: 10.138971, time_offset_ms: 24692},
      %Video.TimedPoint{lat: 53.514035, lon: 10.139008, time_offset_ms: 25025},
      %Video.TimedPoint{lat: 53.513965, lon: 10.139025, time_offset_ms: 25359},
      %Video.TimedPoint{lat: 53.513895, lon: 10.139022, time_offset_ms: 25693},
      %Video.TimedPoint{lat: 53.513829, lon: 10.138994, time_offset_ms: 26026},
      %Video.TimedPoint{lat: 53.513762, lon: 10.138939, time_offset_ms: 26360},
      %Video.TimedPoint{lat: 53.513541, lon: 10.138667, time_offset_ms: 28696},
      %Video.TimedPoint{lat: 53.513374, lon: 10.138548, time_offset_ms: 30364},
      %Video.TimedPoint{lat: 53.513326, lon: 10.138519, time_offset_ms: 30698},
      %Video.TimedPoint{lat: 53.513275, lon: 10.138519, time_offset_ms: 31031},
      %Video.TimedPoint{lat: 53.513223, lon: 10.138553, time_offset_ms: 31365},
      %Video.TimedPoint{lat: 53.513173, lon: 10.138616, time_offset_ms: 31699},
      %Video.TimedPoint{lat: 53.513128, lon: 10.138713, time_offset_ms: 32032},
      %Video.TimedPoint{lat: 53.512884, lon: 10.139291, time_offset_ms: 33701},
      %Video.TimedPoint{lat: 53.512786, lon: 10.139548, time_offset_ms: 34368},
      %Video.TimedPoint{lat: 53.512709, lon: 10.13982, time_offset_ms: 35035},
      %Video.TimedPoint{lat: 53.512651, lon: 10.139942, time_offset_ms: 35369},
      %Video.TimedPoint{lat: 53.512206, lon: 10.141053, time_offset_ms: 38372},
      %Video.TimedPoint{lat: 53.512155, lon: 10.141169, time_offset_ms: 38706},
      %Video.TimedPoint{lat: 53.511986, lon: 10.141477, time_offset_ms: 39707},
      %Video.TimedPoint{lat: 53.511935, lon: 10.141588, time_offset_ms: 40040},
      %Video.TimedPoint{lat: 53.511892, lon: 10.141714, time_offset_ms: 40374},
      %Video.TimedPoint{lat: 53.511787, lon: 10.142135, time_offset_ms: 41709},
      %Video.TimedPoint{lat: 53.511725, lon: 10.142336, time_offset_ms: 42376},
      %Video.TimedPoint{lat: 53.511617, lon: 10.142859, time_offset_ms: 44044},
      %Video.TimedPoint{lat: 53.511581, lon: 10.142987, time_offset_ms: 44129},
      %Video.TimedPoint{lat: 53.511571, lon: 10.143033, time_offset_ms: 44463},
      %Video.TimedPoint{lat: 53.511554, lon: 10.143113, time_offset_ms: 44796},
      %Video.TimedPoint{lat: 53.511545, lon: 10.143196, time_offset_ms: 45130},
      %Video.TimedPoint{lat: 53.511539, lon: 10.143298, time_offset_ms: 45464},
      %Video.TimedPoint{lat: 53.511521, lon: 10.143411, time_offset_ms: 45797},
      %Video.TimedPoint{lat: 53.5115, lon: 10.143503, time_offset_ms: 46131},
      %Video.TimedPoint{lat: 53.511482, lon: 10.143564, time_offset_ms: 46465},
      %Video.TimedPoint{lat: 53.511472, lon: 10.143609, time_offset_ms: 46798},
      %Video.TimedPoint{lat: 53.511467, lon: 10.143667, time_offset_ms: 47132},
      %Video.TimedPoint{lat: 53.511457, lon: 10.143752, time_offset_ms: 47466},
      %Video.TimedPoint{lat: 53.511436, lon: 10.14386, time_offset_ms: 47799},
      %Video.TimedPoint{lat: 53.51141, lon: 10.14398, time_offset_ms: 48133},
      %Video.TimedPoint{lat: 53.511386, lon: 10.144103, time_offset_ms: 48467},
      %Video.TimedPoint{lat: 53.511361, lon: 10.144222, time_offset_ms: 48800},
      %Video.TimedPoint{lat: 53.511341, lon: 10.144315, time_offset_ms: 49134},
      %Video.TimedPoint{lat: 53.511329, lon: 10.144378, time_offset_ms: 49468},
      %Video.TimedPoint{lat: 53.511321, lon: 10.144419, time_offset_ms: 49801},
      %Video.TimedPoint{lat: 53.511308, lon: 10.144478, time_offset_ms: 50135},
      %Video.TimedPoint{lat: 53.511292, lon: 10.144564, time_offset_ms: 50469},
      %Video.TimedPoint{lat: 53.511273, lon: 10.144671, time_offset_ms: 50802},
      %Video.TimedPoint{lat: 53.511248, lon: 10.144784, time_offset_ms: 51136},
      %Video.TimedPoint{lat: 53.511232, lon: 10.144908, time_offset_ms: 51470},
      %Video.TimedPoint{lat: 53.511229, lon: 10.145042, time_offset_ms: 51803},
      %Video.TimedPoint{lat: 53.511232, lon: 10.145176, time_offset_ms: 52137},
      %Video.TimedPoint{lat: 53.511236, lon: 10.145312, time_offset_ms: 52471},
      %Video.TimedPoint{lat: 53.511239, lon: 10.145464, time_offset_ms: 52804},
      %Video.TimedPoint{lat: 53.511239, lon: 10.145634, time_offset_ms: 53138},
      %Video.TimedPoint{lat: 53.511238, lon: 10.14579, time_offset_ms: 53472},
      %Video.TimedPoint{lat: 53.511237, lon: 10.145935, time_offset_ms: 53805},
      %Video.TimedPoint{lat: 53.511235, lon: 10.146079, time_offset_ms: 54139},
      %Video.TimedPoint{lat: 53.511232, lon: 10.146223, time_offset_ms: 54473},
      %Video.TimedPoint{lat: 53.511229, lon: 10.146365, time_offset_ms: 54806},
      %Video.TimedPoint{lat: 53.511225, lon: 10.146493, time_offset_ms: 55140},
      %Video.TimedPoint{lat: 53.511224, lon: 10.146625, time_offset_ms: 55474},
      %Video.TimedPoint{lat: 53.511228, lon: 10.146763, time_offset_ms: 55807},
      %Video.TimedPoint{lat: 53.511223, lon: 10.146886, time_offset_ms: 56141},
      %Video.TimedPoint{lat: 53.511217, lon: 10.147, time_offset_ms: 56475},
      %Video.TimedPoint{lat: 53.511213, lon: 10.147095, time_offset_ms: 56808},
      %Video.TimedPoint{lat: 53.511212, lon: 10.147172, time_offset_ms: 57142},
      %Video.TimedPoint{lat: 53.511216, lon: 10.147233, time_offset_ms: 57476},
      %Video.TimedPoint{lat: 53.511217, lon: 10.147278, time_offset_ms: 57809},
      %Video.TimedPoint{lat: 53.511216, lon: 10.147311, time_offset_ms: 58143},
      %Video.TimedPoint{lat: 53.511213, lon: 10.147348, time_offset_ms: 58477},
      %Video.TimedPoint{lat: 53.511215, lon: 10.147397, time_offset_ms: 58810},
      %Video.TimedPoint{lat: 53.511216, lon: 10.147436, time_offset_ms: 59144},
      %Video.TimedPoint{lat: 53.511214, lon: 10.147483, time_offset_ms: 59478},
      %Video.TimedPoint{lat: 53.51121, lon: 10.147536, time_offset_ms: 59811},
      %Video.TimedPoint{lat: 53.511207, lon: 10.147581, time_offset_ms: 60145},
      %Video.TimedPoint{lat: 53.511197, lon: 10.147616, time_offset_ms: 60479},
      %Video.TimedPoint{lat: 53.511187, lon: 10.147649, time_offset_ms: 60812},
      %Video.TimedPoint{lat: 53.511184, lon: 10.147693, time_offset_ms: 61146},
      %Video.TimedPoint{lat: 53.511183, lon: 10.147738, time_offset_ms: 61480},
      %Video.TimedPoint{lat: 53.51119, lon: 10.147802, time_offset_ms: 61813},
      %Video.TimedPoint{lat: 53.511187, lon: 10.147908, time_offset_ms: 62147},
      %Video.TimedPoint{lat: 53.511173, lon: 10.148027, time_offset_ms: 62481},
      %Video.TimedPoint{lat: 53.511167, lon: 10.148152, time_offset_ms: 62814},
      %Video.TimedPoint{lat: 53.511163, lon: 10.148281, time_offset_ms: 63148},
      %Video.TimedPoint{lat: 53.511158, lon: 10.148412, time_offset_ms: 63482},
      %Video.TimedPoint{lat: 53.511161, lon: 10.148542, time_offset_ms: 63815},
      %Video.TimedPoint{lat: 53.511162, lon: 10.148671, time_offset_ms: 64149},
      %Video.TimedPoint{lat: 53.51115, lon: 10.1488, time_offset_ms: 64483},
      %Video.TimedPoint{lat: 53.511136, lon: 10.148931, time_offset_ms: 64816},
      %Video.TimedPoint{lat: 53.51113, lon: 10.149061, time_offset_ms: 65150},
      %Video.TimedPoint{lat: 53.511124, lon: 10.149196, time_offset_ms: 65484},
      %Video.TimedPoint{lat: 53.511119, lon: 10.149328, time_offset_ms: 65817},
      %Video.TimedPoint{lat: 53.511116, lon: 10.14946, time_offset_ms: 66151},
      %Video.TimedPoint{lat: 53.511114, lon: 10.149592, time_offset_ms: 66485},
      %Video.TimedPoint{lat: 53.511111, lon: 10.149724, time_offset_ms: 66818},
      %Video.TimedPoint{lat: 53.511103, lon: 10.149855, time_offset_ms: 67152},
      %Video.TimedPoint{lat: 53.511098, lon: 10.149986, time_offset_ms: 67486},
      %Video.TimedPoint{lat: 53.511094, lon: 10.150108, time_offset_ms: 67819},
      %Video.TimedPoint{lat: 53.511097, lon: 10.150228, time_offset_ms: 68153},
      %Video.TimedPoint{lat: 53.511106, lon: 10.150347, time_offset_ms: 68487},
      %Video.TimedPoint{lat: 53.51111, lon: 10.150463, time_offset_ms: 68820},
      %Video.TimedPoint{lat: 53.511103, lon: 10.150583, time_offset_ms: 69154},
      %Video.TimedPoint{lat: 53.5111, lon: 10.150707, time_offset_ms: 69488},
      %Video.TimedPoint{lat: 53.5111, lon: 10.15084, time_offset_ms: 69821},
      %Video.TimedPoint{lat: 53.511096, lon: 10.150977, time_offset_ms: 70155},
      %Video.TimedPoint{lat: 53.511094, lon: 10.151109, time_offset_ms: 70489},
      %Video.TimedPoint{lat: 53.511091, lon: 10.151244, time_offset_ms: 70822},
      %Video.TimedPoint{lat: 53.511086, lon: 10.151376, time_offset_ms: 71156},
      %Video.TimedPoint{lat: 53.511087, lon: 10.151513, time_offset_ms: 71490},
      %Video.TimedPoint{lat: 53.511085, lon: 10.151648, time_offset_ms: 71823},
      %Video.TimedPoint{lat: 53.511083, lon: 10.151788, time_offset_ms: 72157},
      %Video.TimedPoint{lat: 53.511084, lon: 10.15192, time_offset_ms: 72491},
      %Video.TimedPoint{lat: 53.511084, lon: 10.152042, time_offset_ms: 72824},
      %Video.TimedPoint{lat: 53.51108, lon: 10.152159, time_offset_ms: 73158},
      %Video.TimedPoint{lat: 53.511072, lon: 10.152286, time_offset_ms: 73492},
      %Video.TimedPoint{lat: 53.511062, lon: 10.152421, time_offset_ms: 73825},
      %Video.TimedPoint{lat: 53.511059, lon: 10.15256, time_offset_ms: 74159},
      %Video.TimedPoint{lat: 53.511056, lon: 10.152709, time_offset_ms: 74493},
      %Video.TimedPoint{lat: 53.511056, lon: 10.152851, time_offset_ms: 74826},
      %Video.TimedPoint{lat: 53.511053, lon: 10.152991, time_offset_ms: 75160},
      %Video.TimedPoint{lat: 53.511052, lon: 10.15311, time_offset_ms: 75494},
      %Video.TimedPoint{lat: 53.511051, lon: 10.153229, time_offset_ms: 75827},
      %Video.TimedPoint{lat: 53.511051, lon: 10.15334, time_offset_ms: 76161},
      %Video.TimedPoint{lat: 53.511045, lon: 10.153466, time_offset_ms: 76495},
      %Video.TimedPoint{lat: 53.511043, lon: 10.153594, time_offset_ms: 76828},
      %Video.TimedPoint{lat: 53.511042, lon: 10.153718, time_offset_ms: 77162},
      %Video.TimedPoint{lat: 53.511041, lon: 10.153842, time_offset_ms: 77496},
      %Video.TimedPoint{lat: 53.511041, lon: 10.153964, time_offset_ms: 77829},
      %Video.TimedPoint{lat: 53.511043, lon: 10.154082, time_offset_ms: 78163},
      %Video.TimedPoint{lat: 53.511037, lon: 10.154191, time_offset_ms: 78497},
      %Video.TimedPoint{lat: 53.511026, lon: 10.154288, time_offset_ms: 78830},
      %Video.TimedPoint{lat: 53.511014, lon: 10.154368, time_offset_ms: 79164},
      %Video.TimedPoint{lat: 53.511008, lon: 10.154437, time_offset_ms: 79498},
      %Video.TimedPoint{lat: 53.511007, lon: 10.1545, time_offset_ms: 79831},
      %Video.TimedPoint{lat: 53.511007, lon: 10.15456, time_offset_ms: 80165},
      %Video.TimedPoint{lat: 53.511001, lon: 10.154626, time_offset_ms: 80499},
      %Video.TimedPoint{lat: 53.510996, lon: 10.154686, time_offset_ms: 80832},
      %Video.TimedPoint{lat: 53.510993, lon: 10.15473, time_offset_ms: 81166},
      %Video.TimedPoint{lat: 53.510991, lon: 10.154766, time_offset_ms: 81500},
      %Video.TimedPoint{lat: 53.510989, lon: 10.154797, time_offset_ms: 81833},
      %Video.TimedPoint{lat: 53.510987, lon: 10.154833, time_offset_ms: 82167},
      %Video.TimedPoint{lat: 53.510982, lon: 10.154878, time_offset_ms: 82501},
      %Video.TimedPoint{lat: 53.510979, lon: 10.154924, time_offset_ms: 82834},
      %Video.TimedPoint{lat: 53.510977, lon: 10.154977, time_offset_ms: 83168},
      %Video.TimedPoint{lat: 53.510975, lon: 10.15503, time_offset_ms: 83502},
      %Video.TimedPoint{lat: 53.510974, lon: 10.155079, time_offset_ms: 83835},
      %Video.TimedPoint{lat: 53.510972, lon: 10.155126, time_offset_ms: 84169},
      %Video.TimedPoint{lat: 53.51097, lon: 10.15517, time_offset_ms: 84503},
      %Video.TimedPoint{lat: 53.510968, lon: 10.155212, time_offset_ms: 84836},
      %Video.TimedPoint{lat: 53.510967, lon: 10.155252, time_offset_ms: 85170},
      %Video.TimedPoint{lat: 53.510965, lon: 10.155289, time_offset_ms: 85504},
      %Video.TimedPoint{lat: 53.510964, lon: 10.155323, time_offset_ms: 85837},
      %Video.TimedPoint{lat: 53.510963, lon: 10.155356, time_offset_ms: 86171},
      %Video.TimedPoint{lat: 53.51096, lon: 10.155388, time_offset_ms: 86505},
      %Video.TimedPoint{lat: 53.510958, lon: 10.155423, time_offset_ms: 86838},
      %Video.TimedPoint{lat: 53.510953, lon: 10.155459, time_offset_ms: 87172},
      %Video.TimedPoint{lat: 53.510951, lon: 10.155499, time_offset_ms: 87506},
      %Video.TimedPoint{lat: 53.510949, lon: 10.155539, time_offset_ms: 87839},
      %Video.TimedPoint{lat: 53.510946, lon: 10.155579, time_offset_ms: 88173},
      %Video.TimedPoint{lat: 53.510942, lon: 10.155621, time_offset_ms: 88507},
      %Video.TimedPoint{lat: 53.510941, lon: 10.155665, time_offset_ms: 88840},
      %Video.TimedPoint{lat: 53.510941, lon: 10.155708, time_offset_ms: 89174},
      %Video.TimedPoint{lat: 53.510939, lon: 10.155752, time_offset_ms: 89508},
      %Video.TimedPoint{lat: 53.510941, lon: 10.155802, time_offset_ms: 89841},
      %Video.TimedPoint{lat: 53.510949, lon: 10.155862, time_offset_ms: 90175},
      %Video.TimedPoint{lat: 53.510953, lon: 10.155932, time_offset_ms: 90509},
      %Video.TimedPoint{lat: 53.510952, lon: 10.156013, time_offset_ms: 90842},
      %Video.TimedPoint{lat: 53.510948, lon: 10.156096, time_offset_ms: 91176},
      %Video.TimedPoint{lat: 53.510941, lon: 10.156178, time_offset_ms: 91510},
      %Video.TimedPoint{lat: 53.510934, lon: 10.156268, time_offset_ms: 91843},
      %Video.TimedPoint{lat: 53.510922, lon: 10.156363, time_offset_ms: 92177},
      %Video.TimedPoint{lat: 53.510911, lon: 10.156465, time_offset_ms: 92511},
      %Video.TimedPoint{lat: 53.510899, lon: 10.156566, time_offset_ms: 92844},
      %Video.TimedPoint{lat: 53.510886, lon: 10.156671, time_offset_ms: 93178},
      %Video.TimedPoint{lat: 53.510875, lon: 10.156774, time_offset_ms: 93512},
      %Video.TimedPoint{lat: 53.510867, lon: 10.156878, time_offset_ms: 93845},
      %Video.TimedPoint{lat: 53.510857, lon: 10.156975, time_offset_ms: 94179},
      %Video.TimedPoint{lat: 53.510845, lon: 10.157059, time_offset_ms: 94513},
      %Video.TimedPoint{lat: 53.510832, lon: 10.157149, time_offset_ms: 94846},
      %Video.TimedPoint{lat: 53.510809, lon: 10.157259, time_offset_ms: 95180},
      %Video.TimedPoint{lat: 53.510777, lon: 10.157376, time_offset_ms: 95514},
      %Video.TimedPoint{lat: 53.510747, lon: 10.157486, time_offset_ms: 95847},
      %Video.TimedPoint{lat: 53.510719, lon: 10.15759, time_offset_ms: 96181},
      %Video.TimedPoint{lat: 53.510692, lon: 10.1577, time_offset_ms: 96515},
      %Video.TimedPoint{lat: 53.510663, lon: 10.157809, time_offset_ms: 96848},
      %Video.TimedPoint{lat: 53.510634, lon: 10.157921, time_offset_ms: 97182},
      %Video.TimedPoint{lat: 53.510601, lon: 10.158029, time_offset_ms: 97516},
      %Video.TimedPoint{lat: 53.510571, lon: 10.158121, time_offset_ms: 97849},
      %Video.TimedPoint{lat: 53.510546, lon: 10.158203, time_offset_ms: 98183},
      %Video.TimedPoint{lat: 53.510518, lon: 10.158296, time_offset_ms: 98517},
      %Video.TimedPoint{lat: 53.51049, lon: 10.158395, time_offset_ms: 98850},
      %Video.TimedPoint{lat: 53.510458, lon: 10.158492, time_offset_ms: 99184},
      %Video.TimedPoint{lat: 53.510425, lon: 10.15859, time_offset_ms: 99518},
      %Video.TimedPoint{lat: 53.510397, lon: 10.158683, time_offset_ms: 99851},
      %Video.TimedPoint{lat: 53.510374, lon: 10.158779, time_offset_ms: 100_185},
      %Video.TimedPoint{lat: 53.510349, lon: 10.158874, time_offset_ms: 100_519},
      %Video.TimedPoint{lat: 53.51031, lon: 10.158963, time_offset_ms: 100_852},
      %Video.TimedPoint{lat: 53.510281, lon: 10.159062, time_offset_ms: 101_186},
      %Video.TimedPoint{lat: 53.510253, lon: 10.159164, time_offset_ms: 101_520},
      %Video.TimedPoint{lat: 53.510228, lon: 10.15925, time_offset_ms: 101_853},
      %Video.TimedPoint{lat: 53.510199, lon: 10.159338, time_offset_ms: 102_187},
      %Video.TimedPoint{lat: 53.510163, lon: 10.159431, time_offset_ms: 102_521},
      %Video.TimedPoint{lat: 53.510134, lon: 10.159539, time_offset_ms: 102_854},
      %Video.TimedPoint{lat: 53.510109, lon: 10.159634, time_offset_ms: 103_188},
      %Video.TimedPoint{lat: 53.510084, lon: 10.159729, time_offset_ms: 103_522},
      %Video.TimedPoint{lat: 53.51006, lon: 10.159828, time_offset_ms: 103_855},
      %Video.TimedPoint{lat: 53.510039, lon: 10.159928, time_offset_ms: 104_189},
      %Video.TimedPoint{lat: 53.510027, lon: 10.160024, time_offset_ms: 104_523},
      %Video.TimedPoint{lat: 53.510012, lon: 10.160087, time_offset_ms: 104_856},
      %Video.TimedPoint{lat: 53.509991, lon: 10.160141, time_offset_ms: 105_190},
      %Video.TimedPoint{lat: 53.509963, lon: 10.160207, time_offset_ms: 105_524},
      %Video.TimedPoint{lat: 53.509935, lon: 10.160283, time_offset_ms: 105_857},
      %Video.TimedPoint{lat: 53.509907, lon: 10.160368, time_offset_ms: 106_191},
      %Video.TimedPoint{lat: 53.509877, lon: 10.160461, time_offset_ms: 106_525},
      %Video.TimedPoint{lat: 53.509844, lon: 10.160561, time_offset_ms: 106_858},
      %Video.TimedPoint{lat: 53.509811, lon: 10.160662, time_offset_ms: 107_192},
      %Video.TimedPoint{lat: 53.509774, lon: 10.160753, time_offset_ms: 107_526},
      %Video.TimedPoint{lat: 53.509739, lon: 10.160836, time_offset_ms: 107_859},
      %Video.TimedPoint{lat: 53.509714, lon: 10.160918, time_offset_ms: 108_193},
      %Video.TimedPoint{lat: 53.509696, lon: 10.160994, time_offset_ms: 108_527},
      %Video.TimedPoint{lat: 53.509678, lon: 10.161056, time_offset_ms: 108_860},
      %Video.TimedPoint{lat: 53.509661, lon: 10.161106, time_offset_ms: 109_194},
      %Video.TimedPoint{lat: 53.509641, lon: 10.161143, time_offset_ms: 109_528},
      %Video.TimedPoint{lat: 53.509617, lon: 10.161178, time_offset_ms: 109_861},
      %Video.TimedPoint{lat: 53.509592, lon: 10.161213, time_offset_ms: 110_195},
      %Video.TimedPoint{lat: 53.509565, lon: 10.161253, time_offset_ms: 110_529},
      %Video.TimedPoint{lat: 53.509548, lon: 10.161303, time_offset_ms: 110_862},
      %Video.TimedPoint{lat: 53.509537, lon: 10.161344, time_offset_ms: 111_196},
      %Video.TimedPoint{lat: 53.509527, lon: 10.161382, time_offset_ms: 111_530},
      %Video.TimedPoint{lat: 53.509518, lon: 10.161422, time_offset_ms: 111_863},
      %Video.TimedPoint{lat: 53.509506, lon: 10.161473, time_offset_ms: 112_197},
      %Video.TimedPoint{lat: 53.509493, lon: 10.161529, time_offset_ms: 112_531},
      %Video.TimedPoint{lat: 53.509484, lon: 10.161582, time_offset_ms: 112_864},
      %Video.TimedPoint{lat: 53.509479, lon: 10.161636, time_offset_ms: 113_198},
      %Video.TimedPoint{lat: 53.509465, lon: 10.161695, time_offset_ms: 113_532},
      %Video.TimedPoint{lat: 53.50944, lon: 10.161752, time_offset_ms: 113_865},
      %Video.TimedPoint{lat: 53.509415, lon: 10.161817, time_offset_ms: 114_199},
      %Video.TimedPoint{lat: 53.509393, lon: 10.1619, time_offset_ms: 114_533},
      %Video.TimedPoint{lat: 53.509373, lon: 10.161977, time_offset_ms: 114_866},
      %Video.TimedPoint{lat: 53.509346, lon: 10.162048, time_offset_ms: 115_200},
      %Video.TimedPoint{lat: 53.50932, lon: 10.162127, time_offset_ms: 115_534},
      %Video.TimedPoint{lat: 53.509301, lon: 10.162217, time_offset_ms: 115_867},
      %Video.TimedPoint{lat: 53.50928, lon: 10.162306, time_offset_ms: 116_201},
      %Video.TimedPoint{lat: 53.509255, lon: 10.162391, time_offset_ms: 116_535},
      %Video.TimedPoint{lat: 53.50923, lon: 10.162487, time_offset_ms: 116_868},
      %Video.TimedPoint{lat: 53.509203, lon: 10.162588, time_offset_ms: 117_202},
      %Video.TimedPoint{lat: 53.509171, lon: 10.162689, time_offset_ms: 117_536},
      %Video.TimedPoint{lat: 53.509136, lon: 10.162788, time_offset_ms: 117_869},
      %Video.TimedPoint{lat: 53.509099, lon: 10.16289, time_offset_ms: 118_203},
      %Video.TimedPoint{lat: 53.509062, lon: 10.162998, time_offset_ms: 118_537},
      %Video.TimedPoint{lat: 53.509031, lon: 10.163108, time_offset_ms: 118_870},
      %Video.TimedPoint{lat: 53.508995, lon: 10.163229, time_offset_ms: 119_204},
      %Video.TimedPoint{lat: 53.508955, lon: 10.163349, time_offset_ms: 119_538},
      %Video.TimedPoint{lat: 53.508916, lon: 10.163461, time_offset_ms: 119_871},
      %Video.TimedPoint{lat: 53.508877, lon: 10.163573, time_offset_ms: 120_205},
      %Video.TimedPoint{lat: 53.508844, lon: 10.163687, time_offset_ms: 120_539},
      %Video.TimedPoint{lat: 53.508814, lon: 10.163794, time_offset_ms: 120_872}
    ]
  end
end