defmodule Data.AutoGenerated.Video.Rendered_20bc71ab1ed54f044cc15786b3f10e96 do
  @moduledoc "#{"2022-12-24-berner-strasse: Umleitung Richtung Süden"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-12-24-berner-strasse: Umleitung Richtung Süden"
  end

  @impl Video.Rendered
  def hash() do
    "20bc71ab1ed54f044cc15786b3f10e96"
  end

  @impl Video.Rendered
  def length_ms() do
    100_963
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-12-24-berner-strasse/GX015043", :start, "00:00:49.550"},
      {"2022-12-24-berner-strasse/GX015043", "00:01:06.199", :end},
      {"2022-12-24-berner-strasse/GX015044", :start, "00:00:28.356"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{minLon: 10.13957, minLat: 53.61436, maxLon: 10.155637, maxLat: 53.62865}
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Dezember 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Kriegkamp"},
      %{timestamp: 11342, text: "Alte Berner Straße"},
      %{timestamp: 14345, text: "Hermann-Balk-Straße"},
      %{timestamp: 49487, text: "Greifenberger Straße"},
      %{timestamp: 54158, text: "Arnswalder Straße"},
      %{timestamp: 65500, text: "Redderblock"},
      %{timestamp: 80280, text: "Stolper Straße"},
      %{timestamp: 89621, text: "Berner Straße"},
      %{timestamp: 92957, text: "Alter Zollweg"},
      %{timestamp: 97293, text: "Berner Straße"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.14221, lat: 53.62865, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.142197, lat: 53.628645, time_offset_ms: 334},
      %Video.TimedPoint{lon: 10.142157, lat: 53.628628, time_offset_ms: 667},
      %Video.TimedPoint{lon: 10.142107, lat: 53.628593, time_offset_ms: 1001},
      %Video.TimedPoint{lon: 10.142044, lat: 53.628546, time_offset_ms: 1334},
      %Video.TimedPoint{lon: 10.14197, lat: 53.628491, time_offset_ms: 1668},
      %Video.TimedPoint{lon: 10.141882, lat: 53.628432, time_offset_ms: 2002},
      %Video.TimedPoint{lon: 10.141792, lat: 53.628367, time_offset_ms: 2335},
      %Video.TimedPoint{lon: 10.141705, lat: 53.628296, time_offset_ms: 2669},
      %Video.TimedPoint{lon: 10.141618, lat: 53.628221, time_offset_ms: 3002},
      %Video.TimedPoint{lon: 10.141529, lat: 53.628145, time_offset_ms: 3336},
      %Video.TimedPoint{lon: 10.141437, lat: 53.628069, time_offset_ms: 3670},
      %Video.TimedPoint{lon: 10.14135, lat: 53.627989, time_offset_ms: 4003},
      %Video.TimedPoint{lon: 10.141259, lat: 53.627909, time_offset_ms: 4337},
      %Video.TimedPoint{lon: 10.141166, lat: 53.627826, time_offset_ms: 4670},
      %Video.TimedPoint{lon: 10.141077, lat: 53.627743, time_offset_ms: 5004},
      %Video.TimedPoint{lon: 10.140987, lat: 53.627657, time_offset_ms: 5338},
      %Video.TimedPoint{lon: 10.140897, lat: 53.627574, time_offset_ms: 5671},
      %Video.TimedPoint{lon: 10.140808, lat: 53.627491, time_offset_ms: 6005},
      %Video.TimedPoint{lon: 10.140715, lat: 53.627408, time_offset_ms: 6338},
      %Video.TimedPoint{lon: 10.140622, lat: 53.627322, time_offset_ms: 6672},
      %Video.TimedPoint{lon: 10.140532, lat: 53.627239, time_offset_ms: 7006},
      %Video.TimedPoint{lon: 10.140444, lat: 53.627155, time_offset_ms: 7339},
      %Video.TimedPoint{lon: 10.140357, lat: 53.62707, time_offset_ms: 7673},
      %Video.TimedPoint{lon: 10.140268, lat: 53.626987, time_offset_ms: 8006},
      %Video.TimedPoint{lon: 10.140172, lat: 53.626903, time_offset_ms: 8340},
      %Video.TimedPoint{lon: 10.140074, lat: 53.62682, time_offset_ms: 8674},
      %Video.TimedPoint{lon: 10.139978, lat: 53.626737, time_offset_ms: 9007},
      %Video.TimedPoint{lon: 10.139881, lat: 53.626656, time_offset_ms: 9341},
      %Video.TimedPoint{lon: 10.139782, lat: 53.626572, time_offset_ms: 9674},
      %Video.TimedPoint{lon: 10.139684, lat: 53.626493, time_offset_ms: 10008},
      %Video.TimedPoint{lon: 10.1396, lat: 53.626408, time_offset_ms: 10342},
      %Video.TimedPoint{lon: 10.13957, lat: 53.626313, time_offset_ms: 10675},
      %Video.TimedPoint{lon: 10.139605, lat: 53.626223, time_offset_ms: 11009},
      %Video.TimedPoint{lon: 10.139698, lat: 53.626153, time_offset_ms: 11342},
      %Video.TimedPoint{lon: 10.139838, lat: 53.626106, time_offset_ms: 11676},
      %Video.TimedPoint{lon: 10.139981, lat: 53.626067, time_offset_ms: 12010},
      %Video.TimedPoint{lon: 10.140124, lat: 53.626029, time_offset_ms: 12343},
      %Video.TimedPoint{lon: 10.140255, lat: 53.625991, time_offset_ms: 12677},
      %Video.TimedPoint{lon: 10.140381, lat: 53.625948, time_offset_ms: 13010},
      %Video.TimedPoint{lon: 10.140491, lat: 53.625894, time_offset_ms: 13344},
      %Video.TimedPoint{lon: 10.140593, lat: 53.625842, time_offset_ms: 13678},
      %Video.TimedPoint{lon: 10.140615, lat: 53.625773, time_offset_ms: 14011},
      %Video.TimedPoint{lon: 10.140551, lat: 53.625708, time_offset_ms: 14345},
      %Video.TimedPoint{lon: 10.140467, lat: 53.625643, time_offset_ms: 14678},
      %Video.TimedPoint{lon: 10.140392, lat: 53.625566, time_offset_ms: 15012},
      %Video.TimedPoint{lon: 10.140307, lat: 53.625491, time_offset_ms: 15346},
      %Video.TimedPoint{lon: 10.140226, lat: 53.625419, time_offset_ms: 15679},
      %Video.TimedPoint{lon: 10.140152, lat: 53.625357, time_offset_ms: 16013},
      %Video.TimedPoint{lon: 10.140093, lat: 53.62529, time_offset_ms: 16346},
      %Video.TimedPoint{lon: 10.14006, lat: 53.625227, time_offset_ms: 16680},
      %Video.TimedPoint{lon: 10.140057, lat: 53.625165, time_offset_ms: 17014},
      %Video.TimedPoint{lon: 10.140077, lat: 53.625091, time_offset_ms: 17347},
      %Video.TimedPoint{lon: 10.140096, lat: 53.625016, time_offset_ms: 17681},
      %Video.TimedPoint{lon: 10.140113, lat: 53.624941, time_offset_ms: 18014},
      %Video.TimedPoint{lon: 10.14013, lat: 53.624865, time_offset_ms: 18348},
      %Video.TimedPoint{lon: 10.140139, lat: 53.624792, time_offset_ms: 18682},
      %Video.TimedPoint{lon: 10.140139, lat: 53.624722, time_offset_ms: 19015},
      %Video.TimedPoint{lon: 10.140141, lat: 53.624656, time_offset_ms: 19349},
      %Video.TimedPoint{lon: 10.140153, lat: 53.624584, time_offset_ms: 19682},
      %Video.TimedPoint{lon: 10.140176, lat: 53.624512, time_offset_ms: 20016},
      %Video.TimedPoint{lon: 10.140204, lat: 53.624438, time_offset_ms: 20350},
      %Video.TimedPoint{lon: 10.14023, lat: 53.624362, time_offset_ms: 20683},
      %Video.TimedPoint{lon: 10.140254, lat: 53.624289, time_offset_ms: 21017},
      %Video.TimedPoint{lon: 10.140271, lat: 53.62422, time_offset_ms: 21350},
      %Video.TimedPoint{lon: 10.140284, lat: 53.624154, time_offset_ms: 21684},
      %Video.TimedPoint{lon: 10.140295, lat: 53.624088, time_offset_ms: 22018},
      %Video.TimedPoint{lon: 10.140302, lat: 53.624025, time_offset_ms: 22351},
      %Video.TimedPoint{lon: 10.140316, lat: 53.623955, time_offset_ms: 22685},
      %Video.TimedPoint{lon: 10.140335, lat: 53.623882, time_offset_ms: 23018},
      %Video.TimedPoint{lon: 10.140357, lat: 53.623806, time_offset_ms: 23352},
      %Video.TimedPoint{lon: 10.140375, lat: 53.623736, time_offset_ms: 23686},
      %Video.TimedPoint{lon: 10.140387, lat: 53.623671, time_offset_ms: 24019},
      %Video.TimedPoint{lon: 10.140409, lat: 53.623604, time_offset_ms: 24353},
      %Video.TimedPoint{lon: 10.140427, lat: 53.623526, time_offset_ms: 24686},
      %Video.TimedPoint{lon: 10.140455, lat: 53.62345, time_offset_ms: 25020},
      %Video.TimedPoint{lon: 10.14049, lat: 53.623373, time_offset_ms: 25354},
      %Video.TimedPoint{lon: 10.140544, lat: 53.623294, time_offset_ms: 25687},
      %Video.TimedPoint{lon: 10.14061, lat: 53.62322, time_offset_ms: 26021},
      %Video.TimedPoint{lon: 10.140673, lat: 53.623149, time_offset_ms: 26354},
      %Video.TimedPoint{lon: 10.140734, lat: 53.623084, time_offset_ms: 26688},
      %Video.TimedPoint{lon: 10.140793, lat: 53.62302, time_offset_ms: 27022},
      %Video.TimedPoint{lon: 10.140853, lat: 53.622954, time_offset_ms: 27355},
      %Video.TimedPoint{lon: 10.140915, lat: 53.622884, time_offset_ms: 27689},
      %Video.TimedPoint{lon: 10.140973, lat: 53.622815, time_offset_ms: 28022},
      %Video.TimedPoint{lon: 10.141032, lat: 53.622747, time_offset_ms: 28356},
      %Video.TimedPoint{lon: 10.141085, lat: 53.622676, time_offset_ms: 28690},
      %Video.TimedPoint{lon: 10.141142, lat: 53.622605, time_offset_ms: 29023},
      %Video.TimedPoint{lon: 10.141199, lat: 53.622534, time_offset_ms: 29357},
      %Video.TimedPoint{lon: 10.141262, lat: 53.622462, time_offset_ms: 29690},
      %Video.TimedPoint{lon: 10.141319, lat: 53.622392, time_offset_ms: 30024},
      %Video.TimedPoint{lon: 10.141378, lat: 53.622316, time_offset_ms: 30358},
      %Video.TimedPoint{lon: 10.141438, lat: 53.622242, time_offset_ms: 30691},
      %Video.TimedPoint{lon: 10.141499, lat: 53.622169, time_offset_ms: 31025},
      %Video.TimedPoint{lon: 10.141562, lat: 53.622093, time_offset_ms: 31358},
      %Video.TimedPoint{lon: 10.141626, lat: 53.622022, time_offset_ms: 31692},
      %Video.TimedPoint{lon: 10.141687, lat: 53.62195, time_offset_ms: 32026},
      %Video.TimedPoint{lon: 10.14175, lat: 53.621872, time_offset_ms: 32359},
      %Video.TimedPoint{lon: 10.141813, lat: 53.621794, time_offset_ms: 32693},
      %Video.TimedPoint{lon: 10.141875, lat: 53.621718, time_offset_ms: 33026},
      %Video.TimedPoint{lon: 10.141936, lat: 53.621643, time_offset_ms: 33360},
      %Video.TimedPoint{lon: 10.142, lat: 53.62157, time_offset_ms: 33694},
      %Video.TimedPoint{lon: 10.142069, lat: 53.621499, time_offset_ms: 34027},
      %Video.TimedPoint{lon: 10.142136, lat: 53.621424, time_offset_ms: 34361},
      %Video.TimedPoint{lon: 10.1422, lat: 53.621353, time_offset_ms: 34694},
      %Video.TimedPoint{lon: 10.142266, lat: 53.621286, time_offset_ms: 35028},
      %Video.TimedPoint{lon: 10.142324, lat: 53.621223, time_offset_ms: 35362},
      %Video.TimedPoint{lon: 10.142381, lat: 53.621155, time_offset_ms: 35695},
      %Video.TimedPoint{lon: 10.142445, lat: 53.621083, time_offset_ms: 36029},
      %Video.TimedPoint{lon: 10.142509, lat: 53.621012, time_offset_ms: 36362},
      %Video.TimedPoint{lon: 10.142565, lat: 53.620945, time_offset_ms: 36696},
      %Video.TimedPoint{lon: 10.142614, lat: 53.620875, time_offset_ms: 37030},
      %Video.TimedPoint{lon: 10.142668, lat: 53.620805, time_offset_ms: 37363},
      %Video.TimedPoint{lon: 10.142734, lat: 53.620769, time_offset_ms: 37697},
      %Video.TimedPoint{lon: 10.142807, lat: 53.620747, time_offset_ms: 38030},
      %Video.TimedPoint{lon: 10.142866, lat: 53.620702, time_offset_ms: 38364},
      %Video.TimedPoint{lon: 10.142926, lat: 53.620637, time_offset_ms: 38698},
      %Video.TimedPoint{lon: 10.142985, lat: 53.620568, time_offset_ms: 39031},
      %Video.TimedPoint{lon: 10.143044, lat: 53.620493, time_offset_ms: 39365},
      %Video.TimedPoint{lon: 10.1431, lat: 53.620423, time_offset_ms: 39698},
      %Video.TimedPoint{lon: 10.143164, lat: 53.620349, time_offset_ms: 40032},
      %Video.TimedPoint{lon: 10.143224, lat: 53.620272, time_offset_ms: 40366},
      %Video.TimedPoint{lon: 10.143286, lat: 53.620191, time_offset_ms: 40699},
      %Video.TimedPoint{lon: 10.143357, lat: 53.620114, time_offset_ms: 41033},
      %Video.TimedPoint{lon: 10.143423, lat: 53.620039, time_offset_ms: 41366},
      %Video.TimedPoint{lon: 10.143488, lat: 53.619963, time_offset_ms: 41700},
      %Video.TimedPoint{lon: 10.143546, lat: 53.619887, time_offset_ms: 42034},
      %Video.TimedPoint{lon: 10.143601, lat: 53.619808, time_offset_ms: 42367},
      %Video.TimedPoint{lon: 10.143659, lat: 53.61973, time_offset_ms: 42701},
      %Video.TimedPoint{lon: 10.143719, lat: 53.619652, time_offset_ms: 43034},
      %Video.TimedPoint{lon: 10.143778, lat: 53.619574, time_offset_ms: 43368},
      %Video.TimedPoint{lon: 10.143844, lat: 53.619491, time_offset_ms: 43702},
      %Video.TimedPoint{lon: 10.143914, lat: 53.619409, time_offset_ms: 44035},
      %Video.TimedPoint{lon: 10.143987, lat: 53.619331, time_offset_ms: 44369},
      %Video.TimedPoint{lon: 10.144058, lat: 53.619253, time_offset_ms: 44702},
      %Video.TimedPoint{lon: 10.144136, lat: 53.61917, time_offset_ms: 45036},
      %Video.TimedPoint{lon: 10.144216, lat: 53.619086, time_offset_ms: 45370},
      %Video.TimedPoint{lon: 10.144285, lat: 53.619002, time_offset_ms: 45703},
      %Video.TimedPoint{lon: 10.144352, lat: 53.618923, time_offset_ms: 46037},
      %Video.TimedPoint{lon: 10.144423, lat: 53.618838, time_offset_ms: 46370},
      %Video.TimedPoint{lon: 10.144497, lat: 53.618753, time_offset_ms: 46704},
      %Video.TimedPoint{lon: 10.144571, lat: 53.618671, time_offset_ms: 47038},
      %Video.TimedPoint{lon: 10.144648, lat: 53.618592, time_offset_ms: 47371},
      %Video.TimedPoint{lon: 10.144716, lat: 53.618514, time_offset_ms: 47705},
      %Video.TimedPoint{lon: 10.144778, lat: 53.618445, time_offset_ms: 48038},
      %Video.TimedPoint{lon: 10.144828, lat: 53.618391, time_offset_ms: 48372},
      %Video.TimedPoint{lon: 10.144854, lat: 53.61835, time_offset_ms: 48706},
      %Video.TimedPoint{lon: 10.144878, lat: 53.618312, time_offset_ms: 49039},
      %Video.TimedPoint{lon: 10.145119198198199, lat: 53.618169108108106, time_offset_ms: 49300},
      %Video.TimedPoint{lon: 10.145163, lat: 53.618159, time_offset_ms: 49487},
      %Video.TimedPoint{lon: 10.145276, lat: 53.618174, time_offset_ms: 49821},
      %Video.TimedPoint{lon: 10.145399, lat: 53.618206, time_offset_ms: 50154},
      %Video.TimedPoint{lon: 10.145535, lat: 53.618233, time_offset_ms: 50488},
      %Video.TimedPoint{lon: 10.145669, lat: 53.618254, time_offset_ms: 50822},
      %Video.TimedPoint{lon: 10.14581, lat: 53.618278, time_offset_ms: 51155},
      %Video.TimedPoint{lon: 10.145951, lat: 53.618304, time_offset_ms: 51489},
      %Video.TimedPoint{lon: 10.14609, lat: 53.618331, time_offset_ms: 51822},
      %Video.TimedPoint{lon: 10.14623, lat: 53.618358, time_offset_ms: 52156},
      %Video.TimedPoint{lon: 10.146372, lat: 53.618384, time_offset_ms: 52490},
      %Video.TimedPoint{lon: 10.14651, lat: 53.61841, time_offset_ms: 52823},
      %Video.TimedPoint{lon: 10.14665, lat: 53.618439, time_offset_ms: 53157},
      %Video.TimedPoint{lon: 10.146789, lat: 53.618464, time_offset_ms: 53490},
      %Video.TimedPoint{lon: 10.146928, lat: 53.61847, time_offset_ms: 53824},
      %Video.TimedPoint{lon: 10.147038, lat: 53.618428, time_offset_ms: 54158},
      %Video.TimedPoint{lon: 10.147091, lat: 53.618351, time_offset_ms: 54491},
      %Video.TimedPoint{lon: 10.147143, lat: 53.618276, time_offset_ms: 54825},
      %Video.TimedPoint{lon: 10.147204, lat: 53.618198, time_offset_ms: 55158},
      %Video.TimedPoint{lon: 10.14727, lat: 53.618121, time_offset_ms: 55492},
      %Video.TimedPoint{lon: 10.147336, lat: 53.618042, time_offset_ms: 55826},
      %Video.TimedPoint{lon: 10.147401, lat: 53.617964, time_offset_ms: 56159},
      %Video.TimedPoint{lon: 10.14747, lat: 53.617882, time_offset_ms: 56493},
      %Video.TimedPoint{lon: 10.14754, lat: 53.617801, time_offset_ms: 56826},
      %Video.TimedPoint{lon: 10.147612, lat: 53.617719, time_offset_ms: 57160},
      %Video.TimedPoint{lon: 10.147678, lat: 53.617638, time_offset_ms: 57494},
      %Video.TimedPoint{lon: 10.147743, lat: 53.617557, time_offset_ms: 57827},
      %Video.TimedPoint{lon: 10.14781, lat: 53.617477, time_offset_ms: 58161},
      %Video.TimedPoint{lon: 10.147871, lat: 53.617397, time_offset_ms: 58494},
      %Video.TimedPoint{lon: 10.147931, lat: 53.617318, time_offset_ms: 58828},
      %Video.TimedPoint{lon: 10.147998, lat: 53.617236, time_offset_ms: 59162},
      %Video.TimedPoint{lon: 10.148065, lat: 53.617154, time_offset_ms: 59495},
      %Video.TimedPoint{lon: 10.148136, lat: 53.617069, time_offset_ms: 59829},
      %Video.TimedPoint{lon: 10.148212, lat: 53.616984, time_offset_ms: 60162},
      %Video.TimedPoint{lon: 10.148291, lat: 53.616898, time_offset_ms: 60496},
      %Video.TimedPoint{lon: 10.148374, lat: 53.616814, time_offset_ms: 60830},
      %Video.TimedPoint{lon: 10.148456, lat: 53.616728, time_offset_ms: 61163},
      %Video.TimedPoint{lon: 10.148534, lat: 53.616641, time_offset_ms: 61497},
      %Video.TimedPoint{lon: 10.148611, lat: 53.616557, time_offset_ms: 61830},
      %Video.TimedPoint{lon: 10.1487, lat: 53.616477, time_offset_ms: 62164},
      %Video.TimedPoint{lon: 10.148782, lat: 53.616391, time_offset_ms: 62498},
      %Video.TimedPoint{lon: 10.148852, lat: 53.616303, time_offset_ms: 62831},
      %Video.TimedPoint{lon: 10.148916, lat: 53.616211, time_offset_ms: 63165},
      %Video.TimedPoint{lon: 10.148984, lat: 53.616119, time_offset_ms: 63498},
      %Video.TimedPoint{lon: 10.149054, lat: 53.616029, time_offset_ms: 63832},
      %Video.TimedPoint{lon: 10.149121, lat: 53.615936, time_offset_ms: 64166},
      %Video.TimedPoint{lon: 10.149188, lat: 53.615844, time_offset_ms: 64499},
      %Video.TimedPoint{lon: 10.149257, lat: 53.615759, time_offset_ms: 64833},
      %Video.TimedPoint{lon: 10.149335, lat: 53.615689, time_offset_ms: 65166},
      %Video.TimedPoint{lon: 10.149454, lat: 53.615664, time_offset_ms: 65500},
      %Video.TimedPoint{lon: 10.14959, lat: 53.615684, time_offset_ms: 65834},
      %Video.TimedPoint{lon: 10.149735, lat: 53.615704, time_offset_ms: 66167},
      %Video.TimedPoint{lon: 10.149888, lat: 53.615724, time_offset_ms: 66501},
      %Video.TimedPoint{lon: 10.150038, lat: 53.615742, time_offset_ms: 66834},
      %Video.TimedPoint{lon: 10.150189, lat: 53.615762, time_offset_ms: 67168},
      %Video.TimedPoint{lon: 10.15034, lat: 53.615784, time_offset_ms: 67502},
      %Video.TimedPoint{lon: 10.150486, lat: 53.615804, time_offset_ms: 67835},
      %Video.TimedPoint{lon: 10.150632, lat: 53.615825, time_offset_ms: 68169},
      %Video.TimedPoint{lon: 10.150777, lat: 53.615843, time_offset_ms: 68502},
      %Video.TimedPoint{lon: 10.150915, lat: 53.615863, time_offset_ms: 68836},
      %Video.TimedPoint{lon: 10.151054, lat: 53.615882, time_offset_ms: 69170},
      %Video.TimedPoint{lon: 10.151192, lat: 53.615902, time_offset_ms: 69503},
      %Video.TimedPoint{lon: 10.151327, lat: 53.61592, time_offset_ms: 69837},
      %Video.TimedPoint{lon: 10.151462, lat: 53.615936, time_offset_ms: 70170},
      %Video.TimedPoint{lon: 10.151599, lat: 53.615949, time_offset_ms: 70504},
      %Video.TimedPoint{lon: 10.151731, lat: 53.615957, time_offset_ms: 70838},
      %Video.TimedPoint{lon: 10.151855, lat: 53.615967, time_offset_ms: 71171},
      %Video.TimedPoint{lon: 10.151968, lat: 53.615974, time_offset_ms: 71505},
      %Video.TimedPoint{lon: 10.152051, lat: 53.615977, time_offset_ms: 71838},
      %Video.TimedPoint{lon: 10.152108, lat: 53.61598, time_offset_ms: 72172},
      %Video.TimedPoint{lon: 10.152136, lat: 53.615982, time_offset_ms: 72506},
      %Video.TimedPoint{lon: 10.152166, lat: 53.615991, time_offset_ms: 72607},
      %Video.TimedPoint{lon: 10.152166, lat: 53.615992, time_offset_ms: 72941},
      %Video.TimedPoint{lon: 10.152171, lat: 53.615994, time_offset_ms: 73274},
      %Video.TimedPoint{lon: 10.152217, lat: 53.616, time_offset_ms: 73608},
      %Video.TimedPoint{lon: 10.152301, lat: 53.616022, time_offset_ms: 73941},
      %Video.TimedPoint{lon: 10.152404, lat: 53.616055, time_offset_ms: 74275},
      %Video.TimedPoint{lon: 10.152519, lat: 53.616088, time_offset_ms: 74609},
      %Video.TimedPoint{lon: 10.15264, lat: 53.616127, time_offset_ms: 74942},
      %Video.TimedPoint{lon: 10.152763, lat: 53.616172, time_offset_ms: 75276},
      %Video.TimedPoint{lon: 10.152889, lat: 53.616208, time_offset_ms: 75609},
      %Video.TimedPoint{lon: 10.152998, lat: 53.616252, time_offset_ms: 75943},
      %Video.TimedPoint{lon: 10.153097, lat: 53.616311, time_offset_ms: 76277},
      %Video.TimedPoint{lon: 10.153209, lat: 53.616363, time_offset_ms: 76610},
      %Video.TimedPoint{lon: 10.153326, lat: 53.616411, time_offset_ms: 76944},
      %Video.TimedPoint{lon: 10.15344, lat: 53.616467, time_offset_ms: 77277},
      %Video.TimedPoint{lon: 10.153549, lat: 53.616524, time_offset_ms: 77611},
      %Video.TimedPoint{lon: 10.153659, lat: 53.61658, time_offset_ms: 77945},
      %Video.TimedPoint{lon: 10.153774, lat: 53.616637, time_offset_ms: 78278},
      %Video.TimedPoint{lon: 10.153886, lat: 53.616694, time_offset_ms: 78612},
      %Video.TimedPoint{lon: 10.153994, lat: 53.616751, time_offset_ms: 78945},
      %Video.TimedPoint{lon: 10.154114, lat: 53.6168, time_offset_ms: 79279},
      %Video.TimedPoint{lon: 10.15423, lat: 53.616849, time_offset_ms: 79613},
      %Video.TimedPoint{lon: 10.154359, lat: 53.616874, time_offset_ms: 79946},
      %Video.TimedPoint{lon: 10.154484, lat: 53.616848, time_offset_ms: 80280},
      %Video.TimedPoint{lon: 10.154564, lat: 53.616789, time_offset_ms: 80613},
      %Video.TimedPoint{lon: 10.154602, lat: 53.616711, time_offset_ms: 80947},
      %Video.TimedPoint{lon: 10.154625, lat: 53.616628, time_offset_ms: 81281},
      %Video.TimedPoint{lon: 10.154638, lat: 53.616549, time_offset_ms: 81614},
      %Video.TimedPoint{lon: 10.154665, lat: 53.61647, time_offset_ms: 81948},
      %Video.TimedPoint{lon: 10.154707, lat: 53.616393, time_offset_ms: 82281},
      %Video.TimedPoint{lon: 10.15475, lat: 53.616317, time_offset_ms: 82615},
      %Video.TimedPoint{lon: 10.154789, lat: 53.61624, time_offset_ms: 82949},
      %Video.TimedPoint{lon: 10.154827, lat: 53.616161, time_offset_ms: 83282},
      %Video.TimedPoint{lon: 10.154865, lat: 53.616084, time_offset_ms: 83616},
      %Video.TimedPoint{lon: 10.154906, lat: 53.616008, time_offset_ms: 83949},
      %Video.TimedPoint{lon: 10.154953, lat: 53.615928, time_offset_ms: 84283},
      %Video.TimedPoint{lon: 10.154996, lat: 53.615847, time_offset_ms: 84617},
      %Video.TimedPoint{lon: 10.155036, lat: 53.615764, time_offset_ms: 84950},
      %Video.TimedPoint{lon: 10.155083, lat: 53.615681, time_offset_ms: 85284},
      %Video.TimedPoint{lon: 10.155129, lat: 53.615598, time_offset_ms: 85617},
      %Video.TimedPoint{lon: 10.155171, lat: 53.615515, time_offset_ms: 85951},
      %Video.TimedPoint{lon: 10.155217, lat: 53.615427, time_offset_ms: 86285},
      %Video.TimedPoint{lon: 10.155269, lat: 53.615343, time_offset_ms: 86618},
      %Video.TimedPoint{lon: 10.155329, lat: 53.615262, time_offset_ms: 86952},
      %Video.TimedPoint{lon: 10.155389, lat: 53.615179, time_offset_ms: 87285},
      %Video.TimedPoint{lon: 10.155407, lat: 53.615095, time_offset_ms: 87619},
      %Video.TimedPoint{lon: 10.155363, lat: 53.615017, time_offset_ms: 87953},
      %Video.TimedPoint{lon: 10.155296, lat: 53.614942, time_offset_ms: 88286},
      %Video.TimedPoint{lon: 10.155234, lat: 53.614866, time_offset_ms: 88620},
      %Video.TimedPoint{lon: 10.155176, lat: 53.614793, time_offset_ms: 88953},
      %Video.TimedPoint{lon: 10.155104, lat: 53.614724, time_offset_ms: 89287},
      %Video.TimedPoint{lon: 10.155011, lat: 53.614694, time_offset_ms: 89621},
      %Video.TimedPoint{lon: 10.15492, lat: 53.614701, time_offset_ms: 89954},
      %Video.TimedPoint{lon: 10.154824, lat: 53.614712, time_offset_ms: 90288},
      %Video.TimedPoint{lon: 10.154722, lat: 53.614722, time_offset_ms: 90621},
      %Video.TimedPoint{lon: 10.154617, lat: 53.614734, time_offset_ms: 90955},
      %Video.TimedPoint{lon: 10.154513, lat: 53.614748, time_offset_ms: 91289},
      %Video.TimedPoint{lon: 10.154416, lat: 53.61476, time_offset_ms: 91622},
      %Video.TimedPoint{lon: 10.154326, lat: 53.614773, time_offset_ms: 91956},
      %Video.TimedPoint{lon: 10.154239, lat: 53.614784, time_offset_ms: 92289},
      %Video.TimedPoint{lon: 10.154158, lat: 53.614793, time_offset_ms: 92623},
      %Video.TimedPoint{lon: 10.154079, lat: 53.614803, time_offset_ms: 92957},
      %Video.TimedPoint{lon: 10.154, lat: 53.614815, time_offset_ms: 93290},
      %Video.TimedPoint{lon: 10.153923, lat: 53.614828, time_offset_ms: 93624},
      %Video.TimedPoint{lon: 10.15386, lat: 53.614847, time_offset_ms: 93957},
      %Video.TimedPoint{lon: 10.153826, lat: 53.614854, time_offset_ms: 94291},
      %Video.TimedPoint{lon: 10.153802, lat: 53.614841, time_offset_ms: 94625},
      %Video.TimedPoint{lon: 10.153762, lat: 53.614809, time_offset_ms: 94958},
      %Video.TimedPoint{lon: 10.153722, lat: 53.614771, time_offset_ms: 95292},
      %Video.TimedPoint{lon: 10.153712, lat: 53.614723, time_offset_ms: 95625},
      %Video.TimedPoint{lon: 10.153753, lat: 53.614682, time_offset_ms: 95959},
      %Video.TimedPoint{lon: 10.153842, lat: 53.614649, time_offset_ms: 96293},
      %Video.TimedPoint{lon: 10.153944, lat: 53.614616, time_offset_ms: 96626},
      %Video.TimedPoint{lon: 10.154063, lat: 53.614588, time_offset_ms: 96960},
      %Video.TimedPoint{lon: 10.154195, lat: 53.614576, time_offset_ms: 97293},
      %Video.TimedPoint{lon: 10.154328, lat: 53.614562, time_offset_ms: 97627},
      %Video.TimedPoint{lon: 10.15446, lat: 53.614543, time_offset_ms: 97961},
      %Video.TimedPoint{lon: 10.154596, lat: 53.614524, time_offset_ms: 98294},
      %Video.TimedPoint{lon: 10.154735, lat: 53.614504, time_offset_ms: 98628},
      %Video.TimedPoint{lon: 10.154871, lat: 53.614487, time_offset_ms: 98961},
      %Video.TimedPoint{lon: 10.15501, lat: 53.61447, time_offset_ms: 99295},
      %Video.TimedPoint{lon: 10.155146, lat: 53.614448, time_offset_ms: 99629},
      %Video.TimedPoint{lon: 10.155276, lat: 53.61443, time_offset_ms: 99962},
      %Video.TimedPoint{lon: 10.155411, lat: 53.614413, time_offset_ms: 100_296},
      %Video.TimedPoint{lon: 10.155536, lat: 53.61439, time_offset_ms: 100_629},
      %Video.TimedPoint{lon: 10.155637, lat: 53.61436, time_offset_ms: 100_963}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "_mfheBy}_jR?@???????????@????????@??@?????@??@??@???@@??@???@@@??@@?@?@@??@@@?@@@?@@@@@?B@@@@@B@@?B@@@B@BB@@B@D@BBBBD@BBDBDBDBFBDDHDFDFBFDHDDBFDDBFDDBFDFBDDFBDDFBDDFDDBFDDDFBDDFDFBDDFDFBFDDDFDFDFBFDFDFDDDFDFBFDFDHDFDFDFDFDHDFDFDFDHDFDHDFDFDHDFDHDFDFFHDHDFDHDFFHDFDHDFDHFFDHDFFHDFDFFHDFDHFFDHDFFHDFFFDHFFDFDHFFFHDFFFDHFFDHFFFFDHFFFFDHFFFHDFFFFHFFDHFFFHFFDFFHFFFFDHFFFHFFDFFHFFFHFFDHFFFFFHDFFHFFFHFFDHFFFFFHDFFHFFFHFHFFDHFFFHFFDHFFFHFFFHFFDHFFFHFFFHFFFHFFDHFFFHFFFHFFFFFHFFFHFFFHFFFFFHFFFHFFFHFFFHFFFFFHFFFHFFFHFFFHFFFHFFFHFFFHFFFHFHFFFHFHFFHHFHFFFHFFHHFHFHFFFHFFHHFHFFFHFFFHHHFFFFFHFFFHFFFHFFHHFFFFFHFFFHFFFFHHFFFHHHFFFFFHFFHHFFFHHHFFFHHFFHFFHHFFFHFFHHFHFFFHFFHHFFFHFFFHHFFHFFFFFHFFFHFFHHFFFHFFFHFFFFHHFFFHFFFHFFFHFFHHFFFFFHFFFHFFFHHHFFFHFFFHFFHHFHFFFHFHFFHHFFFHFHFFFHHFFHFHFHHFFHFFFHHHFFFHHHFHFFHHFHFFHHFHFFFHHFFHFHFFFHHFFHFFFHFFFHFFHHFFFFFHFFFHFFFFHHFFFHFFFHFFHHFFFFFHHFFHFFFHFFHFFHFFFFFHHFFHFFFFFHHFFFFHFFHFFHFFFHHFFFFHFFFHHFFFFHFFFHHFFFFHFFFHFFHFFHFFFHFFFHFFFHHFFHFFFHFHFFHHFHFFFHFHFFHHFHFHFHHFFHFHFHFHHHFFFHFHFHHHFHFHFFFHFHFHHHFHFHFHFFFHHHFHFHFHFFFHHHFHFHFHFHFHHFFHFHFHFHFHFFFHHHFHFHFFFHFHFHFHFFFHFHFHFHFFFHHHFHFHFFFHFHFHFHFFFHFHFHHHFHFHFHFHHHFHFHFJHHFHFHFHFHFFHHFHFHFHFHFHFHFHFHFFFHFHFHFFFHFHFFFHFHFFFHFFFHFHFFHFFHFFFFFHHFFFFFHFFFFDHFFDFFHDFDFDHDFDHDHBFDHBFBHBHBF@HBH@HBF@H@F?H@H@F?H?F?H?HAF?HAF?HAFCFAHAFCHCFCHCFCFCFEFCFEFEFEFEFEFGDEFGFEDGFGDIFGDGFIDIDGFIDIDIDKDIDKDIDKDKBKDKDMBKDKDMBMDMDMBMBMDMBMBMDMBMBMBMDMBMBMBMBMBMBMBMBOBMBMBMBMBMBMBMBMBMBOBMBM@MBMBOBMBMBMBOBMBMBMBMBOBMBMBMBM@KBMBMBMBMBMBKBMBMBKBM@KBMBKBMBKBKBMBKBKBMBKBMBKBKBMBKBKDMBKBKBMBKDKBKBMBKDKBKBKDKBIDKBKBKDKBKDIBKDKDIBKDKDKBIDKBIDKDIDKBIDKDIDKDIBIDIDIDIDIDIDGDIDGDGDGDGDEDGBEDEDCDEDCDCDCDCDCBCDADADADADADAD?D?D?D?D?D?D@D?D@D@D@DBD@FBD@DBDDFBDBDDFDDDDDFDDDFDDFFFDDDFFFDDFFDFDFFFDFFFDFDFFFDFFFDFDFFFDFFFFFDFFFDFFFFDDFFFFFFFFHFDDFFFFFFFFFDFFFFHFFFFFFFFDFFFFFFHFFDFFFFHFFFFDFFFFHFFDFFFFFFHDFFFFFDFFHFFDFFFFFDFFFDFFFDFFFDFDFFFDFFDDFDFDFDDFFDDDFDDDFDDDFDDFDDFDDDDDDDFFDDDDDFFDDDDFDDDFDDDFDDDDDFBDDFBDDDBDDFBDBDBFBDBDBDBD@DBFBD@D@DBD@D@D@D@B@D@D@D@D@D@D?D@D?D@D?D@B?D?D@D?D?D?D?D?F?D?D?DAF?D?FAD?FAF?DAFAF?FAFADAF?FAFAFAFADAFAFAFAFAFADAFAFAFADAF?FAFADAFAFAFADAFAFAFADAFAF?FADAFAFAFADAFAF?FAFADAFAFADAF?FAFAFADAFAFAF?FADAFAFAF?FAFADAFAF?FAFAD?FAFAF?DAFAF?FAD?FAF?DAF?FAD?F?FAD?F?DAF?D?FAF?D?F?DAF?F?D?F?D?F?DAF?D?F?D?F?D?D?F?D?DAF?D?D?F?D?D?D?DAF?D?D?D?F?DAD?D?F?DAD?F?DAF?DAF?D?FAD?FADAF?FAD?FAFADAF?FADAFAFAD?FADAFAFADAFADAFAFADAFCDAFAFADAFADAFCFADAFCFADAFAFCDAFAFCDAFAFCFADAFCFAFADCFAFAFCFADAFCFAFCFADAFCFAFAFCFAFADAFCFAFADCFAFAFADCFAFAFADAFAFCDAFAFADAFAFADCFADAFADAFAFADAFADAFAD?FADAFADAFADADAF?DADAFAD?DAFADAD?FADAD?DAFAD?DAFAD?DADAF?DADAD?FAD?DAFAD?DAF?DAD?FADAD?FAD?DAD?FAD?DAD?DAF?DAD?D?DAD?DAF?DAD?DAD?D?DAD?DAD?DAF?DAD?DAF?DADAF?DAF?DADAF?FADAF?DAFADAF?FADAFADAF?FADAFAFADAFAFADAFAFAD?FAFAFADAFAFADAFAFAFCFAFADAFAFAFAFAFAFADAFAFAFAFADAFAFAFADAFAFADAFADAFADAFADAF?DAFADAFADAD?FADADAF?DADADAF?DADADAD?FADADAD?DADADAD?FADADADAD?FADADADAFADADAF?DADAFADADAFADAFAFADAFAFAFADAFAFAFCFAFAFAFAFAFAFAFAFAFCFAFAFADAFCFAFAFAFCDAFAFCFAFADCFAFCFADAFCFAFCFCDAFCFAFCDCFCFAFCFCFCDCFCFAFCFCDCFEFCFCFCFCFEFCFEFCFEFCFEFEFCFEFEFEFCFEFEDEFEFEFEFEFEFEDEFEFGFEDEFEFEFGDEFEFEDEFEFGDEFEFEDGFEFEDEFGFEDEFEDGFEFEDEFEDGFEDEDEFEDEFEDEDEFEDEDEFEDEDEDEFEDEDEDEDEDEFEDEDEDEDEFEDEDEDEDEDEFEDCDEDEDEDEFEDEDEDEDEFEDEDEDEFEDCDGDEFCDEDEDEFEDEDEFEDEDEFEDEDEFEDGFEDEFEDEDEFEDEFEFEDGFEDEFEDEFEDEFEDEFEDEFEDEFEDEFEDEFEDEFEDEFEDEDEFEDEFEDCDEFEDEFEDEDEFEDEFCDEDEFEDEFEDEDCFEDEFEDEDCFEFEDEDEFCDEFEDEFCDEFEDEFEDCFEDEFCFEDEFEDCFEDEFEDEFCFEDEFEDEFCFEDEFEDEFEDCFEDEFEDEFEFEDCFEDEFEDEFCDEFEDEFEDEFEDEFEDEFEDCFEFGDEFEFEDEFEFEDEFEFEDEFGFEDEFEDEFEDEFEFEDEFEDEFEDEFCDEDEFEDEFEDCFEDEFEDEFCDEFEDEFEFEDEFEFEFEDEFEFEFEFEFEDEFEFEFEDEFEFEFEFEDEFEFEFEDEFEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEDEFEFEDEFEFEDEFEFEDEFEFEFGDEFEFEFEFGDEFEFEFEFGFEDEFEFEFGDEFEFEFEDGFEDEFEFEDEFEDEFGDEFEFEDEFEDEFEDEFEDGFEDEFEDEFEDEFEDEFEFEDEFEDEFEFEDEFEDEFEFGFEDEFEFEFEFEFGDEFEFEFEFGFEFEFEFEFGFEFEFEFEFGFEDEFEFEFEFEFGFEFEFEFEFEDGFEFEFEFEFEFEDGFEFEFEFEFEDEFEFEFGFEFEDEFEFEFEDEFEFEFEDEFEFGFEDEFEFEFEDEFEFEFEDEFEFEDGFEFEDEFEFEFEDEFGDEFEFEDEFEFGDEFEFEDGFEDEFEFGDEFEDGFEFEDEFGDEFGDEFEFGDEFEDGFEDEFGFEDEFGFEDGFEFGDEFEFGFEDGFEFGFEFEDGFEFGDEFEFEDGFEFGDEFEFEDGFEFEDEFGDEFEDEFGDEFEDEFGDEFEDEFGDEFEDEDGFEDEFEDGDEFEDEFGDEDEDEFEDEDEDEFEDEDEDEDEDEDEDEFEDCDEDEDEDEDEDCDEFEDEDEDEDCFEDEDEFEDEDEFCDEDEFEDEFEDEDEFEDEFEDEFEFEDEFEDGFEDEFEFEDGFEFEDEFGFEDEFEDEFGFEFEDEFGDEFEFEDGFEFEDEFGDEFEFEDEFEDEDEFEDEFEDEFEDEDEFCDEDEFEDCDEFEDCDEFEDCDEDEFCDEFEDCDEFCDEFCDEFCDEFEDCFEDCFEDEFCDEFEDCFEFEFEDEFEFEFEDGFEFEDGFEDGFEDEDGDEDEBEDGBEDEBEBEBGBEBEBEBEBCBE@EBE@EBEBE@EBE@E@EBE@CBE@EBE@E@EBE@E@EBC@EBE@E@EBE@CBE@EBE@EBE@EBEBE@EBEBEBEBEBEBEBEBEBEBEDEBEDGBEDEDGDEDEBGFEDEDEDGDEFEDGDEFEDGFEDEDEFEDEFGDEFEDEDEFEDEFEDEFEDEFEDEFEDCFEDEFEDEFEDEFEFEFEDEFEFEDEFEFEFGFEFEDEFEFEDEFEFCDEFEFEDEFEDEFEDCFEDEFEDEFCDEFEDEFEDCDEFEDEFEFEDEFEFEDEFEFEDEFGFEFEDEFEFEDEFEFGFEDEFEFEFEFEDEFEFEFEFEDEFEFEFEFEFEDGFEFEFEFEFEFEFEFEFEFEFGFEFEFEFEFGHEFEFEFGFEFEFEFGFEFGFEDEFGFEFEFGFEFGFEFGFEFGDEFEFGFEFGDEFGFEFEFGDEFEFGFEDEFGFEFEDGFEFEDEFGFEFEDEFGFEFEFGDEFEFEFEDGFEFEFGFEFEDEFEFEFEFEDGFEFEFEFEDEFEFEFEDEFCFEFEFEDEFEFEFEDCFEFEFEFEFEFCFEDEFEFEFEFCFEFEFEFEFEFCFEFEFEFEFCFEFEDEFEFEFEFCFEFEFEFEDEFEFEFCFEFEFEFEFEFEDEFEFEFEFEFEFEFEFEFEFEFEDEFEFEFEFEFEFEFEDCFEFEFEFEFEDEFEFEFEFEFEDEFEFEFEFEFEFEFEFEFGHEFEFEFEFGFEFEHGFEFGFEFEHGFEFEFGFEFGFEHGFEFGFEFGFEFEHGFGFEFGFEFGFEFGFEFGFGFEFGFEFGFEFGFGFEFGFEFGDGFEFGFEFGFEFGDEFGFGFEFGFEFGFGFEDGFEFGFEFGFEFGFGDEFGFEFGFGFGHEFGFGFGFGFEFGFGFGHGFGFGFGFGFGHEFGFGFGFGHGFGFGFGFGHGFGFGFGHGFGFGFGFGHEFGFGFGHEFGFGFGFEHGFGFEFGFEHGFGFEFGFEHEFGFEFGFEFEFGFEFGFEFEFGFEFEFEFGDEFEFGFEFEFGFEFEFGFEFGFEHGFEFGFEFGHEFGFEFGHGFEFGHEFGFGFEFGHGFEFGHGFEFGFGHEFGFGFEHGFGFGHEFGFGFEFGFGHEFGFGFGFEFGHGFEFGFGFEFGFGFGFEFGFGFEFGFGFGHGFEFGFGFGFGFEFGFGFGFGFEFGFGFEFGFGFGDEHGFGFEDGFEFGFGFEFGFEFGFEFGFEFGDEFEFGFEFEDGFEFGFEDEFEFGDEFEFEDGFEDEFEDGFEDEFEDEDEDEFCDEDEDEDCDEDEDCDEDCDCDEBCDCBCDCBCDCBCBABCBABCBABC@ABABC@ABA@ABA@ABC@ABA@A@ABA@A@ABA@A@ABA@A@ABA@A@A@CBABCBABEDEDEFGHIHKHKNSLQP[R[Ta@Ra@Ve@Te@Vg@Ti@Rc@Nc@JYHWDSBMBM@I@G@G?C@C?E?C?E?E?E?E?E?G?E?G?G?G?GAI?IAI?IAI?KAKAKAKAMAMAMAMCMAMAMCKAMAKCMAMCKAMCKAKCMAKCMAKAMCMCKAMAMCKAMCMAKCMAMAMCMAMCMAKAMAMCMAMAKAMCMAMAKAMAMAKCMAKAMAMAKAMAKAMAMAKCMAMAKAMAMAMAMAMCMAMAMAMAMCMAOAMAMCMAMAMAMAMCMAMAMAOCMAMAMCMAMAMAMCMAMAMCMAMAMCMAMAMAMCMAMAMCMAMAMCMAMAMCMAMAMCMAMAMCMAMAMCMAKAOCMAMCMAKAMCMAMAMCMAMAMCMAMAMCMAMAMCMAMAMCOAMAMCMAMAMAMCMAMAMCOAMAMCMAMAMCMAMAMCMAMAMCMAMAMAMCMAMAKCMAMAMCMAMAKCMAMAMCMAMAMCMAMAMCMAMCMAMAMCMAMCMAMAMCMAMCMAMAMCMAOAMCMAMAMAMCMAMAMAMAMAMAMCM?MAMAMAMAMAM?MAMAM?M?MAM?M?M?M?M?M?M?K?M@K?K@K?K@K@K@K@K@I@KBI@KBI@IBIBIBIBIBIBIBGBIDGBIDGBGDGDGDGDGDEDGDGFEDGFEFGDEFEFEFEDEFEFEFEFEFEFEDCFEFEDCFEFEFCDEFCFEDEFCFEFEDCFEFEFEDEFCFEFEFEFEFEFEDEFEFEFEFEFEFGFEFEFEFEFEFEDGFEFEFEFEFGDEFEFEFGFEFEFEDGFEFEFEFGFEFEFGFEFEDEFGFEFEFGFEFEFGFEFEFGFEFEFEFGFEFEFGDEFEFEFGFEFEFEFEDGFEFEFEFGFEFEFEFGFEFGFEFEFGFEFEFGFEFGFEFGHEFGFEFGFEFGFEFGFEFGHEFGFEFGFEFGFEFGFEFGFEFGFEFGFEFGFEFGHEFGFEFGFEFGFEFGFGFEHGFEFGFEFGFGFEFGFEFEHGFEFGFEFGFEFEFGFEFEFGFEFEFGFEFEFGFEFEFEFGFEHEFGFEFEFEFGFEFEFGFEFEFEFGFEFEFEFGFEFEFGFEFEFGFEFEFEFGFEFEHGFEFEFGFEFEFEFEFGFEFEFEFEFGFEFEFEFEFEFEFGFEFEFEFEFEDEFEFEFEFEFEFEFEFEFEFEFEDEFEFEFEFEFEFEFEFEFEFEFEFGFEFEFEFEFGFEFEFGHEFEFGFEFEFGFEHEFGFEFEFGFEFGFEFEHGFEFEFGFEFEFGFEFEFGFEFGHEFEFGFEFGHEFGFEFGFEFGHEFGFEHGFGFEFGFEHGFGFEFGHGFEFGFGHEFGFGHGFEFGFGHGFGFEFGHGFGFGFEHGFGFGHGFGFGFGHGFGFGFGHGFGHGFGFGFGHGFGFGFGHGFGFGFGHGFGFGFGFGFGHGFGFIFGHGFGFGFGFGHGFGFGFIHGFGFGHGFGFGHGFIFGHGFGFGFGHGFGFGHGFGHGFGFGFGHGFGFGHGFGHGFGFGHGFGFEFGHGFGFGHGFGFGFGHEFGFGFGFGHGFGFGFGFGFGFGHGFGFGFGFGFGFGFGFIFGFGFGFGFIFGFGHIFGFGFGFIFGFGFGFIFGHGFGFIFGFGHGFGFGHIFGFGHGFGFGHGFGFEHGFGFGHGFEFGHGFGHEFGFEHGFEHGFEFGHEFEFGHEFGHEFEHGFEHEFGHEFEHEHGFEHEFGHEHEFEHGFEHEFEHGHEFGHEHEFGHEHEFGHEFGHEHEFGHEFGHEHGFEHEFGHEFGHEFGHEFEHGFEHGFEHGFEHEFGHEFGHEFEHGFEHGHEFGHEFEHGHEFGHEHEFGHEHGFEHEFGHEHEFGHEHGFEHEHGFEHGHEFEHGHEFGHEHGFEHEFGHEFGFEHEFGHEFGHEFGFEFGHEFGFEHGFGFEFGFGFEFGFGFGFEFGFGFGFGDIFGDGFGDIDGFIBGDGDIDGBIDGBIBGBIBIBIBGBI@IBI@IBI@I@K@I@I@K@I@K@I?K@K?I?M@K?K?K?K?K?MAK?M?MAM?MAMAMAM?MAMAMAMAMAMAOAMAMAMAMAOAMAMAMAOAMAMAOAMAMAOAMAOAMAOAMAOAMAOAMAOAOAMAOAOAOAMAOAOAMAOAMAOAOAMAO?OAMAOAMAOAMAOAMAOAMAOAMAOAMAM?OAMAOAMAOAOAMAMAOAMAOAMAOAOAMAOAMAOAMAOAMAOAMAOAOAMAOAMCOAMAOAMAOAOAMAOAOAMAOAMAMAOCMAOAMAOAMAMAOAMAOAMAMAOAMAMAMAOAMAMAMAMAOAMAOAMAMAMAOAMAMAMAOAMAOAMAMAMAOAMAMAMAOAMAOAMAMAMAOAMAOAMAMAMAOAMAMAMAMAOAMAM?MAMAMAMAMAMAMAMAMAKAMAMAMAMAMAMAMAKAMAMAMAMAMAMAM?MAKAMAMAMAMAMAMAMAMAMAMAMAMAKAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAKAMAMAM?MAMAMAKAMAMAKAMAMAMAKAM?MAMAKAMAMAKAMAM?KAMAMAMAKAM?MAMAMAKAM?MAMAKAM?MAMAKAM?MAMAMAM?KAMAM?MAMAK?MAMAM?MAM?MAMAK?MAM?MAM?MAK?MAM?KAM?MAK?MAM?KAM?MAK?MAK?MAK?K?MAK?MAK?KAM?KAM?KAK?MAK?K?MAK?KAK?KAK?MAK?K?KAM?KAK?K?KAK?K?MAK?KAK?I?K?KAK?I?KAI?K?KAI?K?I?KAI?I?I?IAI?KAK?I?KAI?KAG?IAG?G?GAE?E?E?EAE?C?C?EAC?C?C?C?AAC?A?C?A?CAA?A?A?A?A?A?A?AAA?A???A?A?A?A?AAA?A?A?A?AAC?C?CAC?A?A???A???A?????????????????????????A????A??????????????????A?????????A?????A???A???AAA???A?A?A?AAA?A?A?AAA?C?A?CAA?CAC?C?CACAE?CAE?EAEAGAGAGAGAIAICIAMCKAKCOCOCQEQCOCKAKCIAKCKCIAKCKCKAICKCIAKCICKCIAKCKCIAKCKCIAKCICKAKCICKCKAKCICKCKAKCICKCKAKCKCKCKCKCKCKCKAKCKCKCMCKCKCKCKCKCKCKEKCMCKCKCKCKCMCKEKCKCKCMCKCMEKCKCKCMCKCKCKCMCKCMCKCKCKCMCKCKCKCKCMCKCKCKCKCKCKCKCKCICKCKCKCICKCICKEICKCICICKEICICICKEICIEICIEICKEICIEIEICKEIEIEICKEIEIEIEICKEIEIEICKEIEKEIEICKEIEKCIEKEICKEIEKCKEICKEICKEKCIEKEKCIEKCKCIEKCKEICKEKCKEICKEKCIEKCKEKCIEKEKCKEKEICKEKEKEKCKEIEKEKEKCIEKEKEIEKEKCIEKEKEIEKEICKEIEIEKEICKEIEKEIEKCIEKEIEIEKEICKEIEKEICKEIEIEKEICKEIEKEICKEIEKEIEKEKCIEKEKEIEKEKEKCIEKEKEKEKEIEKEKEKCIEKEKEIEKEKEKCIEKEIEKEKEIEKCKEIEKEIEKEICKEIEKEIEKEICKEIEKEIEKEICKEIEKEICKEIEKCIEKEICKEKEKCIEKCKEKEICKEKCKEKCKEKCKEKCKEKCKEICKEKCMEICKCKEKCKEKCKCKCKEKCKCKCKCKCKCMCKCKCKAMCKAKCMAKCKAMAKAKAMAKAM?KAK?KAK?K?K?K?K?K?K@K?K@K?I@K@K@K@KBK@K@KBI@KBIBIBIBKBIBIBGBIBGDIBGDGBIDGBGDGDEDGDGDEDGDEDEDEDEFEDEFEDEFCDEFCFEDCFCFEFCFCFCFCFCFAFCFCFAFCFCFAFCFAHAFCFAFAFAHCFAFAFAFAFAFAFAFAHAFAFAFAFAFAFAF?DAFAFAFAFAFAF?FAFAFADAFAFAFAFAFAFCFAFAFAFAFCFAFAFCDAFCFAFCFAFCFCFAFCFCFCDCFAFCFCFCFCFCFCFCDCFCFCFCFCFCDCFEFCFCFCFCDCFCFCFCFCDEFCFCFCFCDCFCFCFCFCDCFCFCFCFCDCFCFCFCFCFCFCDCFCFCFCFCFCDCFCFCFCFCFAFCFCFCFCFCFCFCFCFCFCFCFCDCFCFAFCFCFCFCFCFCFCDCFCFAFCFCFCDCFCFCFCFCDCFCFCFCFCDCFCFCFCFCDCFCFCFCFCDCFCFCFCDCFCFCFEFCFCFCFCFEFCFCFCDEHCFCFEFCFCFCFEFCFCFCFEFCFCFEFCFCFCFCFCFEFCFCFCFCFCFEHCFCFCFCFCFCFCFCFCFCFEHCFCFCFCFCFCHCFCFCFCFEFCFCFCHCFCFEFCFCFCFCHEFCFCFEFCHCFCFEFCFCFEFCHCFEFCFCFEFCHCFEFCFCFCHEFCFCFEFCFCFCFCHEFCFCFCFCFEFCFCFCFCHCFCFCFEFCFCFCFCHCFCFEFCFCHCFEFCHCFCHEFCFCHEFCHCFEHCFEFCHCFEFCHEFCFEHCFEFCHEFCFEFCFEHEFCFEFEFCHEFEFCFEFEFEFCFEFEHEFEFCFEFEFEFEFEFEFEFEFCFEFEFEFEHEFEFEFEFEHEFEFEFEHEFCFEHEFCFEFCFCHEFCFCFAFCHCFCFAFAFCFAFAFAH?FAF?FAF?F?F?F?F@F?F@F?D@F@F@F@F@FBD@FBFBF@FBFBFDFBDBFBFDFBFDFDFDDBFDFDFDFDFDDDFFFDFDFDFDFDDFFDFDFDFDDFFDFDFDFFDDFDFDFDFDDFFDFDFDFDDDFDFDDDFDFDFDDDFDFDDDFDFDDDFDFDDDFDDDFFDDFDFDDFFDFFDDFFDFFDFFDFFFDFFHDFDFDHFFBFDHDFBFDHBFBHBFBFBFBH@FBF@HBF@F@F@H@F@F@F@F@F?F@F@F?F?F@F?F?F@H?F?F?F?F?F?F?F?H?F?F?H?F?HAF?H?HAF?H?FAH?HAH?F?HAH?HAH?HAH?FAH?HAH?HAH?HAH?HAHAJ?HAH?HAH?HAH?JAH?HAHAH?HAH?JAH?HAH?JAHAH?HAJ?HAHAJ?HAHAJ?HAH?HAJAH?HAJAH?HAJAH?HAHAJ?HAHAJ?HAHAJ?HAHAH?HAHAH?JAHAH?HAHAH?HAHAF?HAH?HAHAH?FAHAH?FAH?HAHAF?HAFAH?FAH?FAHAH?FAH?FAFAH?FAH?FAHAF?HAF?HAF?FAHAF?HAF?HAF?FAH?FAFAF?FAH?FAF?FAH?FAF?FAF?FAF?FAF?FAF?F?FAF?FAD?FAF?FAF?FAF?FAF?FAD?FAF?FAF?FAF?FAF?FAD?FAFAF?FAF?FAF?FAFAF?FAF?FAHAF?FAFAF?FAFAF?FAFAF?FAHAFAFAF?HAFAHAFAHAHAHAHAHAHAH?FAHAFAH?FAF?DAF?DAF?D?DAD?D?BAD?B?B?D?BA@?B?B?@?B?@?B?@?@?@?@?@?@?@?@?@???@?@?@???@?@?@???@?@@??@?@???@?@@??@?@?@@@???@@@?@@B?@@@?@@@@B?@@B@@@B@B@B@B@@@B@BBD@B@BBB@BBDBBBDBBBDBBBDBBDDBBDDDBBBDDB@BBDBB@B@DBB@B@B@B@D?B@B@B?B@B?D?B?B?B?B?B?B?B?@AB?BABAB?BABA@ABABABABC@ABABCBCBCBA@CBEBCBCBEBEBEBCBGBEBEBGBGBGBGBGBGBIBGBIBGBI@IBIBIBIBIBI@IBIBI@IBIBK@IBIBK@IBIBI@KBI@KBI@KBI@KBK@IBK@KBK@K@KBK@K@KBK@K@K@K@M@K@K@K@M@K@K@M@K@M@K@M@K?M@M@K@M?K@M@K?M@M@K@M?M@M@K?M@K@M?M@K@M@M?K@M@M@K?M@K@M@M@K?M@M@K@M@K@M?K@M@K@M@M@K@M@M@K@M?K@M@M@K@M@M@M@K@M@M@M@K@M@M@M@M@K@M@M@M@M?K@M@M@M@M@M@M@M@M@M@M@M@M@M@M@M@M@M@M@M@K@M@M@M@M@M?M@M@K@M@M@M@M@K@M?M@M@K@M@M@M?K@M@M@M@M@M@M@M?K@M@M@M@M@M@M@M@M@M?M@M@M@M@M@M@K@M@M@M@M@M@M@K@MBM@M@M@M@K@M@M@K@M@M@K@M@M?K@M@K@M@K@M@K@M@K@K@M?K@M@K@M@K@M@M@K@M@M?K@M@M@K@M@M@M@M@M@K@M@M@K@M@M@M@K@M@K@M@KBM@K@M@KBM@M@KBM@MBM@OBK@KBK@I@K@G@I@G@G@G@G@E@G@E@E@E?E@C@E?C@E@C?C",
      precision: 6
    }
  end
end
