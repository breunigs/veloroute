defmodule Data.AutoGenerated.Video.Rendered_e878ddb11978d379f76abd195c2cb954 do
  @moduledoc "#{"ahrensburg-a7: Hagener Allee → Bahnhofsstraße (via U-Ahrensburg Ost)"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "ahrensburg-a7: Hagener Allee → Bahnhofsstraße (via U-Ahrensburg Ost)"
  end

  @impl Video.Rendered
  def hash() do
    "e878ddb11978d379f76abd195c2cb954"
  end

  @impl Video.Rendered
  def length_ms() do
    82183
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-10-15-ahrensburg/GX014883", "00:02:11.932", "00:02:29.883"},
      {"2022-10-15-ahrensburg/GX014883", "00:04:30.070", :end},
      {"2022-10-16-ahrensburg2/GX014907", :start, "00:00:34.101"},
      {"2022-10-16-ahrensburg2/GX014927", "00:00:06.273", "00:00:20.153"},
      {"2022-10-16-ahrensburg2/GX014910", "00:00:34.701", "00:00:38.639"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.23567470203837,
      minLat: 53.65738461930456,
      maxLon: 10.243857,
      maxLat: 53.670651
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Oktober 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.23567470203837, lat: 53.65738461930456, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.235675, lat: 53.657386, time_offset_ms: 7},
      %Video.TimedPoint{lon: 10.235706, lat: 53.657459, time_offset_ms: 340},
      %Video.TimedPoint{lon: 10.235781, lat: 53.657519, time_offset_ms: 674},
      %Video.TimedPoint{lon: 10.235894, lat: 53.657546, time_offset_ms: 1008},
      %Video.TimedPoint{lon: 10.236274, lat: 53.657542, time_offset_ms: 2008},
      %Video.TimedPoint{lon: 10.236528, lat: 53.65755, time_offset_ms: 2676},
      %Video.TimedPoint{lon: 10.237325, lat: 53.657622, time_offset_ms: 4677},
      %Video.TimedPoint{lon: 10.238021, lat: 53.657696, time_offset_ms: 6345},
      %Video.TimedPoint{lon: 10.238442, lat: 53.657721, time_offset_ms: 7346},
      %Video.TimedPoint{lon: 10.239009, lat: 53.65779, time_offset_ms: 8680},
      %Video.TimedPoint{lon: 10.240106, lat: 53.65788, time_offset_ms: 11349},
      %Video.TimedPoint{lon: 10.241362, lat: 53.657937, time_offset_ms: 14685},
      %Video.TimedPoint{lon: 10.241759, lat: 53.657937, time_offset_ms: 15686},
      %Video.TimedPoint{lon: 10.24215, lat: 53.657915, time_offset_ms: 16687},
      %Video.TimedPoint{lon: 10.24253, lat: 53.657876, time_offset_ms: 17688},
      %Video.TimedPoint{lon: 10.242864251497007, lat: 53.65797783532934, time_offset_ms: 17701},
      %Video.TimedPoint{lon: 10.242868, lat: 53.658035, time_offset_ms: 18014},
      %Video.TimedPoint{lon: 10.242964, lat: 53.658442, time_offset_ms: 19682},
      %Video.TimedPoint{lon: 10.243054, lat: 53.658912, time_offset_ms: 21350},
      %Video.TimedPoint{lon: 10.243074, lat: 53.65928, time_offset_ms: 22684},
      %Video.TimedPoint{lon: 10.24303, lat: 53.65979, time_offset_ms: 24352},
      %Video.TimedPoint{lon: 10.243032, lat: 53.659879, time_offset_ms: 24686},
      %Video.TimedPoint{lon: 10.243055, lat: 53.659966, time_offset_ms: 25019},
      %Video.TimedPoint{lon: 10.243099, lat: 53.660045, time_offset_ms: 25353},
      %Video.TimedPoint{lon: 10.243168, lat: 53.660121, time_offset_ms: 25686},
      %Video.TimedPoint{lon: 10.243623, lat: 53.660557, time_offset_ms: 27688},
      %Video.TimedPoint{lon: 10.24375, lat: 53.66072, time_offset_ms: 28355},
      %Video.TimedPoint{lon: 10.243814, lat: 53.660883, time_offset_ms: 29022},
      %Video.TimedPoint{lon: 10.243832, lat: 53.660971, time_offset_ms: 29356},
      %Video.TimedPoint{lon: 10.243824, lat: 53.661131, time_offset_ms: 30023},
      %Video.TimedPoint{lon: 10.243857, lat: 53.661237, time_offset_ms: 30690},
      %Video.TimedPoint{lon: 10.243786, lat: 53.661281, time_offset_ms: 30764},
      %Video.TimedPoint{lon: 10.243775, lat: 53.661287, time_offset_ms: 31098},
      %Video.TimedPoint{lon: 10.243728, lat: 53.661303, time_offset_ms: 31431},
      %Video.TimedPoint{lon: 10.243655, lat: 53.661322, time_offset_ms: 31765},
      %Video.TimedPoint{lon: 10.243609, lat: 53.661361, time_offset_ms: 32098},
      %Video.TimedPoint{lon: 10.243599, lat: 53.661413, time_offset_ms: 32432},
      %Video.TimedPoint{lon: 10.243609, lat: 53.661466, time_offset_ms: 32766},
      %Video.TimedPoint{lon: 10.243639, lat: 53.661521, time_offset_ms: 33099},
      %Video.TimedPoint{lon: 10.24365, lat: 53.661585, time_offset_ms: 33433},
      %Video.TimedPoint{lon: 10.243633, lat: 53.661654, time_offset_ms: 33766},
      %Video.TimedPoint{lon: 10.243613, lat: 53.661725, time_offset_ms: 34100},
      %Video.TimedPoint{lon: 10.243596, lat: 53.661798, time_offset_ms: 34434},
      %Video.TimedPoint{lon: 10.243592, lat: 53.661872, time_offset_ms: 34767},
      %Video.TimedPoint{lon: 10.243596, lat: 53.661951, time_offset_ms: 35101},
      %Video.TimedPoint{lon: 10.243588, lat: 53.662031, time_offset_ms: 35434},
      %Video.TimedPoint{lon: 10.243576, lat: 53.66211, time_offset_ms: 35768},
      %Video.TimedPoint{lon: 10.243562, lat: 53.662189, time_offset_ms: 36102},
      %Video.TimedPoint{lon: 10.24355, lat: 53.662271, time_offset_ms: 36435},
      %Video.TimedPoint{lon: 10.243537, lat: 53.662349, time_offset_ms: 36769},
      %Video.TimedPoint{lon: 10.243523, lat: 53.662427, time_offset_ms: 37102},
      %Video.TimedPoint{lon: 10.243508, lat: 53.662508, time_offset_ms: 37436},
      %Video.TimedPoint{lon: 10.243498, lat: 53.662589, time_offset_ms: 37770},
      %Video.TimedPoint{lon: 10.243489, lat: 53.66267, time_offset_ms: 38103},
      %Video.TimedPoint{lon: 10.243476, lat: 53.662753, time_offset_ms: 38437},
      %Video.TimedPoint{lon: 10.243461, lat: 53.662834, time_offset_ms: 38770},
      %Video.TimedPoint{lon: 10.243442, lat: 53.662914, time_offset_ms: 39104},
      %Video.TimedPoint{lon: 10.24342, lat: 53.662995, time_offset_ms: 39438},
      %Video.TimedPoint{lon: 10.243403, lat: 53.66307, time_offset_ms: 39771},
      %Video.TimedPoint{lon: 10.243386, lat: 53.663144, time_offset_ms: 40105},
      %Video.TimedPoint{lon: 10.243376, lat: 53.663222, time_offset_ms: 40438},
      %Video.TimedPoint{lon: 10.243363, lat: 53.663299, time_offset_ms: 40772},
      %Video.TimedPoint{lon: 10.243347, lat: 53.663375, time_offset_ms: 41106},
      %Video.TimedPoint{lon: 10.243336, lat: 53.663455, time_offset_ms: 41439},
      %Video.TimedPoint{lon: 10.243326, lat: 53.663535, time_offset_ms: 41773},
      %Video.TimedPoint{lon: 10.243306, lat: 53.663614, time_offset_ms: 42106},
      %Video.TimedPoint{lon: 10.243283, lat: 53.663694, time_offset_ms: 42440},
      %Video.TimedPoint{lon: 10.243263, lat: 53.663771, time_offset_ms: 42774},
      %Video.TimedPoint{lon: 10.243254, lat: 53.663847, time_offset_ms: 43107},
      %Video.TimedPoint{lon: 10.243246, lat: 53.663929, time_offset_ms: 43441},
      %Video.TimedPoint{lon: 10.243233, lat: 53.664008, time_offset_ms: 43774},
      %Video.TimedPoint{lon: 10.243218, lat: 53.664089, time_offset_ms: 44108},
      %Video.TimedPoint{lon: 10.2432, lat: 53.664172, time_offset_ms: 44442},
      %Video.TimedPoint{lon: 10.243188, lat: 53.664251, time_offset_ms: 44775},
      %Video.TimedPoint{lon: 10.243177, lat: 53.664331, time_offset_ms: 45109},
      %Video.TimedPoint{lon: 10.243161, lat: 53.664411, time_offset_ms: 45442},
      %Video.TimedPoint{lon: 10.243143, lat: 53.664488, time_offset_ms: 45776},
      %Video.TimedPoint{lon: 10.243119, lat: 53.664562, time_offset_ms: 46110},
      %Video.TimedPoint{lon: 10.243091, lat: 53.664639, time_offset_ms: 46443},
      %Video.TimedPoint{lon: 10.243074, lat: 53.664717, time_offset_ms: 46777},
      %Video.TimedPoint{lon: 10.24307, lat: 53.664795, time_offset_ms: 47110},
      %Video.TimedPoint{lon: 10.243069, lat: 53.664874, time_offset_ms: 47444},
      %Video.TimedPoint{lon: 10.243058, lat: 53.664953, time_offset_ms: 47778},
      %Video.TimedPoint{lon: 10.243041, lat: 53.665034, time_offset_ms: 48111},
      %Video.TimedPoint{lon: 10.243025, lat: 53.665117, time_offset_ms: 48445},
      %Video.TimedPoint{lon: 10.24301, lat: 53.6652, time_offset_ms: 48778},
      %Video.TimedPoint{lon: 10.242994, lat: 53.665285, time_offset_ms: 49112},
      %Video.TimedPoint{lon: 10.242971, lat: 53.665371, time_offset_ms: 49446},
      %Video.TimedPoint{lon: 10.242953, lat: 53.665454, time_offset_ms: 49779},
      %Video.TimedPoint{lon: 10.24294, lat: 53.66554, time_offset_ms: 50113},
      %Video.TimedPoint{lon: 10.242924, lat: 53.665628, time_offset_ms: 50446},
      %Video.TimedPoint{lon: 10.242904, lat: 53.665711, time_offset_ms: 50780},
      %Video.TimedPoint{lon: 10.242883, lat: 53.665795, time_offset_ms: 51114},
      %Video.TimedPoint{lon: 10.242867, lat: 53.66588, time_offset_ms: 51447},
      %Video.TimedPoint{lon: 10.24285, lat: 53.665967, time_offset_ms: 51781},
      %Video.TimedPoint{lon: 10.24283, lat: 53.666054, time_offset_ms: 52114},
      %Video.TimedPoint{lon: 10.242812, lat: 53.666142, time_offset_ms: 52448},
      %Video.TimedPoint{lon: 10.242791, lat: 53.666229, time_offset_ms: 52782},
      %Video.TimedPoint{lon: 10.242772, lat: 53.666317, time_offset_ms: 53115},
      %Video.TimedPoint{lon: 10.242757, lat: 53.666407, time_offset_ms: 53449},
      %Video.TimedPoint{lon: 10.242742, lat: 53.666492, time_offset_ms: 53782},
      %Video.TimedPoint{lon: 10.242727, lat: 53.666579, time_offset_ms: 54116},
      %Video.TimedPoint{lon: 10.242718, lat: 53.666671, time_offset_ms: 54450},
      %Video.TimedPoint{lon: 10.242706, lat: 53.666762, time_offset_ms: 54783},
      %Video.TimedPoint{lon: 10.242693, lat: 53.666851, time_offset_ms: 55117},
      %Video.TimedPoint{lon: 10.242678, lat: 53.666943, time_offset_ms: 55450},
      %Video.TimedPoint{lon: 10.242658, lat: 53.667033, time_offset_ms: 55784},
      %Video.TimedPoint{lon: 10.242644, lat: 53.667123, time_offset_ms: 56118},
      %Video.TimedPoint{lon: 10.242641, lat: 53.667213, time_offset_ms: 56451},
      %Video.TimedPoint{lon: 10.242646, lat: 53.667303, time_offset_ms: 56785},
      %Video.TimedPoint{lon: 10.242654, lat: 53.66739, time_offset_ms: 57118},
      %Video.TimedPoint{lon: 10.24267, lat: 53.667472, time_offset_ms: 57452},
      %Video.TimedPoint{lon: 10.242683, lat: 53.667542, time_offset_ms: 57786},
      %Video.TimedPoint{lon: 10.242695, lat: 53.667607, time_offset_ms: 58119},
      %Video.TimedPoint{lon: 10.242707, lat: 53.667661, time_offset_ms: 58453},
      %Video.TimedPoint{lon: 10.242713, lat: 53.667689, time_offset_ms: 58786},
      %Video.TimedPoint{lon: 10.242716, lat: 53.6677, time_offset_ms: 59120},
      %Video.TimedPoint{lon: 10.242722, lat: 53.667725, time_offset_ms: 59454},
      %Video.TimedPoint{lon: 10.24273, lat: 53.66777, time_offset_ms: 59787},
      %Video.TimedPoint{lon: 10.24274, lat: 53.667826, time_offset_ms: 60121},
      %Video.TimedPoint{lon: 10.24276, lat: 53.66789, time_offset_ms: 60454},
      %Video.TimedPoint{lon: 10.242783, lat: 53.667959, time_offset_ms: 60788},
      %Video.TimedPoint{lon: 10.242809, lat: 53.668032, time_offset_ms: 61122},
      %Video.TimedPoint{lon: 10.242835, lat: 53.668105, time_offset_ms: 61455},
      %Video.TimedPoint{lon: 10.242866, lat: 53.668181, time_offset_ms: 61789},
      %Video.TimedPoint{lon: 10.242893, lat: 53.668258, time_offset_ms: 62122},
      %Video.TimedPoint{lon: 10.242922, lat: 53.668338, time_offset_ms: 62456},
      %Video.TimedPoint{lon: 10.242953, lat: 53.668418, time_offset_ms: 62790},
      %Video.TimedPoint{lon: 10.242985, lat: 53.668499, time_offset_ms: 63123},
      %Video.TimedPoint{lon: 10.24301, lat: 53.668585, time_offset_ms: 63457},
      %Video.TimedPoint{lon: 10.243031, lat: 53.668671, time_offset_ms: 63790},
      %Video.TimedPoint{lon: 10.243048, lat: 53.668756, time_offset_ms: 64124},
      %Video.TimedPoint{lon: 10.243061, lat: 53.668843, time_offset_ms: 64458},
      %Video.TimedPoint{lon: 10.243095876876877, lat: 53.66895228828829, time_offset_ms: 64615},
      %Video.TimedPoint{lon: 10.243099, lat: 53.668964, time_offset_ms: 64680},
      %Video.TimedPoint{lon: 10.243123, lat: 53.669028, time_offset_ms: 65014},
      %Video.TimedPoint{lon: 10.243145, lat: 53.669095, time_offset_ms: 65348},
      %Video.TimedPoint{lon: 10.243162, lat: 53.669161, time_offset_ms: 65681},
      %Video.TimedPoint{lon: 10.243171, lat: 53.669223, time_offset_ms: 66015},
      %Video.TimedPoint{lon: 10.243174, lat: 53.669281, time_offset_ms: 66348},
      %Video.TimedPoint{lon: 10.24318, lat: 53.669334, time_offset_ms: 66682},
      %Video.TimedPoint{lon: 10.243177, lat: 53.669385, time_offset_ms: 67016},
      %Video.TimedPoint{lon: 10.243153, lat: 53.669435, time_offset_ms: 67349},
      %Video.TimedPoint{lon: 10.243127, lat: 53.669481, time_offset_ms: 67683},
      %Video.TimedPoint{lon: 10.243108, lat: 53.669521, time_offset_ms: 68016},
      %Video.TimedPoint{lon: 10.243063, lat: 53.669575, time_offset_ms: 68350},
      %Video.TimedPoint{lon: 10.243011, lat: 53.669622, time_offset_ms: 68684},
      %Video.TimedPoint{lon: 10.242954, lat: 53.669658, time_offset_ms: 69017},
      %Video.TimedPoint{lon: 10.242866, lat: 53.669698, time_offset_ms: 69351},
      %Video.TimedPoint{lon: 10.24277, lat: 53.669738, time_offset_ms: 69684},
      %Video.TimedPoint{lon: 10.242663, lat: 53.669779, time_offset_ms: 70018},
      %Video.TimedPoint{lon: 10.242543, lat: 53.669819, time_offset_ms: 70352},
      %Video.TimedPoint{lon: 10.242421, lat: 53.669849, time_offset_ms: 70685},
      %Video.TimedPoint{lon: 10.242286, lat: 53.669873, time_offset_ms: 71019},
      %Video.TimedPoint{lon: 10.24217, lat: 53.669892, time_offset_ms: 71352},
      %Video.TimedPoint{lon: 10.242068, lat: 53.669906, time_offset_ms: 71686},
      %Video.TimedPoint{lon: 10.241967, lat: 53.669925, time_offset_ms: 72020},
      %Video.TimedPoint{lon: 10.241869, lat: 53.669947, time_offset_ms: 72353},
      %Video.TimedPoint{lon: 10.24177, lat: 53.669964, time_offset_ms: 72687},
      %Video.TimedPoint{lon: 10.241676, lat: 53.66998, time_offset_ms: 73020},
      %Video.TimedPoint{lon: 10.241605, lat: 53.669989, time_offset_ms: 73354},
      %Video.TimedPoint{lon: 10.241541, lat: 53.669998, time_offset_ms: 73688},
      %Video.TimedPoint{lon: 10.241456, lat: 53.670016, time_offset_ms: 74021},
      %Video.TimedPoint{lon: 10.241344, lat: 53.670031, time_offset_ms: 74355},
      %Video.TimedPoint{lon: 10.241221, lat: 53.670044, time_offset_ms: 74688},
      %Video.TimedPoint{lon: 10.241089, lat: 53.67007, time_offset_ms: 75022},
      %Video.TimedPoint{lon: 10.240955, lat: 53.670102, time_offset_ms: 75356},
      %Video.TimedPoint{lon: 10.24082, lat: 53.670133, time_offset_ms: 75689},
      %Video.TimedPoint{lon: 10.24068, lat: 53.670171, time_offset_ms: 76023},
      %Video.TimedPoint{lon: 10.240534, lat: 53.670213, time_offset_ms: 76356},
      %Video.TimedPoint{lon: 10.240386, lat: 53.670253, time_offset_ms: 76690},
      %Video.TimedPoint{lon: 10.240239, lat: 53.670305, time_offset_ms: 77024},
      %Video.TimedPoint{lon: 10.240102, lat: 53.670356, time_offset_ms: 77357},
      %Video.TimedPoint{lon: 10.240003, lat: 53.670398, time_offset_ms: 77691},
      %Video.TimedPoint{lon: 10.239897, lat: 53.670437, time_offset_ms: 78024},
      %Video.TimedPoint{lon: 10.239761790690315, lat: 53.67044568617416, time_offset_ms: 78245},
      %Video.TimedPoint{lon: 10.239765708003995, lat: 53.67044393020777, time_offset_ms: 78272},
      %Video.TimedPoint{lon: 10.239281, lat: 53.67065, time_offset_ms: 78939},
      %Video.TimedPoint{lon: 10.239207, lat: 53.670651, time_offset_ms: 79273},
      %Video.TimedPoint{lon: 10.23907209325409, lat: 53.67054369887451, time_offset_ms: 79940},
      %Video.TimedPoint{lon: 10.238915822090151, lat: 53.67048254828251, time_offset_ms: 80607},
      %Video.TimedPoint{lon: 10.23873336441803, lat: 53.67042945258994, time_offset_ms: 81274},
      %Video.TimedPoint{lon: 10.238577046627045, lat: 53.670420781197215, time_offset_ms: 81941},
      %Video.TimedPoint{lon: 10.238492386184864, lat: 53.670424959723384, time_offset_ms: 82183}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "er~ieB}pvoRA?AAAAC?AACACACACACACCEACCECECECGCGEECIGIEIGKIKIGEGGEGEEEGEGEGEECGEGCEEGCGCGCECGCGCGAGCGAGCGAGCGAGAICGAIAGAIAIAIAIAIAKAIAK?IAKAK?MAMAK?MAM?M?MAM?MAM?M?M?M?M?MAM?M?M?M?M?M?M?M?K?M?M?M?M?M?M?K?M?M?M?M?K?M?M?K?M?K?K?M?K?M?K?M?K?K?M?K?M?K?M?K?M?K?K?K?M?K?K?KAK?I?K?K?K?I?K?KAI?K?K?I?I?IAI?I?K?KAK?K?K?KAK?M?MAK?M?KAM?KAM?MAM?M?KAM?MAM?MAK?MAK?MAK?MAK?MAK?MAM?MAM?MAMAM?OAM?MAM?MAM?KAMAM?MAM?MAMAM?MAM?MAK?MAKAM?MAK?MAKAM?MAK?MAK?MAMAK?MAM?MAKAM?MAK?MAMAM?KAM?MAKAM?MAKAM?MAK?MAMAK?MAM?KAMAM?MAKAM?MAK?MAMAM?KAMAM?MAKAM?MAK?MAMAM?KAMAM?MAKAM?MAKAM?MAMAM?KAMAM?MAKAM?MAMAM?KAMAM?MAMAK?MAMAM?MAKAM?MAMAM?KAMAM?MAMAMAM?KAMAM?MAMAM?MAMAKAM?MAMAMAM?MAMAM?MAMAMAM?MAMAKAM?MAMAM?MAMAMAM?MAMAM?MAMAMAM?MAMAM?MAMAMAM?MAMAO?MAMAMAM?OAMAM?MAOAM?MAOAM?MAMAO?MAMAM?MAM?MAMAM?MAMAM?MAK?MAM?MAM?MAMAK?MAM?MAM?MAK?MAM?MAM?KAM?M?MAK?MAM?MAK?MAM?MAM?KAM?M?MAM?KAM?MAM?MAMAM?MAM?MAM?MAM?MAMAM?MAM?MAMAM?MAMAM?MAMAM?MAMAM?MAMAMAM?MAMAM?MAMAMAM?MAMAMAM?MAMAMAMAM?MAMAKAM?MAMAMAMAMAM?OAMAMAMAOAM?MAMAOAMAMAOAM?OAMAMAOAMAM?MAMAM?MAMAMAM?MAMAMAM?KAMAMAM?MAMAM?MAMAM?MAMAM?KAMAMAM?MAM?MAMAM?KAMAM?MAMAM?MAMAM?KAMAM?MAM?MAMAK?MAMAM?MAMAM?KAM?MAMAM?MAK?MAMAM?MAM?KAMAM?MAM?KAMAM?MAM?MAK?MAMAM?MAK?MAMAM?MAK?MAM?MAMAM?MAM?MAM?MAMAM?MAM?MAM?MAMAM?MAM?MAMAM?MAM?MAK?MAM?MAK?MAM?MAK?MAM?MAK?MAM?MAK?MAM?KAM?MAK?MAM?KAM?MAK?MAM?KAM?MAK?MAM?KAM?M?KAM?KAM?MAK?M?KAM?MAK?MAK?MAM?K?MAK?MAM?KAM?K?MAK?MAK?MAK?M?KAM?MAK?M?KAM?KAM?K?MAK?MAK?M?KAM?KAM?M?KAM?K?MAK?MAK?M?KAM?K?MAK?MAK?M?KAM?K?MAK?M?KAK?M?KAM?K?MAK?K?MAK?MAK?M?KAK?M?KAM?K?KAM?K?K?MAK?K?KAM?K?KAM?K?KAM?K?KAM?K?K?MAK?M?KAM?K?MAK?M?K?MAK?M?KAM?K?MAK?M?K?MAM?K?MAK?M?K?MAK?K?MAK?M?K?MAK?K?MAK?M?K?MAK?M?K?KAM?K?MAK?K?M?KAK?K?K?KAK?M?K?KAK?K?K?MAK?K?K?KAK?M?K?KAK?K?M?K?KAK?K?K?MAK?K?K?KAM?K?K?K?KAM?K?K?KAM?K?K?K?MAK?K?K?M?KAK?M?M?K?MAM?K?M?M?KAM?M?K?M?MAM?M?K?M?M?M?MAM?M?M?M?M?K?K?K?K?K?KAK?M?K?K?K?I?K?K?K?K?K?K?K?M?K?K@M?K?K?M?K?M?K?M?K?M?K@M?M?K?M?K?M?M@K?M?K?M?K@M?K?M?M?K@M?K?M?K@M?K?M?K@M?M?K?M@K?M?K@M?K?M@K?M?K@M?K@M?M?K@M?K?K@M?K@M?K?M@K?M@K?M@K?M?K@K?M@K?M@K?M@K?M@K?K@M?K@M?K@M?K@K?M@K?M@K@K?M@K?M@K?K@M@K?M@K?M@K?M@K@K?M@K?M@K?M@K?M@K?K@M?M?M@M?M?M@M?O?O?O?O?O?O?QAQ?S?QASAUAWAUAYC[C]Ec@Gk@M{@}@qEk@gBUg@KSIKGGEGCCCCCAAACACACACACAECCAEACAGAGAEAGCGAEAIAIAIAGAIAIAIAIAGAGAGAIAGAGAGAIAGAG?GAGAGAGAGAGAGAGAIAGAGAIAGAGAIAGAIAGAGAIAGAGAGAGAIAGAGAGAGAIAGAGAGAGAIAGAGAG?GAGAIAGAGAGAGAGAIAGAGAGAGAIAGAGAGAG?IAGAGAIAGAGAIAGAGAGAIAGAGAIAGAG?IAGAIAGAGAIAGAGAIAGAIAGAIAG?IAGAGAIAGAIAGAIAGAIAGAIAG?IAGAIAIAGAIAGAIAGAIAG?IAIAGAIAIAGAIAGAIAIAG?IAIAIAGAIAIAIAGAI?IAGAIAIAIAGAI?IAGAIAIAGAI?IAGAIAIAG?IAIAGAI?IAGAIAI?GAIAIAG?IAIAG?IAIAG?IAIAG?IAIAG?IAI?GAIAI?GAI?IAG?IAIAG?IAG?IAI?GAI?GAI?IAG?I?IAG?IAI?GAI?G?IAI?G?IAG?I?IAG?I?GAI?I?G?IAG?I?I?GAI?G?I?I?GAI?I?G?I?I?G?IAI?I?G?I?I?I?G?I?I?G?I?I?I?I?G?I?I?I?I?G?I?I@I?I?I?I?G?I?I@I?I?I?I?I?I@I?I?G?I?I@I?I?I?I?I@I?I?I@I?I?I@I?I?I?I@I?I?I@I?I?I@I?I@I?I?I@I?I?K@I?I@I?K@I?I?I@K?I@I?I@I?I@I?I?K@I?I@I?I?I@I?I@I?K@I?I?K@I?I@K?I@K?I?I@K?I@I?K?I@I?K@I?K?I@K?I?K@I?K?I?K@I?K?K?I@I?I?G?I?G?G?G?GAE?G?G?E?GAG?EAG?E?GAGAG?GAGAG?GAGAGAIAGAGAICGAGAICGAGAGCGAGCICGAGCGCGCGCGCGCGCGCECGCGCGCEEGCGCECEEGCECGEECECEEECECGEECEEEEECEEEEGEECEEGGGGEEGGGEGGGIGGIGGGGGGGGGGIIGGGGGGGGGGGGGGGGGGGEGGGGGGGGGGGGGGGGGEGGGGGGGGGGGGGEGGGGGGGEGGGGEEGGGEGGEGGEGGGEEGGGGEGGGGGGGEGGEGGGGGGEGGGGGGGEGGGGEEGGGGGEEGGGGEGGEEGGGGGEEGGGGEEGGEGGEGGEGGGGEEGGGGEGGGGGGGGGGEGGGGGGGGGGGGGGEGGGGGGGGGEGGGGGGGGGEEGGEGGGEGGGEEGGEGGGEGEGGEEGGGEGEGEGEGGEEGEGEGEGEEEGCGEEEGCGEGEGCGEGEGEGCGEGCGEGCGEGCGEGCGCGEGCGCGCGCGCGCIEGCGCGCGAICGCGCGCGCICGAGCICGAGCICGAGCIAGCGCIAGCGAIAGCGAGAGCGAGAGAGAGAEAGAGAG?EAGAGAE?GAGAG?EAG?G?EAG?GAG?G?G?GAG?G?I?G?G?I?G?I?G?G?I?G?I?G?I?G?I?G?G?G?G?I?G?G?EAG?G?G?G?EAG?E?G?GAE?GAE?G?EAE?EAG?EAE?EAG?E?EAE?E?GAE?E?E?E?E?E?E?E@E?E@E?E@GBE@GBE@EBGBEBEBGDEBEDEDGDGHKNGHEFADCDA@AB?@A@?@A@???@????A@???@A@???@A@?@?@A@?@A@?@A@?BA@?@ABAB?@ABABAB?BABABABABADABADABADADADADCDADADCFADCDAFCDADCFCDAFCDCDCFCDADCBCDCBADCBCDCBCBCBABC@CBCBC@CBCBE@C@CBC@C@E@C@C@E@C@E@E@C?E@C?E@C?E@E?C?E?C?E?E?C?E?CAE?E?CAE?EAC?EAE?CAEAC?EAEAEACAE?EACAEAEAEAEACAEAEAEAEAEAEAEACAEAGAEAE?EAEAEAE?EAEAE?GAE?EAE?E?G?EAE?G?E?E?G@E?E?G?E@G?E?G@E?G@E@G?E@G@E?G@E@G@E@G@G?E@G@E@G@E@G@E@G@G@E@G@E@G?E@G@G@E@G@G@E@G@E@G?G@E@G@E@G?G@G@E@G?E@G@G?E@G?G@E?G@G?E@G?G?E@G?G?E@G?G?E?G@G?E?G?G?G?E?G?G?G?G?G?G?G?E?G?G?G?G?G?G?G?G?G?G?G?G@G?G?G?G?I?G@G?G?G?G@G?G@G?G?G@G?G@G?G?G@G?G@G?G@G?E@G@G?G@G?G@G?G@G@G?G@G?G@E@G?G@G@G?G@G@G?G@G@G?G@G@G?G@G?E@G@G?G@G@G?I@G@G?G@G@G?G@G@G?I@G@G?G@G?G@G@G?G@G@G?I@G@G?E@G?G@G@G?G@G@G?G@E@G?G@G?G@G@E?G@G@G?G@G@G?G@E@G@G?G@G@G?G@G@G?E@G@G@G?G@G@G?G@G@G@G?G@G@G?I@G@G@G?G@G@G?G@G@G?G@G?G@G@G?G@I?G@G?G@G@G?G@G?G@G?G@G?G@G?G@G?G@G?G@G?G@G?G@G?I@G?G@G?G@G?G@G?G@G?G@G?G@I?G@G@G?G@G?G@G@I?G@G@G?G@G@I?G@G@G?G@G@G?G@G@I@G?G@G@G@G?G@G@G@G@G?G@G@G@G@G@G?G@G@G@G@G@G@G@G@G@G?G@G@G@G@G@G@G@G@G@G@G@G@GBG@G@I@G@G@G@G@G@G@G@G@G@G@G@G@G@G@G@G@G@E@G@G@G?E@G@G@E@G@G@E?G@G@E@G@G@E?G@G@E@G@G?E@G@G@E@G?G@E@G@G?E@G@G?G@G@E?G@G@G?G@G@G?G@G@G?E@G?G@G@G?G@G?G@G?G@G@E?G@G@G?G@G?E@G@G?G@G@G?G@E@G?G@G@G?E@G@G@G?E@G@G?G@E@G@G?G@G@E?G@G@G?G@E@G?G@G@G?G@G@G?G@G@G?G@G?G@G@G?G@G?G@G?G@G@I?G@G?G@E?G@G?G@G@G?G@I?E@G@G?G@G@G?G@G@G@G?G@G@G@G@G@G?G@G@G@G@G@G@G@G@G@E@G@G@G@I@E@GBG@G@G@G@G@I@G@G@G@GBG@G@G@G@G@G@G@G@E@G@G@G@G@G@G@E@G@G@G@G@G?E@G@G@G@E?G@G@G?E@G@G?G@E?G@G?G@E@G?G@G?G@E?G?G@G?G@G?G@G?G@G?G@G?G?I@G?G@G?G@G?I@G?G@G?G@G?G@G@G?G@G?G@G?G@G@G?G@G?E@G@G?G@G@G?G@G@G?G@G@G@G?G@G@G@G?G@G@G@G?G@G@I@G?G@G@G@G@G@G?I@G@G@G@G@G?I@G@G@G@G@G?I@G@G@G?G@G@G@G?G@G@G?G@G@G?G@G@G?E@G?G@G@G?G@G?G@G@G?G@G?G@G@G?G@G?G@G@G?G@G?G@G@G?G@G@G?G@G@G?G@G@G@G?G@G@G@G@G?G@G@G@G@G@G?G@G@G@G@G@G@G?E@G@G@G@G@G@E@G@G@G@E@G@G@G@G@E@G@G@E@G@G@EBG@G@E@G@G@E@GBG@E@G@GBE@G@G@GBG@E@G@GBG@G@GBG@G@G@EBG@G@G@GBG@G@G@G@G@E@G@G@G@G@G@G@G@G?E@G@G@G?G@G@G?G@G?E@G?G@G?G@G?G?G@G?E?G@G?G?G?G?G@G?E?G?G?G@G?G?G?G?G?G?G@G?G?G?G?G?G@E?G?G?G@G?G?G@G?G?G@G?G@G?E?G@G?G@G@G?G@G?G@G?G@G@G?G@G@G@G?G@G@G@G?G@I@G@G@G?G@G@G@G@G?G@G@G@I@G?G@G@G@G@G?G@I@G@G@G?G@G@G@I@G?G@G@G@G@I?G@G@G@G?G@G@I@G?G@G@G@G?G@I@G@G@G?G@I@G@G@G?G@I@G@G@G@I?G@G@G@I@G@G@G@I@G@G@I@G@G@G@I@G@G@I@G@I@G@G@G@I@G@G@G@I@G@G@G@I@G@G@G@G@G@G@I@G@G@G?G@G@G@G@I?G@G@G@G@I?G@G@G@I?G@G@G?I@G@G@I?G@G@I?G@G@I@G?I@G@G@I@G?I@G@I@G@I?G@I@G@G@I@G@G?I@G@G@G@I@G@G@G@G@G@G@I@G?G@G@G@G@G@G@G@I@G@G@G@G@G@I@G@G@G@G@I@G@G@G@G@I@G@G@G@G@I@G@G@G@G@I@G?G@G@I@G@G@I@G?G@G@G@I@G@G?I@G@G@I@G@G?G@I@G@G@I@G@I?G@G@I@G@G@I@G@G@I@G@G?I@G@I@G@G@I@G@G@I@G@G@I@G@G@I@G@I@G@G@I@G?G@I@G@I@G@G@I@G@I@G@G@I@G@I@G@G@I@G@G@I@G@G@I@G@G@I@G@I@G@G@G@I@G@G@I@G@I@G@G@I@G?I@G@G@I@G@I@G@G@I@G@I@G@G?I@G@I@G@I@G@I?G@I@G@I@I?G@I@G@I@G?I@G@G@I?G@I@G@G?I@G@G@G?I@G@G@G?I@G@G@G?G@G@I?G@G@G@I?G@G@G@I?G@G@I?G@G@I?G@G@I?G@I@G?G@I@I?G@I?G@I@G?I@G?I@I?G@I?I@G?I@G?I@I@G?I@G?I@I?G@I?G@I?I@G@I?G@I?G@I@G?I@G?I@G@I?G@I@G?I@G?I@G@G?I@G@I?G@I@G?G@I@G?I@G@I?G@I@I?G@I@G@I?I@G@I@I@G?I@G@I@G@I?I@G@I@G@I@G@I@G?I@G@I@G@I@G@I@G@I@G?I@G@I@G@I@G@I?G@I@G@I?G@I@G@I?G@I@G?I@G?I@G?I@G?I@G?I@G?I?G@I?G?I?G@I?G?I?G?I?G?I?G?I?G?I?G?I?G?I?G?I?G?IAG?I?G?I?GAI?G?I?GAI?G?IAG?I?GAG?I?GAI?GAG?IAG?IAG?G?GAIAG?GAG?IAG?GAIAG?GAGAI?GAGAGAG?IAGAGAG?GAGAE?GAGAGAG?GAEAG?GAEAG?EAGAE?EAGAE?GAEAG?EAEAG?EAG?EAEAG?EAGAE?GAEAG?EAGAE?GAEAGAE?GAGAGAG?GAEAGAGAE?EAEAE?EAEAE?CAC?CAC?C?CAA?CAC?A?AAC?A?A?AAA?A?A?A?AAA???A?A???AAA???A???A???A??AA???A?????A?????A???AA??A???A?A???A?AA??A?A?A?A??AA?A?A?A?AAC?A?A?AAC?A?CAA?C?CAC?A?EAC?CAC?EAC?EAC?EAE?EAEAG?EAEAE?GAEAE?EAG?EAEAE?EAEAE?EAEAEAG?EAEAEAEAE?GAEAEAEAGAEAEAGAEAEAGAEAEAEAGAEAGAEAEAGAEAGAECGAEAGAEAGAECGAEAGAEAGCEAGAGAECGAEAGAGCEAGAGCGAEAGAGCEAGAECGAGAEAGCGAEAGCGAEAGCGAEAGCGAEAGCEAGAGCEAGAGCEAGCGAGCEAGAGCGAECGAGCGAGCGAGCEAGCGAGCGAEAGCGAGCGAGCEAGAGCGAGCGAGCEAGAGCGAGAGCGAECGAGCGAGAGCGAGCGAGCGAGAGCGAGCGAGCGAGCGAGCGAGCGAGCGAGCGAGCGAGCGCGAGCGAGCGAGCGAGCGAGCGCGAGCGAGCGAGCGAICGAGCGAGCGAGCGAGCGAGCIAGAGCGAGCIAGAGCGAIAGCIAGAGAGCIAGAGAIAGCGAIAGAGAIAGAGCIAGAGAIAGAGAIAGAGAGAIAGAGAIAGAGAGAG?IAGAGAGAIAGAG?GAGAIAGAG?GAGAIAG?GAGAGAI?GAGAGAG?IAGAGAIAGAIAIAKAMAKCMCQCQCWG[G]G[GUGOCOEKCGAEACACAC?CACAE?CACAEACAEACAEAEAEAEAEAGAEAGCEAGAGCGAGAICGAGCGAEAGAEAGCGAEAEAGAEAEAGAEAGAEAEAGAEAGAEAE?GAEAEAGAEAE?GAEAEAE?GAEAE?GAE?EAEAE?EAE?GAE?EAE?EAE?E?EAE?EAE?E?EAE?E?EAE?E?E?EAE?E?E?EAE?E?E?CAE?E?E?EAC?E?E?E?C?EAE?C?E?E?C?E?CAE?E?C?E?C?E?C?E?E?C@E?C?C?E?C?E@C?E?C@E?C?E@C?E@C?E@C?E@C@E?E@C@E@C@E@C?E@E@C@E@CBE@C@E@C@E@C@E@EBC@C@E@C@C@EBC@C@C@E@C@C@CBC@C@C@C@C@C@C@C@C@C@CBC@A@C@C@C@C@A@C@CBC@C@C@CBC@EBC@CBEBCBE@CBEBEBCDEBEBEDEBEBEDEBEDCDEBEDEDEBCDEDCBEDCDEBCDEDCBCDCDEBCDCBCDCBCDCDCBADCBCDCBCDABCDCDABCDCBADCDCDCDADCDCDCDCFCDCFAFCFCDCFEHCFCFCHCFCHCFEHCFCHCHCFCHCHCHCFCHEHCHCHCHCFCHCHCHCHCHCFCHCHCHCHCHCJCHCHCHCHCHCHCJCHCHCJCHCJCHCJCHCJCHCJEJCJCHCJCJCJCJCJCJCJCJCLCJCJCJCJCJAJCJCJCJAJCLCHAJCLCJAJCJAJCJAJCJAJCJAJCJAJALCJALCJALAJCLALAJCLALALCLALALALCLAJALALAJALCJALAJALAJAJAJAJAJAJAJAJAHAJ?JAHAJAHAHAJAH?JAHAHAHAH?HAHAHAH?HAHAHAH?HAHAHAHAF?HAHAHAHAHAHAH?HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAJAHAHAHAHAHAHAHAHAHAHAHAHAFAHAHAHAHAHAHAHAHAHAH?HAHAHAHAHAHAHAHAHAHAHAH?HAJAHAHAHAHAHAH?JAHAHAHAHAH?HAHAHAH?FAHAF?FAFAF?HAF?DAF?FADAF?D?DAF?DAD?DAD?DAD?DAD?D?DAD?BAD?DAD?D?BAD?DAD?BAD?D?DAD?DAD?DADAF?DAF?DAFAF?DAFAF?FAHAF?FAHAFAHAH?FAHAHAJAHAHAH?JAHAJAHAJAJAJ?JAHAJAJAJAJ?JAJAJAJ?JAJAJAJAJ?JAJAJAJ?LAJAJAJAJ?LAJAJAJAJALAJALAJALAJALAJCLALAJALCLALAJCLALAJCLALALCJALCLALCJALCLAJCLALCLCLAJCLALCJALCLCJALCLALCJALCLCLAJCLAJCLALCLCJALCJCLALCLCJALCLCLCLALCLCLCLALCLCLCLCLCLCLCLCLCLCLCLCNCLCLCLCNCLCLCNCLCLCNCLCNCLCLCNELCLCLCNCLCNCLCLCNCLCLCLCNCLCLCNCLELCLCNCLCLCLENCLCNELCNCLELCNELCNELCNELCNELENCLELCNELELCNELELCLELCNELELELCNELELCLELCJELCJELCJEJCJCJEJCHCJCHCHCJCFCHCHCHCHCHCFCHCHCHCHAHCHCHCHCHCHCHAHCJCHCHAJCHCJAJCJCJALCNCPCPAPCPCPAPAPCNAPANANALAJAJ?HAHAF?BAHCJCLCLEPEPIZM^K`@M^K\\M^K^MZIXKXIXKZKZKZKZKZIXIVIVIXIVIVITGVITIVIZGZIZIZETEVETCTAJALAJAH?FAH?D?B?D?B?@@B?B?B@@?B?B@B@B?B@D@B@B?B@D@BBD@D@DBDBF@DBFBFDFBFBHDFDHDHDHDHDHDFDFDHDFBHDFDFBFDFDFBFBFDDBFBFBFBDDFBFBDBF@FBDBFBFBDBF@FBDBFBF@DBFBF@DBF@FBD@FBF@DBF@FBF@FBD@FBF@FBF@FBF@F@FBF@HBF@FBF@H@FBF@HBF@HBF@H@HBF@HBF@H@HBH@FBH@H@H@HBH@F@H@H@FBH@H@F@H@H@F@H?F@F@H@F@H?F@F@H@F?F@H?F@F@H?F@F?H@F?F?H@F?H@F?F?H@H?F?H?H@H?H?H?H?F?H@F?F?F?F?D?F?F?D?D?D?D?D?D?D?D?D?D?B?D?D?B?D?B?B?B",
      precision: 6
    }
  end
end
