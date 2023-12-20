defmodule Data.AutoGenerated.Video.Rendered_fbbacb61e54623e0310161a516ff37bc do
  @moduledoc "#{"ahrensburg-a9: U-Bahn Ahrensburg West → Zentrum"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "ahrensburg-a9: U-Bahn Ahrensburg West → Zentrum"
  end

  @impl Video.Rendered
  def hash() do
    "fbbacb61e54623e0310161a516ff37bc"
  end

  @impl Video.Rendered
  def length_ms() do
    82566
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-10-16-ahrensburg2/GX014931", "00:00:40.707", :end},
      {"2022-10-16-ahrensburg2/GX014932", :start, "00:00:11.778"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.220475,
      minLat: 53.66400607784431,
      maxLon: 10.239134293413175,
      maxLat: 53.674562
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
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Waldemar-Bonsels-Weg"},
      %{timestamp: 18340, text: "Katzenbuckel"},
      %{timestamp: 27347, text: "Theodor-Storm-Stieg"},
      %{timestamp: 31350, text: "Theodor-Storm-Straße"},
      %{timestamp: 46696, text: ""},
      %{timestamp: 51033, text: "Reesenbüttler Graben"},
      %{timestamp: 52367, text: ""},
      %{timestamp: 53702, text: "Stormarnstraße"},
      %{timestamp: 54702, text: "Klaus-Groth-Straße"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.220692203592815, lat: 53.66400607784431, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.220619, lat: 53.66405, time_offset_ms: 326},
      %Video.TimedPoint{lon: 10.220553, lat: 53.6641, time_offset_ms: 659},
      %Video.TimedPoint{lon: 10.2205, lat: 53.664161, time_offset_ms: 993},
      %Video.TimedPoint{lon: 10.220475, lat: 53.664224, time_offset_ms: 1327},
      %Video.TimedPoint{lon: 10.22048, lat: 53.66429, time_offset_ms: 1660},
      %Video.TimedPoint{lon: 10.220499, lat: 53.664356, time_offset_ms: 1994},
      %Video.TimedPoint{lon: 10.220525, lat: 53.664419, time_offset_ms: 2327},
      %Video.TimedPoint{lon: 10.220553, lat: 53.66448, time_offset_ms: 2661},
      %Video.TimedPoint{lon: 10.220581, lat: 53.664546, time_offset_ms: 2995},
      %Video.TimedPoint{lon: 10.22061, lat: 53.664618, time_offset_ms: 3328},
      %Video.TimedPoint{lon: 10.220646, lat: 53.664696, time_offset_ms: 3662},
      %Video.TimedPoint{lon: 10.220682, lat: 53.664775, time_offset_ms: 3995},
      %Video.TimedPoint{lon: 10.220723, lat: 53.664856, time_offset_ms: 4329},
      %Video.TimedPoint{lon: 10.220762, lat: 53.664939, time_offset_ms: 4663},
      %Video.TimedPoint{lon: 10.220802, lat: 53.665027, time_offset_ms: 4996},
      %Video.TimedPoint{lon: 10.220852, lat: 53.665107, time_offset_ms: 5330},
      %Video.TimedPoint{lon: 10.220912, lat: 53.665182, time_offset_ms: 5663},
      %Video.TimedPoint{lon: 10.220981, lat: 53.665265, time_offset_ms: 5997},
      %Video.TimedPoint{lon: 10.221064, lat: 53.665341, time_offset_ms: 6331},
      %Video.TimedPoint{lon: 10.22116, lat: 53.665411, time_offset_ms: 6664},
      %Video.TimedPoint{lon: 10.221266, lat: 53.665476, time_offset_ms: 6998},
      %Video.TimedPoint{lon: 10.221384, lat: 53.665544, time_offset_ms: 7331},
      %Video.TimedPoint{lon: 10.221502, lat: 53.665612, time_offset_ms: 7665},
      %Video.TimedPoint{lon: 10.221619, lat: 53.665681, time_offset_ms: 7999},
      %Video.TimedPoint{lon: 10.221734, lat: 53.665748, time_offset_ms: 8332},
      %Video.TimedPoint{lon: 10.22185, lat: 53.665812, time_offset_ms: 8666},
      %Video.TimedPoint{lon: 10.22197, lat: 53.665879, time_offset_ms: 8999},
      %Video.TimedPoint{lon: 10.222085, lat: 53.665946, time_offset_ms: 9333},
      %Video.TimedPoint{lon: 10.222183, lat: 53.666016, time_offset_ms: 9667},
      %Video.TimedPoint{lon: 10.222263, lat: 53.666096, time_offset_ms: 10000},
      %Video.TimedPoint{lon: 10.222324, lat: 53.666182, time_offset_ms: 10334},
      %Video.TimedPoint{lon: 10.222368, lat: 53.666272, time_offset_ms: 10667},
      %Video.TimedPoint{lon: 10.222397, lat: 53.666367, time_offset_ms: 11001},
      %Video.TimedPoint{lon: 10.222412, lat: 53.666466, time_offset_ms: 11335},
      %Video.TimedPoint{lon: 10.222416, lat: 53.666565, time_offset_ms: 11668},
      %Video.TimedPoint{lon: 10.222412, lat: 53.666666, time_offset_ms: 12002},
      %Video.TimedPoint{lon: 10.222399, lat: 53.66676, time_offset_ms: 12335},
      %Video.TimedPoint{lon: 10.222385, lat: 53.666844, time_offset_ms: 12669},
      %Video.TimedPoint{lon: 10.222364, lat: 53.666932, time_offset_ms: 13003},
      %Video.TimedPoint{lon: 10.222353, lat: 53.667014, time_offset_ms: 13336},
      %Video.TimedPoint{lon: 10.222341, lat: 53.667096, time_offset_ms: 13670},
      %Video.TimedPoint{lon: 10.222328, lat: 53.667176, time_offset_ms: 14003},
      %Video.TimedPoint{lon: 10.22232, lat: 53.667249, time_offset_ms: 14337},
      %Video.TimedPoint{lon: 10.222345, lat: 53.667309, time_offset_ms: 14671},
      %Video.TimedPoint{lon: 10.22242, lat: 53.667355, time_offset_ms: 15004},
      %Video.TimedPoint{lon: 10.22252, lat: 53.667381, time_offset_ms: 15338},
      %Video.TimedPoint{lon: 10.222633, lat: 53.667391, time_offset_ms: 15671},
      %Video.TimedPoint{lon: 10.22275, lat: 53.667392, time_offset_ms: 16005},
      %Video.TimedPoint{lon: 10.222872, lat: 53.667392, time_offset_ms: 16339},
      %Video.TimedPoint{lon: 10.222988, lat: 53.667389, time_offset_ms: 16672},
      %Video.TimedPoint{lon: 10.223106, lat: 53.667384, time_offset_ms: 17006},
      %Video.TimedPoint{lon: 10.22322, lat: 53.667377, time_offset_ms: 17339},
      %Video.TimedPoint{lon: 10.223329, lat: 53.66737, time_offset_ms: 17673},
      %Video.TimedPoint{lon: 10.223432, lat: 53.667377, time_offset_ms: 18007},
      %Video.TimedPoint{lon: 10.223483, lat: 53.667423, time_offset_ms: 18340},
      %Video.TimedPoint{lon: 10.223487, lat: 53.667486, time_offset_ms: 18674},
      %Video.TimedPoint{lon: 10.223474, lat: 53.667557, time_offset_ms: 19007},
      %Video.TimedPoint{lon: 10.223458, lat: 53.667627, time_offset_ms: 19341},
      %Video.TimedPoint{lon: 10.223458, lat: 53.667692, time_offset_ms: 19675},
      %Video.TimedPoint{lon: 10.223467, lat: 53.66776, time_offset_ms: 20008},
      %Video.TimedPoint{lon: 10.223473, lat: 53.667824, time_offset_ms: 20342},
      %Video.TimedPoint{lon: 10.223469, lat: 53.667887, time_offset_ms: 20675},
      %Video.TimedPoint{lon: 10.223456, lat: 53.667949, time_offset_ms: 21009},
      %Video.TimedPoint{lon: 10.223431, lat: 53.668016, time_offset_ms: 21342},
      %Video.TimedPoint{lon: 10.223402, lat: 53.668079, time_offset_ms: 21676},
      %Video.TimedPoint{lon: 10.223372, lat: 53.668141, time_offset_ms: 22010},
      %Video.TimedPoint{lon: 10.223335, lat: 53.668205, time_offset_ms: 22343},
      %Video.TimedPoint{lon: 10.223296, lat: 53.66827, time_offset_ms: 22677},
      %Video.TimedPoint{lon: 10.223256, lat: 53.668341, time_offset_ms: 23010},
      %Video.TimedPoint{lon: 10.223213, lat: 53.668418, time_offset_ms: 23344},
      %Video.TimedPoint{lon: 10.223174, lat: 53.668497, time_offset_ms: 23678},
      %Video.TimedPoint{lon: 10.223151, lat: 53.66858, time_offset_ms: 24011},
      %Video.TimedPoint{lon: 10.22313, lat: 53.668658, time_offset_ms: 24345},
      %Video.TimedPoint{lon: 10.223107, lat: 53.668731, time_offset_ms: 24678},
      %Video.TimedPoint{lon: 10.223089, lat: 53.668803, time_offset_ms: 25012},
      %Video.TimedPoint{lon: 10.223084, lat: 53.668875, time_offset_ms: 25346},
      %Video.TimedPoint{lon: 10.223078, lat: 53.668947, time_offset_ms: 25679},
      %Video.TimedPoint{lon: 10.223066, lat: 53.669021, time_offset_ms: 26013},
      %Video.TimedPoint{lon: 10.22304, lat: 53.669094, time_offset_ms: 26346},
      %Video.TimedPoint{lon: 10.223013, lat: 53.669158, time_offset_ms: 26680},
      %Video.TimedPoint{lon: 10.222996, lat: 53.669213, time_offset_ms: 27014},
      %Video.TimedPoint{lon: 10.223013, lat: 53.66925, time_offset_ms: 27347},
      %Video.TimedPoint{lon: 10.223084, lat: 53.669258, time_offset_ms: 27681},
      %Video.TimedPoint{lon: 10.223175, lat: 53.669254, time_offset_ms: 28014},
      %Video.TimedPoint{lon: 10.223283, lat: 53.669249, time_offset_ms: 28348},
      %Video.TimedPoint{lon: 10.223394, lat: 53.669253, time_offset_ms: 28682},
      %Video.TimedPoint{lon: 10.223511, lat: 53.669255, time_offset_ms: 29015},
      %Video.TimedPoint{lon: 10.223635, lat: 53.669259, time_offset_ms: 29349},
      %Video.TimedPoint{lon: 10.223758, lat: 53.669262, time_offset_ms: 29682},
      %Video.TimedPoint{lon: 10.223878, lat: 53.669263, time_offset_ms: 30016},
      %Video.TimedPoint{lon: 10.223988, lat: 53.669265, time_offset_ms: 30350},
      %Video.TimedPoint{lon: 10.22405, lat: 53.669268, time_offset_ms: 30683},
      %Video.TimedPoint{lon: 10.224099, lat: 53.669273, time_offset_ms: 31017},
      %Video.TimedPoint{lon: 10.224143, lat: 53.669307, time_offset_ms: 31350},
      %Video.TimedPoint{lon: 10.224154, lat: 53.669362, time_offset_ms: 31684},
      %Video.TimedPoint{lon: 10.224149, lat: 53.669425, time_offset_ms: 32018},
      %Video.TimedPoint{lon: 10.224149, lat: 53.669495, time_offset_ms: 32351},
      %Video.TimedPoint{lon: 10.224164, lat: 53.669562, time_offset_ms: 32685},
      %Video.TimedPoint{lon: 10.224195, lat: 53.669635, time_offset_ms: 33018},
      %Video.TimedPoint{lon: 10.224241, lat: 53.669711, time_offset_ms: 33352},
      %Video.TimedPoint{lon: 10.224304, lat: 53.669777, time_offset_ms: 33686},
      %Video.TimedPoint{lon: 10.224385, lat: 53.669841, time_offset_ms: 34019},
      %Video.TimedPoint{lon: 10.224484, lat: 53.669903, time_offset_ms: 34353},
      %Video.TimedPoint{lon: 10.22459, lat: 53.669962, time_offset_ms: 34686},
      %Video.TimedPoint{lon: 10.2247, lat: 53.670021, time_offset_ms: 35020},
      %Video.TimedPoint{lon: 10.224816, lat: 53.670077, time_offset_ms: 35354},
      %Video.TimedPoint{lon: 10.224925, lat: 53.670135, time_offset_ms: 35687},
      %Video.TimedPoint{lon: 10.22504, lat: 53.670189, time_offset_ms: 36021},
      %Video.TimedPoint{lon: 10.225151, lat: 53.670245, time_offset_ms: 36354},
      %Video.TimedPoint{lon: 10.225268, lat: 53.670302, time_offset_ms: 36688},
      %Video.TimedPoint{lon: 10.225382, lat: 53.67036, time_offset_ms: 37022},
      %Video.TimedPoint{lon: 10.225493, lat: 53.670418, time_offset_ms: 37355},
      %Video.TimedPoint{lon: 10.225601, lat: 53.670477, time_offset_ms: 37689},
      %Video.TimedPoint{lon: 10.225714, lat: 53.670534, time_offset_ms: 38022},
      %Video.TimedPoint{lon: 10.225836, lat: 53.670588, time_offset_ms: 38356},
      %Video.TimedPoint{lon: 10.225952, lat: 53.670647, time_offset_ms: 38690},
      %Video.TimedPoint{lon: 10.226071, lat: 53.670709, time_offset_ms: 39023},
      %Video.TimedPoint{lon: 10.226192, lat: 53.670772, time_offset_ms: 39357},
      %Video.TimedPoint{lon: 10.226307, lat: 53.670832, time_offset_ms: 39690},
      %Video.TimedPoint{lon: 10.226429, lat: 53.670889, time_offset_ms: 40024},
      %Video.TimedPoint{lon: 10.226553, lat: 53.670949, time_offset_ms: 40358},
      %Video.TimedPoint{lon: 10.226671, lat: 53.671012, time_offset_ms: 40691},
      %Video.TimedPoint{lon: 10.226792, lat: 53.671076, time_offset_ms: 41025},
      %Video.TimedPoint{lon: 10.226916, lat: 53.671141, time_offset_ms: 41358},
      %Video.TimedPoint{lon: 10.227037, lat: 53.671205, time_offset_ms: 41692},
      %Video.TimedPoint{lon: 10.227158, lat: 53.671269, time_offset_ms: 42026},
      %Video.TimedPoint{lon: 10.227291, lat: 53.671337, time_offset_ms: 42359},
      %Video.TimedPoint{lon: 10.227427, lat: 53.6714, time_offset_ms: 42693},
      %Video.TimedPoint{lon: 10.227526, lat: 53.671448, time_offset_ms: 43026},
      %Video.TimedPoint{lon: 10.227578, lat: 53.671474, time_offset_ms: 43360},
      %Video.TimedPoint{lon: 10.227604, lat: 53.671489, time_offset_ms: 43694},
      %Video.TimedPoint{lon: 10.227621, lat: 53.671499, time_offset_ms: 44027},
      %Video.TimedPoint{lon: 10.227635, lat: 53.671506, time_offset_ms: 44361},
      %Video.TimedPoint{lon: 10.227653, lat: 53.671515, time_offset_ms: 44694},
      %Video.TimedPoint{lon: 10.22769, lat: 53.671535, time_offset_ms: 45028},
      %Video.TimedPoint{lon: 10.22775, lat: 53.671567, time_offset_ms: 45362},
      %Video.TimedPoint{lon: 10.22782, lat: 53.671608, time_offset_ms: 45695},
      %Video.TimedPoint{lon: 10.2279, lat: 53.671653, time_offset_ms: 46029},
      %Video.TimedPoint{lon: 10.227983, lat: 53.671704, time_offset_ms: 46362},
      %Video.TimedPoint{lon: 10.228074, lat: 53.671758, time_offset_ms: 46696},
      %Video.TimedPoint{lon: 10.228165, lat: 53.671813, time_offset_ms: 47030},
      %Video.TimedPoint{lon: 10.228263, lat: 53.671871, time_offset_ms: 47363},
      %Video.TimedPoint{lon: 10.228358, lat: 53.671928, time_offset_ms: 47697},
      %Video.TimedPoint{lon: 10.228458, lat: 53.671991, time_offset_ms: 48030},
      %Video.TimedPoint{lon: 10.228557, lat: 53.672056, time_offset_ms: 48364},
      %Video.TimedPoint{lon: 10.228662, lat: 53.672127, time_offset_ms: 48698},
      %Video.TimedPoint{lon: 10.228767, lat: 53.672196, time_offset_ms: 49031},
      %Video.TimedPoint{lon: 10.228869, lat: 53.672266, time_offset_ms: 49365},
      %Video.TimedPoint{lon: 10.228975, lat: 53.672338, time_offset_ms: 49698},
      %Video.TimedPoint{lon: 10.229075, lat: 53.672411, time_offset_ms: 50032},
      %Video.TimedPoint{lon: 10.229174, lat: 53.672481, time_offset_ms: 50366},
      %Video.TimedPoint{lon: 10.229277, lat: 53.672552, time_offset_ms: 50699},
      %Video.TimedPoint{lon: 10.229373, lat: 53.672617, time_offset_ms: 51033},
      %Video.TimedPoint{lon: 10.229467, lat: 53.672683, time_offset_ms: 51366},
      %Video.TimedPoint{lon: 10.229566, lat: 53.672753, time_offset_ms: 51700},
      %Video.TimedPoint{lon: 10.229669, lat: 53.672819, time_offset_ms: 52034},
      %Video.TimedPoint{lon: 10.229775, lat: 53.672877, time_offset_ms: 52367},
      %Video.TimedPoint{lon: 10.229891, lat: 53.672939, time_offset_ms: 52701},
      %Video.TimedPoint{lon: 10.230005, lat: 53.672996, time_offset_ms: 53034},
      %Video.TimedPoint{lon: 10.230113, lat: 53.673049, time_offset_ms: 53368},
      %Video.TimedPoint{lon: 10.230216, lat: 53.673099, time_offset_ms: 53702},
      %Video.TimedPoint{lon: 10.230311, lat: 53.67314, time_offset_ms: 54035},
      %Video.TimedPoint{lon: 10.230379, lat: 53.673163, time_offset_ms: 54369},
      %Video.TimedPoint{lon: 10.230431, lat: 53.673181, time_offset_ms: 54702},
      %Video.TimedPoint{lon: 10.230486, lat: 53.673202, time_offset_ms: 55036},
      %Video.TimedPoint{lon: 10.230559, lat: 53.673231, time_offset_ms: 55370},
      %Video.TimedPoint{lon: 10.230641, lat: 53.67327, time_offset_ms: 55703},
      %Video.TimedPoint{lon: 10.230729, lat: 53.673311, time_offset_ms: 56037},
      %Video.TimedPoint{lon: 10.230827, lat: 53.673353, time_offset_ms: 56370},
      %Video.TimedPoint{lon: 10.230928, lat: 53.673394, time_offset_ms: 56704},
      %Video.TimedPoint{lon: 10.231036, lat: 53.673437, time_offset_ms: 57038},
      %Video.TimedPoint{lon: 10.231145, lat: 53.673475, time_offset_ms: 57371},
      %Video.TimedPoint{lon: 10.231261, lat: 53.673511, time_offset_ms: 57705},
      %Video.TimedPoint{lon: 10.231369, lat: 53.673555, time_offset_ms: 58038},
      %Video.TimedPoint{lon: 10.23148, lat: 53.6736, time_offset_ms: 58372},
      %Video.TimedPoint{lon: 10.231585, lat: 53.673645, time_offset_ms: 58706},
      %Video.TimedPoint{lon: 10.231692, lat: 53.673695, time_offset_ms: 59039},
      %Video.TimedPoint{lon: 10.231812, lat: 53.673732, time_offset_ms: 59373},
      %Video.TimedPoint{lon: 10.231945, lat: 53.67376, time_offset_ms: 59706},
      %Video.TimedPoint{lon: 10.232073, lat: 53.673792, time_offset_ms: 60040},
      %Video.TimedPoint{lon: 10.232203, lat: 53.673824, time_offset_ms: 60374},
      %Video.TimedPoint{lon: 10.232337, lat: 53.673856, time_offset_ms: 60707},
      %Video.TimedPoint{lon: 10.232467, lat: 53.673893, time_offset_ms: 61041},
      %Video.TimedPoint{lon: 10.232597, lat: 53.673925, time_offset_ms: 61374},
      %Video.TimedPoint{lon: 10.232738, lat: 53.673942, time_offset_ms: 61708},
      %Video.TimedPoint{lon: 10.232878, lat: 53.673962, time_offset_ms: 62042},
      %Video.TimedPoint{lon: 10.233013, lat: 53.673988, time_offset_ms: 62375},
      %Video.TimedPoint{lon: 10.233148, lat: 53.674015, time_offset_ms: 62709},
      %Video.TimedPoint{lon: 10.233283, lat: 53.674042, time_offset_ms: 63042},
      %Video.TimedPoint{lon: 10.233414, lat: 53.674071, time_offset_ms: 63376},
      %Video.TimedPoint{lon: 10.233549, lat: 53.674099, time_offset_ms: 63710},
      %Video.TimedPoint{lon: 10.233684, lat: 53.674129, time_offset_ms: 64043},
      %Video.TimedPoint{lon: 10.233817, lat: 53.674158, time_offset_ms: 64377},
      %Video.TimedPoint{lon: 10.233953, lat: 53.674189, time_offset_ms: 64710},
      %Video.TimedPoint{lon: 10.234089, lat: 53.67422, time_offset_ms: 65044},
      %Video.TimedPoint{lon: 10.234221, lat: 53.67425, time_offset_ms: 65378},
      %Video.TimedPoint{lon: 10.234356, lat: 53.674282, time_offset_ms: 65711},
      %Video.TimedPoint{lon: 10.234486, lat: 53.674319, time_offset_ms: 66045},
      %Video.TimedPoint{lon: 10.234618, lat: 53.674355, time_offset_ms: 66378},
      %Video.TimedPoint{lon: 10.234759, lat: 53.674383, time_offset_ms: 66712},
      %Video.TimedPoint{lon: 10.234908, lat: 53.674401, time_offset_ms: 67046},
      %Video.TimedPoint{lon: 10.235055, lat: 53.674416, time_offset_ms: 67379},
      %Video.TimedPoint{lon: 10.235205, lat: 53.674442, time_offset_ms: 67713},
      %Video.TimedPoint{lon: 10.235354, lat: 53.674472, time_offset_ms: 68046},
      %Video.TimedPoint{lon: 10.235498, lat: 53.674505, time_offset_ms: 68380},
      %Video.TimedPoint{lon: 10.235644, lat: 53.674528, time_offset_ms: 68714},
      %Video.TimedPoint{lon: 10.235788, lat: 53.674543, time_offset_ms: 69047},
      %Video.TimedPoint{lon: 10.235929, lat: 53.674555, time_offset_ms: 69381},
      %Video.TimedPoint{lon: 10.236066, lat: 53.674562, time_offset_ms: 69714},
      %Video.TimedPoint{lon: 10.236199, lat: 53.674561, time_offset_ms: 70048},
      %Video.TimedPoint{lon: 10.236299, lat: 53.674555, time_offset_ms: 70382},
      %Video.TimedPoint{lon: 10.236379, lat: 53.674547, time_offset_ms: 70715},
      %Video.TimedPoint{lon: 10.236511, lat: 53.674544, time_offset_ms: 70788},
      %Video.TimedPoint{lon: 10.236528, lat: 53.674541, time_offset_ms: 71122},
      %Video.TimedPoint{lon: 10.236584, lat: 53.674528, time_offset_ms: 71455},
      %Video.TimedPoint{lon: 10.236657, lat: 53.674508, time_offset_ms: 71789},
      %Video.TimedPoint{lon: 10.236738, lat: 53.674487, time_offset_ms: 72122},
      %Video.TimedPoint{lon: 10.23683, lat: 53.674468, time_offset_ms: 72456},
      %Video.TimedPoint{lon: 10.236921, lat: 53.674452, time_offset_ms: 72790},
      %Video.TimedPoint{lon: 10.237013, lat: 53.67444, time_offset_ms: 73123},
      %Video.TimedPoint{lon: 10.237109, lat: 53.674431, time_offset_ms: 73457},
      %Video.TimedPoint{lon: 10.237199, lat: 53.674422, time_offset_ms: 73790},
      %Video.TimedPoint{lon: 10.237287, lat: 53.674413, time_offset_ms: 74124},
      %Video.TimedPoint{lon: 10.237378, lat: 53.674402, time_offset_ms: 74458},
      %Video.TimedPoint{lon: 10.237464, lat: 53.67439, time_offset_ms: 74791},
      %Video.TimedPoint{lon: 10.237545, lat: 53.674381, time_offset_ms: 75125},
      %Video.TimedPoint{lon: 10.237624, lat: 53.674373, time_offset_ms: 75458},
      %Video.TimedPoint{lon: 10.237704, lat: 53.674367, time_offset_ms: 75792},
      %Video.TimedPoint{lon: 10.237783, lat: 53.67436, time_offset_ms: 76126},
      %Video.TimedPoint{lon: 10.237865, lat: 53.674353, time_offset_ms: 76459},
      %Video.TimedPoint{lon: 10.237944, lat: 53.674346, time_offset_ms: 76793},
      %Video.TimedPoint{lon: 10.23802, lat: 53.67434, time_offset_ms: 77126},
      %Video.TimedPoint{lon: 10.238092, lat: 53.674335, time_offset_ms: 77460},
      %Video.TimedPoint{lon: 10.238164, lat: 53.674327, time_offset_ms: 77794},
      %Video.TimedPoint{lon: 10.238235, lat: 53.674312, time_offset_ms: 78127},
      %Video.TimedPoint{lon: 10.238306, lat: 53.674306, time_offset_ms: 78461},
      %Video.TimedPoint{lon: 10.238371, lat: 53.674301, time_offset_ms: 78794},
      %Video.TimedPoint{lon: 10.238436, lat: 53.674302, time_offset_ms: 79128},
      %Video.TimedPoint{lon: 10.238502, lat: 53.674295, time_offset_ms: 79462},
      %Video.TimedPoint{lon: 10.238566, lat: 53.674282, time_offset_ms: 79795},
      %Video.TimedPoint{lon: 10.238629, lat: 53.674261, time_offset_ms: 80129},
      %Video.TimedPoint{lon: 10.238694, lat: 53.674244, time_offset_ms: 80462},
      %Video.TimedPoint{lon: 10.23876, lat: 53.674225, time_offset_ms: 80796},
      %Video.TimedPoint{lon: 10.238825, lat: 53.674203, time_offset_ms: 81130},
      %Video.TimedPoint{lon: 10.238894, lat: 53.67419, time_offset_ms: 81463},
      %Video.TimedPoint{lon: 10.238963, lat: 53.674179, time_offset_ms: 81797},
      %Video.TimedPoint{lon: 10.239036, lat: 53.674178, time_offset_ms: 82130},
      %Video.TimedPoint{lon: 10.239112, lat: 53.674187, time_offset_ms: 82464},
      %Video.TimedPoint{lon: 10.239134293413175, lat: 53.67419005389222, time_offset_ms: 82566}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "gpkjeByfynRA@ABA@ABABABCBABABCBABCDABCDCBADCDCBCDCDEDCFCDEDCFEFEFEFEFEDEFCDEFEDCDEDEDCDEDEDEDEDCDEDEDEBEDEDEDGBEDEBEDEBEBEDEBGBEBEBEBE@EBEBE@EBE@E@E@GBE@E@E@E@E@E?E@E@E?G@E?E@E?E?G@E?E?E?G?E?E?E?G?EAE?G?EAE?GAE?EAG?EAEAE?GAEAEAGAE?GAEAEAEAGAEAEAEAGAECEAEAGAEAEAECGAEAEAEAECEAEAGCEAEAEAECEAEAECEAEAEAECEAEAECEAEAECEAEAECEAEAECEAEAGCEAEAECEAECEAGAECEAGCEAEAECGAECGAEAECGAECGAECGAECGAECGAEAGCGCEAGCEAGCGAECGAGCGAECGCGAGCGCGCEAGCGCGAGCGCGCGCGAGCGCGCGCGAGCGCGCGCGCGAGCECGCGCGCGAGCGCGCGCGCGCGAGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCICGCGCGCGCGCGCGCGCGCGCGCGAICGCGCGCGCGCGCICGCGCGCICGCGCICGCICGCIEGCICGCICGCGEICGCGCICGEGCICGEGCGCGEGCGCGEGCGEGCGEGCGEGCGEGCEEGEGCGEGEGCEEGEGEGCEEGEGEEEGEGEGCEEGEGEGEGGEEGEGEGGGEIEGGGEGGGEGGGEIGGGGEGGGGGEGGGGGGGGGGGEGGGGGGGGGGEGGGGGGIGGEGGGGGGIEGGGGIEGGIGGEIGGEIGIEGGIGIEIGIEGGIEIEIGIEIGIEGEKGIEIEIGIEIEIEIGIEIEKGIEIEIEKEIGIEKEIGKEIEKGKEIEKGKEKGKEIGKEKGKEKEKGKEKGKEKEKGKEKGKEIGKEKEKGKEKEKGIEKGKEKGKEKEKGKEIGKEKEKGKEKGKEKGKEIEKGKEKGKEKGKEKGIEKEKGKEKGIEKEKGKEKGKEIEKGKEKEKGIEKGKEKEIEKGKEKEIEKGKEKEIGKEKEIEKEKGKEIEKEKEKGIEKEKEKEIGKEKEKEKGKEKEKGKEKGKEKEKGKEKEKGKEKGKEKEKGKEKEKGKEKGIEKEKGKEIEKGKEKGIEKEKGIEKGIEIEKGIEKGIEIGIEIEIGIEIGIEIGIEIGGEIGIEGGIGGEIGGGIEGGIGGGGGIGGEGGGGGGGGGGGGGGGIGGGGEGGGEGGGGGEIEGGGEGEGEGGIEGEGEIEGEGEIEGCGEIEGEGCIEGEICGEICGCGEICGCIEGCICGCICGCICGCICICGCICIAGCICGAICICGAICIAICGAIAICIAGAICIAIAIAIAIAGAIAIAIAIAIAIAIAI?IAIAI?IAIAG?IAI?IAI?IAI?IAI?I?IAI?I?I?IAI?I?I?I?I?G?I?I?I?K?I?I?I?I?I?I?I?I?I@I?K?I?I@I?I?G@I?I?I@I?I@I?I@I?I@G?I@I?I@G@I?I@G@I?I@G?I@G@G?I@G@I@G?G@G@I?G@G@G?G@G@G@G?G@G@I@G?G@G@I@G@G@I@G@G?I@G@I@G@I@G@I@G@I@G@G@I?G@G@I@G@G?G@G@I?G@G@G?G@G@G?G@G@G?G@G?G@G?G@I@G?G@G?G@G@G?G@G?G@G@I?G@G?G@G@G?G@G@G?G@G?I@G@G?G@G@G?G@G?G@G@G?G@G?G@G?G@G?G@G?G@G?G?G@E?G?G?G?E?G?G?E?G?E?GAE?EAG?EAE?EAGAEACAEAEAEAECEACCEAECCAECCCECCCECCEECCCCEECCECEEECECEEGCECGCGCECGCGCGCGCGCGCGCGAICGCGAICGAICIAICIAGAIAICIAIAIAIAIAKAIAIAK?IAKAIAK?IAKAI?KAK?IAK?IAK?KAI?K?KAK?I?KAK?K?I?K?KAK?I?K?K?K?K?K?K?KAK?K?K?K?K?K?K?K?K?K?K?M?K?K?K?M?K?K?K@K?K?K?K?K?K?K?K?K?K?I@K?K?K?I?K?K?K@I?K?K?K?I?K@K?K?K?K@I?K?K?K?K@K?K?K?K@K?K?K@I?K?K?K@K?K?K@I?K?K@K?K?I@K?K?K@I?K?K@I?K?I@K?K?K?I@K?I?K@I?K?I?K?K@I?K?K?I?K?I?K?KAI?K?I?KAI?IAI?IAIAI?IAGAIAGAGAGAGAEAGAEAEAEAEAEAECCAECEACCEACCCAECCCCCCCCCCCCCCCACCECCAECCAECCAEAEAEAEAEAEAEAG?EAE?E?GAE?G?E?G?E?G?E@G?G?E@G?G?E@G@G?E@G?G@E?G@G@E?G@G@E?G@E@G?G@E@G?E@G@E?G@E?G@E?G@E?E@G?E?E@G?E?E?E@G?E?E?E?E?G?E?E?E?E?G?E?E?E?G?EAE?G?E?GAE?E?G?EAG?E?GAE?G?EAE?GAE?G?E?EAG?E?EAE?G?E?EAE?E?G?EAE?E?E?E?E?G?E?E?E?E?E?E?G?E?E?E?E@E?E?E?G?E@E?E?E@E?E?E@E?E@E?E@E?E@E?E@E@E?E@G@E?E@E@E@E?E@G@E@E@E@G@E@E@G@E@GBE@G@E@EBG@E@G@EBE@G@EBE@G@EBE@EBE@G@EBE@E@EBE@GBE@E@EBE@EBE@EBE@EBE@EBG@E@EBE@EBE@EBEBE@EBE@EBE@EBEBG@EBEBE@EBEBGBE@EBEBEBG@EBEBEBEBGBE@EBEBEBGBEBEBE@EBGBEBEBEBEBGBEBE@GBEBEBEBGBEBEBGBEBGBEBEBGBEBGBEBGBGBEBGBEBGBEBGBGBEBGBGBGDEBGBGBGBGBEBGBGBGDGBGBGBGBGBGBGBEBGBGDGBGBGBGBG@GBGBGBGBGBGBGBG@GBGBG@GBGBG@GBG@GBG@GBG@IBG@GBG@G@G@IBG@G@G@GBG@G@G@G@I@G@GBG@G@E@G@G@G@G@G@G@GBG@G@E@G@G@G@E@G@G@G@E@GBG@E@G@G@E@G@G@E@G@E@G@G@E@G@E@G@G@E@G@E@G@E@G@G?E@G@G@E@G?E@G@E?G@E?G@G@E?G@E?G@G?E@G?E?G@G?E@G?E?G@E?G?E@G?G?E@G?E?G?G@E?G?E@G?G?E@G?E@G?G?E@G?E@G?G@E?G@G?E@G?G@E?G@G@E?G@G@G?E@G@G@E@G@G@G@E@G@G@G@E@G@G@G@GBE@G@G@GBE@G@E@GBG@E@GBE@G@EBG@E@EBG@E@E@GBE@G@E@EBE@G@E@E@G@E@G?E@G@E?E?G@E?E?EAC?E?E?CAC?CAE?AAC?CAAAC?CAAAA?CAAAAAA?AAAAAAAAAAAAAA??ACAA?AAAAA?CAAAA?CAA?CACAC?CAC?CAE?CAC?EAEAE?EAE?EAG?EAG?GAI?GAI?G?KAI?I?I?K?I?K?I?I?K?I?I?K@I?K?I?I?K?I@K?K?K?I?K?I?K?K@I?K?I?K?K?I?K?I?K?I?K?I?KAI?K?K?I?K?I?K?K?I?KAI?K?K?K?I?K?KAK?I?K?K?K?K?KAK?K?K?K?K?K?KAK?K?K?K?K?MAK?K?K?M?K?KAM?K?K?K?K?MAK?K?K?M?K?KAK?M?K?K?K?K?MAK?K?K?K?K?K?M?KAK?K?K?K?M?K?K?K?K?K?KAK?M?K?K?K?K?M?K?K?M?KAM?K?M?K?K?M?KAK?M?K?K?K?IAI?K?G?IAI?G?G?GAG?E?EAG?E?EAC?E?CAE?C?CAE?C?CAC?C?CAC?CAA?C?CAC?AAC?A?CAA?CAA?CAA?CAA?CAA?CAAACAC?AACACAAACACACAACCACACCAACCCACCACCACCCCACCECCACCECCAECEAECEAEAEAECE?EAEAGAE?EAE?E?EAE?G?E?E?E?G?E?E?G?E?E?G?E?E?G?E?G?E?G?E?G?E?G?E?G?GAE?G?E?G?EAG?E?G?EAE?GAE?GAE?EAE?GAEAE?GAEAEAE?GAEAEAGAEAGAEAGAECGAEAGCEAGAGCEAGCGAGCECGAGCECGCGCGCGCECGCGCGCGCECGEGCGCGEGCGEECGEGEECGEGEECGEEEGEECEEGEEEEEGEEEEEEEGEEEEGEEEEEEGGEEEGEGGEEGEGEGEEGGEGEGEGGGEIEGEGEGEGGIEGEIEGEIGGEIEIEGEIEIEIEIGIEIEIEIEIEIEIEIEIEIGIEIEIEKEIEIEIEKEIEIEIEKCIEIEKEIEIEIEKEIEKEIEKEIEIEKEIEKEICKEIEKEKEIEKEIEKEIEKEKEICKEKEIEKEKEIEKCKEKEKEIEKEKEIEKCKEIEKEKEIEKCKEIEKEIEKEIEKCKEIEKEIEKEICKEIEKEICKEIEKEKEICKEIEKEKCIEKEKEKCIEKEIEKCKEIEKEKCIEKEKEICKEIEKEICKEKEIEKCIEKEIEKCKEIEKEKEIEKCKEKEIEKEKEKEICKEKEKEKEKEKEIEKEKCKEKEKEIEKEKEKEIEKCKEIEKEKEKEIEKEKEIEKCKEIEKEKEIEKEIEKEKEIEKCIEKEKEIEKEIEIEKEIEKCIEKEIEKEIEKEIEIEKEICKEIEKEIEKEIEIEKEIEKCIEKEIEKEIEKEIEKEKCIEKEKEIEKEKCIEKEKEICKEKEKEKEKCKEKEKEICKEKEKEKEMCKEKEKEKEKCIEKEKEKEKEKCKEKEKEKEIEKCKEKEKEKEKEIEKEKEKEIEKEKEKEKEKEKEKEKEKEKEKGKEKEKEKEKEKEKEIEKGKEMEKEKEKEKEKGKEKEKEKEKEKGKEKEKEKEKEKEKEKGKEKEKEKEKEKEIEKEKEKEKEIEKEKEKCIEKEKEKEKEKEKEIEKEKEKCKEKEKEKEKEKEKEKCKEKEKEKEKEMEKEKEKEKEKEMEKEKEKEKEKEMEKEKEKEKEMEKEKEKEKEKEKEKEKGKEKEKEKEKEKEKEKEKGKEKEIEKEKEKEKGKEKEKEKEKEKGKEKEKEKEKGKEKEKEKEKGKEMEKEKEKGKEKEKEMGKEKEKGMEKEKGMEKEKEKEKGKEKEMEKGKEKEKEKEKGKEKEKEKEKGMEKEKEKEKGKEKEKEIEMEKGKEKEKEKEKEIEKGKEKEKEKEKEKGKEMEKEKEKGKEMEKGMEKEMGMEKGMEMGKEMGMEMEMGKEMEMGMEKEMGMEMGMEMEMGMEMEMEMGMEMGMEMEMEMEKEMEKGMEKEKEMEKCKEKEKEMEKEKEIEKEKEKCIEKEICKEIEICGCIEICGCGCEAGCECEACAEACCCACACACAC?CAAACAAAA?CAAAA?AAA?AAA?AAA?AAA???AAA?AA??A?AA??A?AA??A??AA?A???AA??A???AA??A????AA???A??AA?????AA??A?????AA??A?????AA??A?????AA??A???AA??A????AA???AAA???A??AA?AA??A?AAA?AAA?AAA?AAAAA?AAAAC?AACAAACAAACACACACACAECCAECCAECEAECECGCGCECGCGEGCICGCGEGCGCGEICGCECGCGEGCGCGCGCGCGEECGCGCGCGCEEGCGCGCGEGCGCGCEEGCGCGCGEGCGCGEGCGCGEGCICGEGCGEGCGEGCGEICGEGCGEGCIEGCGEICGEGEGCIEGCGEIEGCIEGEIEGCIEGEICGEIEGEICGEIEICGEIEGEICGEIEGEICGEIEGCIEGEICIEGEIEGCIEGEIEIEGCIEIEIEGEIEIEIEIEICIEIEIEIEIEIEGEIEIEIEIEIEICGEIEIEIEGEICIEGEIEIEGEICIEGEIEIEIEGEIEIEIEIEIEIEIEIEIEIEIGIEIEIEIEIGIEIEIEIEIGIEIEIEIEIEIGIEGEIEIGIEIEIEIGIEIEIEIGIEIGIEKGIEIEIGIEKGIEIGIGKEIGIEKGIEIGKEIGIGIEKGIEIGKEIGIEIGKEIGIEIGKEIEIGIEIGIEKGIEIGIEIGIEKEIGIEIGIEIGIEIGIEIGKEIGIEIGIEIGIEKGIEIGIGIEKGIEIGKGIEIGKGIEIGIGKEIGIEIGIGKEIGIGIEIGIEIGIGIEIGKGIEIGIEIGIGIEIGIEIGIGIEIGGEIGIEIGIEIGIEIGIEIGIEIEGGIEIGIEIGKGIEIGIEIGIEIGKGIEIGIGKEIGIEIGIEIGIEIGIEIEIGIEIGIEIEIEIGGEIEIEIGGEIEIEGEIGIEGEIEIEGGIEIEGEIGIEGEIEIGGEIEIGIEGEIEIGGEIGIEIEIGIEIGGEIGIEIGIEIGIEIGKEIGIEIGIEIEIGIEIGIEIGIEIEKGIEIEIGIEIEKGIEIEIEKEIEIGIEIEIEKEIEIEIEIEIEKEIEICIEIEIEIEKEIEIEKEIEIEKEKEIEKEIEKEKEKEKEIEKGMEIEKEKEKEKEKEIEKEKEKEKEKEIEKEKEKEKEIEKEKEKCIEKEIEKEKCIEKEIEKCIEKEICKEIEICKEIEKCIEIEKCIEICKEIEICKEIEKCIEICIEKCIEICKEICIEIEKCICIEKCIEICIEICKCIEICKCIEICKCIEICICKCICICICICICGCICGAICGCGAGCGAGAGCEAGAEAECGAEAEAEAEACAEAEACAEAEACAE?CAEACACAEAC?CACACAEAC?CACACAEAC?CACAEACACAC?EACACAEACAEACAEACAEACAEAEAEACAGAECEAEAEAECGAEAGCEAGCGAECGCGAGCGCGAGCGCGCGAGCICGCGCGCICGCGCICGCICGCGCICGCGCICGCGCICGCICGCGCICGCGCICGCICGCICGCICGCICGCIEICGCICICICGCICICIEICICICICICICICIEICICICICICICICICICICICICIEICICICICICICICICICICKCICIEICKCICICKCICKCIEKCICKCICKCICKCICKCICKCICICKCICKCICKCICICKCICKCIAICKCICKCICKCKAICKCICKCKCICKCKCIAKCKCKCICKCKCICKCICKCKCICKCICKCKCICKCIEICKCKCICICKCIEKCICKCIEKCICKCIEKCICKCIEKCKCIEKCKCICIEKCICKCIEKCICICKEICICICKCIEICICICIEKCICICIEICKCIEICKCIEICKCIEKCIEKCICKEICKEKCICKCIEKCICKCKEKCICKCKCICKCKCKCIAKCKCKCKCKCKAKCKCMAKCKCKAMCKCKAMCMAKCMAKCMCMAKCMAKCMAKCMAMCKAMCKAMCKAMCKAMCKAKCMCKAMCKAMCKAKCMAKCKCMAKCMAKCMCKAKCMAKCMAKCMCKAMCKAMCKCMAKCMAKCMCMAKCMCKAMCMAMCKCMAMCKCMAMCKCMAMCKCMCKAMCMCMAKCMCKCMAKCMCKCMCMAKCMCMCKAKCMCKCMAMCKCMAKCMCKAMCKAMCKAMCKAMCKAMCKAMAMCKAMAKAMCMAMAMAKAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMAMCMAMAMAKAMAMCMAMAMAKAMCMAMAMCKAMAMAKCMAMAKCMAMAMAMCKAMAMCKAMAMCMAMCKAMAMCKAMAMCMAKAMCMAMAMCKAMAMCMAKCMAMAMCMAKAMCMAKCMAMAKCMAMCKAMAMCKAMCKAMAKCMAKCMAKAMCKAMCKAMAMCKAMCMAKCMAMAKCMAKCMAMAMCMAKCMAMCKAMCMAMAKCMAMCMAMCKAMCMAMCMAMCKAMCMAMCKAMCMAKCMAMAMCKAMCMAKCMAKCMAKCMAMCKAMAMCKAMCKAMCMAKCMAMCMAKCMAMCMAMCKCMAMCMAMCMAMCKAMCMAMCMCMAMCKAMCMAMCKAMCMCMAMCMAMCKAMCMAKCMAMCKCMAMCMAKCMAKCMAKCMAKCMAMCKAMCKAMCKAMCKAMCMAMCKAMCMCKAMCMAMCKCMAMCMCMAKCMCMAKCMCKCMAMCKCMCMAKCMCKCMAKCMCKCMCKAMCKCMCKCMAKCMCMCKCMAKCMCMCKAMCKCMCMAKCMCMAKCMCMAKCMCMAMCMAMCKAMCMAMCMAMAMCMAMAMCMAOAMCMAMAMAOAMAMAOCMAMAMAOAMAOAMAOAMAO?MAOAMAMAOAMAO?MAMAOAMAMAO?MAMAOAMAMAOAM?MAMAOAMAMAOAMAOAMAMCOAMAOAMAOAMCOAOAMCOAMAMCOAMAOCMAOAOCMAOCMAOCMAOCMAOCMAOCMAOCMAMCOAMCMAOCMCOAMCMAMCOAMCMCMAOCMAMCMAOCMAMCMAMCOAMAMCOAMAMCMAOAMAMCMAOAMAOAMAMCMAOAMAMAMAOAMAMAM?OAMAMAMAOAM?MAMAOAMAM?MAMAM?MAMAMAO?MAMAM?MAM?MAMAM?MAM?MAM?MAMAM?MAM?MAM?M?MAM?MAM?MAM?M?MAK?M?MAM?M?M?MAM?K?M?M?M?M?MAM?M?M?M?M?M?M?M?M?M@M?M?K?M?K?K@K?K?K?K?K@I?I?K?I@I?I?G@I?I?G?G@I?G?G?G@G?G?G?E@G?G?G?G@E?G?E?G@G?G?I@I?K?O@O?U@Y@]@e@Bu@@m@@W@O@K?G@E?E?C?C?A@A?A???A???A?A?A@A?A?A?A?C@A?A?C?A@C?C?A@C?C?C@C?C@E?C@C?C@E?C@E@E?E@C@E?E@G@E@E@G@G@E@G@G@I@G@G@I@G@I@IBG@I@G@G@I@G@G@I@GBG@I@G@G@G@I@G@G@I@G@I@G@I@G@I@G@I@G@I@G@I@I@I@G@I@I@I@G@I@I@G@I?I@G@I@G@I@I?G@I@G@I@I?G@I@G@I?G@I@G?I@G@I?G@I@G?I@I@G?I@G@I?G@I?I@G@I?G@I?I@I?G@I?I@I?G@I?I@I@I?G@I?I@I?I@I?I@G?I?I@G?I@I?I@G?I@G?I@I?G@I?G?I@G?G@I?G@G?I@G?I?G@G?I@G?G@I?G@G?I?G@G?I@G?G@I?G@G?I@G?I@G?I@I?G@I?G@I@G?I@G?I@I?G@I?I@G@I?G@I?G@I?I@G@G?I@I?G@G?I@G?I@G@G?I@G?G@G?G@I?G@G?G@G?G@G?G@G?G@G?I@G?G?G@E?G@G?G@G?G?G@G?G@G?G@G?G?G@E?G?G@G?G@G?G?G@G?G?G@E?G@G?G?G@G?G?G@G?G?G@G?G?G@G?G?G@G?G?G@E?G?G@G?G?G@G?G?G@G?G?G@G?G?G@G?G?G@G?G?G@G?G?G@G?G@G?G?G@I?G?G@G?G?G@I?G?G@G?G@G?G?G@I?G?G@G?G?G@G?G?G@G?G?G@G?G?G@G?E?G@G?G?G@G?G?G@G?G?E@G?G?G?G@E?G?G@E?G?G@E?G?G?E@G?G?E@G?E?G@E?G?E?G@E?G?E@G?E?G@E?G@E?G?E@G?E?G@E?G@E?G@G?E@G?E?G@E?G@G?E@G?G@E?G@G?E@G?G@G?E@G@G?G@E?G@G?G@E?G@G?E@G?G@E?G?E@G?G@E?G?E@G?G@E?E?G@E?G?E@G?E?E?G@E?E?G?E@E?E?G?E?E@E?E?E?G?E@E?E?E?E?E@G?E?E?E?E?E@E?E?G?E?E?E@E?E?E?E?G@E?E?E?E@E?G?E@E?E?E?E@G?E?E@E?G@E?E?E@E?E@G?E@E?E@E?G@E?E@E@E?G@E?E@E@E?E@G@E@E?E@G@E@E?E@G@E@E@E?G@E@E@G@E@E@E@G@E?E@E@G@E@E@G@E@E@E@G@E@E?E@G@E@E@E@E@G@E@E@E@E@G@E@E?G@E@E@E@E@G@E@E@G@E@E@G@E@E@G@E@E@G@E@G@E@E@G@E@E?G@E@G@E@G@E@E@G@E@G@E?E@G@E@G@E@E?G@E@E@G@E?G@E@E?G@E@G?E@E@G?E@E?G@E?G@E@E?G@E?G?E@E?G@E?G?E@E?G?E@G?E?G@G?E?G?G?G?I@I?G?I?I?I?G?G?G?GAG?G?G?E?G?E?G?E?E?EAE?E?C?E?E?C?EAC?E?C?C?C?CAC?C?C?C?A?CAA?C",
      precision: 6
    }
  end
end
