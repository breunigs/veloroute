defmodule Data.AutoGenerated.Video.Rendered_5278e5201c8a37d11cf5feb9f650e088 do
  @moduledoc "#{"2023-12-17-friedensallee: Friedensallee Richtung Autobahn"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2023-12-17-friedensallee: Friedensallee Richtung Autobahn"
  end

  @impl Video.Rendered
  def hash() do
    "5278e5201c8a37d11cf5feb9f650e088"
  end

  @impl Video.Rendered
  def length_ms() do
    70284
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2021-07-15-14uhr-und-13gg/GX012231", "00:00:00.934", :end},
      {"2021-07-15-14uhr-und-13gg/GX012232", :start, "00:00:18.085"},
      {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012928", "00:00:13.847",
       "00:00:55.589"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    false
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.901786670658682,
      minLat: 53.555290994011976,
      maxLon: 9.926302473053893,
      maxLat: 53.564921676646705
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Juli 2021"}, %{timestamp: 28542, text: "September 2021"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.926302473053893, lat: 53.555290994011976, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.926278, lat: 53.555293, time_offset_ms: 67},
      %Video.TimedPoint{lon: 9.926153, lat: 53.555328, time_offset_ms: 400},
      %Video.TimedPoint{lon: 9.926036, lat: 53.555376, time_offset_ms: 734},
      %Video.TimedPoint{lon: 9.925903, lat: 53.555421, time_offset_ms: 1068},
      %Video.TimedPoint{lon: 9.925752, lat: 53.555454, time_offset_ms: 1401},
      %Video.TimedPoint{lon: 9.925603, lat: 53.555475, time_offset_ms: 1735},
      %Video.TimedPoint{lon: 9.925447, lat: 53.555497, time_offset_ms: 2068},
      %Video.TimedPoint{lon: 9.925283, lat: 53.555519, time_offset_ms: 2402},
      %Video.TimedPoint{lon: 9.92512, lat: 53.555541, time_offset_ms: 2736},
      %Video.TimedPoint{lon: 9.924959, lat: 53.555559, time_offset_ms: 3069},
      %Video.TimedPoint{lon: 9.924795, lat: 53.555578, time_offset_ms: 3403},
      %Video.TimedPoint{lon: 9.924642, lat: 53.555606, time_offset_ms: 3736},
      %Video.TimedPoint{lon: 9.924484, lat: 53.555629, time_offset_ms: 4070},
      %Video.TimedPoint{lon: 9.924325, lat: 53.555651, time_offset_ms: 4404},
      %Video.TimedPoint{lon: 9.924165, lat: 53.555678, time_offset_ms: 4737},
      %Video.TimedPoint{lon: 9.924003, lat: 53.555707, time_offset_ms: 5071},
      %Video.TimedPoint{lon: 9.923836, lat: 53.555732, time_offset_ms: 5404},
      %Video.TimedPoint{lon: 9.923674, lat: 53.555757, time_offset_ms: 5738},
      %Video.TimedPoint{lon: 9.923514, lat: 53.555779, time_offset_ms: 6072},
      %Video.TimedPoint{lon: 9.923354, lat: 53.555803, time_offset_ms: 6405},
      %Video.TimedPoint{lon: 9.9232, lat: 53.555822, time_offset_ms: 6739},
      %Video.TimedPoint{lon: 9.92305, lat: 53.555843, time_offset_ms: 7072},
      %Video.TimedPoint{lon: 9.922897, lat: 53.555866, time_offset_ms: 7406},
      %Video.TimedPoint{lon: 9.922749, lat: 53.555887, time_offset_ms: 7740},
      %Video.TimedPoint{lon: 9.92261, lat: 53.55591, time_offset_ms: 8073},
      %Video.TimedPoint{lon: 9.922471, lat: 53.555937, time_offset_ms: 8407},
      %Video.TimedPoint{lon: 9.922339, lat: 53.555957, time_offset_ms: 8740},
      %Video.TimedPoint{lon: 9.922214, lat: 53.555976, time_offset_ms: 9074},
      %Video.TimedPoint{lon: 9.922097, lat: 53.555999, time_offset_ms: 9408},
      %Video.TimedPoint{lon: 9.921993, lat: 53.556017, time_offset_ms: 9741},
      %Video.TimedPoint{lon: 9.921916, lat: 53.556031, time_offset_ms: 10075},
      %Video.TimedPoint{lon: 9.921858, lat: 53.556039, time_offset_ms: 10408},
      %Video.TimedPoint{lon: 9.921734, lat: 53.556074, time_offset_ms: 10724},
      %Video.TimedPoint{lon: 9.921688, lat: 53.556082, time_offset_ms: 11058},
      %Video.TimedPoint{lon: 9.921591, lat: 53.556105, time_offset_ms: 11391},
      %Video.TimedPoint{lon: 9.921478, lat: 53.556131, time_offset_ms: 11725},
      %Video.TimedPoint{lon: 9.921355, lat: 53.556161, time_offset_ms: 12058},
      %Video.TimedPoint{lon: 9.921225, lat: 53.556194, time_offset_ms: 12392},
      %Video.TimedPoint{lon: 9.92109, lat: 53.556227, time_offset_ms: 12726},
      %Video.TimedPoint{lon: 9.920959, lat: 53.556259, time_offset_ms: 13059},
      %Video.TimedPoint{lon: 9.920833, lat: 53.556292, time_offset_ms: 13393},
      %Video.TimedPoint{lon: 9.920703, lat: 53.556323, time_offset_ms: 13726},
      %Video.TimedPoint{lon: 9.920583, lat: 53.556355, time_offset_ms: 14060},
      %Video.TimedPoint{lon: 9.920459, lat: 53.556395, time_offset_ms: 14394},
      %Video.TimedPoint{lon: 9.920328, lat: 53.556432, time_offset_ms: 14727},
      %Video.TimedPoint{lon: 9.9202, lat: 53.556465, time_offset_ms: 15061},
      %Video.TimedPoint{lon: 9.92007, lat: 53.556498, time_offset_ms: 15394},
      %Video.TimedPoint{lon: 9.919934, lat: 53.55653, time_offset_ms: 15728},
      %Video.TimedPoint{lon: 9.919802, lat: 53.556567, time_offset_ms: 16062},
      %Video.TimedPoint{lon: 9.919674, lat: 53.556603, time_offset_ms: 16395},
      %Video.TimedPoint{lon: 9.91955, lat: 53.556634, time_offset_ms: 16729},
      %Video.TimedPoint{lon: 9.919436, lat: 53.556663, time_offset_ms: 17062},
      %Video.TimedPoint{lon: 9.919324, lat: 53.556693, time_offset_ms: 17396},
      %Video.TimedPoint{lon: 9.919203, lat: 53.556725, time_offset_ms: 17730},
      %Video.TimedPoint{lon: 9.919076, lat: 53.55676, time_offset_ms: 18063},
      %Video.TimedPoint{lon: 9.918954, lat: 53.556796, time_offset_ms: 18397},
      %Video.TimedPoint{lon: 9.918838, lat: 53.556828, time_offset_ms: 18730},
      %Video.TimedPoint{lon: 9.918714, lat: 53.556862, time_offset_ms: 19064},
      %Video.TimedPoint{lon: 9.918588, lat: 53.5569, time_offset_ms: 19398},
      %Video.TimedPoint{lon: 9.918466, lat: 53.556933, time_offset_ms: 19731},
      %Video.TimedPoint{lon: 9.918358, lat: 53.556963, time_offset_ms: 20065},
      %Video.TimedPoint{lon: 9.918276, lat: 53.556987, time_offset_ms: 20398},
      %Video.TimedPoint{lon: 9.91822, lat: 53.557003, time_offset_ms: 20732},
      %Video.TimedPoint{lon: 9.91819, lat: 53.557011, time_offset_ms: 21066},
      %Video.TimedPoint{lon: 9.918153, lat: 53.557015, time_offset_ms: 21399},
      %Video.TimedPoint{lon: 9.918109, lat: 53.55701, time_offset_ms: 21733},
      %Video.TimedPoint{lon: 9.918039, lat: 53.557013, time_offset_ms: 22066},
      %Video.TimedPoint{lon: 9.917945, lat: 53.55703, time_offset_ms: 22400},
      %Video.TimedPoint{lon: 9.917843, lat: 53.557057, time_offset_ms: 22734},
      %Video.TimedPoint{lon: 9.917732, lat: 53.557089, time_offset_ms: 23067},
      %Video.TimedPoint{lon: 9.917612, lat: 53.557122, time_offset_ms: 23401},
      %Video.TimedPoint{lon: 9.917488, lat: 53.557152, time_offset_ms: 23734},
      %Video.TimedPoint{lon: 9.91736, lat: 53.557181, time_offset_ms: 24068},
      %Video.TimedPoint{lon: 9.91723, lat: 53.55721, time_offset_ms: 24402},
      %Video.TimedPoint{lon: 9.91711, lat: 53.557242, time_offset_ms: 24735},
      %Video.TimedPoint{lon: 9.916996, lat: 53.557275, time_offset_ms: 25069},
      %Video.TimedPoint{lon: 9.916881, lat: 53.557308, time_offset_ms: 25402},
      %Video.TimedPoint{lon: 9.916768, lat: 53.55734, time_offset_ms: 25736},
      %Video.TimedPoint{lon: 9.916658, lat: 53.55738, time_offset_ms: 26070},
      %Video.TimedPoint{lon: 9.916529, lat: 53.557422, time_offset_ms: 26403},
      %Video.TimedPoint{lon: 9.916392, lat: 53.557461, time_offset_ms: 26737},
      %Video.TimedPoint{lon: 9.916252, lat: 53.557504, time_offset_ms: 27070},
      %Video.TimedPoint{lon: 9.916103, lat: 53.557548, time_offset_ms: 27404},
      %Video.TimedPoint{lon: 9.915958, lat: 53.55759, time_offset_ms: 27738},
      %Video.TimedPoint{lon: 9.915809, lat: 53.557631, time_offset_ms: 28071},
      %Video.TimedPoint{lon: 9.915652, lat: 53.557674, time_offset_ms: 28405},
      %Video.TimedPoint{lon: 9.915478783783785, lat: 53.55773233033033, time_offset_ms: 28542},
      %Video.TimedPoint{lon: 9.915399, lat: 53.557754, time_offset_ms: 28706},
      %Video.TimedPoint{lon: 9.915242, lat: 53.557802, time_offset_ms: 29040},
      %Video.TimedPoint{lon: 9.915088, lat: 53.557855, time_offset_ms: 29373},
      %Video.TimedPoint{lon: 9.914938, lat: 53.557913, time_offset_ms: 29707},
      %Video.TimedPoint{lon: 9.914793, lat: 53.557978, time_offset_ms: 30041},
      %Video.TimedPoint{lon: 9.914649, lat: 53.558046, time_offset_ms: 30374},
      %Video.TimedPoint{lon: 9.914499, lat: 53.558112, time_offset_ms: 30708},
      %Video.TimedPoint{lon: 9.914349, lat: 53.558176, time_offset_ms: 31041},
      %Video.TimedPoint{lon: 9.914204, lat: 53.558237, time_offset_ms: 31375},
      %Video.TimedPoint{lon: 9.914058, lat: 53.558298, time_offset_ms: 31709},
      %Video.TimedPoint{lon: 9.913921, lat: 53.558355, time_offset_ms: 32042},
      %Video.TimedPoint{lon: 9.913792, lat: 53.558406, time_offset_ms: 32376},
      %Video.TimedPoint{lon: 9.913687, lat: 53.558448, time_offset_ms: 32709},
      %Video.TimedPoint{lon: 9.913609, lat: 53.558477, time_offset_ms: 33043},
      %Video.TimedPoint{lon: 9.913535, lat: 53.558504, time_offset_ms: 33377},
      %Video.TimedPoint{lon: 9.91344, lat: 53.558538, time_offset_ms: 33710},
      %Video.TimedPoint{lon: 9.913328, lat: 53.558571, time_offset_ms: 34044},
      %Video.TimedPoint{lon: 9.91321, lat: 53.558619, time_offset_ms: 34377},
      %Video.TimedPoint{lon: 9.91309, lat: 53.55868, time_offset_ms: 34711},
      %Video.TimedPoint{lon: 9.912967, lat: 53.558741, time_offset_ms: 35045},
      %Video.TimedPoint{lon: 9.912834, lat: 53.558799, time_offset_ms: 35378},
      %Video.TimedPoint{lon: 9.912692, lat: 53.558858, time_offset_ms: 35712},
      %Video.TimedPoint{lon: 9.912546, lat: 53.558915, time_offset_ms: 36045},
      %Video.TimedPoint{lon: 9.912391, lat: 53.558966, time_offset_ms: 36379},
      %Video.TimedPoint{lon: 9.912235, lat: 53.559023, time_offset_ms: 36713},
      %Video.TimedPoint{lon: 9.912099, lat: 53.559092, time_offset_ms: 37046},
      %Video.TimedPoint{lon: 9.911958, lat: 53.559159, time_offset_ms: 37380},
      %Video.TimedPoint{lon: 9.91181, lat: 53.559225, time_offset_ms: 37713},
      %Video.TimedPoint{lon: 9.911666, lat: 53.559289, time_offset_ms: 38047},
      %Video.TimedPoint{lon: 9.911527, lat: 53.559353, time_offset_ms: 38381},
      %Video.TimedPoint{lon: 9.911417, lat: 53.559406, time_offset_ms: 38714},
      %Video.TimedPoint{lon: 9.911339, lat: 53.559443, time_offset_ms: 39048},
      %Video.TimedPoint{lon: 9.911277, lat: 53.559472, time_offset_ms: 39381},
      %Video.TimedPoint{lon: 9.911215, lat: 53.559498, time_offset_ms: 39715},
      %Video.TimedPoint{lon: 9.911155, lat: 53.559522, time_offset_ms: 40049},
      %Video.TimedPoint{lon: 9.911099, lat: 53.559546, time_offset_ms: 40382},
      %Video.TimedPoint{lon: 9.911031, lat: 53.559576, time_offset_ms: 40716},
      %Video.TimedPoint{lon: 9.910938, lat: 53.559613, time_offset_ms: 41049},
      %Video.TimedPoint{lon: 9.910829, lat: 53.559659, time_offset_ms: 41383},
      %Video.TimedPoint{lon: 9.910702, lat: 53.559709, time_offset_ms: 41717},
      %Video.TimedPoint{lon: 9.910572, lat: 53.559763, time_offset_ms: 42050},
      %Video.TimedPoint{lon: 9.910441, lat: 53.559829, time_offset_ms: 42384},
      %Video.TimedPoint{lon: 9.910299, lat: 53.559894, time_offset_ms: 42717},
      %Video.TimedPoint{lon: 9.910153, lat: 53.559955, time_offset_ms: 43051},
      %Video.TimedPoint{lon: 9.910024, lat: 53.560018, time_offset_ms: 43385},
      %Video.TimedPoint{lon: 9.909909, lat: 53.560069, time_offset_ms: 43718},
      %Video.TimedPoint{lon: 9.909764, lat: 53.56012, time_offset_ms: 44052},
      %Video.TimedPoint{lon: 9.90961, lat: 53.560176, time_offset_ms: 44385},
      %Video.TimedPoint{lon: 9.909462, lat: 53.560236, time_offset_ms: 44719},
      %Video.TimedPoint{lon: 9.90932, lat: 53.560291, time_offset_ms: 45053},
      %Video.TimedPoint{lon: 9.909182, lat: 53.560348, time_offset_ms: 45386},
      %Video.TimedPoint{lon: 9.909061, lat: 53.560416, time_offset_ms: 45720},
      %Video.TimedPoint{lon: 9.908939, lat: 53.560473, time_offset_ms: 46053},
      %Video.TimedPoint{lon: 9.908814, lat: 53.560522, time_offset_ms: 46387},
      %Video.TimedPoint{lon: 9.908685, lat: 53.560571, time_offset_ms: 46721},
      %Video.TimedPoint{lon: 9.908554, lat: 53.56062, time_offset_ms: 47054},
      %Video.TimedPoint{lon: 9.908426, lat: 53.560674, time_offset_ms: 47388},
      %Video.TimedPoint{lon: 9.908292, lat: 53.560727, time_offset_ms: 47721},
      %Video.TimedPoint{lon: 9.908164, lat: 53.560776, time_offset_ms: 48055},
      %Video.TimedPoint{lon: 9.908036, lat: 53.560829, time_offset_ms: 48388},
      %Video.TimedPoint{lon: 9.907905, lat: 53.560887, time_offset_ms: 48722},
      %Video.TimedPoint{lon: 9.907779, lat: 53.560945, time_offset_ms: 49056},
      %Video.TimedPoint{lon: 9.907653, lat: 53.561007, time_offset_ms: 49389},
      %Video.TimedPoint{lon: 9.907536, lat: 53.561081, time_offset_ms: 49723},
      %Video.TimedPoint{lon: 9.907428, lat: 53.561159, time_offset_ms: 50056},
      %Video.TimedPoint{lon: 9.907321, lat: 53.561238, time_offset_ms: 50390},
      %Video.TimedPoint{lon: 9.90721, lat: 53.561322, time_offset_ms: 50724},
      %Video.TimedPoint{lon: 9.907106, lat: 53.561403, time_offset_ms: 51057},
      %Video.TimedPoint{lon: 9.907004, lat: 53.561482, time_offset_ms: 51391},
      %Video.TimedPoint{lon: 9.906901, lat: 53.561563, time_offset_ms: 51724},
      %Video.TimedPoint{lon: 9.906806, lat: 53.561636, time_offset_ms: 52058},
      %Video.TimedPoint{lon: 9.906716, lat: 53.561712, time_offset_ms: 52392},
      %Video.TimedPoint{lon: 9.906618, lat: 53.561786, time_offset_ms: 52725},
      %Video.TimedPoint{lon: 9.906525, lat: 53.561857, time_offset_ms: 53059},
      %Video.TimedPoint{lon: 9.906431, lat: 53.561931, time_offset_ms: 53392},
      %Video.TimedPoint{lon: 9.906328, lat: 53.562007, time_offset_ms: 53726},
      %Video.TimedPoint{lon: 9.906231, lat: 53.562085, time_offset_ms: 54060},
      %Video.TimedPoint{lon: 9.906132, lat: 53.562156, time_offset_ms: 54393},
      %Video.TimedPoint{lon: 9.906036, lat: 53.562229, time_offset_ms: 54727},
      %Video.TimedPoint{lon: 9.905948, lat: 53.562299, time_offset_ms: 55060},
      %Video.TimedPoint{lon: 9.905858, lat: 53.562367, time_offset_ms: 55394},
      %Video.TimedPoint{lon: 9.905749, lat: 53.562437, time_offset_ms: 55728},
      %Video.TimedPoint{lon: 9.905635, lat: 53.562501, time_offset_ms: 56061},
      %Video.TimedPoint{lon: 9.905512, lat: 53.56257, time_offset_ms: 56395},
      %Video.TimedPoint{lon: 9.905398, lat: 53.562637, time_offset_ms: 56728},
      %Video.TimedPoint{lon: 9.905282, lat: 53.562703, time_offset_ms: 57062},
      %Video.TimedPoint{lon: 9.905166, lat: 53.562766, time_offset_ms: 57396},
      %Video.TimedPoint{lon: 9.905051, lat: 53.562824, time_offset_ms: 57729},
      %Video.TimedPoint{lon: 9.904937, lat: 53.562877, time_offset_ms: 58063},
      %Video.TimedPoint{lon: 9.904821, lat: 53.562927, time_offset_ms: 58396},
      %Video.TimedPoint{lon: 9.904711, lat: 53.562963, time_offset_ms: 58730},
      %Video.TimedPoint{lon: 9.904634, lat: 53.563003, time_offset_ms: 59064},
      %Video.TimedPoint{lon: 9.90456, lat: 53.563047, time_offset_ms: 59397},
      %Video.TimedPoint{lon: 9.904475, lat: 53.563092, time_offset_ms: 59731},
      %Video.TimedPoint{lon: 9.904385, lat: 53.563137, time_offset_ms: 60064},
      %Video.TimedPoint{lon: 9.904288, lat: 53.563188, time_offset_ms: 60398},
      %Video.TimedPoint{lon: 9.904195, lat: 53.563237, time_offset_ms: 60732},
      %Video.TimedPoint{lon: 9.904097, lat: 53.563281, time_offset_ms: 61065},
      %Video.TimedPoint{lon: 9.903996, lat: 53.563337, time_offset_ms: 61399},
      %Video.TimedPoint{lon: 9.903899, lat: 53.563392, time_offset_ms: 61732},
      %Video.TimedPoint{lon: 9.903806, lat: 53.56345, time_offset_ms: 62066},
      %Video.TimedPoint{lon: 9.903705, lat: 53.563507, time_offset_ms: 62400},
      %Video.TimedPoint{lon: 9.903619, lat: 53.563565, time_offset_ms: 62733},
      %Video.TimedPoint{lon: 9.903529, lat: 53.563624, time_offset_ms: 63067},
      %Video.TimedPoint{lon: 9.903434, lat: 53.563692, time_offset_ms: 63400},
      %Video.TimedPoint{lon: 9.903331, lat: 53.563754, time_offset_ms: 63734},
      %Video.TimedPoint{lon: 9.903232, lat: 53.563814, time_offset_ms: 64068},
      %Video.TimedPoint{lon: 9.903131, lat: 53.563874, time_offset_ms: 64401},
      %Video.TimedPoint{lon: 9.903024, lat: 53.563934, time_offset_ms: 64735},
      %Video.TimedPoint{lon: 9.902912, lat: 53.563992, time_offset_ms: 65068},
      %Video.TimedPoint{lon: 9.902817, lat: 53.564054, time_offset_ms: 65402},
      %Video.TimedPoint{lon: 9.90273, lat: 53.564114, time_offset_ms: 65736},
      %Video.TimedPoint{lon: 9.902642, lat: 53.56417, time_offset_ms: 66069},
      %Video.TimedPoint{lon: 9.902554, lat: 53.564231, time_offset_ms: 66403},
      %Video.TimedPoint{lon: 9.902478, lat: 53.564294, time_offset_ms: 66736},
      %Video.TimedPoint{lon: 9.902404, lat: 53.564358, time_offset_ms: 67070},
      %Video.TimedPoint{lon: 9.902321, lat: 53.564423, time_offset_ms: 67404},
      %Video.TimedPoint{lon: 9.902226, lat: 53.564481, time_offset_ms: 67737},
      %Video.TimedPoint{lon: 9.902132, lat: 53.564535, time_offset_ms: 68071},
      %Video.TimedPoint{lon: 9.902033, lat: 53.56459, time_offset_ms: 68404},
      %Video.TimedPoint{lon: 9.901939, lat: 53.564646, time_offset_ms: 68738},
      %Video.TimedPoint{lon: 9.901858, lat: 53.564707, time_offset_ms: 69072},
      %Video.TimedPoint{lon: 9.901828, lat: 53.564778, time_offset_ms: 69405},
      %Video.TimedPoint{lon: 9.901831, lat: 53.564847, time_offset_ms: 69739},
      %Video.TimedPoint{lon: 9.9018, lat: 53.564902, time_offset_ms: 70072},
      %Video.TimedPoint{lon: 9.901786670658682, lat: 53.564921676646705, time_offset_ms: 70284}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "}dwceBqgz|Q?@AB?BAB?DAB?DADAFADAFAFCHAHAHCJCJCLCNCNEPERERENCNELCLCJEJCLCJCJCJEJCJCJCJEJCJCJCJEJCJCJELCJCLEJCJCLCJELCLCJCLCLELCLCLCJCLCLCLCLCNCLCLCLCNALCNCLCNALCNCNALCNCLANANCLANCLANALCNALALANALCLALANALANALALANCLALANALANANALANANALANANCNALANANANANANALANANANCNANANANANANANAPANCNANANAPANANANAPANCNANANAPANANANAPANANANCNANANAPANANANANANANANANAPANANANANANANANANANANANANAN?NANANANANANAPANANANANANAPANANANAPANANANANAPANANALANCNAPALANANCNANALANCNALANCNALANANCLANANALCNANANCLANANANANCLANANANANCNANANANALANANCNANANANANANANALCNANANANANANANCNANANALANCNANANANANCNAPANCLANAPCNANANCNANANCNANANCNANCNANCNANANCNANCNANAPCNANCNANANCNANAPCNANAPCNANAPCNANAPCNAPANCPANANCNAPANANCNAPANANCPANANANANCNANANAPCNANANANANCNANANANANCNANANANANANANALCPANANANALANANCNANANANANANANCNANAPANANANCNANANANANANANCNANANANANANALANANALANANALANANALANANALANALANALANANALANALANALANALANALANALANALCNALANALANALANANALANALCNANALANANANALCNANALANALANALANANCLANALANALANALALANALANCLANALALALALANALALALCLALALANALAJALALCLALALALALAJCLALALALCLALALALCLALALALCLALALCNAJALALCLALALALALCLAJALALALAJALALAJCLALAJALAJALAJALAJAJALAJALAJALAJAJAJALAJAJAJALAJAJAJAJAJAJAJAJALAJAJAJAJAJAJAJAJCJAJAJAJAJAJAJAJAJAHAJCJAJAJAJAHAJAJAHAJAHAJAHAJAHAHAH?HAHAHAFAH?FAHAFAD?FAF?DAFAD?FAD?DAD?DAD?DAB?DAD?BAD?DAB?DAB?DAB?BAD?BAB?DAD?DADAFAF?FAHCFAJAJAJCLCLALCNCNCPCNCNCLCLAJCJAHAHAHAFAFADAD?DADAB?BAD?@?BAB?BAB?BAB?BAD?BADAD?DADAD?DAFADAFAFAHAFAHAHAFAHAJCHAHAJCJAJAJCJAJCJAJAJCJAJAJCJAJCHAJAJCJAHAJCJAJCJAJCJAJAJCLAJCJAJCJALCJAJCJAJCLCJAJCLAJCLCJAJCLAJCLAJCJCLAJCLCLAJCLCJALCJALCLCJALCLCJALCLCLAJCLCLALCJCLCLALCLAJCLCLAJCLCLALCJCLAJCLCLAJCLAJCLCLAJCLAJCJCLAJCLAJCLCJAJCLCJAJCLAJCJCJALCJAJCLCJAJCJALCJCLAJCLAJCJCLALCJALCJCLAJCLCJALCJAJCLAJCJCLAJCJAJCJCJAJCJAJCJAJCJCJAJCJCHAJCJCJAJCJCJCJALCJCJCJCJCJCJALCJCLCJCJCJCLCJCJCLCJCLCJCLCJALCJCLCJCLCLCJCLCLCJALCJCLCJALCJCLCJCLAJCJCLAJCJCLAJCLCJAJCLCJAJCJALCJCLAJCLCJAJCLCJALCJCLAJCLAJCLCJALCJCLAJCLALCJCLALCJCLALCJCLALCLCLALCJCLALCJCLALCLCJCLALCLCJCLALCJCLCLAJCLCLCJCLCLAJCLCJCLCJCLALCJCJCLCLAJCLCJCJCLAJCLCJCLAJCJCJALCJCLCJAJCLCJAJCJALCJCJAJCLAJCJAJCJCJAJCJAJCJAJCJAJCHAJCJAJAHCJAJCHAJCHAJAHCJAJCHAJCHAJCHAJAHCJAHCJAHCJAHCJAJCHAJCHAJCHAJCJAJCJAHCJAJCJAJCJCJAJCJCJAJCJAJCJCLAJCJCJALCJCJCLAJCJCLCJALCJCJCLCJALCJCJCLAJCJCLCJCJAJCLCJCJAJCJCLCJCJAJCLCJCJAJCJCJCHAJCJCJAJCJCJAJCJAHCJCHAJCJAHCJAJCJCHAJCJCJAJCJCJAJCJAJCJCJCJAJCLCJCJAJCLCJCJAJCLCJCJCLAJCJCLCJCJCLAJCJCLCJCLCJCJALCJCJCLCJCJALCJCJCLCJAJCLCJAJCJCJCJALCJCJAJCJCJAJCJCJAHCJAJCJCJAHCJAJCHCJAJCHAJCHAJCHAHCHAJCHAHCHAHCJAHCHAHAHCHAHAFCFAHAFAFAFAFAFADAFADAFAD?DADAB?DADAB?DAB?BAB?BAB?B?BAB?@?BAB?@?B?@A@?@?B?@?@A@?@?@?@?@?@AB?@?@?@?@?@A@?B?@?@?@?B?@A@?@?B?@?@?@?B?@A@?B?@?B?@?@?B?@?B?@AB?B?@?B?B?@?B?B?BAB?B?B?D?B?D?D?BAD?D?D?F?D?DAF?F?D?FAF?H?FAF?F?HAH?FAH?HAH?HAH?HAHAJAH?JAHAHAHAJAHAHAHAJAHAHCJAHAHAHAJCHAHAHCJAHAHCHAJAHCHAJCHAJCHAJCHAHCJAJCHAJCHAJCJCHAJCJAHCJCJAJCHAJCJCJAJCJCJAHCJAJCJCLAJCJCJAJCJCJAJCJAJCJCLAJCJAJCJALCJAJCJCJALCJAJCJAJCLAJCJAJALCJAJCLAJCJALCJAJCLAJCLAJCJALAJCLAJCJALCJALCJALCJALCJALCJALCJALCLAJCJALCJALCJAJCLAJCJCJALCJAJCJAJCJCJAJCJAJCJAJCJCJAJCHAJCJCJAJCHAJCJCHAJCJAHCJCJAJCHCJAHCJAJCHCJAJCJCHAJCJCJAJCHCJAJCJCJAHCJCJAHCJAJCHCJAJCJCHAJCHCJAHCJAHCJCJAHCJCHAJCHCJCHAHCJCHCJAHCJCHCJCHAJCHCJCHCJCHCJCJCHCJCJCJCJCJCJCJCJCJCLCJCLCJELCJCLCJCLCJCLCLCJCLCLELCJCLCLCJCLCLCLCJCLCLCLCLCLCJCLCLCLCLCLCLCLCLCLCLCLELCLCJCNCLCLCLCLCLELCLCLCLCNCLELCLCNCLCLENCLCNCLENCNCLCNCLELCNCLCNCLCLENCLCLCNCLCLCLCLCNCLELCLCLCNCLCLCLCNCLCLCNCLCLCNCLCNELCLCNCLCNCLCLCNCLCNCLCNCLCNENCLCNCNCLCNCNCLENCNCNEPCNEREPERETEVGVIZI^Ib@Mf@Op@Mj@Kb@I^GXETEPCPELAJCJCJCLCJCLCLCLCLCNELCNEPCNEPEPCPEPENCPENEPCNENENCNENCNENENCNELCNENENCLENENCLENENCLENELENENCLENELENELCNELENELENELENELENELELENELELENELENELELELGNELELENELGLELENELGLELELENGLELENGLELELGNELGLELENGLELELGNELGLELENGLELENGLELENGLENELGLENELGNENELENGLELENGLENELENGNELENELGNELENELGNELENELENGLENELELENELENGLELENELELELENELELELENELELELELELENELELENGLELELENELELENELELENELELENELELELENELELELELELELELENELELELEJCLELELELELCJELELEJCLELELCJELELCJELEJCLELEJCLEJCLEJEJCLCJEJCJEJCJEJCJCJCJEJCHCJCHEJCHCHCJCHCHCHAFCHCFCHAFCHCFAFCFAFCFADAFCFADAFCDAFADCFADADAFCDAFADAFCDADADAFCDAFADAFCDAFADAFCDAFCFAFCFAHCFAFCFAHCHAFCHCHAFCHCHAHCHCHCJAHCHCHCJAHCHCJCHAHCHCJCHAJCHCJCHCJCJCHAJCHCJCJCJCJEHCJCJCJCJEJCJCJEJCJEJCJCJEHEJCJEJEJCLEJEJEJEJCJEJEJEJEJELEJEJEJEJEJELGJEJEJEJEJEJEJEJELEJEJEJEJEJEJELEJEJEJEJELEJEJELEJELEJELEJELEJCLEJELELEJELELEJELELCJELELELELELELELELELELELENELELELELELELENCLELELENELELELENELCLENELELENELCLENELELCNELENELCNENELCNELCNELENCLENENCNELCNENELCNENELCNENENENCLENENENELENENENENELENELENELELENELENELGLELELELGLELELGLELELGLELELGLEJELGLELGLELELGLELELGLELELGLELGLELELGLELELELGNELGLENELGLENELGLENELGNELENGLELENELGLENELGLENELELELGNELELELELGNELELELGLELELELELENGLELELGLELENELGLELELGLENELELEJGLELELEJELEJELEJEJEJEJELEHCJEJEJEJCHEJEHCJEHCHCHEHCHCFEHCHCFCFCHCFCFCFAFCDCFCFADCFCDAFCDCFADCFADCDADCDAFADCDADCDADADCDABADCDADADADCDADADCDADADCDADADADCDADADCDADADADCDADADADCDADADADADCBADADADADCDADABADADADCBADADABADADABADADCBADADABADABADADABCDADABADADCDADADADCDADADCDADAFCDADCFADCFADCFAFCFCFAFCFCFCFAFCHCFCHCHCFCHCHCHCHCHCHCHCHCHCHCHCHEJCHCHCJCHEHCJCHEJCJCHCJEHCJCJEJCHEJCJELCJEJCJCJEJCJELEJCJELCJELEJCLEJCLEJEJCLELCJEJELCJELEJCLEJEJELCJELEJEJELCJELEJELEJELEJELEJGLELEJELELGLEJELELGLEJELGLELELGLELEJELGLELENELGLELELGLELELENELGLELELELENGLELELENELELELELGNELELENELELELELGLELELELELELELGJELELEJELELEJELEJELEJEJEJELEJEJEJCJEJEHCJEJCJEHCJEJCHEJCJCHEJCJEJCJEJCJELCJELCJELELCLELCLELENCLELENCLENELCLENENELCNENELENCNELENENENELCNENELENENELENCLENENELENELENELENELENELENELENELELCNELELENELELENELELCLELELELCLELELENEJCLELELELCLELELELELCLELELELELELELELEJELCLELEJELEJELEJGLEJELEJELGJEJELEJEJGLEJEJGLEJEJEJGJEJEJEJELEJEJEJEJEJEJEJEJEJEJELCJEJEJCJEJEJCJEJEJCLEJEJCJEJCJEJCJEJCLEJCJEJCJCLEJCJEJCLEJCLEJCJCLEJCJELCJELCJELCJEJCLCJELCJELCJELCJELCJELCJELCJCLEJCLELCJELCJEJCLEJELCJELCJELCJELEJCJELCJELEJELCJELCJEJELCJELELCJELEJCLELELEJCLELELCJELELCLEJELCJELCJELELCJELCJELCJCJELCJEJCLEJCJEJCLEJCJELCJEJCLEJCLEJEJCLEJCJELEJCLEJELCJEJELCJEJELEJCLELEJELEJELCJELEJELELEJELEJELEJCLEJELEJELEJELEJEJEJCLEJEJEJELEJEJEJELCJEJEJELEJEJELEJEJEJGLEJEJEJELEJEJGJEJEJELEJGJEJEJGJEJGJEJGJEJGJEJGJGJEJGJGJGJEHGJGJGJEHGJGJGHGJGHEJGJGHGJGHGJGHGJEHGHGJGHGHGJGHGJEHGHGJGHGHGJGHGHGHGJGHGJGHEHGJGHGHGJGHIJGHGJGHGJGHGJGHIJGHGJGJIHGJGHGJGHIJGHGHGJGHGJGHIHGJGHGHGJGHGHGHGJGHGHGHGHGHGJGHGHGHGHGHGHGHGHGHGHGHGJGHGHGHEHGHGHGHGHGHGHGJGHGHGHGHIJGHGHGHGJGHGHGJGHGHGHGHGHGHGHGHGHGHEFGHGHEHGFGHEHGFGHEHGFEHGFGHEFGHGHEFGHGFGHEHGFGHEFGHGFGHEHGFGHGHEFGHGFGHEHGHGFGHEHGHGFGHGHEHGHGHGHEHGFGHEHGHGHEFGHGHEHGFEHGHGFEHGHEFGHEHGFEHGFEHGHEFGHGFEHGHEFGHGHEFGHGHEHGFGHEHGHGFEHGHGHEFGHGHGHEHGHGHGHEHGHGHGHGHGHEHGJGHGHGHGHGHEHGHGHGHGHGHGHGHEHGHGHGHGHGHGHGHEHGHGHGFEHGHGHGHEHGHGHEHGHGHEFGHGHEHGHEHGFEHGHEHGHGHEFGHEHGHGHEHGHGFEHGHEHGHGHGHEFGHEHGHGFEHGFGHEHGFEHGFEHGHEFGFEHGFEHGFEHGFEFEHGFEFGHEFEHGFEFEHGFEFEHGFEHEFGHEFEHGHEFEHGHEHGHEHGHEHGHEHGHEJGHEHGJEHGJGHEJGJEHEJGHEJGHEJEJGHEJEHGJEHEJEHEJGJEHEJEJEHGJEJEHEJGJEJEJGJEJGJEJEJGJEJGLEJGJGLEJGJEJEJGJEJGJEJGJEJEJGJEHGJEJEJEHGJEJEJGHEJEJGHEJEJEHGJEJEJGHEJEJGJEHEJGJEJEJGJEHEJEJGJEHEJEJGJEJEJEHEJGJEJEJEHEJEJGJEJEJEHEJEJEJEHEJEJEJEJEHEJEJEJEJEHEJEJEJEJEHCJEJEJEHEJCJEHEJEJCJEHEJCHEJEJCHEJEJCJEHEJCHEJCJEJEHCJEJCJEJCJEJEJCHEJCJELCJEJCJCHEJCJCJEJCHCJCJEJCJCHCJCHCJCHCJCHCJCHCHCHCHCHCFCHCFCHCHCFCFCFAFCFCFCFCFCFADCFCFCDCFCFCDCFAFCDCFCFCDCFCFCDCFCFEFCDCFCFCFCDCFCFEFCFCFCFCFEFCFCFCFEFCFCHCFEFCFCHEFCFCHCFEFCFCHCFEFCHCFCHEFCFCHCFEHCFCHEFCHCFEHCFCHEFCHCHEHCFEHCHEHCHEFCHEHEHCHEHCHEHCHEHEHCHEFCHEHCHEHCHEFCHCHEFCHEHCHCFEHCFCHEHCFCHEHCFCHEHCFCHCHEHCFCHCFEHCHCFEHCHCHEFCHCHEHCHEHCHEHEHCHEHEHCJEHEHEJEHCHEHEHEHEHCJEHEHEHEHEHCFEHEHEHCHEHEHEHEFCHEHEHEFCHEHEFEHEHCHEFEHEHEHCFEHEHEFEHEHCHEFEHEHEHEFEHEHCHEHEHEHEHEHEHEFEHEJEHEHEHEFEHCHEHEHEFEHEHEFEHCFEHEHEFEFEHEFCFEHEFEFCFEHEFEFEHEFEFEHCFEFEHEFEFEHEFEHEFEFEHEFEHEFEHEFEHEHEFGHEHEFEHGHEHEHGHEHGHEHGHEHEHGHEHEHEHGHEHEHGHEHEHEHEHGHEHEHEHEHEHEHGJEHEHEHEHEHEHEHEHEHEHEHEHEFEHEHEHEHEHEHEHEHEHEHEHEHEHEHCHEHEHGHCHEHEHEHEHEHEHEHEHEHEHEJEHEHEHEJEHEHEHEHEJEHEHEJEHEJEHEHEJEHEJEHEHEJEJEHEJEHEJEHEJEJEHEJEHEJEHEJEHEHEJEHEHEHEHEJEHEHEHEHEFEHEHGHEHEHEFEHEHEFEHEHEFEHEHEFEHEFEFEHEFEHEFEHEFEHEFEFEHEFEFCHEFEFEHEFEFEFCHEFEFEHEFCFEFEHEFEFEHCFEFEFEHEFEHEFEFEHEFEHEFEFEHEFEHEFGHEFEFEFEHEFEFEFGFEFEFEFEFEFEFEFEFGFEFEFEFEDEFEFEDEFEFGFEFEDEFEFEDEFEFGDEFEFEFEDEFEFGFEFEDEFEFGFEFEFEFGFEFEFEFEHGFEFEFGHEFEFEHEFEFEHGFEHEFEHEFEHEFEHEHEFEHEHEFEHEHEFEHEHCFEHEHEHEFEHCHEFEHCHEFEHCFEHEHEFCHEHCFEHEHEFCHEHEHCHEFEHEHEHCHEHEHEHEHCHEHEHEHEHCFEHEHEHEHCHEFEHEHEHCFEHEHEFEHEHEFCHEFEHEFEHEFEFEHEFEFEFEHEFEFEDEFGFEFEDEFEDGDEFEDEBEDGDEDEBEDGBEBEBGBEBGBEBG@EBG@EBG@E@G@E@G@E@G@E@G?G@E@G@E?G@E@G?G@G@E@G?G@G@GBG@I@GBE@G@E@E@E@E@C@C@E@C@C@C?A@C@A@C?A@C@A?A@A?A@A?A@A??@A?A???A@??A??@",
      precision: 6
    }
  end
end
