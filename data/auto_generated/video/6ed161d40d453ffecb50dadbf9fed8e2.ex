defmodule Data.AutoGenerated.Video.Rendered_6ed161d40d453ffecb50dadbf9fed8e2 do
  @moduledoc "#{"2023-10-29-lenhartzstrasse: Eppendorfer Marktplatz → Schottmüllerstraße → Lenhartzstraße"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2023-10-29-lenhartzstrasse: Eppendorfer Marktplatz → Schottmüllerstraße → Lenhartzstraße"
  end

  @impl Video.Rendered
  def hash() do
    "6ed161d40d453ffecb50dadbf9fed8e2"
  end

  @impl Video.Rendered
  def length_ms() do
    43868
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2023-10-29-lenhart/GX016638", "00:00:09.007", :end},
      {"2023-10-29-lenhart/GX016639", :start, :end},
      {"2023-10-29-lenhart/GX016640", :start, :end},
      {"2023-10-29-lenhart/GX016641", :start, "00:00:09.341"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{minLon: 9.980875, minLat: 53.585001, maxLon: 9.988083, maxLat: 53.592713}
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
      %{timestamp: 0, text: "Martinistraße"},
      %{timestamp: 5104, text: "Schottmüllerstraße"},
      %{timestamp: 20783, text: "Lenhartzstraße"},
      %{timestamp: 43201, text: "Eppendorfer Weg"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.988083, lat: 53.592707, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.987961, lat: 53.592695, time_offset_ms: 334},
      %Video.TimedPoint{lon: 9.987833, lat: 53.592685, time_offset_ms: 667},
      %Video.TimedPoint{lon: 9.987707, lat: 53.592674, time_offset_ms: 1001},
      %Video.TimedPoint{lon: 9.987589, lat: 53.592663, time_offset_ms: 1334},
      %Video.TimedPoint{lon: 9.987478, lat: 53.592669, time_offset_ms: 1668},
      %Video.TimedPoint{lon: 9.987391, lat: 53.592693, time_offset_ms: 2002},
      %Video.TimedPoint{lon: 9.987322, lat: 53.592713, time_offset_ms: 2335},
      %Video.TimedPoint{lon: 9.987254, lat: 53.592712, time_offset_ms: 2669},
      %Video.TimedPoint{lon: 9.987223, lat: 53.592698, time_offset_ms: 3002},
      %Video.TimedPoint{lon: 9.987188, lat: 53.592648, time_offset_ms: 3102},
      %Video.TimedPoint{lon: 9.98718, lat: 53.592642, time_offset_ms: 3436},
      %Video.TimedPoint{lon: 9.987138, lat: 53.592614, time_offset_ms: 3769},
      %Video.TimedPoint{lon: 9.987061, lat: 53.592575, time_offset_ms: 4103},
      %Video.TimedPoint{lon: 9.986962, lat: 53.592529, time_offset_ms: 4436},
      %Video.TimedPoint{lon: 9.986855, lat: 53.592484, time_offset_ms: 4770},
      %Video.TimedPoint{lon: 9.986784, lat: 53.592435, time_offset_ms: 5104},
      %Video.TimedPoint{lon: 9.98672, lat: 53.592377, time_offset_ms: 5437},
      %Video.TimedPoint{lon: 9.98662, lat: 53.592322, time_offset_ms: 5771},
      %Video.TimedPoint{lon: 9.986517, lat: 53.592258, time_offset_ms: 6104},
      %Video.TimedPoint{lon: 9.986425, lat: 53.592185, time_offset_ms: 6438},
      %Video.TimedPoint{lon: 9.986332, lat: 53.592115, time_offset_ms: 6772},
      %Video.TimedPoint{lon: 9.98622, lat: 53.592052, time_offset_ms: 7105},
      %Video.TimedPoint{lon: 9.986106, lat: 53.591989, time_offset_ms: 7439},
      %Video.TimedPoint{lon: 9.986001, lat: 53.591927, time_offset_ms: 7772},
      %Video.TimedPoint{lon: 9.985896, lat: 53.591868, time_offset_ms: 8106},
      %Video.TimedPoint{lon: 9.985789, lat: 53.591807, time_offset_ms: 8440},
      %Video.TimedPoint{lon: 9.985681, lat: 53.591743, time_offset_ms: 8773},
      %Video.TimedPoint{lon: 9.98557, lat: 53.59169, time_offset_ms: 9107},
      %Video.TimedPoint{lon: 9.98547, lat: 53.591635, time_offset_ms: 9440},
      %Video.TimedPoint{lon: 9.98537, lat: 53.591567, time_offset_ms: 9774},
      %Video.TimedPoint{lon: 9.985254, lat: 53.591498, time_offset_ms: 10108},
      %Video.TimedPoint{lon: 9.98514, lat: 53.591428, time_offset_ms: 10441},
      %Video.TimedPoint{lon: 9.985043, lat: 53.591352, time_offset_ms: 10775},
      %Video.TimedPoint{lon: 9.984938, lat: 53.59128, time_offset_ms: 11108},
      %Video.TimedPoint{lon: 9.984825, lat: 53.59121, time_offset_ms: 11442},
      %Video.TimedPoint{lon: 9.984708, lat: 53.591143, time_offset_ms: 11775},
      %Video.TimedPoint{lon: 9.984595, lat: 53.591076, time_offset_ms: 12109},
      %Video.TimedPoint{lon: 9.984499, lat: 53.591006, time_offset_ms: 12443},
      %Video.TimedPoint{lon: 9.984392, lat: 53.590942, time_offset_ms: 12776},
      %Video.TimedPoint{lon: 9.984283, lat: 53.590878, time_offset_ms: 13110},
      %Video.TimedPoint{lon: 9.984174, lat: 53.59081, time_offset_ms: 13443},
      %Video.TimedPoint{lon: 9.984066, lat: 53.590744, time_offset_ms: 13777},
      %Video.TimedPoint{lon: 9.983955, lat: 53.590693, time_offset_ms: 14111},
      %Video.TimedPoint{lon: 9.983868, lat: 53.590635, time_offset_ms: 14444},
      %Video.TimedPoint{lon: 9.983815, lat: 53.590577, time_offset_ms: 14778},
      %Video.TimedPoint{lon: 9.983766, lat: 53.590536, time_offset_ms: 15111},
      %Video.TimedPoint{lon: 9.983731, lat: 53.590515, time_offset_ms: 15445},
      %Video.TimedPoint{lon: 9.983724, lat: 53.590495, time_offset_ms: 15779},
      %Video.TimedPoint{lon: 9.983725, lat: 53.59048, time_offset_ms: 16112},
      %Video.TimedPoint{lon: 9.983723, lat: 53.590477, time_offset_ms: 16446},
      %Video.TimedPoint{lon: 9.983722, lat: 53.590476, time_offset_ms: 16779},
      %Video.TimedPoint{lon: 9.983723, lat: 53.590474, time_offset_ms: 17113},
      %Video.TimedPoint{lon: 9.983723, lat: 53.590472, time_offset_ms: 17447},
      %Video.TimedPoint{lon: 9.983723, lat: 53.59047, time_offset_ms: 17780},
      %Video.TimedPoint{lon: 9.983723, lat: 53.590467, time_offset_ms: 18114},
      %Video.TimedPoint{lon: 9.98373, lat: 53.590455, time_offset_ms: 18447},
      %Video.TimedPoint{lon: 9.983747, lat: 53.590419, time_offset_ms: 18781},
      %Video.TimedPoint{lon: 9.983767, lat: 53.590366, time_offset_ms: 19115},
      %Video.TimedPoint{lon: 9.983789, lat: 53.590305, time_offset_ms: 19448},
      %Video.TimedPoint{lon: 9.983803, lat: 53.590242, time_offset_ms: 19782},
      %Video.TimedPoint{lon: 9.983751, lat: 53.590187, time_offset_ms: 20115},
      %Video.TimedPoint{lon: 9.983666, lat: 53.59014, time_offset_ms: 20449},
      %Video.TimedPoint{lon: 9.983606, lat: 53.590084, time_offset_ms: 20783},
      %Video.TimedPoint{lon: 9.983568, lat: 53.59002, time_offset_ms: 21116},
      %Video.TimedPoint{lon: 9.983538, lat: 53.589968, time_offset_ms: 21450},
      %Video.TimedPoint{lon: 9.983509, lat: 53.589957, time_offset_ms: 21783},
      %Video.TimedPoint{lon: 9.983504, lat: 53.589956, time_offset_ms: 22117},
      %Video.TimedPoint{lon: 9.983489, lat: 53.589952, time_offset_ms: 22184},
      %Video.TimedPoint{lon: 9.983471, lat: 53.589949, time_offset_ms: 22518},
      %Video.TimedPoint{lon: 9.983406, lat: 53.589938, time_offset_ms: 22851},
      %Video.TimedPoint{lon: 9.983312, lat: 53.589917, time_offset_ms: 23185},
      %Video.TimedPoint{lon: 9.983202, lat: 53.589893, time_offset_ms: 23518},
      %Video.TimedPoint{lon: 9.983088, lat: 53.589862, time_offset_ms: 23852},
      %Video.TimedPoint{lon: 9.982999, lat: 53.589799, time_offset_ms: 24186},
      %Video.TimedPoint{lon: 9.982917, lat: 53.589726, time_offset_ms: 24519},
      %Video.TimedPoint{lon: 9.982828, lat: 53.589656, time_offset_ms: 24853},
      %Video.TimedPoint{lon: 9.982745, lat: 53.58959, time_offset_ms: 25186},
      %Video.TimedPoint{lon: 9.982701, lat: 53.589518, time_offset_ms: 25520},
      %Video.TimedPoint{lon: 9.982671, lat: 53.58944, time_offset_ms: 25854},
      %Video.TimedPoint{lon: 9.982649, lat: 53.589353, time_offset_ms: 26187},
      %Video.TimedPoint{lon: 9.982641, lat: 53.589264, time_offset_ms: 26521},
      %Video.TimedPoint{lon: 9.982631, lat: 53.589172, time_offset_ms: 26854},
      %Video.TimedPoint{lon: 9.982601, lat: 53.589078, time_offset_ms: 27188},
      %Video.TimedPoint{lon: 9.982577, lat: 53.588981, time_offset_ms: 27522},
      %Video.TimedPoint{lon: 9.982551, lat: 53.588885, time_offset_ms: 27855},
      %Video.TimedPoint{lon: 9.98253, lat: 53.588791, time_offset_ms: 28189},
      %Video.TimedPoint{lon: 9.982505, lat: 53.588694, time_offset_ms: 28522},
      %Video.TimedPoint{lon: 9.98249, lat: 53.588597, time_offset_ms: 28856},
      %Video.TimedPoint{lon: 9.982468, lat: 53.588502, time_offset_ms: 29190},
      %Video.TimedPoint{lon: 9.982427, lat: 53.588411, time_offset_ms: 29523},
      %Video.TimedPoint{lon: 9.982395, lat: 53.588315, time_offset_ms: 29857},
      %Video.TimedPoint{lon: 9.982368, lat: 53.588214, time_offset_ms: 30190},
      %Video.TimedPoint{lon: 9.98234, lat: 53.588116, time_offset_ms: 30524},
      %Video.TimedPoint{lon: 9.982303, lat: 53.588032, time_offset_ms: 30858},
      %Video.TimedPoint{lon: 9.982282, lat: 53.587956, time_offset_ms: 31191},
      %Video.TimedPoint{lon: 9.982264, lat: 53.587893, time_offset_ms: 31525},
      %Video.TimedPoint{lon: 9.982236, lat: 53.587808, time_offset_ms: 31858},
      %Video.TimedPoint{lon: 9.982227, lat: 53.587708, time_offset_ms: 32192},
      %Video.TimedPoint{lon: 9.982211, lat: 53.587606, time_offset_ms: 32526},
      %Video.TimedPoint{lon: 9.98218, lat: 53.58751, time_offset_ms: 32859},
      %Video.TimedPoint{lon: 9.982158, lat: 53.587436, time_offset_ms: 33193},
      %Video.TimedPoint{lon: 9.982141, lat: 53.587379, time_offset_ms: 33526},
      %Video.TimedPoint{lon: 9.982123, lat: 53.587327, time_offset_ms: 33860},
      %Video.TimedPoint{lon: 9.98211, lat: 53.587289, time_offset_ms: 34194},
      %Video.TimedPoint{lon: 9.982114, lat: 53.587273, time_offset_ms: 34527},
      %Video.TimedPoint{lon: 9.982109, lat: 53.587256, time_offset_ms: 34861},
      %Video.TimedPoint{lon: 9.982091, lat: 53.587206, time_offset_ms: 35194},
      %Video.TimedPoint{lon: 9.98206, lat: 53.587133, time_offset_ms: 35528},
      %Video.TimedPoint{lon: 9.98203, lat: 53.587051, time_offset_ms: 35861},
      %Video.TimedPoint{lon: 9.98201, lat: 53.586961, time_offset_ms: 36195},
      %Video.TimedPoint{lon: 9.981985, lat: 53.586867, time_offset_ms: 36529},
      %Video.TimedPoint{lon: 9.981959, lat: 53.586768, time_offset_ms: 36862},
      %Video.TimedPoint{lon: 9.981932, lat: 53.586671, time_offset_ms: 37196},
      %Video.TimedPoint{lon: 9.981916, lat: 53.586572, time_offset_ms: 37529},
      %Video.TimedPoint{lon: 9.981883, lat: 53.586477, time_offset_ms: 37863},
      %Video.TimedPoint{lon: 9.981843, lat: 53.586383, time_offset_ms: 38197},
      %Video.TimedPoint{lon: 9.981815, lat: 53.58628, time_offset_ms: 38530},
      %Video.TimedPoint{lon: 9.981786, lat: 53.586184, time_offset_ms: 38864},
      %Video.TimedPoint{lon: 9.981766, lat: 53.586082, time_offset_ms: 39197},
      %Video.TimedPoint{lon: 9.981744, lat: 53.585981, time_offset_ms: 39531},
      %Video.TimedPoint{lon: 9.981717, lat: 53.585878, time_offset_ms: 39865},
      %Video.TimedPoint{lon: 9.981681, lat: 53.585778, time_offset_ms: 40198},
      %Video.TimedPoint{lon: 9.981623, lat: 53.585691, time_offset_ms: 40532},
      %Video.TimedPoint{lon: 9.981551, lat: 53.58562, time_offset_ms: 40865},
      %Video.TimedPoint{lon: 9.981475, lat: 53.585554, time_offset_ms: 41199},
      %Video.TimedPoint{lon: 9.9814, lat: 53.58549, time_offset_ms: 41533},
      %Video.TimedPoint{lon: 9.981324, lat: 53.585431, time_offset_ms: 41866},
      %Video.TimedPoint{lon: 9.981221, lat: 53.585381, time_offset_ms: 42200},
      %Video.TimedPoint{lon: 9.981127, lat: 53.585316, time_offset_ms: 42533},
      %Video.TimedPoint{lon: 9.981072, lat: 53.585241, time_offset_ms: 42867},
      %Video.TimedPoint{lon: 9.981017, lat: 53.585163, time_offset_ms: 43201},
      %Video.TimedPoint{lon: 9.980944, lat: 53.585081, time_offset_ms: 43534},
      %Video.TimedPoint{lon: 9.980875, lat: 53.585001, time_offset_ms: 43868}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "_g`feBe|r`R?B@B?D?D?D@D?D?F@F?F?F@F?F@H?H@H?H@J?J@L?J@N@L?N@L@N?L@L?L@J?L@J?L@J@L?J@J?L@J?L@J?L@J?J@L?J@J@L?J@L?J@J?L@J?J@J?L@J@J?J@L?J@J?J?J@J?J@J?J@J?J?J?J@J?J?J?H?J@J?J?J?JAH?J?H?J?JAH?J?JAH?JAH?HAJ?HAHAH?HAJAHAHAFAHAH?HAFAHAHAHAFAHAFAHAFAHAFAFAHAFAHAFAH?FAHAFAF?FAH?DAF?F?DAF?D?DAF?D?D?B?D?D?D?D?B?D?B?D?B@D?B?B@D?B?B@B?B@B?B@B?B@@?B@B?@@@@B?@@@?B@@@@?B@@@B@B@BBDBDBDDFDHHLHLFHDDBD@BBB@@@@@@@@?@??@@????@@??@@??@@?@@@@??@@@@@@@@B@@@@@B@@@@@B@@@B@BBB@@@B@BBB@DBB@DBB@DBDBDBFBDBFDFBFDHBHDHDHBHDHDHBHBHDHBHDHBHDHBHBHDHBHDJBHDHBHBJDHBHDHBJBHDJBHDHBJDHBHBJDHBJDHBHDJDHBHDHBHBHDFBHBFDHBFDFBFBFDFBFBFBDDFBDBFDDBFBDBDDFBDDDBFBDDDDFBDDDBFDDDFBDDDBFDFDDDFBDDFDFBDDFDFDFDFDFBHDFDFDHDFDHDFDHDHDHDHBFDHDHDHDHDHDJFHDHDHDHDHDJDHDHFHDHDHDJFHDHDHFHDHDHFHDHFHDHFFDHFHDHFHDFFHFHDHFHDFFHFHDFFHDHFFFHDHFFDHFHDFFHDHFFDHDHFHDFFHDHDHFHDFDHFHDJDHFHDHDHFJDHDHDJFHDJDHDJFHDJDHDJDHDJFJDHDJDJDHFJDJDHDJDJDHFJDJDJDHDJFJDHDJDHDJDHDJFHDJDHDJDHDJDHDHDHFJDHDHDJDHDHDHDHDJDHDHDHDJDHDHDHDHBHDHDJDHDHDHDHDJDHDHDHDHDJDHDHDJDHDHDHDJDHDHDJDHDHDJDHDHDJDHFHDJDHDJDHDJFHDJDHDJDHFJDJDHDJDJDHFJDHDJDHDJDHDJBHDJDHDJDHDHBJDHDHDJBHDJDHBHDHDJBHDHDHBHDJDHBHDHDHDHBHDHDHBFDHDHDHBHDHDFDHDHDHDHDHDHDHDHDHFHDHDJFHDHDHFJDHDHFHDJFHDHFJDHDJFHDJFHDJFJDHFJDJFJDHFJDJFJDHFJDJFJDJFHDJFJDJFHFJDJFJDHFJDJFHFJDHFJDHFJDHFHFJDHFHFHDHFJFHDHFHFHDHFHFHDHFHFHFHDHFHFHDHFHFHDHFHFHDJFHFHDHFHFJDHFHDHFJDHFHDJFHFHDJFHDJFHDJFHDJFHDJFJDHFJDJFHDJFJDHFJDJFJDJFHDJDJFJDJFHDJDJFJDJFJDHDJFJDJDHFJDJDJFHDJFJDJDHFJDJDHFJDHFJDJDHFJDHFHDJDHFHDJFHDHFHDHDHFHDHDHFHDHFHDHDHFHDHDHFHDHDHFHDHFHDHDJDHFHDHDHFJDHDHDJFHDHDHDJDHFHDJDHDHDJFHDJDHDHDJDHFHDJDHDJFHDHDJDHFJDHDHDJFHDJDHFJDHDJFJDHFHDJDJFHDJFHDJDHFHDJDHFJDHFJDHDJFHDJDHFJDHDJDJFJDHDJDHDJDHDJDHDJDHDJDHDJDHDHBJDHDHDHBJDHDHDHBJDHDHBHDHDHDHDHBFDHDHDHDFDHDFDHDFDHDFDFDFDFDFDDDFDFDDDFDFDDDDDFDDDDDFDDDDDFBDDDDDDDDDDFDDDDBDDFDDDDDDBDDDDDDDDFFDFFFFHFFDDDFDBBDBBBB@BBB@@@B@@@@@@?@@@@@?@@??@@@??@@?@@??@??@@???@??@@?????@??@@?????@????@@?????@???????@????@@?????????@?????????@?????????????@?????????????????????????????????????@@??????????????????????????????????????????????????????????????????????????????????@???????????????????????????????????????????????????????????????????????@?????????????????????????????????????@??????????A????@???????????@?????@?????@?????@???@A@???@?@?@A??@?@?@A@?B?@A@?BABA@?BADABADADADAHCFCHCLEJCJEJCHCFCFADCDAFADADCDADAFADADADAFADCDADAFADADADAFAD?DADAFAD?DADAD?F?DAD?D?D?D?D?D?D?D?D@D?D@B@D?D@B@D@D@BBD@DBB@DBDBBBDBDBBDDBDDBBDDDDBDDDDDBDDFDDBFDDDFBFDDDFDFBFDFDFBDDFDFBDDFDDBFDDDFBDDDDDBFDDDDBDDDDDDBDDDDBDDBDDDDDBDDFBDDDBDDDBFDDBDBFDFBDDFBFDHFFDHFHFHFHFHFDFFDDDDDDDBBBBBDB@BB@B@B@@B@@B?@@@@@@@?@@@?@@??@@@???@@@???@??@@?????@@??@?????@????????@@???????????????@?????????@@??@?@?@@@???@???@@??@?????@???@????@@?@???@?@@@???@?@@B?@?@@B?@?B@B?B@B?B@B?D@B@D?D@F@D@F?F@H@H@HBJ@J@LBL@LBN@LBL@L@LBJ@J@J@HBJ@H@J@J@HBJ@H@J@JBH@J@JBH@J@JBH@J@JBH@JBH@J@JBJ@HBJBH@JBH@JBHBJBH@JBHBHBHBHBHBHBHDHBHBHDHBHDHBHDHDFBHDHDHDFDHFHDFDHDFFHDFDHFFDHFFDFFHDFFHDFFFFHDFFFDHFFFFDFFHDFFFFHDFFFFHDFFFDHFFDHFFFFDHFFDHFFDHFFDFFFDHFFDFFHDFDFFFDFFFDFFFDFFFDFDFFDDFFDDDDFFDDDDDFDDDFDDBDDFBDDFBDDFBDBFDDBDBFBFBDBFBFBDBF@FBDBFBF@FBDBF@FBF@FBF@FBF@FBF@FBF@F@FBF@F@H@FBF@H@F@F@H@FBH@F@F@H@F?F@H@F@H@F@H?F@F@H?F@H@F?F@H?F@H?F@H?F@H?F@H?F@H?F@H?F@H?F@H?H@F?H@F@H?H@F@H?F@H@H@F@H@F@H@H@F@H@H@F@H@H@FBH@H@HBF@H@HBH@F@HBH@H@FBH@H@HBH@F@HBH@H@H@HBH@F@H@HBH@H@H@FBH@H@HBH@H@H@FBH@H@H@HBH@F@H@HBH@F@H@H@HBF@H@H@H@F@HBH@F@H@H@F@H@H@F@H@HBF@H@H@F@H@H@H@HBF@H@H@H@H@HBH@H@H@F@H@H@HBH@H@F@H@H@H@H@H@H@F@H?H@H@H@H@H@F@H@H@H?H@F@H@H@H@H@F@H@H@H@F@H@H@HBH@F@H@HBF@H@HBF@HBF@HBH@FBHBH@FBHBF@HBFBHBHBFBH@FBHBFBHBH@FBHBHBFBH@HBFBH@HBHBF@HBHBH@HBF@HBHBH@HBH@HBH@HBH@H@HBH@HBH@HBH@JBH@H@HBH@HBH@H@HBH@HBH@H@HBH@HBH@HBH@HBH@HBF@HBH@HBFBH@HBFBH@FBHBF@HBFBF@FBH@FBFBH@FBF@FBFBF@F@FBF@FBF@F@FBF@F@FBF@F@F@F@DBF@D@F@D@F@D@D@F@D@D?D@D@D@D@D@D@D@D?D@D@D@D@D@D@F@D@D@F@F@D@F@F@FBF@F@F@HBF@H@F@H@FBH@F@H@H@F@H@H@H@H@F@H?H@H@H@H?H@H@H?H@H@J?H@H@H?H@H@H?H@H@J?H@H@H@H?H@H@J@H@H@H@H@H@H@H@H@HBH@H@H@HBH@HBH@H@HBH@HBH@HBH@FBH@H@FBH@F@FBH@F@FBF@F@F@F@DBF@F@D@F@F@D@D@F@D@D@F@D@D@D@D@D@D@D@D@D?D@B@D@D@D@D@D@B@D?D@D@D@D@D@D@D@F@D@D@D@F@D@D@D@D@D@B?D@B@D?B@B@B?B@B?B@@?B?B@@?B@@?@?B@@?@?@?@@@?@?@?@??@@?@?@???@??@@???@???@???@???@??@@???@???@???@??@@???@???@???@?@@@???@?@@@?@?B?@@@?B@@?B?@@B?B@B@B?D@B@D@D@B@F@D@D@F@FBH@FBFBH@FBFBH@FBFBHBF@FBF@FBFBF@FBF@FBFBF@FBF@FBH@FBF@FBF@FBF@H@FBF@FBF@F@H@FBH@F@FBH@F@F@H@F@HBF@H@H@F@H@F@HBF@H@F@H@H@F@H@HBF@H@F@H@HBH@F@H@H@FBH@H@H@FBH@H@HBH@H@H@HBH@H@HBH@H@HBH@H@HBF@H@HBH@H@HBH@H@HBH@H@F@HBH@H@H@HBF@H@H@H@HBH@F@H@H@H@H@H@H@H@H@H@H@H@HBH@H@H@H@F@H@H@H@H@HBH@H@FBH@H@HBF@HBH@HBF@HBHBF@HBHBH@FBHBHBFBH@HBFBHBHBF@HBHBFBHBH@FBHBHBHBF@HBHBHBH@HBHBH@HBJBH@HBH@HBJBH@HBH@JBH@H@HBH@HBH@HBH@F@HBH@H@FBH@H@HBF@H@HBH@F@H@HBH@H@H@HBH@H@H@H@H@HBH@J@H@H@H@H@H@H@H@H@J@HBH@H@H@H@H@H@H@H@H@H@H@HBH@H@H@H@H@HBH@J@H@H@HBH@H@HBH@J@HBH@H@HBH@JBH@HBH@HBH@HBHBJ@HBHBH@HBHBHBHBHBHBHBHBHBHBHBHBFDHBHBFDHBHDFBHDFDFBHDFDHDFDFDHDFDFDFDFDFDFFFDFDFFFDFDDFFDFDDFFDDFFDDFFDDFFDDFFDDFDDFFDFFDDFDFFDDFDFFDDFDFFFDFDDFFDFDFDDFFDFDFFFDDDFDFDFFDDFDFDFDFFDDFDFDFDDDFDFDFDFFDDFDFDFBFDDDFDFDFDFDFDFBFDFDDDHBFDFDFBFDFDHBFDHDFBHDFDHBHDFDHDHBHDHDHDFBHDHDHDHDHDHDHDHDHDHFHDFDHDHFFDHDHFFDFFHDFDFFFDDFFDFFDDFFDDFFDDDFDDDFDFDDDFDDDFDFDFDDDFBFDFDDDFDFBFDDDFDFBFDFDFDDDFDFDFDFDFDFDFDFDFDFFFDFDFFFDHFFDFFFDHFFFFDFFFFHDFFHFFFHHJFFFHFHFDFFDFDDDDDDBDDDBBBBBDBBBBB@@BB@@",
      precision: 6
    }
  end
end
