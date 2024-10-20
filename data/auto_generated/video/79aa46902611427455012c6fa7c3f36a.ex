defmodule Data.AutoGenerated.Video.Rendered_79aa46902611427455012c6fa7c3f36a do
  @moduledoc "#{"alltagsroute-7: aus der Innenstadt nach Jenfeld"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "alltagsroute-7: aus der Innenstadt nach Jenfeld"
  end

  @impl Video.Rendered
  def hash() do
    "79aa46902611427455012c6fa7c3f36a"
  end

  @impl Video.Rendered
  def length_ms() do
    66219
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2024-05-02-vr7/GX017385", "00:00:01.235", :end},
      {"2024-05-02-vr7/GX017386", :start, "00:00:32.693"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.113710891891891,
      minLat: 53.573908,
      maxLon: 10.142717,
      maxLat: 53.576419
    }
  end

  @impl Video.Rendered
  def renderer() do
    5
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Mai 2024"}]
  end

  @impl Video.Rendered
  def street_names() do
    [%{timestamp: 0, text: "Jenfelder Straße"}, %{timestamp: 49872, text: "Bekkamp"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.113710891891891, lat: 53.576399810810805, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.113743, lat: 53.576401, time_offset_ms: 99},
      %Video.TimedPoint{lon: 10.113868, lat: 53.576419, time_offset_ms: 433},
      %Video.TimedPoint{lon: 10.114008, lat: 53.576408, time_offset_ms: 767},
      %Video.TimedPoint{lon: 10.114147, lat: 53.576371, time_offset_ms: 1100},
      %Video.TimedPoint{lon: 10.114278, lat: 53.576323, time_offset_ms: 1434},
      %Video.TimedPoint{lon: 10.114393, lat: 53.576262, time_offset_ms: 1767},
      %Video.TimedPoint{lon: 10.114499, lat: 53.576192, time_offset_ms: 2101},
      %Video.TimedPoint{lon: 10.114586, lat: 53.57611, time_offset_ms: 2435},
      %Video.TimedPoint{lon: 10.114645, lat: 53.576017, time_offset_ms: 2768},
      %Video.TimedPoint{lon: 10.114689, lat: 53.575922, time_offset_ms: 3102},
      %Video.TimedPoint{lon: 10.114723, lat: 53.575823, time_offset_ms: 3435},
      %Video.TimedPoint{lon: 10.114746, lat: 53.57572, time_offset_ms: 3769},
      %Video.TimedPoint{lon: 10.114765, lat: 53.575619, time_offset_ms: 4103},
      %Video.TimedPoint{lon: 10.114784, lat: 53.575517, time_offset_ms: 4436},
      %Video.TimedPoint{lon: 10.114805, lat: 53.575415, time_offset_ms: 4770},
      %Video.TimedPoint{lon: 10.114821, lat: 53.575316, time_offset_ms: 5103},
      %Video.TimedPoint{lon: 10.114822, lat: 53.575215, time_offset_ms: 5437},
      %Video.TimedPoint{lon: 10.11483, lat: 53.575115, time_offset_ms: 5771},
      %Video.TimedPoint{lon: 10.114864, lat: 53.575017, time_offset_ms: 6104},
      %Video.TimedPoint{lon: 10.11494, lat: 53.574928, time_offset_ms: 6438},
      %Video.TimedPoint{lon: 10.115048, lat: 53.574849, time_offset_ms: 6771},
      %Video.TimedPoint{lon: 10.115173, lat: 53.574782, time_offset_ms: 7105},
      %Video.TimedPoint{lon: 10.11531, lat: 53.57473, time_offset_ms: 7439},
      %Video.TimedPoint{lon: 10.115444, lat: 53.574683, time_offset_ms: 7772},
      %Video.TimedPoint{lon: 10.115577, lat: 53.574625, time_offset_ms: 8106},
      %Video.TimedPoint{lon: 10.115722, lat: 53.57457, time_offset_ms: 8439},
      %Video.TimedPoint{lon: 10.115865, lat: 53.574522, time_offset_ms: 8773},
      %Video.TimedPoint{lon: 10.116007, lat: 53.57448, time_offset_ms: 9107},
      %Video.TimedPoint{lon: 10.116155, lat: 53.57445, time_offset_ms: 9440},
      %Video.TimedPoint{lon: 10.116297, lat: 53.574414, time_offset_ms: 9774},
      %Video.TimedPoint{lon: 10.116429, lat: 53.574363, time_offset_ms: 10107},
      %Video.TimedPoint{lon: 10.116555, lat: 53.574312, time_offset_ms: 10441},
      %Video.TimedPoint{lon: 10.116676, lat: 53.574265, time_offset_ms: 10775},
      %Video.TimedPoint{lon: 10.116812, lat: 53.574225, time_offset_ms: 11108},
      %Video.TimedPoint{lon: 10.116953, lat: 53.574191, time_offset_ms: 11442},
      %Video.TimedPoint{lon: 10.117111, lat: 53.574163, time_offset_ms: 11775},
      %Video.TimedPoint{lon: 10.117282, lat: 53.574142, time_offset_ms: 12109},
      %Video.TimedPoint{lon: 10.117451, lat: 53.574124, time_offset_ms: 12443},
      %Video.TimedPoint{lon: 10.117624, lat: 53.574104, time_offset_ms: 12776},
      %Video.TimedPoint{lon: 10.117794, lat: 53.574087, time_offset_ms: 13110},
      %Video.TimedPoint{lon: 10.117965, lat: 53.574071, time_offset_ms: 13443},
      %Video.TimedPoint{lon: 10.118146, lat: 53.574055, time_offset_ms: 13777},
      %Video.TimedPoint{lon: 10.118333, lat: 53.574037, time_offset_ms: 14111},
      %Video.TimedPoint{lon: 10.118523, lat: 53.574018, time_offset_ms: 14444},
      %Video.TimedPoint{lon: 10.118714, lat: 53.573999, time_offset_ms: 14778},
      %Video.TimedPoint{lon: 10.118907, lat: 53.573977, time_offset_ms: 15111},
      %Video.TimedPoint{lon: 10.1191, lat: 53.573959, time_offset_ms: 15445},
      %Video.TimedPoint{lon: 10.119287, lat: 53.573939, time_offset_ms: 15779},
      %Video.TimedPoint{lon: 10.119476, lat: 53.57392, time_offset_ms: 16112},
      %Video.TimedPoint{lon: 10.119662, lat: 53.573908, time_offset_ms: 16446},
      %Video.TimedPoint{lon: 10.119842, lat: 53.573911, time_offset_ms: 16779},
      %Video.TimedPoint{lon: 10.120024, lat: 53.573937, time_offset_ms: 17113},
      %Video.TimedPoint{lon: 10.120178, lat: 53.573992, time_offset_ms: 17447},
      %Video.TimedPoint{lon: 10.120309, lat: 53.574066, time_offset_ms: 17780},
      %Video.TimedPoint{lon: 10.120455, lat: 53.574132, time_offset_ms: 18114},
      %Video.TimedPoint{lon: 10.120615, lat: 53.574183, time_offset_ms: 18447},
      %Video.TimedPoint{lon: 10.120766, lat: 53.57424, time_offset_ms: 18781},
      %Video.TimedPoint{lon: 10.12091, lat: 53.574303, time_offset_ms: 19115},
      %Video.TimedPoint{lon: 10.121052, lat: 53.574365, time_offset_ms: 19448},
      %Video.TimedPoint{lon: 10.121188, lat: 53.574426, time_offset_ms: 19782},
      %Video.TimedPoint{lon: 10.121316, lat: 53.57448, time_offset_ms: 20115},
      %Video.TimedPoint{lon: 10.121438, lat: 53.574535, time_offset_ms: 20449},
      %Video.TimedPoint{lon: 10.121553, lat: 53.574606, time_offset_ms: 20783},
      %Video.TimedPoint{lon: 10.121678, lat: 53.574677, time_offset_ms: 21116},
      %Video.TimedPoint{lon: 10.121828, lat: 53.574731, time_offset_ms: 21450},
      %Video.TimedPoint{lon: 10.121967, lat: 53.574786, time_offset_ms: 21783},
      %Video.TimedPoint{lon: 10.122108, lat: 53.574842, time_offset_ms: 22117},
      %Video.TimedPoint{lon: 10.122261, lat: 53.574892, time_offset_ms: 22451},
      %Video.TimedPoint{lon: 10.122412, lat: 53.574938, time_offset_ms: 22784},
      %Video.TimedPoint{lon: 10.122564, lat: 53.574977, time_offset_ms: 23118},
      %Video.TimedPoint{lon: 10.122713, lat: 53.574992, time_offset_ms: 23451},
      %Video.TimedPoint{lon: 10.122856, lat: 53.57501, time_offset_ms: 23785},
      %Video.TimedPoint{lon: 10.123, lat: 53.575039, time_offset_ms: 24119},
      %Video.TimedPoint{lon: 10.123144, lat: 53.575054, time_offset_ms: 24452},
      %Video.TimedPoint{lon: 10.123301, lat: 53.575048, time_offset_ms: 24786},
      %Video.TimedPoint{lon: 10.123464, lat: 53.575049, time_offset_ms: 25119},
      %Video.TimedPoint{lon: 10.123628, lat: 53.575055, time_offset_ms: 25453},
      %Video.TimedPoint{lon: 10.123785, lat: 53.575064, time_offset_ms: 25787},
      %Video.TimedPoint{lon: 10.123949, lat: 53.575067, time_offset_ms: 26120},
      %Video.TimedPoint{lon: 10.124124, lat: 53.575072, time_offset_ms: 26454},
      %Video.TimedPoint{lon: 10.124298, lat: 53.575075, time_offset_ms: 26787},
      %Video.TimedPoint{lon: 10.124462, lat: 53.575084, time_offset_ms: 27121},
      %Video.TimedPoint{lon: 10.124628, lat: 53.575094, time_offset_ms: 27455},
      %Video.TimedPoint{lon: 10.124794, lat: 53.575097, time_offset_ms: 27788},
      %Video.TimedPoint{lon: 10.12496, lat: 53.575105, time_offset_ms: 28122},
      %Video.TimedPoint{lon: 10.125123, lat: 53.575107, time_offset_ms: 28455},
      %Video.TimedPoint{lon: 10.125277, lat: 53.575101, time_offset_ms: 28789},
      %Video.TimedPoint{lon: 10.125447, lat: 53.575103, time_offset_ms: 29123},
      %Video.TimedPoint{lon: 10.12561, lat: 53.575109, time_offset_ms: 29456},
      %Video.TimedPoint{lon: 10.125769, lat: 53.575122, time_offset_ms: 29790},
      %Video.TimedPoint{lon: 10.125918, lat: 53.575135, time_offset_ms: 30123},
      %Video.TimedPoint{lon: 10.126062, lat: 53.575136, time_offset_ms: 30457},
      %Video.TimedPoint{lon: 10.126197, lat: 53.575131, time_offset_ms: 30791},
      %Video.TimedPoint{lon: 10.126327, lat: 53.575119, time_offset_ms: 31124},
      %Video.TimedPoint{lon: 10.126422, lat: 53.575109, time_offset_ms: 31458},
      %Video.TimedPoint{lon: 10.126491, lat: 53.575098, time_offset_ms: 31791},
      %Video.TimedPoint{lon: 10.126546, lat: 53.575083, time_offset_ms: 32125},
      %Video.TimedPoint{lon: 10.126604, lat: 53.575076, time_offset_ms: 32459},
      %Video.TimedPoint{lon: 10.126666, lat: 53.575066, time_offset_ms: 32792},
      %Video.TimedPoint{lon: 10.12671, lat: 53.575047, time_offset_ms: 33126},
      %Video.TimedPoint{lon: 10.12673, lat: 53.575034, time_offset_ms: 33459},
      %Video.TimedPoint{lon: 10.126774, lat: 53.575035, time_offset_ms: 33526},
      %Video.TimedPoint{lon: 10.12679, lat: 53.57503, time_offset_ms: 33860},
      %Video.TimedPoint{lon: 10.126852, lat: 53.575021, time_offset_ms: 34193},
      %Video.TimedPoint{lon: 10.126931, lat: 53.575022, time_offset_ms: 34527},
      %Video.TimedPoint{lon: 10.127018, lat: 53.575031, time_offset_ms: 34860},
      %Video.TimedPoint{lon: 10.127116, lat: 53.575061, time_offset_ms: 35194},
      %Video.TimedPoint{lon: 10.127227, lat: 53.575102, time_offset_ms: 35528},
      %Video.TimedPoint{lon: 10.127368, lat: 53.575128, time_offset_ms: 35861},
      %Video.TimedPoint{lon: 10.127527, lat: 53.575132, time_offset_ms: 36195},
      %Video.TimedPoint{lon: 10.127693, lat: 53.575134, time_offset_ms: 36528},
      %Video.TimedPoint{lon: 10.127858, lat: 53.575137, time_offset_ms: 36862},
      %Video.TimedPoint{lon: 10.128027, lat: 53.575141, time_offset_ms: 37196},
      %Video.TimedPoint{lon: 10.128196, lat: 53.575143, time_offset_ms: 37529},
      %Video.TimedPoint{lon: 10.128366, lat: 53.575146, time_offset_ms: 37863},
      %Video.TimedPoint{lon: 10.12854, lat: 53.575149, time_offset_ms: 38196},
      %Video.TimedPoint{lon: 10.128719, lat: 53.575154, time_offset_ms: 38530},
      %Video.TimedPoint{lon: 10.1289, lat: 53.575156, time_offset_ms: 38864},
      %Video.TimedPoint{lon: 10.129077, lat: 53.57516, time_offset_ms: 39197},
      %Video.TimedPoint{lon: 10.129251, lat: 53.575168, time_offset_ms: 39531},
      %Video.TimedPoint{lon: 10.129428, lat: 53.575171, time_offset_ms: 39864},
      %Video.TimedPoint{lon: 10.129608, lat: 53.575174, time_offset_ms: 40198},
      %Video.TimedPoint{lon: 10.129793, lat: 53.575177, time_offset_ms: 40532},
      %Video.TimedPoint{lon: 10.129979, lat: 53.575179, time_offset_ms: 40865},
      %Video.TimedPoint{lon: 10.130164, lat: 53.575182, time_offset_ms: 41199},
      %Video.TimedPoint{lon: 10.130354, lat: 53.575186, time_offset_ms: 41532},
      %Video.TimedPoint{lon: 10.130542, lat: 53.575189, time_offset_ms: 41866},
      %Video.TimedPoint{lon: 10.130727, lat: 53.575192, time_offset_ms: 42200},
      %Video.TimedPoint{lon: 10.130911, lat: 53.575197, time_offset_ms: 42533},
      %Video.TimedPoint{lon: 10.1311, lat: 53.575198, time_offset_ms: 42867},
      %Video.TimedPoint{lon: 10.13129, lat: 53.5752, time_offset_ms: 43200},
      %Video.TimedPoint{lon: 10.131481, lat: 53.575203, time_offset_ms: 43534},
      %Video.TimedPoint{lon: 10.131675, lat: 53.575204, time_offset_ms: 43868},
      %Video.TimedPoint{lon: 10.131868, lat: 53.575205, time_offset_ms: 44201},
      %Video.TimedPoint{lon: 10.132054, lat: 53.575205, time_offset_ms: 44535},
      %Video.TimedPoint{lon: 10.13224, lat: 53.575203, time_offset_ms: 44868},
      %Video.TimedPoint{lon: 10.132426, lat: 53.575197, time_offset_ms: 45202},
      %Video.TimedPoint{lon: 10.13261, lat: 53.57519, time_offset_ms: 45536},
      %Video.TimedPoint{lon: 10.132792, lat: 53.575181, time_offset_ms: 45869},
      %Video.TimedPoint{lon: 10.132964, lat: 53.57517, time_offset_ms: 46203},
      %Video.TimedPoint{lon: 10.133124, lat: 53.575157, time_offset_ms: 46536},
      %Video.TimedPoint{lon: 10.133276, lat: 53.575142, time_offset_ms: 46870},
      %Video.TimedPoint{lon: 10.133422, lat: 53.575128, time_offset_ms: 47204},
      %Video.TimedPoint{lon: 10.133567, lat: 53.575116, time_offset_ms: 47537},
      %Video.TimedPoint{lon: 10.13371, lat: 53.575102, time_offset_ms: 47871},
      %Video.TimedPoint{lon: 10.133854, lat: 53.575087, time_offset_ms: 48204},
      %Video.TimedPoint{lon: 10.133993, lat: 53.575072, time_offset_ms: 48538},
      %Video.TimedPoint{lon: 10.134142, lat: 53.575054, time_offset_ms: 48872},
      %Video.TimedPoint{lon: 10.134283, lat: 53.57502, time_offset_ms: 49205},
      %Video.TimedPoint{lon: 10.13442, lat: 53.574971, time_offset_ms: 49539},
      %Video.TimedPoint{lon: 10.134568, lat: 53.57492, time_offset_ms: 49872},
      %Video.TimedPoint{lon: 10.134729, lat: 53.574871, time_offset_ms: 50206},
      %Video.TimedPoint{lon: 10.134903, lat: 53.57483, time_offset_ms: 50540},
      %Video.TimedPoint{lon: 10.135086, lat: 53.574799, time_offset_ms: 50873},
      %Video.TimedPoint{lon: 10.135267, lat: 53.57478, time_offset_ms: 51207},
      %Video.TimedPoint{lon: 10.135442, lat: 53.574783, time_offset_ms: 51540},
      %Video.TimedPoint{lon: 10.135611, lat: 53.574797, time_offset_ms: 51874},
      %Video.TimedPoint{lon: 10.135779, lat: 53.574808, time_offset_ms: 52208},
      %Video.TimedPoint{lon: 10.135944, lat: 53.574817, time_offset_ms: 52541},
      %Video.TimedPoint{lon: 10.136107, lat: 53.574825, time_offset_ms: 52875},
      %Video.TimedPoint{lon: 10.136273, lat: 53.574834, time_offset_ms: 53208},
      %Video.TimedPoint{lon: 10.136437, lat: 53.574842, time_offset_ms: 53542},
      %Video.TimedPoint{lon: 10.136597, lat: 53.574849, time_offset_ms: 53876},
      %Video.TimedPoint{lon: 10.136757, lat: 53.574857, time_offset_ms: 54209},
      %Video.TimedPoint{lon: 10.136924, lat: 53.574866, time_offset_ms: 54543},
      %Video.TimedPoint{lon: 10.137093, lat: 53.574875, time_offset_ms: 54876},
      %Video.TimedPoint{lon: 10.137259, lat: 53.574883, time_offset_ms: 55210},
      %Video.TimedPoint{lon: 10.137427, lat: 53.574892, time_offset_ms: 55544},
      %Video.TimedPoint{lon: 10.137598, lat: 53.574902, time_offset_ms: 55877},
      %Video.TimedPoint{lon: 10.137767, lat: 53.57491, time_offset_ms: 56211},
      %Video.TimedPoint{lon: 10.137936, lat: 53.574918, time_offset_ms: 56544},
      %Video.TimedPoint{lon: 10.138106, lat: 53.57492, time_offset_ms: 56878},
      %Video.TimedPoint{lon: 10.138276, lat: 53.574918, time_offset_ms: 57212},
      %Video.TimedPoint{lon: 10.138446, lat: 53.574921, time_offset_ms: 57545},
      %Video.TimedPoint{lon: 10.138614, lat: 53.574927, time_offset_ms: 57879},
      %Video.TimedPoint{lon: 10.13878, lat: 53.574938, time_offset_ms: 58212},
      %Video.TimedPoint{lon: 10.138947, lat: 53.574953, time_offset_ms: 58546},
      %Video.TimedPoint{lon: 10.139115, lat: 53.574968, time_offset_ms: 58880},
      %Video.TimedPoint{lon: 10.139283, lat: 53.574979, time_offset_ms: 59213},
      %Video.TimedPoint{lon: 10.139452, lat: 53.574984, time_offset_ms: 59547},
      %Video.TimedPoint{lon: 10.139622, lat: 53.574988, time_offset_ms: 59880},
      %Video.TimedPoint{lon: 10.139794, lat: 53.575, time_offset_ms: 60214},
      %Video.TimedPoint{lon: 10.139965, lat: 53.575018, time_offset_ms: 60548},
      %Video.TimedPoint{lon: 10.140132, lat: 53.575038, time_offset_ms: 60881},
      %Video.TimedPoint{lon: 10.140297, lat: 53.575055, time_offset_ms: 61215},
      %Video.TimedPoint{lon: 10.14046, lat: 53.575073, time_offset_ms: 61548},
      %Video.TimedPoint{lon: 10.140619, lat: 53.575097, time_offset_ms: 61882},
      %Video.TimedPoint{lon: 10.140783, lat: 53.575117, time_offset_ms: 62216},
      %Video.TimedPoint{lon: 10.140946, lat: 53.575138, time_offset_ms: 62549},
      %Video.TimedPoint{lon: 10.141106, lat: 53.575164, time_offset_ms: 62883},
      %Video.TimedPoint{lon: 10.141267, lat: 53.575189, time_offset_ms: 63216},
      %Video.TimedPoint{lon: 10.141426, lat: 53.575207, time_offset_ms: 63550},
      %Video.TimedPoint{lon: 10.141592, lat: 53.575227, time_offset_ms: 63884},
      %Video.TimedPoint{lon: 10.141755, lat: 53.575244, time_offset_ms: 64217},
      %Video.TimedPoint{lon: 10.141917, lat: 53.575264, time_offset_ms: 64551},
      %Video.TimedPoint{lon: 10.142079, lat: 53.575285, time_offset_ms: 64884},
      %Video.TimedPoint{lon: 10.142241, lat: 53.575304, time_offset_ms: 65218},
      %Video.TimedPoint{lon: 10.142401, lat: 53.575324, time_offset_ms: 65552},
      %Video.TimedPoint{lon: 10.142562, lat: 53.575342, time_offset_ms: 65885},
      %Video.TimedPoint{lon: 10.142717, lat: 53.575364, time_offset_ms: 66219}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "cl`eeBmkhhR?C?A?C?CAE?C?EAE?E?EAE?G?GAG?IAI?IAK?MAK?OAO?QASAS?O?Q?OAM?O@M?M?M?M?M@M?M@M@M?M@M@M@K@M@M@M@M@MBM@MBO@MBM@MBMBM@MBMBMBMBMBMBMBMBMBMBMBKDMBMBKBMDKBMBKDMBMDKBMDKBKDKBMDKDKBKDKDMDIBKDMDKDIDKDKDKDKDKDIDKDIDKFKDIDKDIFKDIDKFIDKDIFIDIFKDIFIDIFKDIFIFIDIFGFIFIDIFIFGFIFIFGFIFGFGFIFGFGFIHGFGFGFEFGHGFGHEFGFEHGFEHGFEHEHEFGHEHEFEHEHCFEHEHEFCHEHCFEHCHEFCHEHCFCHEHCHCFCHCHCHCFEHCHCHCFCHCHAHCHCHCHCHCHAHCHCHCHAFCHCHAHCHAHCHAJCHAHAHCHAHAHCHAHAHCJAHAHAHAHCJAHAHAHAHAHAHAHAHAHAJAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAJAH?HAHAHAHAHAHAHAJAHAHAHAHAHAHAHAHAJAHAHAHAHAHAHAHAJAHAHAHAHAHAHAHAHAHAHAHAHAH?HAHAHAHAH?HAHAH?FAH?HAHAH?HAH?H?HAH?HAH?H?H?HAH?H?H?HAJ?H?H?H?HAH?H?H?HAH?H?H?HAH?HAH?H?HAHAH?HAH?HAFAHAHAHAHAHAHAHAHAHCHAHCHAHCHCHCFCHCHCHCFCHEHCFEHCHEFEHEFEHEFEHGFEHEFGHGFGHGFGFGFGHGFGFIFGHIFIFGFIFIFIFIHIFKFIFIFKFIDKFIFKFKDIFKFKFKDKFKDKFKDKFKDKFKDKDMFKDKDMDKDKDMDKFMDKDMDKBMDKDMDMDKBMDMDKBMDMDMBMDKBMDMBKDMBMDMBMDKBMDKBMDMBKBMDKBMDMBKDMBKBMDKBMDKDMBMDKDMBMDKDMBMDKDMDMBMDMDKDMDMBMDKDMDMDMDMDMBMDODMDMDMDOBMDMDODMDMBODMDMBODMDMBMDOBMDMBMDMBMDOBMDMBMBMDMBMDMBMBOBMDMBMBMBMDMBMBMBMBOBMDMBMBMBMBMBMBMBOBM@MBMBMBMBOBM@MBMBO@MBMBO@MBMBO@MBMBO@MBMBM@MBOBM@MBOBM@MBMBMBM@MBMBMBMBMBMBMBMBMBMBMBKBMBMBMBMDMBMBKDMBMDMBKDMBMDMBKDMBKDMBKDMBMDKBMDKBKDMBKDMDKBKDMBKDMBKDKBKDMBKDKBKDKBMBKDKBKDKBKBKBKDKBKBKBKDKBKBKBKBKDMBKBKBMBKBMDKBMBKBMBMBMBKBMBMBMBMBMBMBKBMBMBMBM@MBMBMBMBM@MBKBM@MBOBM@MBMBM@MBM@MBM@OBMBO@MBO@OBM@OBO@O@OBO@OBM@O@OBO@O@O@QBO@O@Q@OBO@Q@O@Q@O@Q@OBQ@Q@O@Q@O@Q@O@Q@O@Q@Q@O@Q@O@O@Q@O@Q?O@O@Q@O@Q@O@Q@O@O@Q@O@Q@Q@O@Q@O@Q@Q?O@Q@Q@O@Q@Q@Q@O@Q@O@Q@Q@O@Q@Q@O@Q@O@Q?O@Q@O@O@Q@Q@O?Q@O@O@Q@O@Q?O@Q@O@Q@O@Q?O@Q@Q@O@O?Q@Q@O@Q@O?Q@O@Q@Q@O?Q@Q@Q@Q@O?Q@Q@Q@Q@Q?Q@Q@Q@Q@Q@Q?Q@S@Q@Q@Q@Q?S@Q@Q@Q@Q@S@Q?Q@S@Q@S@Q@Q@S@Q@Q@S@Q?Q@S@S@Q@Q@S@Q@S@Q@S@Q@S@S@Q@S@Q@S?Q@Q@S@Q@S@S@Q@S@Q@S@Q@S@Q@S@Q@S@Q@S@Q@S@Q@S@Q@S@S@Q@S@S@Q@S@S@Q@S@S@S@Q@S@SBQ@S@S@Q@S@Q@S@S@S@Q@S@Q?S@S@Q@S@S@S@Q@S@Q@S@Q@S@Q@S@Q@S@Q@S@Q?Q@S@Q@Q@S@Q@S@Q@Q@Q@S@Q@Q@Q@S@Q@S@Q@S@Q@S@Q@S@Q@S@Q?S@Q@S@Q@S@Q@Q?S@Q@S@Q@Q?S@Q@Q?S@Q?Q@Q@S?Q@S?Q?Q@Q?Q@Q?Q?S?Q@Q?Q?Q?Q?Q?Q?Q?Q?QAQ?Q?Q?QAQ?QAQ?OAQAQ?SAQAQAQAQAQAQAQAQAQCQASCQAQCOCQAQCOCQCOCQCOCOCOEOCOCOEOCMEOCOEOEMEOEMEOCMEMGMEOEMEMEMGMEMEMGMEMGKEMGMEMGMEMGKEMGMEMGMEMGMGMEMEMGMEMGMEMEMGMEOEMEOGMEOEMEMEOEMEOEOEOEMCOEOEMEOEOCOEOEOEOCOEMEOCOEOCMEOEOEOCOEMEOEOCMEOEMEOCOEMEOEMEOEMEOEMCMEOEMEOEMGMEOEMEMEMEOEMEMEOEMEMEMEMGOEMEMEMEMEMEOEMGMEMEMEOEMEMEMGMEMEMEMEMEMEMEMEMEMEMGOEMEKEMEMEMEMEMEMEMEMEMEKEMEMEKEMEMEKEMEMCKEMEKEMEKCKEMEKEMCKEKEKCMEKEKEKCKEMEKCKEKEKEKCKEKEKCKEKEKEKEKCKEKEKEIEKEKEKEKEKGKEKEKEIGKEKEKGKEKGKEKGKEKGKEKGKEIGKEMGKEKGKEKGKGMEKGKEMGKEMGKEMEKGMEKEMEMGKEMEMEMEMEMEMEMEOEMEMEOEMCOEMEMEOEMCMEMEOEMCMEOEMEMCMEMEMCMEMEMEMCMEMEKCMEMEMCMEMEMEMEMCMEMEMCMEMEMEMCMEMEMEMCMEOEMCMEMEOCMEOEMCMEOEMCOEMCOEMCOEOEOCMEOCOEMCOCMEOCOEOCMCOEMCOEOCMCOEMCOCOCMEOCMCOCMCOCMEOCOCMCOCOCMCOCOCMCOCOCMCOAOCOCMAOCMAOCMAOCMAOAMAOCMAMAOAMAOAMAMAOAMAO?MAMAMAOAMAMAMAO?MAMAMAMAMAMAMAM?MAOAMAMAMAMAMCMAMAMAMAMAOAMCMAMAMAOCMAMAOAOCMAMAOAMCMAMAMAOAMAMAMAMAOAMAMAM?MAMAMAM?MAM?OAM?MAM?M?OAM?O?M?O?M?OAO?M?O?O@O?O?O?O?O?O?M?O?O@O?O?Q?O?O?O?O?O?O?O?O?Q?O?O?O?O?Q?O?OAO?O?Q?O?OAO?O?Q?O?OAO?O?QAO?O?Q?OAO?O?OAO?OAO?O?OAO?O?OAO?MAO?O?OAO?M?OAO?O?MAO?O?OAO?O?OAO?O?O?OAQ?O?O?O?OAO?Q?O?O?OAO?Q?O?Q?OAQ?Q?O?QAO?Q?Q?Q?QAQ?Q?O?QAQ?Q?O?Q?QAQ?O?Q?Q?QAQ?O?Q?Q?QAQ?Q?O?Q?QAO?Q?OAQ?O?Q?OAQ?O?OAQ?O?OAO?OAO?Q?OAO?OAO?OAO?OAO?QAO?O?OAQ?OAO?OAQ?OAO?QAO?O?QAO?OAO?Q?OAO?Q?OAO?Q?O?OAQ?O?O?QAO?O?Q?OAO?O?O?QAO?O?Q?OAO?Q?OAO?O?QAO?O?QAO?Q?O?OAO?Q?OAO?O?Q?O?OAO?Q?O?O?O?Q?OAO?O?O?O?O?O?O?O?O@O?O?O?O?M?O?O?M@O?M?O?O?M?O@M?O?O?M?O?O?O?O@Q?O?O?O?Q?O?Q?O?Q?QAO?Q?Q?O?Q?O?OAQ?O?Q?O?QAO?O?Q?OAO?O?OAO?Q?OAO?O?OAO?OAO?OAO?OAO?OAO?OAO?OAOAO?OAO?OAOAO?MAOAO?OAOAM?OAO?MAOAO?MAO?MAO?OAMAO?M?MAO?MAM?O?MAM?O?MAM?M?O?M?MAM?M?O?M?M?M?M?M?M?M?M?M?M@M?M?M?M?K?M@M?M?K?M@M?M?K@M?M?M@K?M@M?M?M@K?M@M?M@M@M?M@M?M@M@M?K@M?K@M@K?K@K?K@K@K?I@K?I@K@I?I@I?G@I@I?G@I?G@I?G@G@G?G@G?G@E@G?G@E?E@G?E@E@G?E@E?E@E?E@E?E@E?E@C?E@E?E@C?E@E?C@E?E@C?E@E?C@E?E@C?E@C?E@E?E@C?E@E?E@C?E@E@E?E@E?E@E@E?E@E@G?E@E@E@G?E@E@G@E?E@G@E@E@G@E?G@E@E@E@E?G@E@E@E?C@E@E?C@E@C?C@E?C@C@C?C@C?C@C?A?C@A?C@A?C?A@A?A?C@A?A?A??@A?A?C?A@A?A?C@C?C@E@E@K?E@E?C?C@A?A?A?A?A@A???A?A???A?A?A@A?A?A?C?A@C?A?C?C@C?C?C?E@C?E?E@C?E?E@E?G?E?E@G?G?E?G@G?G?G?G?I@G?G?I?I?G?I?I?I?G?I?I?I?I?IAI?G?GAI?G?GAI?GAG?IAG?GAIAG?GAIAGAI?IAGAIAIAGAIAICIAIAIAICIAICIAKCIAICKCIAICKCIAKCICKCKCICKAKCICKCKCKCKCKAKCKCKCKAMCKCKAMCKAMCMCKAMAMCMAMAMCOAMAMAMAMAOAMAO?MAOAMAO?OAM?OAO?OAM?Q?OAO?O?MAO?O?Q?O?OAO?O?Q?O?O?O?QAO?O?Q?O?Q?O?O?QAO?O?O?Q?O?O?Q?OAO?O?O?Q?O?O?OAO?Q?O?O?O?QAO?O?O?Q?O?QAO?O?Q?O?O?QAO?Q?O?Q?OAQ?O?O?Q?O?QAO?Q?O?Q?O?Q?O?QAO?Q?O?Q?O?Q?O?OAQ?O?O?Q?O?Q?O?QAO?Q?O?O?Q?O?QAO?Q?O?Q?O?Q?OAQ?O?Q?Q?O?Q?QAO?Q?Q?O?Q?QAQ?O?Q?Q?O?QAQ?Q?O?Q?QAQ?Q?Q?O?QAQ?Q?Q?Q?QAQ?Q?Q?QAQ?Q?Q?O?Q?SAQ?Q?Q?Q?Q?QAQ?Q?Q?Q?Q?Q?QAQ?Q?Q?Q?Q?Q?QAQ?Q?Q?Q?Q?QAQ?O?Q?Q?QAQ?Q?Q?OAQ?Q?O?QAQ?Q?QAO?Q?QAO?Q?QAO?Q?QAQ?O?QAQ?O?QAQ?O?Q?QAQ?Q?O?QAQ?Q?Q?Q?QAQ?O?Q?Q?Q?QAO?Q?Q?Q?Q?Q?QAQ?Q?Q?Q?Q?OAS?Q?Q?Q?Q?Q?QAQ?Q?Q?Q?Q?Q?QAS?Q?Q?Q?Q?Q?SAQ?S?Q?Q?Q?Q?SAQ?Q?Q?S?Q?Q?S?QAS?Q?Q?Q?S?Q?S?Q?QAQ?Q?S?Q?Q?S?Q?QAQ?S?Q?Q?Q?Q?QAS?Q?Q?Q?S?Q?QAQ?S?Q?Q?SAQ?S?Q?S?Q?SAQ?S?S?Q?SAQ?S?Q?S?Q?QAS?Q?S?Q?SAQ?S?Q?Q?S?Q?SAQ?Q?S?Q?Q?SAQ?Q?S?Q?S?Q?QAQ?Q?S?Q?Q?QAS?Q?Q?Q?S?QAQ?Q?Q?Q?SAQ?Q?Q?S?QAQ?Q?Q?S?QAQ?Q?Q?S?QAQ?Q?Q?S?Q?SAQ?Q?Q?S?Q?Q?S?Q?S?SAQ?Q?S?Q?S?Q?Q?S?S?Q?S?Q?QAS?S?Q?S?Q?S?Q?S?Q?SAQ?S?Q?S?Q?S?Q?SAQ?S?Q?S?Q?S?Q?SAQ?S?Q?S?Q?S?Q?SAS?Q?S?S?Q?S?S?Q?S?Q?S?SAS?S?Q?S?S?Q?S?Q?S?S?S?Q?S?S?S?Q?S?S?Q?SAS?S?Q?S?Q?S?Q?S?Q?S?S?Q?Q?S?Q?Q?Q?S?Q?Q?S?Q?Q?Q?S?Q?Q?Q?Q?S?Q?S@Q?Q?Q?S?Q?Q?S?Q?S?Q@Q?Q?S?Q?Q?Q?Q@S?Q?S?Q@Q?Q?S?Q@Q?Q?S?Q@S?Q?Q@Q?S?Q?Q@Q?S?Q@Q?Q?S@Q?Q?Q@Q?Q@S?Q?Q@Q?Q?Q@S?Q@Q?Q?Q@Q?S@Q?Q?Q@Q?S@Q?Q@Q?Q@S?Q?Q@O?Q@Q?Q@Q?Q@Q?Q@Q?O@Q?Q@Q@O?Q@Q?O@Q?Q@O?Q@O@O?Q@O?Q@O@O?O@O@Q?O@O?O@O@O?O@O@O?O@M@O?O@O@O?M@O@O@O?M@O@O?M@O@M@O?O@O@M?O@M@O@M?M@O@M?O@M@O@M?M@O@M?M@O@M@M?O@M@M?M@M?O@M@M?M@O@M?M@M@O?M@M@O?M@M@M?O@M?M@M@M?O@M@M?M@M@O?M@M@M?M@M@M?M@O@M?M@M@M?M@M@M@O?M@M@M?M@O@M@M?M@O@M@M?M@O@M@M?M@O@M@M?M@M@M@M?M@M@M@M?M@K@M@M?M@M@M@K?M@M@M@M?M@M@M@O@M@M@M?O@M@M@O@M@O@M@O@MBO@M@M@O@M@MBO@M@MBM@MBO@MBM@MBMBM@MBMBM@MBMBMBMBMBKBOBMBKBMBMBMDMBMBMBKDMBMBMDMBMDMBMBMDMBMDMBODMBMDMBMDOBMDMBODMDOBMDOBMDOBODMBODMBODOBODOBODMBODOBODOBOBODQBODOBOBODOBOBQBODQBOBOBQBODQBOBQBOBQBQBQBQBOBQBQBQBO@QBQBQBQBQ@QBQBSBQ@QBQ@QBS@QBQ@QBQ@QBQ@S@Q@QBQ@Q@Q@Q@Q@Q@Q@Q@Q@S@Q@Q@Q@Q?Q@Q?Q@O?Q@Q?Q@Q?Q?Q?O?Q@Q?Q?O?QAQ?Q?Q?O?QAO?Q?QAO?Q?QAO?QAO?QAO?QAO?QAOAQ?OAQ?OAOAQ?OAOAQ?OAQ?OAQAO?OAQ?OAOAQ?OAQ?OAQ?OAO?QAO?OAO?QAO?QAO?OAQ?OAO?OAQ?OAO?QAO?O?OAO?OAQ?OAO?O?QAO?OAO?OAO?O?OAO?OAQ?O?OAO?OAO?OAO?Q?OAO?OAQ?OAO?Q?OAO?QAO?QAO?O?OAQ?OAO?OAQ?O?QAO?OAO?OAO?Q?OAO?OAQ?O?OAO?O?OAO?OAQ?O?OAO?O?OAO?OAO?O?OAO?O?OAO?O?MAO?OAO?O?OAO?O?OAO?OAO?O?OAO?OAO?O?OAO?OAO?O?OAO?OAQ?OAO?O?OAQ?OAO?QAO?QAO?O?QAO?OAQ?OAQ?OAQ?OAQ?O?QAO?QAO?QAO?QAO?Q?OAO?QAO?QAO?Q?OAO?QAO?OAO?O?QAO?OAQ?O?OAO?QAO?O?OAQ?OAQ?OAO?O?QAO?OAQ?OAQ?OAO?QAO?O?QAO?QAO?QAO?QAO?QAQ?OAQ?OAQ?QAO?QAO?QAO?Q?OAQ?OAQ?QAO?QAO?O?QAO?OAQ?QAO?O?QAO?QAO?O?QAO?QAO?Q?OAO?Q?QAO?OAQ?Q?OAO?Q?OAQ?O?O?QAO?Q?Q?OAO?Q?O?Q?O?OAQ?Q?O?Q?O?Q?O?O?Q?O?Q?O?Q?Q?O?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?O?Q?Q?OAO?Q?Q?O?Q?O?QAO?O?Q?O?QAO?Q?O?QAO?O?Q?OAO?Q?OAQ?O?QAO?O?OAQ?OAO?QAO?Q?OAO?QAO?OAO?QAO?QAOAO?OAO?QAOAO?OAQAO?QAOAO?OAQAO?OAQAOAQ?OAOAQ?OAOAQAO?OAQAOAQ?OAOAQAO?OAQAOAQ?OAQAO?OAQAO?OAQAO?QAOAQ?OAO?QAOAQ?OAO?QAO?QAO?OAQ?OAO?QAO?Q?OAQ?O?OAQ?O?OAQ?O?QAO?Q?O?QAO?O?Q?OAQ?O?Q?OAQ?O?Q?O?QAO?Q?OAQ?O?Q?OAQ?O?OAQ?QAO?Q?OAQ?OAQ?QAO?QAOAQ?QAO?QAOAQ?QAOAQ?OAQAQAOAQ?OAQAOAQAO?QAQAOAQAOAQAOAQAOAQAOAQ?OAQAOAQAOAQAOAOAQAOAQAOAOAOAQAOAOAOAQAOAQ?OAOAOAOAQAOAOAOAQ?OAOAOAQAOAOAOAO?OAQAOAOAOAOAQAOAOAO?OAQAOAOAOAOAOAOAOAOAOAOAOAOAOCOAOAOAOAOAOAOAOAOAOCOAOAOAOAMAQAOAOAOAOCOAOAOAOAQAOAOAOAQAOAOAOAOAOAOAQAOAOAOAQAOAOCOAOAQAOAOAOAOAOAOAOAQCOAOAOAOAOAOCOAOAOAOAOCOAOAOAOCOAOAOAOCOAOAOAOCOAOAOCOAOAQAOCOAOAOAOCOAOAQAOAOAMAOCOAOAOAQAMAOAOAOAOAOAMAOAOAOAOAOAO?OAOAMAOAOAQAOAOAOAOAQAOAOAOAQAOAQAOAQAOAOAOAQAOAO?QAOAOAOAOAQAOAOAOAOAQ?OAOAOAOAOAOAOAOAOAO?QAOAOAOAOAOAOAOAOAOAQAOAOAOAOAOAOAOAOAOAOAQAOAOAOAOAOAOAOAQAOAOCOAOAOAOAOAOAOAQAOAOAOAOAOAO?OAOAOAOAQAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAOAO?OAOAOAOAOAOAQAOAOAOAOAOAOAOAOAOAOAOAQAOASAQCSASAQAOAOAMAMAMAKAI?KAGAI?GAI?EAG?EAE",
      precision: 6
    }
  end
end
