defmodule Data.AutoGenerated.Video.Rendered_7805de1e5e55fbe3f69f5c1184392d19 do
  @moduledoc "#{"2022-12-24-berner-strasse: Umleitung Richtung Norden"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-12-24-berner-strasse: Umleitung Richtung Norden"
  end

  @impl Video.Rendered
  def hash() do
    "7805de1e5e55fbe3f69f5c1184392d19"
  end

  @impl Video.Rendered
  def length_ms() do
    94779
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-12-24-berner-strasse/GX015032", :start, :end},
      {"2022-12-24-berner-strasse/GX015033", :start, "00:01:11.038"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.139731,
      minLat: 53.614556,
      maxLon: 10.156402,
      maxLat: 53.628306464071855
    }
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
      %{timestamp: 0, text: "Meiendorfer Straße"},
      %{timestamp: 1001, text: "Berner Straße"},
      %{timestamp: 4337, text: "Stolper Straße"},
      %{timestamp: 14678, text: "Redderblock"},
      %{timestamp: 31080, text: "Arnswalder Straße"},
      %{timestamp: 46092, text: "Greifenberger Straße"},
      %{timestamp: 51430, text: "Hermann-Balk-Straße"},
      %{timestamp: 81454, text: "Alte Berner Straße"},
      %{timestamp: 84123, text: "Kriegkamp"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.156402, lat: 53.614556, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.156387, lat: 53.614561, time_offset_ms: 334},
      %Video.TimedPoint{lon: 10.156333, lat: 53.614572, time_offset_ms: 667},
      %Video.TimedPoint{lon: 10.15625, lat: 53.614586, time_offset_ms: 1001},
      %Video.TimedPoint{lon: 10.156155, lat: 53.614602, time_offset_ms: 1334},
      %Video.TimedPoint{lon: 10.15605, lat: 53.614609, time_offset_ms: 1668},
      %Video.TimedPoint{lon: 10.155962, lat: 53.614586, time_offset_ms: 2002},
      %Video.TimedPoint{lon: 10.155875, lat: 53.614559, time_offset_ms: 2335},
      %Video.TimedPoint{lon: 10.155764, lat: 53.614564, time_offset_ms: 2669},
      %Video.TimedPoint{lon: 10.155642, lat: 53.614581, time_offset_ms: 3002},
      %Video.TimedPoint{lon: 10.155512, lat: 53.614601, time_offset_ms: 3336},
      %Video.TimedPoint{lon: 10.155381, lat: 53.614619, time_offset_ms: 3670},
      %Video.TimedPoint{lon: 10.155253, lat: 53.614639, time_offset_ms: 4003},
      %Video.TimedPoint{lon: 10.155167, lat: 53.61469, time_offset_ms: 4337},
      %Video.TimedPoint{lon: 10.155177, lat: 53.614755, time_offset_ms: 4670},
      %Video.TimedPoint{lon: 10.155233, lat: 53.614823, time_offset_ms: 5004},
      %Video.TimedPoint{lon: 10.155294, lat: 53.614893, time_offset_ms: 5338},
      %Video.TimedPoint{lon: 10.15536, lat: 53.61496, time_offset_ms: 5671},
      %Video.TimedPoint{lon: 10.155417, lat: 53.615027, time_offset_ms: 6005},
      %Video.TimedPoint{lon: 10.155451, lat: 53.615098, time_offset_ms: 6338},
      %Video.TimedPoint{lon: 10.155439, lat: 53.615168, time_offset_ms: 6672},
      %Video.TimedPoint{lon: 10.155389, lat: 53.615238, time_offset_ms: 7006},
      %Video.TimedPoint{lon: 10.155328, lat: 53.615308, time_offset_ms: 7339},
      %Video.TimedPoint{lon: 10.15528, lat: 53.615381, time_offset_ms: 7673},
      %Video.TimedPoint{lon: 10.155242, lat: 53.615457, time_offset_ms: 8006},
      %Video.TimedPoint{lon: 10.155202, lat: 53.615537, time_offset_ms: 8340},
      %Video.TimedPoint{lon: 10.155158, lat: 53.615616, time_offset_ms: 8674},
      %Video.TimedPoint{lon: 10.155111, lat: 53.615694, time_offset_ms: 9007},
      %Video.TimedPoint{lon: 10.155065, lat: 53.615774, time_offset_ms: 9341},
      %Video.TimedPoint{lon: 10.155023, lat: 53.615855, time_offset_ms: 9674},
      %Video.TimedPoint{lon: 10.154983, lat: 53.615938, time_offset_ms: 10008},
      %Video.TimedPoint{lon: 10.154943, lat: 53.616021, time_offset_ms: 10341},
      %Video.TimedPoint{lon: 10.154901, lat: 53.6161, time_offset_ms: 10675},
      %Video.TimedPoint{lon: 10.154858, lat: 53.616181, time_offset_ms: 11009},
      %Video.TimedPoint{lon: 10.154816, lat: 53.616266, time_offset_ms: 11342},
      %Video.TimedPoint{lon: 10.154773, lat: 53.61635, time_offset_ms: 11676},
      %Video.TimedPoint{lon: 10.154736, lat: 53.616435, time_offset_ms: 12009},
      %Video.TimedPoint{lon: 10.154711, lat: 53.616523, time_offset_ms: 12343},
      %Video.TimedPoint{lon: 10.154694, lat: 53.616608, time_offset_ms: 12677},
      %Video.TimedPoint{lon: 10.154677, lat: 53.61669, time_offset_ms: 13010},
      %Video.TimedPoint{lon: 10.154644, lat: 53.616773, time_offset_ms: 13344},
      %Video.TimedPoint{lon: 10.154605, lat: 53.61685, time_offset_ms: 13677},
      %Video.TimedPoint{lon: 10.154553, lat: 53.616905, time_offset_ms: 14011},
      %Video.TimedPoint{lon: 10.154474, lat: 53.616927, time_offset_ms: 14345},
      %Video.TimedPoint{lon: 10.154384, lat: 53.61692, time_offset_ms: 14678},
      %Video.TimedPoint{lon: 10.154304, lat: 53.61689, time_offset_ms: 15012},
      %Video.TimedPoint{lon: 10.154238, lat: 53.616856, time_offset_ms: 15345},
      %Video.TimedPoint{lon: 10.154179, lat: 53.616839, time_offset_ms: 15679},
      %Video.TimedPoint{lon: 10.154139, lat: 53.616835, time_offset_ms: 16013},
      %Video.TimedPoint{lon: 10.154081, lat: 53.616809, time_offset_ms: 16346},
      %Video.TimedPoint{lon: 10.154004, lat: 53.616763, time_offset_ms: 16680},
      %Video.TimedPoint{lon: 10.153915, lat: 53.616714, time_offset_ms: 17013},
      %Video.TimedPoint{lon: 10.153812, lat: 53.616658, time_offset_ms: 17347},
      %Video.TimedPoint{lon: 10.153709, lat: 53.616605, time_offset_ms: 17681},
      %Video.TimedPoint{lon: 10.153605, lat: 53.616552, time_offset_ms: 18014},
      %Video.TimedPoint{lon: 10.153496, lat: 53.616497, time_offset_ms: 18348},
      %Video.TimedPoint{lon: 10.15339, lat: 53.616444, time_offset_ms: 18681},
      %Video.TimedPoint{lon: 10.153286, lat: 53.616385, time_offset_ms: 19015},
      %Video.TimedPoint{lon: 10.15318, lat: 53.616327, time_offset_ms: 19349},
      %Video.TimedPoint{lon: 10.153069, lat: 53.616279, time_offset_ms: 19682},
      %Video.TimedPoint{lon: 10.152952, lat: 53.616236, time_offset_ms: 20016},
      %Video.TimedPoint{lon: 10.152827, lat: 53.6162, time_offset_ms: 20349},
      %Video.TimedPoint{lon: 10.152704, lat: 53.616167, time_offset_ms: 20683},
      %Video.TimedPoint{lon: 10.152589, lat: 53.616135, time_offset_ms: 21017},
      %Video.TimedPoint{lon: 10.152494, lat: 53.616111, time_offset_ms: 21350},
      %Video.TimedPoint{lon: 10.152433, lat: 53.616099, time_offset_ms: 21684},
      %Video.TimedPoint{lon: 10.152417, lat: 53.616099, time_offset_ms: 22017},
      %Video.TimedPoint{lon: 10.152403, lat: 53.616104, time_offset_ms: 22351},
      %Video.TimedPoint{lon: 10.152375, lat: 53.616115, time_offset_ms: 22685},
      %Video.TimedPoint{lon: 10.152335, lat: 53.61613, time_offset_ms: 23018},
      %Video.TimedPoint{lon: 10.152304, lat: 53.616146, time_offset_ms: 23352},
      %Video.TimedPoint{lon: 10.152281, lat: 53.616151, time_offset_ms: 23685},
      %Video.TimedPoint{lon: 10.152226, lat: 53.61614, time_offset_ms: 23741},
      %Video.TimedPoint{lon: 10.152217, lat: 53.616136, time_offset_ms: 24075},
      %Video.TimedPoint{lon: 10.152178, lat: 53.616112, time_offset_ms: 24408},
      %Video.TimedPoint{lon: 10.152123, lat: 53.616065, time_offset_ms: 24742},
      %Video.TimedPoint{lon: 10.152031, lat: 53.616025, time_offset_ms: 25075},
      %Video.TimedPoint{lon: 10.151909, lat: 53.616003, time_offset_ms: 25409},
      %Video.TimedPoint{lon: 10.151791, lat: 53.615987, time_offset_ms: 25743},
      %Video.TimedPoint{lon: 10.151656, lat: 53.615977, time_offset_ms: 26076},
      %Video.TimedPoint{lon: 10.151516, lat: 53.615963, time_offset_ms: 26410},
      %Video.TimedPoint{lon: 10.151375, lat: 53.615943, time_offset_ms: 26743},
      %Video.TimedPoint{lon: 10.151228, lat: 53.61592, time_offset_ms: 27077},
      %Video.TimedPoint{lon: 10.151076, lat: 53.615893, time_offset_ms: 27411},
      %Video.TimedPoint{lon: 10.150929, lat: 53.61587, time_offset_ms: 27744},
      %Video.TimedPoint{lon: 10.150784, lat: 53.615849, time_offset_ms: 28078},
      %Video.TimedPoint{lon: 10.150633, lat: 53.615825, time_offset_ms: 28411},
      %Video.TimedPoint{lon: 10.150481, lat: 53.615801, time_offset_ms: 28745},
      %Video.TimedPoint{lon: 10.150328, lat: 53.615777, time_offset_ms: 29079},
      %Video.TimedPoint{lon: 10.150175, lat: 53.615754, time_offset_ms: 29412},
      %Video.TimedPoint{lon: 10.150028, lat: 53.615733, time_offset_ms: 29746},
      %Video.TimedPoint{lon: 10.149879, lat: 53.615709, time_offset_ms: 30079},
      %Video.TimedPoint{lon: 10.149736, lat: 53.615684, time_offset_ms: 30413},
      %Video.TimedPoint{lon: 10.149593, lat: 53.615664, time_offset_ms: 30747},
      %Video.TimedPoint{lon: 10.149458, lat: 53.615675, time_offset_ms: 31080},
      %Video.TimedPoint{lon: 10.149367, lat: 53.615734, time_offset_ms: 31414},
      %Video.TimedPoint{lon: 10.149303, lat: 53.615815, time_offset_ms: 31747},
      %Video.TimedPoint{lon: 10.149238, lat: 53.615896, time_offset_ms: 32081},
      %Video.TimedPoint{lon: 10.149176, lat: 53.615973, time_offset_ms: 32415},
      %Video.TimedPoint{lon: 10.149108, lat: 53.61605, time_offset_ms: 32748},
      %Video.TimedPoint{lon: 10.14904, lat: 53.616128, time_offset_ms: 33082},
      %Video.TimedPoint{lon: 10.14897, lat: 53.616206, time_offset_ms: 33415},
      %Video.TimedPoint{lon: 10.148901, lat: 53.616283, time_offset_ms: 33749},
      %Video.TimedPoint{lon: 10.148833, lat: 53.616358, time_offset_ms: 34083},
      %Video.TimedPoint{lon: 10.148768, lat: 53.616432, time_offset_ms: 34416},
      %Video.TimedPoint{lon: 10.148703, lat: 53.616507, time_offset_ms: 34750},
      %Video.TimedPoint{lon: 10.148636, lat: 53.616585, time_offset_ms: 35083},
      %Video.TimedPoint{lon: 10.148571, lat: 53.616662, time_offset_ms: 35417},
      %Video.TimedPoint{lon: 10.148506, lat: 53.616739, time_offset_ms: 35751},
      %Video.TimedPoint{lon: 10.148441, lat: 53.616814, time_offset_ms: 36084},
      %Video.TimedPoint{lon: 10.148378, lat: 53.616888, time_offset_ms: 36418},
      %Video.TimedPoint{lon: 10.148315, lat: 53.616963, time_offset_ms: 36751},
      %Video.TimedPoint{lon: 10.148248, lat: 53.617034, time_offset_ms: 37085},
      %Video.TimedPoint{lon: 10.148178, lat: 53.617106, time_offset_ms: 37419},
      %Video.TimedPoint{lon: 10.148111, lat: 53.617181, time_offset_ms: 37752},
      %Video.TimedPoint{lon: 10.148049, lat: 53.617256, time_offset_ms: 38086},
      %Video.TimedPoint{lon: 10.147991, lat: 53.617331, time_offset_ms: 38419},
      %Video.TimedPoint{lon: 10.147931, lat: 53.617408, time_offset_ms: 38753},
      %Video.TimedPoint{lon: 10.147869, lat: 53.617485, time_offset_ms: 39087},
      %Video.TimedPoint{lon: 10.147805, lat: 53.617561, time_offset_ms: 39420},
      %Video.TimedPoint{lon: 10.14774, lat: 53.617637, time_offset_ms: 39754},
      %Video.TimedPoint{lon: 10.147675, lat: 53.617714, time_offset_ms: 40087},
      %Video.TimedPoint{lon: 10.147611, lat: 53.617788, time_offset_ms: 40421},
      %Video.TimedPoint{lon: 10.147548, lat: 53.617861, time_offset_ms: 40755},
      %Video.TimedPoint{lon: 10.147483, lat: 53.617937, time_offset_ms: 41088},
      %Video.TimedPoint{lon: 10.147422, lat: 53.618011, time_offset_ms: 41422},
      %Video.TimedPoint{lon: 10.147361, lat: 53.618086, time_offset_ms: 41755},
      %Video.TimedPoint{lon: 10.147299, lat: 53.618161, time_offset_ms: 42089},
      %Video.TimedPoint{lon: 10.14724, lat: 53.618233, time_offset_ms: 42423},
      %Video.TimedPoint{lon: 10.147184, lat: 53.618303, time_offset_ms: 42756},
      %Video.TimedPoint{lon: 10.147133, lat: 53.618372, time_offset_ms: 43090},
      %Video.TimedPoint{lon: 10.147092, lat: 53.618433, time_offset_ms: 43423},
      %Video.TimedPoint{lon: 10.147073, lat: 53.618472, time_offset_ms: 43757},
      %Video.TimedPoint{lon: 10.147061, lat: 53.618495, time_offset_ms: 44091},
      %Video.TimedPoint{lon: 10.147056, lat: 53.618503, time_offset_ms: 44424},
      %Video.TimedPoint{lon: 10.14705, lat: 53.618505, time_offset_ms: 44758},
      %Video.TimedPoint{lon: 10.147036, lat: 53.618521, time_offset_ms: 45091},
      %Video.TimedPoint{lon: 10.147016, lat: 53.618554, time_offset_ms: 45425},
      %Video.TimedPoint{lon: 10.146979, lat: 53.618589, time_offset_ms: 45759},
      %Video.TimedPoint{lon: 10.146904, lat: 53.618586, time_offset_ms: 46092},
      %Video.TimedPoint{lon: 10.146812, lat: 53.618564, time_offset_ms: 46426},
      %Video.TimedPoint{lon: 10.146707, lat: 53.618541, time_offset_ms: 46759},
      %Video.TimedPoint{lon: 10.146613, lat: 53.618524, time_offset_ms: 47093},
      %Video.TimedPoint{lon: 10.146511, lat: 53.618507, time_offset_ms: 47427},
      %Video.TimedPoint{lon: 10.146396, lat: 53.618485, time_offset_ms: 47760},
      %Video.TimedPoint{lon: 10.146268, lat: 53.618457, time_offset_ms: 48094},
      %Video.TimedPoint{lon: 10.146136, lat: 53.61843, time_offset_ms: 48427},
      %Video.TimedPoint{lon: 10.146005, lat: 53.618402, time_offset_ms: 48761},
      %Video.TimedPoint{lon: 10.145882, lat: 53.618377, time_offset_ms: 49095},
      %Video.TimedPoint{lon: 10.145752, lat: 53.618352, time_offset_ms: 49428},
      %Video.TimedPoint{lon: 10.145632, lat: 53.618332, time_offset_ms: 49762},
      %Video.TimedPoint{lon: 10.145515, lat: 53.618317, time_offset_ms: 50095},
      %Video.TimedPoint{lon: 10.145401, lat: 53.618296, time_offset_ms: 50429},
      %Video.TimedPoint{lon: 10.145287, lat: 53.618268, time_offset_ms: 50763},
      %Video.TimedPoint{lon: 10.145206, lat: 53.618251, time_offset_ms: 51096},
      %Video.TimedPoint{lon: 10.145162, lat: 53.618248, time_offset_ms: 51430},
      %Video.TimedPoint{lon: 10.145117, lat: 53.618258, time_offset_ms: 51763},
      %Video.TimedPoint{lon: 10.145069, lat: 53.618295, time_offset_ms: 52097},
      %Video.TimedPoint{lon: 10.145029, lat: 53.618352, time_offset_ms: 52431},
      %Video.TimedPoint{lon: 10.144978, lat: 53.618414, time_offset_ms: 52764},
      %Video.TimedPoint{lon: 10.144922, lat: 53.61848, time_offset_ms: 53098},
      %Video.TimedPoint{lon: 10.144867, lat: 53.618551, time_offset_ms: 53431},
      %Video.TimedPoint{lon: 10.144811, lat: 53.618619, time_offset_ms: 53765},
      %Video.TimedPoint{lon: 10.14475, lat: 53.61869, time_offset_ms: 54099},
      %Video.TimedPoint{lon: 10.144689, lat: 53.618768, time_offset_ms: 54432},
      %Video.TimedPoint{lon: 10.144646, lat: 53.618833, time_offset_ms: 54766},
      %Video.TimedPoint{lon: 10.144594, lat: 53.618899, time_offset_ms: 55099},
      %Video.TimedPoint{lon: 10.144524, lat: 53.618973, time_offset_ms: 55433},
      %Video.TimedPoint{lon: 10.144457, lat: 53.619047, time_offset_ms: 55767},
      %Video.TimedPoint{lon: 10.144386, lat: 53.619121, time_offset_ms: 56100},
      %Video.TimedPoint{lon: 10.144309, lat: 53.619202, time_offset_ms: 56434},
      %Video.TimedPoint{lon: 10.144243, lat: 53.619276, time_offset_ms: 56767},
      %Video.TimedPoint{lon: 10.144182, lat: 53.619353, time_offset_ms: 57101},
      %Video.TimedPoint{lon: 10.14412, lat: 53.619429, time_offset_ms: 57435},
      %Video.TimedPoint{lon: 10.144052, lat: 53.619504, time_offset_ms: 57768},
      %Video.TimedPoint{lon: 10.143982, lat: 53.619577, time_offset_ms: 58102},
      %Video.TimedPoint{lon: 10.143918, lat: 53.619653, time_offset_ms: 58435},
      %Video.TimedPoint{lon: 10.14385, lat: 53.619729, time_offset_ms: 58769},
      %Video.TimedPoint{lon: 10.143783, lat: 53.619805, time_offset_ms: 59103},
      %Video.TimedPoint{lon: 10.143714, lat: 53.619885, time_offset_ms: 59436},
      %Video.TimedPoint{lon: 10.143647, lat: 53.619965, time_offset_ms: 59770},
      %Video.TimedPoint{lon: 10.14358, lat: 53.620044, time_offset_ms: 60103},
      %Video.TimedPoint{lon: 10.143511, lat: 53.620126, time_offset_ms: 60437},
      %Video.TimedPoint{lon: 10.143444, lat: 53.620207, time_offset_ms: 60771},
      %Video.TimedPoint{lon: 10.143378, lat: 53.620287, time_offset_ms: 61104},
      %Video.TimedPoint{lon: 10.143308, lat: 53.620371, time_offset_ms: 61438},
      %Video.TimedPoint{lon: 10.143235, lat: 53.620451, time_offset_ms: 61771},
      %Video.TimedPoint{lon: 10.14316, lat: 53.620534, time_offset_ms: 62105},
      %Video.TimedPoint{lon: 10.143084, lat: 53.620618, time_offset_ms: 62439},
      %Video.TimedPoint{lon: 10.143012, lat: 53.620701, time_offset_ms: 62772},
      %Video.TimedPoint{lon: 10.14294, lat: 53.620784, time_offset_ms: 63106},
      %Video.TimedPoint{lon: 10.142863, lat: 53.620868, time_offset_ms: 63439},
      %Video.TimedPoint{lon: 10.14279, lat: 53.620953, time_offset_ms: 63773},
      %Video.TimedPoint{lon: 10.142716, lat: 53.621036, time_offset_ms: 64107},
      %Video.TimedPoint{lon: 10.142639, lat: 53.62112, time_offset_ms: 64440},
      %Video.TimedPoint{lon: 10.142567, lat: 53.621203, time_offset_ms: 64774},
      %Video.TimedPoint{lon: 10.14249, lat: 53.621288, time_offset_ms: 65107},
      %Video.TimedPoint{lon: 10.142411, lat: 53.621372, time_offset_ms: 65441},
      %Video.TimedPoint{lon: 10.14234, lat: 53.621457, time_offset_ms: 65775},
      %Video.TimedPoint{lon: 10.142273, lat: 53.621537, time_offset_ms: 66108},
      %Video.TimedPoint{lon: 10.142203, lat: 53.621623, time_offset_ms: 66442},
      %Video.TimedPoint{lon: 10.142134, lat: 53.621708, time_offset_ms: 66775},
      %Video.TimedPoint{lon: 10.142061, lat: 53.62179, time_offset_ms: 67109},
      %Video.TimedPoint{lon: 10.141992, lat: 53.621877, time_offset_ms: 67443},
      %Video.TimedPoint{lon: 10.141924, lat: 53.621967, time_offset_ms: 67776},
      %Video.TimedPoint{lon: 10.141848, lat: 53.622054, time_offset_ms: 68110},
      %Video.TimedPoint{lon: 10.141775, lat: 53.622139, time_offset_ms: 68443},
      %Video.TimedPoint{lon: 10.141698, lat: 53.62223, time_offset_ms: 68777},
      %Video.TimedPoint{lon: 10.141623, lat: 53.622317, time_offset_ms: 69111},
      %Video.TimedPoint{lon: 10.141548, lat: 53.622409, time_offset_ms: 69444},
      %Video.TimedPoint{lon: 10.141483, lat: 53.622497, time_offset_ms: 69778},
      %Video.TimedPoint{lon: 10.141404, lat: 53.622585, time_offset_ms: 70111},
      %Video.TimedPoint{lon: 10.141324, lat: 53.622678, time_offset_ms: 70445},
      %Video.TimedPoint{lon: 10.141251, lat: 53.622762, time_offset_ms: 70779},
      %Video.TimedPoint{lon: 10.141175, lat: 53.622854, time_offset_ms: 71112},
      %Video.TimedPoint{lon: 10.141104, lat: 53.62294, time_offset_ms: 71446},
      %Video.TimedPoint{lon: 10.141028, lat: 53.623024, time_offset_ms: 71779},
      %Video.TimedPoint{lon: 10.140956, lat: 53.623119, time_offset_ms: 72113},
      %Video.TimedPoint{lon: 10.14089, lat: 53.623212, time_offset_ms: 72447},
      %Video.TimedPoint{lon: 10.140832, lat: 53.623305, time_offset_ms: 72780},
      %Video.TimedPoint{lon: 10.140787, lat: 53.623405, time_offset_ms: 73114},
      %Video.TimedPoint{lon: 10.140752, lat: 53.623499, time_offset_ms: 73447},
      %Video.TimedPoint{lon: 10.140718, lat: 53.623598, time_offset_ms: 73781},
      %Video.TimedPoint{lon: 10.140683, lat: 53.623704, time_offset_ms: 74115},
      %Video.TimedPoint{lon: 10.140645, lat: 53.623808, time_offset_ms: 74448},
      %Video.TimedPoint{lon: 10.140606, lat: 53.623906, time_offset_ms: 74782},
      %Video.TimedPoint{lon: 10.140562, lat: 53.62401, time_offset_ms: 75115},
      %Video.TimedPoint{lon: 10.140534, lat: 53.624115, time_offset_ms: 75449},
      %Video.TimedPoint{lon: 10.140507, lat: 53.624223, time_offset_ms: 75783},
      %Video.TimedPoint{lon: 10.140471, lat: 53.624344, time_offset_ms: 76116},
      %Video.TimedPoint{lon: 10.140439, lat: 53.624465, time_offset_ms: 76450},
      %Video.TimedPoint{lon: 10.140403, lat: 53.624582, time_offset_ms: 76783},
      %Video.TimedPoint{lon: 10.140362, lat: 53.6247, time_offset_ms: 77117},
      %Video.TimedPoint{lon: 10.140324, lat: 53.62481, time_offset_ms: 77451},
      %Video.TimedPoint{lon: 10.14029, lat: 53.624919, time_offset_ms: 77784},
      %Video.TimedPoint{lon: 10.140263, lat: 53.625027, time_offset_ms: 78118},
      %Video.TimedPoint{lon: 10.140257, lat: 53.625133, time_offset_ms: 78451},
      %Video.TimedPoint{lon: 10.140299, lat: 53.625228, time_offset_ms: 78785},
      %Video.TimedPoint{lon: 10.140369, lat: 53.625314, time_offset_ms: 79119},
      %Video.TimedPoint{lon: 10.140452, lat: 53.625394, time_offset_ms: 79452},
      %Video.TimedPoint{lon: 10.140519, lat: 53.625471, time_offset_ms: 79786},
      %Video.TimedPoint{lon: 10.140602, lat: 53.62554, time_offset_ms: 80119},
      %Video.TimedPoint{lon: 10.140686, lat: 53.625606, time_offset_ms: 80453},
      %Video.TimedPoint{lon: 10.140758, lat: 53.625674, time_offset_ms: 80787},
      %Video.TimedPoint{lon: 10.140795, lat: 53.625755, time_offset_ms: 81120},
      %Video.TimedPoint{lon: 10.140746, lat: 53.625835, time_offset_ms: 81454},
      %Video.TimedPoint{lon: 10.140626, lat: 53.62589, time_offset_ms: 81787},
      %Video.TimedPoint{lon: 10.140482, lat: 53.625936, time_offset_ms: 82121},
      %Video.TimedPoint{lon: 10.140338, lat: 53.625978, time_offset_ms: 82455},
      %Video.TimedPoint{lon: 10.14019, lat: 53.626017, time_offset_ms: 82788},
      %Video.TimedPoint{lon: 10.14004, lat: 53.626059, time_offset_ms: 83122},
      %Video.TimedPoint{lon: 10.139901, lat: 53.626106, time_offset_ms: 83455},
      %Video.TimedPoint{lon: 10.139789, lat: 53.626168, time_offset_ms: 83789},
      %Video.TimedPoint{lon: 10.139738, lat: 53.626253, time_offset_ms: 84123},
      %Video.TimedPoint{lon: 10.139731, lat: 53.626345, time_offset_ms: 84456},
      %Video.TimedPoint{lon: 10.139756, lat: 53.626402, time_offset_ms: 84790},
      %Video.TimedPoint{lon: 10.139782, lat: 53.626424, time_offset_ms: 85123},
      %Video.TimedPoint{lon: 10.139801, lat: 53.626443, time_offset_ms: 85457},
      %Video.TimedPoint{lon: 10.13984, lat: 53.62648, time_offset_ms: 85791},
      %Video.TimedPoint{lon: 10.139895, lat: 53.626532, time_offset_ms: 86124},
      %Video.TimedPoint{lon: 10.139962, lat: 53.626592, time_offset_ms: 86458},
      %Video.TimedPoint{lon: 10.140035, lat: 53.626658, time_offset_ms: 86791},
      %Video.TimedPoint{lon: 10.140114, lat: 53.626729, time_offset_ms: 87125},
      %Video.TimedPoint{lon: 10.140193, lat: 53.626799, time_offset_ms: 87459},
      %Video.TimedPoint{lon: 10.140272, lat: 53.626868, time_offset_ms: 87792},
      %Video.TimedPoint{lon: 10.140354, lat: 53.626941, time_offset_ms: 88126},
      %Video.TimedPoint{lon: 10.140433, lat: 53.627014, time_offset_ms: 88459},
      %Video.TimedPoint{lon: 10.14051, lat: 53.627087, time_offset_ms: 88793},
      %Video.TimedPoint{lon: 10.14059, lat: 53.627162, time_offset_ms: 89127},
      %Video.TimedPoint{lon: 10.140671, lat: 53.627237, time_offset_ms: 89460},
      %Video.TimedPoint{lon: 10.140751, lat: 53.627311, time_offset_ms: 89794},
      %Video.TimedPoint{lon: 10.140835, lat: 53.627387, time_offset_ms: 90127},
      %Video.TimedPoint{lon: 10.140918, lat: 53.627461, time_offset_ms: 90461},
      %Video.TimedPoint{lon: 10.140998, lat: 53.627536, time_offset_ms: 90795},
      %Video.TimedPoint{lon: 10.141079, lat: 53.627615, time_offset_ms: 91128},
      %Video.TimedPoint{lon: 10.141162, lat: 53.627688, time_offset_ms: 91462},
      %Video.TimedPoint{lon: 10.141247, lat: 53.627757, time_offset_ms: 91795},
      %Video.TimedPoint{lon: 10.141331, lat: 53.627829, time_offset_ms: 92129},
      %Video.TimedPoint{lon: 10.141412, lat: 53.627902, time_offset_ms: 92463},
      %Video.TimedPoint{lon: 10.141491, lat: 53.627973, time_offset_ms: 92796},
      %Video.TimedPoint{lon: 10.14157, lat: 53.628043, time_offset_ms: 93130},
      %Video.TimedPoint{lon: 10.141647, lat: 53.628112, time_offset_ms: 93463},
      %Video.TimedPoint{lon: 10.141725, lat: 53.628177, time_offset_ms: 93797},
      %Video.TimedPoint{lon: 10.141815, lat: 53.62824, time_offset_ms: 94131},
      %Video.TimedPoint{lon: 10.141929, lat: 53.628281, time_offset_ms: 94464},
      %Video.TimedPoint{lon: 10.142031799401197, lat: 53.628306464071855, time_offset_ms: 94779}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "c}jgeBqt{jR?????????@???????@A??????@???@???@???@??A@?@?@?@?@A@?@?@?@A@?B?@?BA@?B?BAB?B?BAB?BAD?BAD?DAD?DAFADAF?HAFAHAHAJAHALAJAJAJAHAHAJAHAH?HAHAHAH?HAJAH?HAHAH?HAJAH?HAH?JAH?H?JAH?H?H?JAH?H?J?H?H?H?H@H?H?F?H@H?F@H?F@H?F@H@F?F@H@F@H?F@F@H@F@F@H@F@H@F@H@F@H@F@F@H@F@H?F@H@F@H@F@F?H@F@H?F@H@F?H@H?H?F@H?H?H@H?H?J?H?J?H?J?HAJ?J?J?HAL?JAJ?JAJ?JAJAJ?JALAJAJ?LAJAJAJALAJ?JAJALAJALAJALAJAJALAJALALAJALALAJAL?JALAJALALAJALAJALALAJALAJALAJALALAJALAJALAJALAJALALAJALAJALALCJAJALCJAJAJCJAJCJCJAHCJCHCHCHCHCHCHEFCFCFEFCFEFCDEDCDCDEBCDEBCBCBE@CBE@C@E@C@E@C@E?E@C?E?E?E?E?EAE?EAEAEAGAEAGAECEAGCECGCECGCEEGCGEECGEEEGCGEEEGEEEGEEEGEEEGEEEGEEEGEGEEEGEEEGEEGGEEEGEEEGEEGGEEEEEGEEGGEEEGEEEEGGEEEGEEEEEGEEEEGGEEEGEEEEEGCEEEEGEEEECGEEEGCEEECGEECGCEEECGCECGCECGCGCECGCEAGCEAGAGCEAEAGAEAG?EAG?EAE?GAE?G?E?E?G@E?E?G@E?E@G@E@E@G@E@G@E@GBE@EBG@EBGBEBGBEBGBGBEDGBEBGDEBGDEBGDGDEDGBEDGDGDEDGBEDGDGDEDGDEDGDEBGDGDEDGBEDGDGDEBGDEBGDEBGDGBEDGBGDEBGBEDGBGBEBGBGDGBEBGBGBEBGBGBGBEBGBGBGBGBEBGBGBGBGBEBGBGBGBGBGBGBGBGBGBGBGBGBGBGBGBGDGBGBGBGBGBGBGBGBGBGDGBGBGBGBGBGDGBGBEBGBGDGBGBGBGDGBGBGBGDGBGBGDEBGBGBGDGBGBGDGBGBEDGBGBGDGBGBGBGDGBGBGDGBGBGDGBGBGBGDGBGBGBGDGBGBGBGBGDGBGBGBGBGBGBIDGBGBGBGBGBGBGBGBGBGBGBGDGBIBGBGBGBGBGBGBIBGBGBGBGBGBGBIBGBGBGBGBGBIBGBGBGBGBIBGBGBGBGDGBIBGBGBGBGBGBGBGBGBGBGBGBGBGBGBGBGBEBGBGBGBGDGBGBGBGBGBGBGBGBGBGBGDGBGBGBGBGBGBGBGDGBGBGBGBIBGBGBGDGBIBGBGBGBIBGDGBIBGBGBGBIDGBGBGBIBGBGBGBIDGBGBGBGBGBIBGBGBGBIBGBGDGBGBGBIBGBGBG@IBGBGBGBIBGBGBG@IBGBGBG@IBGBG@GBIBG@IBG@GBI@G@GBI@GBI@G@IBG@G@I@G@IBG@G@I@G@G@I@G@G@G@I@G@G@G@I@G@G?G@I@G@G@G@G@G@I?G@G@G@G@G@G@G@G@G@I@G@G@G@G@G@G@G@G@GBG@G@I@GBG@GBG@G@IBGBG@GBGBI@GBGBG@GBGBGBIBGBGBGBGBGBGBGBGBGBGDGBGBGDGBEDGBGDEBEDGDEBEDEDEDEDEDEDCBEFCDEDCDCDCDCDADCDCDADCDADCDADADAFADADADADAFADADAF?DAFAD?FAD?F?DAF?F?D?F?FAF?F@F?F?F?H?F@F?F@F?H@F?F@F@H@F@F@F?HBF@F@F@H@FBH@FBF@H@FBF@FBHBF@FBFBH@FBF@HBFBFBF@HBF@FBF@FBF@DBF@F@D@D@DBF@D@D@D@B?D@D@B@D@B@D?B@B@B@D?B@B?B@B@@?B@B?B@@?B@@?B@@?B?@@@?@@B?@@B?@?B@@@B?B@B?@@B@B?B@D@B@B@B@D@B?DBD@B@D@D@DBD@F@DBFBDBF@FBFBHBFDFBHBHDHDHBFDHBFDHBFDHBFDHBFDHBFDHBFDHBFDHBFDFBHDFBHDFBHDFBHDHDFBHDHDHBHDHDHDHBHDHDJDHDHDJBHDHDJDHDHDHBJDHDHDHBJDHDHBHDHDHBHDHDHDJBHDHBHDHDHBHDHDHBJDHDHBHDHBHDJDHBHDHDHBJDHDHBHDHDJBHDHDHBJDHDJBHDHDJDHBJDHDHDJDJBHDJDHDHBJDHDJBHDHDJDHBHDJDHBJDHDHBHDHDJBHDHDHBHDHDJDHBHDHDJDHDHBHDJDHDHDHDJDHDHDJBHDHDHDJDHDHDHDJDHDJDHDHDHBJDHDHDJDHDJDHDJBHDHDJBHDJDHBHDJDHBJDHBJDHBJDHBJDHBJDHBJBHDJBHBJBHDJBJBHDJBJBHBJBJBJDHBJBJBJBJBJBJBJBJBJBHBJBLBJBJBJBJBJBLBJBJBJBJBL@JBJBJBLBJ@JBJBJBL@JBJBJBL@JBJBJ@JBLBJBJ@JBJBJ@LBJBJ@JBJBJ@JBJ@JBJBJ@JBJBJ@JBJBL@HBJ@JBJBJ@JBJ@HBJ@JBJ@JBJ@LBLBL@NBNBL@N@JBL@J?H@H@H@F?F@F?D?D@D?D?D?D?B@B?B?B?B?B?B?@?B?@?@?@?B?@?@???@?@?@?@??A@???@?????@???@?????@???@???@??A@?????@???@???@???@A??@???@?@??A@?@?@?@??A@?@?@?@A@?@?BA@?@?@A@?B?@A@?BA@?B?@AB?BAB?BAB?BAB?BAD?BABAB?BAB?DAB?BAB?B?BAB?BAB?BAB?BA@?B?BAB?BA@?B?BA@?B?@AB?@?@?BA@?@?@?B?@A@?@?@?@?@?@?BA@?B?B?D?D?F@N?J@D?D?@?B@@?@?@???@?????@@??@???@?@??@@?@?@?@@@?@?@@B?@@@?B@B@@?B@B@B@D@B@B@D@D@DBD@DBDBDBD@DBDBFBDDFBDDFBFDFDHDFBHDHDFDHDFBHDFBFBFDHBFBHBFBHBFDH@HBHBHBFBHBJ@HBHBJBH@JBH@JBH@J@JBJ@JBJ@L@J@JBJ@J@J@J@J@J@J@L@H@J@J?J@J@H@J@J?J@J@H@J?J@J@J?J@J@J?J@L@J?J@L@L?J@L@J?L@L?L@L@L?L@L?J@L@L?L@L@L?L@L@L?L@L@L?L@L@L?L@L@L@L?L@L@L@L@L?L@L@L@L@L@L@L@L@L@L@L@L@L@L@L@L@L@N@L@L@L@N@L@L@L@L@NBL@L@N@L@N@LBL@N@L@N@LBL@N@N@LBN@L@N@LBN@L@NBN@N@LBN@N@L@NBL@N@LBN@L@N@L@NBL@N@L@N@LBL@N@L@L@N@L@LBL@N@L@L@N@L@L@L@L@NBL@L@L@L@L@N@L@L@L@L@N@L@LBN@L@N@L@L@N@NBL@N@L@N@NBL@N@L@N@LBN@L@N@N@LBN@N@L@N@LBN@L@N@L@NBN@L@N@L@N@NBL@N@L@NBN@L@N@N@L@NBL@N@N@L@NBN@L@N@N@LBN@L@N@N@N@LBN@N@L@N@N@NBL@N@N@L@N@N@LBN@L@N@L@N@L@N@L@L@NBL@L@N@L@L@N@L@L@N@L@L@LBN@L@N@L@L@N@LBN@L@N@L@N@LBN@L@N@LBN@L@L@N@LBN@L@L@LBN@L@L@L@LBN@L@L@L@L@LBN@L@L@L@L@L@N@L@L@L@N@L@L@L@N@L@L?L@N?L@L?L@L?L?L?L?L?L?J?L?LAL?JALAJ?LAJAJAJAJAHAJCHAJCHAHCHCHAHCHCHCHEFCHCHEFEHCHEFEFEHEFEFEHGFEFGFEFGFEFGFGDGFGFGDGFGFGDGFGDGFGDGDGFGDGDIFGDGDGFGDGDGDGFGDGDIFGDGDGDGFGDGDGDGDGFGDEDGDGDGDGDGDEDGFGDGDGDEDGDGDGDGFEDGDGDGFGDGDEDGFGDGDGFGDGDGFEDGDGFGDGFGDEDGFGDGFGDGDGFGDGDEFGDGFGDGFGDGDGFGDEFGDGFGDGDGFGDGFGDGFGDGFEDGFGDGFGDGFGDGFGDGFGDEFGDGFGDGFGDGFGDEFGDGDGFGDGFGDEFGDGFGDGDEFGDGFGDGFEDGDGFGDEDGFGDGFEDGDGFGDEDGFGDEDGFGDGDEFGDGDEFGDGDEDGFGDGDEDGDGFEDGDGDEFGDGDGDEFGDGDEDGDGFEDGDGDGFEDGDGDGFEDGDGDGFGDGDEFGDGDGFGDGFGDGDGFGDGDGFGDEDGFGDGDGFGDGDGFGDEDGDGFGDGDGDEFGDGDGDGFEDGDGDGFGDGDGDEFGDGDGDGFGDEDGDGFGDGDGFGDEDGDGDGFGDEDGFGDGDGDGFEDGDGDGFEDGDGDGDEFGDGDEDGDGFGDEDGDGDEDGFGDEDGDGDEDGDGFEDGDGDGDEDGDGFEDGDGDGDEFGDGDGDEDGFGDGDGDEFGDGDEDGDGFEDGDGFEDGDEDGDEFGDEDGFGDEDGDEFGDEDGFEDGDEFGDGFEDGFEDGDEFGDGFEDGFGDEDGFEDGFGDEFGDGDEFGDGFEDGFGDGDGFEDGFGDGDEFGDGDGFEDGDGDGFGDEDGDGDEFGDGDGDEDGDGDGFEDGDGDGDEDGDGDEDGDGDGDEDGDGDGDEBGDGDGDEDGDGDGDEDGDGDEDGDGDGDGBGDEDGDGDGDGDEDGDGDGDGDGDGDEDGFGDGDGDGDGDEDGDGDGDGDGDGDEFGDGDGDGDGDEDGDGDGFGDGDEDGDGFGDGDGDEDGDGFGDGDEDGDGFGDEDGDGDGFGDEDGDGFGDGDEDGDGFGDGDEDGFGDGDGDEDGFGDGDGFGDEDGDGFGDGDGFGDGDGFEDGDGDGFGDEDGDGDGFGDEDGDGFEDGDGDGDEDGFGDEDGDGDEDGFGDEDGDGDEDGFGDEDGDEDGDGDEDGFGDEDGDEDGDGDEDGFGDGDEDGFGDGDGDEFGDGDGDGFGDEDGDGFGDGDEDGDGFGDEDGDGDGDEDGDGDEDGDGFEDGDGDEDGDGDEDGDGDGDEDGDGDEDGDGDGDEDGDGFGDGDEDGDGDEDGDGDGDGDEDGDGFGDEDGDGDGDEDGDGDGDEFGDGDGDEDGDGDEDGDGDEDGDGDEDGDEDGDGDEDGDGBEDGDEDGDEDGDGDEDGBEDGDEDGDEDGBEDGDEDGBEDGDEDGBEDGDEBGDEDGDEBGDEBGDEDGBGDEDGBEDGBEDGBEDGBEDGBGDEBGDEBGDGBEDGBEBGBGDEBGBGBGDGBGDGBGBEDGBEBE@EBC@CBC@C@C@C@C@A@A@C@A?A@A@C@A?A@A??@A@A?A@A???A@A??@A?A@??A??@A???A??@A????@A?????A??@????A??????@????A???????????A@??????????????????A??????@??????A????@??A?????A@??A??@??A??@A?A@??A@??A@A?A@?@A@A?A@A@A@A@A@A@A@C@ABA@A@CBA@ABC@ABCBA@CBABCBCBABCBCDABCBCDCDCBCDABCDABADCBAB?BADABAB?BAB?DAB?DAB?DAD?D?D?DAD?D?F?D?F?F?F?F?F@H?H?F@H?J@H@J?H@J@H@J@H@J@H@JBH@J@H@J@H@JBH@J@H@J@HBJ@J@H@J@H@H@H@H@H@J@H@H@F@H@H@H@F@H@H@F@H?F@H@F@H@F@H?F@H@H@F@H@H?H@F@H@H@H@H?H@H@H@H@H@H@H@H@H@J@H@J@H@H@J@J@H@J@J@H@J@J@J@J@HBJ@J@J@J@JBJ@L@J@JBJ@L@JBJ@L@JBL@JBL@J@LBL@J@LBJ@LBJ@L@LBJ@LBJ@L@LBJ@LBL@J@LBL@J@LBJ@LBJ@L@LBJ@LBL@J@LBJ@L@JBL@LBJ@L@LBJ@L@JBL@J@JBL@J@LBJ@J@JBJ@J@J@JBJ@L@J@J@JBJ@J@J@JBJ@L@J@LBJ@J@L@LBJ@L@JBL@L@L@JBL@J@L@J@L@JBJ@L@J@J@L@J@J@J@J@J@J@J@J@J@H@J@J@J@J@J?H@J@J@J@J@J@J@J?H@J@J@J@J@H@J?J@H@J@J@H@J@J@J@H@J?J@H@J@J@H@J@JBH@J@J@J@H@J@JBJ@J@J@JBJ@J@JBJ@LBJ@J@LBL@JBL@JBJ@L@JBJ@J@L@HBJ@J@H?H@H@J@F?F@H?F@F?D?F@D?D?D?B@D?D?B?B?B?B?B?B?B?B?@?B?@?@?B?@?BA@?@?B?@?@?B?@A@?B?@?@AB?@?@?BA@?B?@A@?BA@?BAB?@AB?BA@ABAB?BABABABABCDABADCBADCBCDADCDCDCDEDCDEDCDEDEDCDEDEDEDEDEDGDEBEDEBEDEBEDEBEDEBEDEBGDEBEDEBEDEBGDEDEBEDEBGDEDEBEDEBGDEDEDEBGDEDEBEDGDEDEBGDEDGDEBEDGDEDEDGBEDGDEDGDEBGDEDGDGDEDGDEDGBGDEDGDEDGBEDGDEDGDEBEDGDEDGBEDEDGDEBEDGDEDEBGDEDGDEDEBGDEDGDEDGDEDGDEDGDEDGDEDGDGDEDGDEDGDGDGDGDEDGDGFGDGDGDGDGFGDGDIDGDGDGDEDGDGDGBEDGDEBGDEBGDEBEDGBEBEBEBEDEBEBEBEBEDEBEBEBGDEBEBEDEBEDGBEBEDEBEDGBEDEDGBEDEDGDEDEDGDGDEDGDEDGDGFEDGDGFGDGFGFGDEFGDGDGFEDGFGDGFEDGFGDEDGFGDEFGDGDGFEDGFGDEDGFEDGDGFEDGFGDEFGDGFGDEDGFEDGFGDGFEDGFGDEFGFGDGFGFGFGDGFGFGFGDGFGFGFGFIFGFGFGFGFGDGFGFGDGFGFGDGFEDGFGDGDEFGDGDEDGDGFEDGDGDEDGDGDEFGDGDGDEDGDGDGFGDEDGDGDGDGDGDEFGDGDGDGDGDEDGDGDGDGDEFGDGDGDEDGDGDGDGFEDGDGDGDEDGFGDGDGFEDGDGFGDEDGFGDGFGDEDGFGDGFEDGDGFEDGFGDEFGDGDEFGDGFEDGDGFEDGFGDEDGFGDEDGFGDGDEFGDGDGFEDGDGFGDEDGFGDGDGDEFGDGDGFEDGDGFGDGDEDGFGDGDGFEDGFGDGDGFGDEDGFGDGDEFGDGFGDGDEFGDGDGFEDGDGDGFGDEDGFGDGDEFGDGDGFGDGFGDGFGDGFGDGDGFGDGFGFGDGDGFGDGFGDGFGDGDGFGDGFGDGDGFGDGDGFGDGFGDGDGFGDGDGFGDGDGFGDGDGFGDGDGFGDGDGFGDEDGFGDGDGFGDGDGFGDGFGDGDGFGDIFGDGFGDGFGDGFGDGDIFGDGFGDGDGFGDGFGDGFGDGDGFGDGDIFGDGDGFGDGDGFGDGDGFGDGDGFGDGDGFGDGDGDGFGDGDGFGDGDGFGDGDGDGFGDGFGDGFGDIFGDGDGFGDIFGFGDGFGDIFGFGDGFGDGFGDIFGFGDGFGDGFGFGDGFGDGFGDGFGFGDGFGFGDGFGFGDGFGFGDGFIFGFGDGFGFGFGDIFGFGFGDGFGFIFGFGDGFGFIFGDGFGFGFIFGDGFGFGFIFGDGFGFGDIFGFGFGDGFGFIDGFGFGDGFGDIFGFGDGFGDGFGFGDIFGDGFGFGDGFGDGFGDIFGFGDGFGFGDGFIDGFGFGDGFGFIFGDGFGFGFIFGDGFGFIFGFGDGFIFGFGFGDGFIFGFGDGFIFGFGDGFGFIDGFGFIFGDGFGFGDGFIDGFGFGFIDGFGFGDGFGFGDGFIFGDGFGFGDGFGFIDGFGFGFGDIFGFGFGFGFIDGFGFGFIFGFGDGFGFIFGDGFGFGFIDGFGFGFGDGFGDGFGFIDGFGFGDGFGDGFGFIDGFGFGFGDIFGFGFGDIFGFGFGFIFGFGFIDGFGFGFGFIFGFGFGFIDGFGFGFGFIFGFGFGFIDGFGFGFGFIDGFGFGFIFGDGFGFIDGFGFGDGFIFGDGFIFGDGFGDGFGDGFIDGFGDGDGFGDGFGDGDGDGFGDGDGFGDGDGFGDGDGFGDGFIDGDGFGDGFGDIFGDGFIDGFGDIFGDGFIDGFGDIFGFGDIFGDGFGDIFGDGDGFIFGDGFGDIFGDGFGDGFGDIFGDGFGDGFGDGFGDGFIDGFGFGDGFGDGFGDIFGDGFGDIFGDGFGDGFIDGFGDIFGDGFIDGFGDIFGDIDGFGDIFGDIFGDIFGDIFGDIFGDIFGDIFGDIFGDIFGDGFIDGFIFGDIFGFGDIFGFGDIFGFIFGDGFIFGFGDIFGFGDIFGFGFGDIFGFGDGFIDGFGFGDGFIFGDGFGDIFGFGFIDGFIFGFIDGFIFGFIFGFIFIFGFIFGDIFGFIFGFIFGFIDGFIFGFGDIFGFGDIFGFGDIFGFGDIFGFGDIFGFIFGDIFGFIFGFIDIFGFIFIFIFGDIFGFIDIFGDIFGFIDGFIDGDIFGDGFGDIDGFGDIDGFGDIDGFGDIFGDGFIDGFGDIFGFIFGDGFIFGFIFGDIFGFGFIFGFIFGFIFIFGFIFGFIFIFGFIFIFGFIHIFIFGFIFIFGFIFGDIFGFIFGFGDGFIFGDGFGDGFGDGFGDIFGFGDGFGDGFIFGDIFGFIFGDIFGFIFIFGFIFIFIFGFIDGFIFIFGDIFGFIFGDGFIFGDGFIDGFGDGFIFGDGFGDIFGDGFGDGFIFGDGFGFGDIFGFGDGFGFIDGFGFGDGFIDGFGFIDGFIFGFIDGFIFGDIFIFGDIFIFIFIDIFGFIDIFIDIFGDIFIDIFGDIFIDGDIFGDIDIFIDGDIDGDIFIDGDIDGDIDIDGDIDIDGDIDGDIDIDGDIDIBGDIDIBGDIDIBGDIDIBIDIBIDIBIDIBIBIDIBIDIBIBIBIDIBIBIBIBIBIBIBGBIBIBI@GBIBGBIBI@GBIBI@GBIBGBI@IBIBI@GBIBIBI@IBGBI@IBIBIBI@IBIBI@IBIBIBK@IBIBIBI@KBIBIBI@KBIBIBK@IBIBKBIBI@IBKBIBIBKBI@IBIBKBIBIBIBKBIBI@IBIBKBIBIBIBIBIBIBIBIBI@IBIBIBIBGBIBIBIBIBIBIBIBGBIBIBIBIBKBIBIBIBIBIBKBIBIDIBKBIBIBIBKBIBIBIBI@KBIBIBI@KBIBI@IBI@IBKBI@I@IBK@IBI@IBK@I@IBK@I@IBI@KBI@I@IBK@I@KBI@IBK@I@IBK@KBI@KBKBK@KBI@MBKBKBK@KBKBKBM@KBKBKBK@KBKBKBK@KBKBK@KBKBK@KBKBK@MBKBK@KBKBK@KBKBI@KBMBK@IBKBKBK@KBKBKBK@KBKBIBKBKBK@IBKBKBKBKBKBKBKBKBIBKBKBKBKBKBKBKBKBKBKBKBIBKBKBKBIBKBKBIBKBI@KBIBKBIBKBIBKBI@IBKBIBKBI@KBIBKBIBI@KBKBIBI@KBIBK@IBKBI@KBI@IBKBI@KBI@KBI@IBK@I@KBI@I@KBI@K@I@I@K@IBI?K@I@K@I@I@K?I@I?K@I?K@I?I?K?I?I?K?IAI?IAIAI?IAIAIAICIAIAGCIAICGCICICICGCICGEICIEGCIEGEICGEIEGEGEIEGEGGIEGEIGGEGGGEGGIEGGGGGEGGIGGGGGGGGGGGIGGGGGGGGGGGGGGGGEGGGGGGGGGGGEGGGGGEGGEGGEGGGEGGEGGEGGEEGGGEEGGGGEEGGGEGGGGEEGGGEGGGEGGGEGGGEGGGEGGIEGEGGGEGGGEGEIGGEGEGGGEGEGGGEGGIEGEGGEEGEGEGGGEGGGEGEEGGEGEEGGEEGGEEGEEGEEGEEEGEGEEEGCGEEEGCGEGCGCGCGCECGCIAGCGAGAEAG?GAG?G?G?G?G?E@G@G?GBG@E@GBGBGBGBGDEDGBEDGDEFGDEFEFGDEHEFEFEHGHEHEHEHEJEHEJCJEJEJEJEJCLEJELCLEJCLELCLELCLELCLELCLCNELCLCLELCNCLCLELCNCLCLCLELCLCNCLCLCLCLCNCLCLCLELCLCNCLCLCLCNCLCLCNCLCLCNCLCNCLCLCNCLCLCNCLCLCNCLCNCLCNCLCNCLCNCLCNELCNCNCLCLCNELCLCNCLELCNCLCLELCLCLENCJCLELCLELCLEJCLEJELCJEJELCJEJEJEJEJEJEHEJEHEJEHGHEHEHGHEFEHGFEFGFEFGFEFGDGDGFEDGDGDIDGBGDGBGDIBGBGBIBGBI@GBI@I@GBI@I@I?I@I@I?I?I?I?I?I?IAG?IAGAIAGAIAGCGAGCEAGCEAECCAEAECCACACCCACACAAACAAACAAAAAAAAAAAAAA?AAAAA??AAAA?AA?AA?AAAA??AAAAA??AAAA??AAAA??AA?AA?AAAA?AAAAAAAAAAAAAAACAACAAAACCAACCCAACCCCCCCCCCCCCCCEECCEEECCEEEEEEEECGEEGEEEEEEGCEEEEEEEEEEGEEEEEEEGEEEEEGEEEEEGGEEGEEEEEGEEEGEEEGGEEGEEEGEGGEEGEEGGEGEEGGEGEGGEEGEGGEEGGGEGGGEGGGEEGGEGGGEGGGEGGGGGEGGGEGGGEGGGEGGGGGEGGGEGGGEGGGEGGGEGGGEGGEEGGGEGGGEGEGGGEGGGEGGGEGGEEGGGEGEGGGEGGGEGGGEGGGEEEGGGGIEGGGEGGGGGEGGGEGGGGGGIEGGGGGEGGGGGEGGGGGEGGGGGEGGGGGEGGGGGEGGGGGEGGGGGEGGGEGGEGGEGGGGGEGGGEEGGGGEGGGGGEGGEEGGGGGEGGGGGEGGGGEEGGGGGGGEGGGGGGGEGGGGGGGEGGGGGGGEGGIGGGGGGEGGGGGGGEGGGGGGGGGEGGGGGEGGGGGGGEIGGGGEGGEGGEGGGGGEGGGGGEGGGGGEGGGGGGGEGGIGGGGEGGGGGGIGGGGEGGIGGGGGGGGEIGGGGGGEGGIGGGGGGEGGGGGEIGGGGEGGGGGGGEGGGGGEGGGGIEGGGGGEGGGGGGGEGGGGGEGGGGGGGEGGGGGGGGGEGGGGGGGGGGGGGGGGIGGGGGGGGGGGGEIGGGGGGGGGGGGGIEGGGGGEGGGGGGGEIGGGGEGGGEGGGEIGGEGGGGGEGGGEIGGEGGGEGGGEIGGEGEGGGEGGIEGGGEGGGEIGGEGGGEGGIEGGGGGEGGIGGEGGGEGGIGGEGGGEGGGGIEGGGGGEGGGGGEGGGGGEIGGEGGGGGEGGGEGGGGGEGGGGGEGGGEGGGEGGGGGEGGGEGGEEGGGEGGGEGGGEGGGEGGGEGGGEGGGEEGGEGGGEGGGEGGGEGGGEGGGEGGGEEGGEGGGEGGGEGEGGGEGGGEEGGEGEGGGEGEGGGEEEGEGGGEGEGEEGGEGEGEGEGGGEGEGEGEGEIGGEGEIEGEGEIGGEIEGEIEIEIEIEGEIEICIEIEIEICKEICIEICKEICKCIEKCKCKEKCKCKCMEMCMCKCKCKAICIAIAGCGAIAGAEAGAEAEAEAE?EAEACAE?CAC",
      precision: 6
    }
  end
end
