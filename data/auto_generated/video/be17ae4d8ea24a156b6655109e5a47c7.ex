defmodule Data.AutoGenerated.Video.Rendered_be17ae4d8ea24a156b6655109e5a47c7 do
  @moduledoc "#{"2022-01-20-fixme: Fahrtrichtung Süden/Elbbrücken"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-01-20-fixme: Fahrtrichtung Süden/Elbbrücken"
  end

  @impl Video.Rendered
  def hash() do
    "be17ae4d8ea24a156b6655109e5a47c7"
  end

  @impl Video.Rendered
  def fade() do
    0.26693360026693363
  end

  @impl Video.Rendered
  def length_ms() do
    155_532
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-01-19-neue-veloroute/GX013183", "00:00:01.168", :end},
      {"2022-01-19-neue-veloroute/GX013184", :start, :end},
      {"2022-01-19-neue-veloroute/GX013185", :start, :end},
      {"2022-01-19-neue-veloroute/GX013186", :start, :end},
      {"2022-01-19-neue-veloroute/GX013187", :start, :end},
      {"2022-01-19-neue-veloroute/GX013188", :start, "00:00:31.064"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.569723447447444,
      maxLon: 10.032993,
      minLat: 53.53409304191617,
      minLon: 10.024083
    }
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.569723447447444, lon: 10.026785405405406, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.569706, lon: 10.026754, time_offset_ms: 166},
      %Video.TimedPoint{lat: 53.56964, lon: 10.02673, time_offset_ms: 500},
      %Video.TimedPoint{lat: 53.569568, lon: 10.026709, time_offset_ms: 834},
      %Video.TimedPoint{lat: 53.569489, lon: 10.026684, time_offset_ms: 1167},
      %Video.TimedPoint{lat: 53.569407, lon: 10.026656, time_offset_ms: 1501},
      %Video.TimedPoint{lat: 53.569323, lon: 10.026632, time_offset_ms: 1834},
      %Video.TimedPoint{lat: 53.569239, lon: 10.026607, time_offset_ms: 2168},
      %Video.TimedPoint{lat: 53.569161, lon: 10.026569, time_offset_ms: 2502},
      %Video.TimedPoint{lat: 53.569082, lon: 10.026539, time_offset_ms: 2835},
      %Video.TimedPoint{lat: 53.568998, lon: 10.026511, time_offset_ms: 3169},
      %Video.TimedPoint{lat: 53.568912, lon: 10.026481, time_offset_ms: 3502},
      %Video.TimedPoint{lat: 53.568833, lon: 10.026461, time_offset_ms: 3836},
      %Video.TimedPoint{lat: 53.568761, lon: 10.026433, time_offset_ms: 4170},
      %Video.TimedPoint{lat: 53.568687, lon: 10.02638, time_offset_ms: 4503},
      %Video.TimedPoint{lat: 53.568615, lon: 10.02633, time_offset_ms: 4837},
      %Video.TimedPoint{lat: 53.568543, lon: 10.026275, time_offset_ms: 5170},
      %Video.TimedPoint{lat: 53.568464, lon: 10.026216, time_offset_ms: 5504},
      %Video.TimedPoint{lat: 53.568384, lon: 10.026158, time_offset_ms: 5838},
      %Video.TimedPoint{lat: 53.568297, lon: 10.026099, time_offset_ms: 6171},
      %Video.TimedPoint{lat: 53.568211, lon: 10.026042, time_offset_ms: 6505},
      %Video.TimedPoint{lat: 53.568116, lon: 10.025983, time_offset_ms: 6838},
      %Video.TimedPoint{lat: 53.568029, lon: 10.02593, time_offset_ms: 7172},
      %Video.TimedPoint{lat: 53.567944, lon: 10.025874, time_offset_ms: 7506},
      %Video.TimedPoint{lat: 53.56786, lon: 10.025823, time_offset_ms: 7839},
      %Video.TimedPoint{lat: 53.567774, lon: 10.025769, time_offset_ms: 8173},
      %Video.TimedPoint{lat: 53.567692, lon: 10.025715, time_offset_ms: 8506},
      %Video.TimedPoint{lat: 53.567609, lon: 10.025666, time_offset_ms: 8840},
      %Video.TimedPoint{lat: 53.567535, lon: 10.025618, time_offset_ms: 9174},
      %Video.TimedPoint{lat: 53.56746, lon: 10.02557, time_offset_ms: 9507},
      %Video.TimedPoint{lat: 53.567387, lon: 10.025526, time_offset_ms: 9841},
      %Video.TimedPoint{lat: 53.567312, lon: 10.025483, time_offset_ms: 10174},
      %Video.TimedPoint{lat: 53.567246, lon: 10.025442, time_offset_ms: 10508},
      %Video.TimedPoint{lat: 53.567178, lon: 10.025392, time_offset_ms: 10842},
      %Video.TimedPoint{lat: 53.567104, lon: 10.025345, time_offset_ms: 11175},
      %Video.TimedPoint{lat: 53.567032, lon: 10.025286, time_offset_ms: 11509},
      %Video.TimedPoint{lat: 53.566956, lon: 10.025218, time_offset_ms: 11842},
      %Video.TimedPoint{lat: 53.566876, lon: 10.025149, time_offset_ms: 12176},
      %Video.TimedPoint{lat: 53.566792, lon: 10.025092, time_offset_ms: 12510},
      %Video.TimedPoint{lat: 53.566705, lon: 10.025041, time_offset_ms: 12843},
      %Video.TimedPoint{lat: 53.566615, lon: 10.024983, time_offset_ms: 13177},
      %Video.TimedPoint{lat: 53.566525, lon: 10.024922, time_offset_ms: 13510},
      %Video.TimedPoint{lat: 53.566435, lon: 10.024871, time_offset_ms: 13844},
      %Video.TimedPoint{lat: 53.566343, lon: 10.024816, time_offset_ms: 14178},
      %Video.TimedPoint{lat: 53.56625, lon: 10.024759, time_offset_ms: 14511},
      %Video.TimedPoint{lat: 53.566161, lon: 10.024709, time_offset_ms: 14845},
      %Video.TimedPoint{lat: 53.566072, lon: 10.024668, time_offset_ms: 15178},
      %Video.TimedPoint{lat: 53.565982, lon: 10.024621, time_offset_ms: 15512},
      %Video.TimedPoint{lat: 53.565894, lon: 10.024575, time_offset_ms: 15846},
      %Video.TimedPoint{lat: 53.565806, lon: 10.024532, time_offset_ms: 16179},
      %Video.TimedPoint{lat: 53.565714, lon: 10.024491, time_offset_ms: 16513},
      %Video.TimedPoint{lat: 53.565618, lon: 10.024454, time_offset_ms: 16846},
      %Video.TimedPoint{lat: 53.565518, lon: 10.024408, time_offset_ms: 17180},
      %Video.TimedPoint{lat: 53.565413, lon: 10.024366, time_offset_ms: 17514},
      %Video.TimedPoint{lat: 53.565307, lon: 10.024328, time_offset_ms: 17847},
      %Video.TimedPoint{lat: 53.565202, lon: 10.024292, time_offset_ms: 18181},
      %Video.TimedPoint{lat: 53.56509, lon: 10.024252, time_offset_ms: 18514},
      %Video.TimedPoint{lat: 53.564979, lon: 10.024211, time_offset_ms: 18848},
      %Video.TimedPoint{lat: 53.564867, lon: 10.024167, time_offset_ms: 19182},
      %Video.TimedPoint{lat: 53.564759, lon: 10.024129, time_offset_ms: 19515},
      %Video.TimedPoint{lat: 53.564648, lon: 10.024096, time_offset_ms: 19849},
      %Video.TimedPoint{lat: 53.564543, lon: 10.024083, time_offset_ms: 20182},
      %Video.TimedPoint{lat: 53.564436, lon: 10.02409, time_offset_ms: 20516},
      %Video.TimedPoint{lat: 53.564338, lon: 10.024103, time_offset_ms: 20850},
      %Video.TimedPoint{lat: 53.564246, lon: 10.02413, time_offset_ms: 21183},
      %Video.TimedPoint{lat: 53.564157, lon: 10.024166, time_offset_ms: 21517},
      %Video.TimedPoint{lat: 53.564077, lon: 10.024207, time_offset_ms: 21850},
      %Video.TimedPoint{lat: 53.563997, lon: 10.024254, time_offset_ms: 22184},
      %Video.TimedPoint{lat: 53.563919, lon: 10.0243, time_offset_ms: 22518},
      %Video.TimedPoint{lat: 53.563844, lon: 10.024347, time_offset_ms: 22851},
      %Video.TimedPoint{lat: 53.563769, lon: 10.024389, time_offset_ms: 23185},
      %Video.TimedPoint{lat: 53.563697, lon: 10.024422, time_offset_ms: 23518},
      %Video.TimedPoint{lat: 53.563623, lon: 10.024455, time_offset_ms: 23852},
      %Video.TimedPoint{lat: 53.56355, lon: 10.024491, time_offset_ms: 24185},
      %Video.TimedPoint{lat: 53.563478, lon: 10.024524, time_offset_ms: 24519},
      %Video.TimedPoint{lat: 53.563407, lon: 10.024558, time_offset_ms: 24853},
      %Video.TimedPoint{lat: 53.563337, lon: 10.024588, time_offset_ms: 25186},
      %Video.TimedPoint{lat: 53.563267, lon: 10.024618, time_offset_ms: 25520},
      %Video.TimedPoint{lat: 53.5632, lon: 10.024642, time_offset_ms: 25853},
      %Video.TimedPoint{lat: 53.563134, lon: 10.024663, time_offset_ms: 26187},
      %Video.TimedPoint{lat: 53.563068, lon: 10.02468, time_offset_ms: 26521},
      %Video.TimedPoint{lat: 53.563003, lon: 10.024698, time_offset_ms: 26854},
      %Video.TimedPoint{lat: 53.562929, lon: 10.024724, time_offset_ms: 27188},
      %Video.TimedPoint{lat: 53.562859, lon: 10.024746, time_offset_ms: 27521},
      %Video.TimedPoint{lat: 53.562795, lon: 10.024758, time_offset_ms: 27855},
      %Video.TimedPoint{lat: 53.562731, lon: 10.024771, time_offset_ms: 28189},
      %Video.TimedPoint{lat: 53.562663, lon: 10.024793, time_offset_ms: 28522},
      %Video.TimedPoint{lat: 53.562596, lon: 10.024809, time_offset_ms: 28856},
      %Video.TimedPoint{lat: 53.562531, lon: 10.024822, time_offset_ms: 29189},
      %Video.TimedPoint{lat: 53.562466, lon: 10.024832, time_offset_ms: 29523},
      %Video.TimedPoint{lat: 53.5624, lon: 10.024846, time_offset_ms: 29857},
      %Video.TimedPoint{lat: 53.562333, lon: 10.024858, time_offset_ms: 30190},
      %Video.TimedPoint{lat: 53.562267, lon: 10.024874, time_offset_ms: 30524},
      %Video.TimedPoint{lat: 53.562198, lon: 10.024887, time_offset_ms: 30857},
      %Video.TimedPoint{lat: 53.56213, lon: 10.024896, time_offset_ms: 31191},
      %Video.TimedPoint{lat: 53.562062, lon: 10.024892, time_offset_ms: 31525},
      %Video.TimedPoint{lat: 53.561991, lon: 10.024903, time_offset_ms: 31858},
      %Video.TimedPoint{lat: 53.561924, lon: 10.024927, time_offset_ms: 32192},
      %Video.TimedPoint{lat: 53.561855, lon: 10.024945, time_offset_ms: 32525},
      %Video.TimedPoint{lat: 53.561786, lon: 10.024968, time_offset_ms: 32859},
      %Video.TimedPoint{lat: 53.561718, lon: 10.024985, time_offset_ms: 33193},
      %Video.TimedPoint{lat: 53.56165, lon: 10.024999, time_offset_ms: 33526},
      %Video.TimedPoint{lat: 53.561584, lon: 10.025012, time_offset_ms: 33860},
      %Video.TimedPoint{lat: 53.561518, lon: 10.025029, time_offset_ms: 34193},
      %Video.TimedPoint{lat: 53.561451, lon: 10.025045, time_offset_ms: 34527},
      %Video.TimedPoint{lat: 53.561382, lon: 10.02506, time_offset_ms: 34861},
      %Video.TimedPoint{lat: 53.561312, lon: 10.025078, time_offset_ms: 35194},
      %Video.TimedPoint{lat: 53.561239, lon: 10.025098, time_offset_ms: 35528},
      %Video.TimedPoint{lat: 53.561166, lon: 10.025114, time_offset_ms: 35861},
      %Video.TimedPoint{lat: 53.561095, lon: 10.025126, time_offset_ms: 36195},
      %Video.TimedPoint{lat: 53.561024, lon: 10.02514, time_offset_ms: 36529},
      %Video.TimedPoint{lat: 53.560951, lon: 10.025159, time_offset_ms: 36862},
      %Video.TimedPoint{lat: 53.560882, lon: 10.025177, time_offset_ms: 37196},
      %Video.TimedPoint{lat: 53.560816, lon: 10.025195, time_offset_ms: 37529},
      %Video.TimedPoint{lat: 53.560747, lon: 10.025216, time_offset_ms: 37863},
      %Video.TimedPoint{lat: 53.560679, lon: 10.025231, time_offset_ms: 38197},
      %Video.TimedPoint{lat: 53.56061, lon: 10.025249, time_offset_ms: 38530},
      %Video.TimedPoint{lat: 53.560539, lon: 10.02527, time_offset_ms: 38864},
      %Video.TimedPoint{lat: 53.560467, lon: 10.025291, time_offset_ms: 39197},
      %Video.TimedPoint{lat: 53.5604, lon: 10.0253, time_offset_ms: 39531},
      %Video.TimedPoint{lat: 53.560327, lon: 10.025315, time_offset_ms: 39865},
      %Video.TimedPoint{lat: 53.560251, lon: 10.025334, time_offset_ms: 40198},
      %Video.TimedPoint{lat: 53.560174, lon: 10.025356, time_offset_ms: 40532},
      %Video.TimedPoint{lat: 53.560095, lon: 10.025377, time_offset_ms: 40865},
      %Video.TimedPoint{lat: 53.560018, lon: 10.0254, time_offset_ms: 41199},
      %Video.TimedPoint{lat: 53.559941, lon: 10.025419, time_offset_ms: 41533},
      %Video.TimedPoint{lat: 53.559864, lon: 10.025439, time_offset_ms: 41866},
      %Video.TimedPoint{lat: 53.55979, lon: 10.025458, time_offset_ms: 42200},
      %Video.TimedPoint{lat: 53.559717, lon: 10.025483, time_offset_ms: 42533},
      %Video.TimedPoint{lat: 53.559644, lon: 10.025521, time_offset_ms: 42867},
      %Video.TimedPoint{lat: 53.559568, lon: 10.025554, time_offset_ms: 43201},
      %Video.TimedPoint{lat: 53.559489, lon: 10.025581, time_offset_ms: 43534},
      %Video.TimedPoint{lat: 53.559408, lon: 10.025605, time_offset_ms: 43868},
      %Video.TimedPoint{lat: 53.559337, lon: 10.025624, time_offset_ms: 44201},
      %Video.TimedPoint{lat: 53.559275, lon: 10.025643, time_offset_ms: 44535},
      %Video.TimedPoint{lat: 53.559219, lon: 10.025655, time_offset_ms: 44869},
      %Video.TimedPoint{lat: 53.559174, lon: 10.025663, time_offset_ms: 45202},
      %Video.TimedPoint{lat: 53.559138, lon: 10.025671, time_offset_ms: 45536},
      %Video.TimedPoint{lat: 53.559108, lon: 10.025679, time_offset_ms: 45869},
      %Video.TimedPoint{lat: 53.559086, lon: 10.025687, time_offset_ms: 46203},
      %Video.TimedPoint{lat: 53.559049, lon: 10.025698, time_offset_ms: 46537},
      %Video.TimedPoint{lat: 53.558982, lon: 10.025709, time_offset_ms: 46870},
      %Video.TimedPoint{lat: 53.558908, lon: 10.025722, time_offset_ms: 47204},
      %Video.TimedPoint{lat: 53.558832, lon: 10.025729, time_offset_ms: 47537},
      %Video.TimedPoint{lat: 53.558751, lon: 10.02574, time_offset_ms: 47871},
      %Video.TimedPoint{lat: 53.55867, lon: 10.025759, time_offset_ms: 48205},
      %Video.TimedPoint{lat: 53.55859, lon: 10.025781, time_offset_ms: 48538},
      %Video.TimedPoint{lat: 53.558508, lon: 10.025806, time_offset_ms: 48872},
      %Video.TimedPoint{lat: 53.558429, lon: 10.025833, time_offset_ms: 49205},
      %Video.TimedPoint{lat: 53.558349, lon: 10.025857, time_offset_ms: 49539},
      %Video.TimedPoint{lat: 53.558269, lon: 10.025878, time_offset_ms: 49873},
      %Video.TimedPoint{lat: 53.55819, lon: 10.025899, time_offset_ms: 50206},
      %Video.TimedPoint{lat: 53.558108, lon: 10.025921, time_offset_ms: 50540},
      %Video.TimedPoint{lat: 53.558021, lon: 10.025945, time_offset_ms: 50873},
      %Video.TimedPoint{lat: 53.557935, lon: 10.025969, time_offset_ms: 51207},
      %Video.TimedPoint{lat: 53.557851, lon: 10.025992, time_offset_ms: 51541},
      %Video.TimedPoint{lat: 53.557764, lon: 10.026012, time_offset_ms: 51874},
      %Video.TimedPoint{lat: 53.557681, lon: 10.026033, time_offset_ms: 52208},
      %Video.TimedPoint{lat: 53.5576, lon: 10.02605, time_offset_ms: 52541},
      %Video.TimedPoint{lat: 53.557521, lon: 10.026063, time_offset_ms: 52875},
      %Video.TimedPoint{lat: 53.55745, lon: 10.026061, time_offset_ms: 53209},
      %Video.TimedPoint{lat: 53.557391, lon: 10.026048, time_offset_ms: 53542},
      %Video.TimedPoint{lat: 53.557341, lon: 10.026021, time_offset_ms: 53876},
      %Video.TimedPoint{lat: 53.557295, lon: 10.025996, time_offset_ms: 54209},
      %Video.TimedPoint{lat: 53.557253, lon: 10.025979, time_offset_ms: 54543},
      %Video.TimedPoint{lat: 53.557216, lon: 10.025968, time_offset_ms: 54877},
      %Video.TimedPoint{lat: 53.557188, lon: 10.025961, time_offset_ms: 55210},
      %Video.TimedPoint{lat: 53.557166, lon: 10.025951, time_offset_ms: 55544},
      %Video.TimedPoint{lat: 53.557148, lon: 10.025945, time_offset_ms: 55877},
      %Video.TimedPoint{lat: 53.557129, lon: 10.025936, time_offset_ms: 56211},
      %Video.TimedPoint{lat: 53.557119973053894, lon: 10.025929982035928, time_offset_ms: 56412},
      %Video.TimedPoint{lat: 53.557083, lon: 10.025919, time_offset_ms: 56412},
      %Video.TimedPoint{lat: 53.557073, lon: 10.025916, time_offset_ms: 56746},
      %Video.TimedPoint{lat: 53.557031, lon: 10.0259, time_offset_ms: 57079},
      %Video.TimedPoint{lat: 53.556968, lon: 10.02587, time_offset_ms: 57413},
      %Video.TimedPoint{lat: 53.556895, lon: 10.025834, time_offset_ms: 57746},
      %Video.TimedPoint{lat: 53.556819, lon: 10.025832, time_offset_ms: 58080},
      %Video.TimedPoint{lat: 53.556758, lon: 10.0259, time_offset_ms: 58414},
      %Video.TimedPoint{lat: 53.556693, lon: 10.026003, time_offset_ms: 58747},
      %Video.TimedPoint{lat: 53.55662, lon: 10.026103, time_offset_ms: 59081},
      %Video.TimedPoint{lat: 53.556549, lon: 10.02621, time_offset_ms: 59414},
      %Video.TimedPoint{lat: 53.556478, lon: 10.026321, time_offset_ms: 59748},
      %Video.TimedPoint{lat: 53.556408, lon: 10.026428, time_offset_ms: 60082},
      %Video.TimedPoint{lat: 53.55634, lon: 10.026531, time_offset_ms: 60415},
      %Video.TimedPoint{lat: 53.556266, lon: 10.02663, time_offset_ms: 60749},
      %Video.TimedPoint{lat: 53.556183, lon: 10.026724, time_offset_ms: 61082},
      %Video.TimedPoint{lat: 53.556088, lon: 10.026772, time_offset_ms: 61416},
      %Video.TimedPoint{lat: 53.555987, lon: 10.02675, time_offset_ms: 61750},
      %Video.TimedPoint{lat: 53.555884, lon: 10.026694, time_offset_ms: 62083},
      %Video.TimedPoint{lat: 53.55578, lon: 10.026635, time_offset_ms: 62417},
      %Video.TimedPoint{lat: 53.555672, lon: 10.026568, time_offset_ms: 62750},
      %Video.TimedPoint{lat: 53.555555, lon: 10.026495, time_offset_ms: 63084},
      %Video.TimedPoint{lat: 53.555439, lon: 10.026425, time_offset_ms: 63418},
      %Video.TimedPoint{lat: 53.555319, lon: 10.026357, time_offset_ms: 63751},
      %Video.TimedPoint{lat: 53.555194, lon: 10.026289, time_offset_ms: 64085},
      %Video.TimedPoint{lat: 53.55507, lon: 10.026225, time_offset_ms: 64418},
      %Video.TimedPoint{lat: 53.554945, lon: 10.026162, time_offset_ms: 64752},
      %Video.TimedPoint{lat: 53.554817, lon: 10.026101, time_offset_ms: 65086},
      %Video.TimedPoint{lat: 53.554693, lon: 10.026044, time_offset_ms: 65419},
      %Video.TimedPoint{lat: 53.554568, lon: 10.02599, time_offset_ms: 65753},
      %Video.TimedPoint{lat: 53.554439, lon: 10.025932, time_offset_ms: 66086},
      %Video.TimedPoint{lat: 53.554314, lon: 10.025874, time_offset_ms: 66420},
      %Video.TimedPoint{lat: 53.55419, lon: 10.02583, time_offset_ms: 66753},
      %Video.TimedPoint{lat: 53.554065, lon: 10.025782, time_offset_ms: 67087},
      %Video.TimedPoint{lat: 53.553947, lon: 10.025738, time_offset_ms: 67421},
      %Video.TimedPoint{lat: 53.553839, lon: 10.025694, time_offset_ms: 67754},
      %Video.TimedPoint{lat: 53.553751, lon: 10.025657, time_offset_ms: 68088},
      %Video.TimedPoint{lat: 53.55365, lon: 10.025654, time_offset_ms: 68421},
      %Video.TimedPoint{lat: 53.55356, lon: 10.025641, time_offset_ms: 68755},
      %Video.TimedPoint{lat: 53.553471, lon: 10.025591, time_offset_ms: 69089},
      %Video.TimedPoint{lat: 53.553374, lon: 10.025543, time_offset_ms: 69422},
      %Video.TimedPoint{lat: 53.553278, lon: 10.025485, time_offset_ms: 69756},
      %Video.TimedPoint{lat: 53.553181, lon: 10.025445, time_offset_ms: 70089},
      %Video.TimedPoint{lat: 53.553088, lon: 10.025411, time_offset_ms: 70423},
      %Video.TimedPoint{lat: 53.552989, lon: 10.025386, time_offset_ms: 70757},
      %Video.TimedPoint{lat: 53.552895, lon: 10.025372, time_offset_ms: 71090},
      %Video.TimedPoint{lat: 53.552802, lon: 10.025366, time_offset_ms: 71424},
      %Video.TimedPoint{lat: 53.552723, lon: 10.025379, time_offset_ms: 71757},
      %Video.TimedPoint{lat: 53.552666, lon: 10.025374, time_offset_ms: 72091},
      %Video.TimedPoint{lat: 53.552605, lon: 10.025361, time_offset_ms: 72425},
      %Video.TimedPoint{lat: 53.552526, lon: 10.025363, time_offset_ms: 72758},
      %Video.TimedPoint{lat: 53.55245, lon: 10.025354, time_offset_ms: 73092},
      %Video.TimedPoint{lat: 53.552348, lon: 10.025351, time_offset_ms: 73425},
      %Video.TimedPoint{lat: 53.552242, lon: 10.025327, time_offset_ms: 73759},
      %Video.TimedPoint{lat: 53.552139, lon: 10.025286, time_offset_ms: 74093},
      %Video.TimedPoint{lat: 53.552053, lon: 10.025261, time_offset_ms: 74426},
      %Video.TimedPoint{lat: 53.551998, lon: 10.025258, time_offset_ms: 74760},
      %Video.TimedPoint{lat: 53.55196, lon: 10.025309, time_offset_ms: 75093},
      %Video.TimedPoint{lat: 53.551926, lon: 10.025374, time_offset_ms: 75427},
      %Video.TimedPoint{lat: 53.551873, lon: 10.025426, time_offset_ms: 75761},
      %Video.TimedPoint{lat: 53.551806, lon: 10.025478, time_offset_ms: 76094},
      %Video.TimedPoint{lat: 53.551736, lon: 10.025532, time_offset_ms: 76428},
      %Video.TimedPoint{lat: 53.551664, lon: 10.025587, time_offset_ms: 76761},
      %Video.TimedPoint{lat: 53.551581, lon: 10.025646, time_offset_ms: 77095},
      %Video.TimedPoint{lat: 53.551505, lon: 10.025693, time_offset_ms: 77429},
      %Video.TimedPoint{lat: 53.551463, lon: 10.025712, time_offset_ms: 77762},
      %Video.TimedPoint{lat: 53.551455176646705, lon: 10.025712601796407, time_offset_ms: 77963},
      %Video.TimedPoint{lat: 53.551388, lon: 10.025776, time_offset_ms: 77963},
      %Video.TimedPoint{lat: 53.551385, lon: 10.025778, time_offset_ms: 78297},
      %Video.TimedPoint{lat: 53.551349, lon: 10.025807, time_offset_ms: 78630},
      %Video.TimedPoint{lat: 53.55129, lon: 10.025852, time_offset_ms: 78964},
      %Video.TimedPoint{lat: 53.551219, lon: 10.02591, time_offset_ms: 79297},
      %Video.TimedPoint{lat: 53.551139, lon: 10.025966, time_offset_ms: 79631},
      %Video.TimedPoint{lat: 53.551055, lon: 10.026015, time_offset_ms: 79965},
      %Video.TimedPoint{lat: 53.550968, lon: 10.026076, time_offset_ms: 80298},
      %Video.TimedPoint{lat: 53.550879, lon: 10.026127, time_offset_ms: 80632},
      %Video.TimedPoint{lat: 53.550788, lon: 10.026183, time_offset_ms: 80965},
      %Video.TimedPoint{lat: 53.550696, lon: 10.026238, time_offset_ms: 81299},
      %Video.TimedPoint{lat: 53.550602, lon: 10.026285, time_offset_ms: 81633},
      %Video.TimedPoint{lat: 53.55051, lon: 10.026342, time_offset_ms: 81966},
      %Video.TimedPoint{lat: 53.550418, lon: 10.026401, time_offset_ms: 82300},
      %Video.TimedPoint{lat: 53.550322, lon: 10.026457, time_offset_ms: 82633},
      %Video.TimedPoint{lat: 53.550227, lon: 10.026502, time_offset_ms: 82967},
      %Video.TimedPoint{lat: 53.550131, lon: 10.026549, time_offset_ms: 83301},
      %Video.TimedPoint{lat: 53.550035, lon: 10.026602, time_offset_ms: 83634},
      %Video.TimedPoint{lat: 53.549941, lon: 10.026657, time_offset_ms: 83968},
      %Video.TimedPoint{lat: 53.549848, lon: 10.026713, time_offset_ms: 84301},
      %Video.TimedPoint{lat: 53.549762, lon: 10.026774, time_offset_ms: 84635},
      %Video.TimedPoint{lat: 53.54968, lon: 10.026824, time_offset_ms: 84968},
      %Video.TimedPoint{lat: 53.549599, lon: 10.02689, time_offset_ms: 85302},
      %Video.TimedPoint{lat: 53.549525, lon: 10.026943, time_offset_ms: 85636},
      %Video.TimedPoint{lat: 53.549446, lon: 10.026994, time_offset_ms: 85969},
      %Video.TimedPoint{lat: 53.549371, lon: 10.02705, time_offset_ms: 86303},
      %Video.TimedPoint{lat: 53.549284, lon: 10.027139, time_offset_ms: 86636},
      %Video.TimedPoint{lat: 53.5492, lon: 10.027214, time_offset_ms: 86970},
      %Video.TimedPoint{lat: 53.549118, lon: 10.027278, time_offset_ms: 87304},
      %Video.TimedPoint{lat: 53.549037, lon: 10.027347, time_offset_ms: 87637},
      %Video.TimedPoint{lat: 53.548956, lon: 10.027413, time_offset_ms: 87971},
      %Video.TimedPoint{lat: 53.548874, lon: 10.027479, time_offset_ms: 88304},
      %Video.TimedPoint{lat: 53.548793, lon: 10.027551, time_offset_ms: 88638},
      %Video.TimedPoint{lat: 53.548711, lon: 10.027616, time_offset_ms: 88972},
      %Video.TimedPoint{lat: 53.54863, lon: 10.027676, time_offset_ms: 89305},
      %Video.TimedPoint{lat: 53.54856, lon: 10.027717, time_offset_ms: 89639},
      %Video.TimedPoint{lat: 53.548488, lon: 10.027756, time_offset_ms: 89972},
      %Video.TimedPoint{lat: 53.548404, lon: 10.02782, time_offset_ms: 90306},
      %Video.TimedPoint{lat: 53.548319, lon: 10.027887, time_offset_ms: 90640},
      %Video.TimedPoint{lat: 53.548239, lon: 10.027952, time_offset_ms: 90973},
      %Video.TimedPoint{lat: 53.548167, lon: 10.028018, time_offset_ms: 91307},
      %Video.TimedPoint{lat: 53.548094, lon: 10.028072, time_offset_ms: 91640},
      %Video.TimedPoint{lat: 53.548018, lon: 10.028126, time_offset_ms: 91974},
      %Video.TimedPoint{lat: 53.547962, lon: 10.028176, time_offset_ms: 92308},
      %Video.TimedPoint{lat: 53.547936, lon: 10.028199, time_offset_ms: 92641},
      %Video.TimedPoint{lat: 53.5479275748503, lon: 10.028208628742515, time_offset_ms: 92842},
      %Video.TimedPoint{lat: 53.547803, lon: 10.028395, time_offset_ms: 92842},
      %Video.TimedPoint{lat: 53.547798, lon: 10.028403, time_offset_ms: 93176},
      %Video.TimedPoint{lat: 53.547773, lon: 10.028428, time_offset_ms: 93509},
      %Video.TimedPoint{lat: 53.547715, lon: 10.028469, time_offset_ms: 93843},
      %Video.TimedPoint{lat: 53.547649, lon: 10.028526, time_offset_ms: 94176},
      %Video.TimedPoint{lat: 53.547578, lon: 10.028567, time_offset_ms: 94510},
      %Video.TimedPoint{lat: 53.547485, lon: 10.028629, time_offset_ms: 94844},
      %Video.TimedPoint{lat: 53.547407, lon: 10.028664, time_offset_ms: 95177},
      %Video.TimedPoint{lat: 53.547329, lon: 10.028692, time_offset_ms: 95511},
      %Video.TimedPoint{lat: 53.547241, lon: 10.02873, time_offset_ms: 95844},
      %Video.TimedPoint{lat: 53.547162, lon: 10.028774, time_offset_ms: 96178},
      %Video.TimedPoint{lat: 53.547098, lon: 10.028809, time_offset_ms: 96512},
      %Video.TimedPoint{lat: 53.547035, lon: 10.028867, time_offset_ms: 96845},
      %Video.TimedPoint{lat: 53.546971, lon: 10.028919, time_offset_ms: 97179},
      %Video.TimedPoint{lat: 53.546889, lon: 10.029005, time_offset_ms: 97512},
      %Video.TimedPoint{lat: 53.546811, lon: 10.02907, time_offset_ms: 97846},
      %Video.TimedPoint{lat: 53.546729, lon: 10.029136, time_offset_ms: 98180},
      %Video.TimedPoint{lat: 53.546643, lon: 10.029192, time_offset_ms: 98513},
      %Video.TimedPoint{lat: 53.546559, lon: 10.029249, time_offset_ms: 98847},
      %Video.TimedPoint{lat: 53.546469, lon: 10.029317, time_offset_ms: 99180},
      %Video.TimedPoint{lat: 53.54639, lon: 10.029393, time_offset_ms: 99514},
      %Video.TimedPoint{lat: 53.546302, lon: 10.029443, time_offset_ms: 99848},
      %Video.TimedPoint{lat: 53.546202, lon: 10.029498, time_offset_ms: 100_181},
      %Video.TimedPoint{lat: 53.54611, lon: 10.029574, time_offset_ms: 100_515},
      %Video.TimedPoint{lat: 53.546024, lon: 10.029635, time_offset_ms: 100_848},
      %Video.TimedPoint{lat: 53.545944, lon: 10.029676, time_offset_ms: 101_182},
      %Video.TimedPoint{lat: 53.545869, lon: 10.029719, time_offset_ms: 101_516},
      %Video.TimedPoint{lat: 53.545797, lon: 10.029777, time_offset_ms: 101_849},
      %Video.TimedPoint{lat: 53.545725, lon: 10.029833, time_offset_ms: 102_183},
      %Video.TimedPoint{lat: 53.545662, lon: 10.029885, time_offset_ms: 102_516},
      %Video.TimedPoint{lat: 53.545606, lon: 10.029939, time_offset_ms: 102_850},
      %Video.TimedPoint{lat: 53.545549, lon: 10.030004, time_offset_ms: 103_184},
      %Video.TimedPoint{lat: 53.545501, lon: 10.030061, time_offset_ms: 103_517},
      %Video.TimedPoint{lat: 53.545466, lon: 10.030101, time_offset_ms: 103_851},
      %Video.TimedPoint{lat: 53.545443, lon: 10.030133, time_offset_ms: 104_184},
      %Video.TimedPoint{lat: 53.545429, lon: 10.030155, time_offset_ms: 104_518},
      %Video.TimedPoint{lat: 53.545423594594595, lon: 10.03016460960961, time_offset_ms: 104_718},
      %Video.TimedPoint{lat: 53.545367, lon: 10.030211, time_offset_ms: 104_718},
      %Video.TimedPoint{lat: 53.545357, lon: 10.03022, time_offset_ms: 105_052},
      %Video.TimedPoint{lat: 53.545319, lon: 10.030252, time_offset_ms: 105_385},
      %Video.TimedPoint{lat: 53.545263, lon: 10.030296, time_offset_ms: 105_719},
      %Video.TimedPoint{lat: 53.545198, lon: 10.030347, time_offset_ms: 106_052},
      %Video.TimedPoint{lat: 53.54513, lon: 10.03041, time_offset_ms: 106_386},
      %Video.TimedPoint{lat: 53.54506, lon: 10.030464, time_offset_ms: 106_720},
      %Video.TimedPoint{lat: 53.544979, lon: 10.030519, time_offset_ms: 107_053},
      %Video.TimedPoint{lat: 53.544899, lon: 10.030552, time_offset_ms: 107_387},
      %Video.TimedPoint{lat: 53.544816, lon: 10.030604, time_offset_ms: 107_720},
      %Video.TimedPoint{lat: 53.544731, lon: 10.030674, time_offset_ms: 108_054},
      %Video.TimedPoint{lat: 53.544644, lon: 10.030738, time_offset_ms: 108_388},
      %Video.TimedPoint{lat: 53.544557, lon: 10.030801, time_offset_ms: 108_721},
      %Video.TimedPoint{lat: 53.544471, lon: 10.030875, time_offset_ms: 109_055},
      %Video.TimedPoint{lat: 53.544385, lon: 10.030954, time_offset_ms: 109_388},
      %Video.TimedPoint{lat: 53.544296, lon: 10.031037, time_offset_ms: 109_722},
      %Video.TimedPoint{lat: 53.544207, lon: 10.031115, time_offset_ms: 110_056},
      %Video.TimedPoint{lat: 53.544115, lon: 10.031186, time_offset_ms: 110_389},
      %Video.TimedPoint{lat: 53.544027, lon: 10.031249, time_offset_ms: 110_723},
      %Video.TimedPoint{lat: 53.543932, lon: 10.031317, time_offset_ms: 111_056},
      %Video.TimedPoint{lat: 53.543839, lon: 10.031378, time_offset_ms: 111_390},
      %Video.TimedPoint{lat: 53.543737, lon: 10.031452, time_offset_ms: 111_724},
      %Video.TimedPoint{lat: 53.543641, lon: 10.031526, time_offset_ms: 112_057},
      %Video.TimedPoint{lat: 53.543545, lon: 10.0316, time_offset_ms: 112_391},
      %Video.TimedPoint{lat: 53.54345, lon: 10.031674, time_offset_ms: 112_724},
      %Video.TimedPoint{lat: 53.543362, lon: 10.031741, time_offset_ms: 113_058},
      %Video.TimedPoint{lat: 53.543268, lon: 10.031823, time_offset_ms: 113_392},
      %Video.TimedPoint{lat: 53.543168, lon: 10.031914, time_offset_ms: 113_725},
      %Video.TimedPoint{lat: 53.543073, lon: 10.031996, time_offset_ms: 114_059},
      %Video.TimedPoint{lat: 53.542986, lon: 10.032067, time_offset_ms: 114_392},
      %Video.TimedPoint{lat: 53.542901, lon: 10.032133, time_offset_ms: 114_726},
      %Video.TimedPoint{lat: 53.542818, lon: 10.032198, time_offset_ms: 115_060},
      %Video.TimedPoint{lat: 53.542734, lon: 10.032261, time_offset_ms: 115_393},
      %Video.TimedPoint{lat: 53.542651, lon: 10.032325, time_offset_ms: 115_727},
      %Video.TimedPoint{lat: 53.54257, lon: 10.032391, time_offset_ms: 116_060},
      %Video.TimedPoint{lat: 53.542487, lon: 10.03246, time_offset_ms: 116_394},
      %Video.TimedPoint{lat: 53.542406, lon: 10.032528, time_offset_ms: 116_728},
      %Video.TimedPoint{lat: 53.542325, lon: 10.032595, time_offset_ms: 117_061},
      %Video.TimedPoint{lat: 53.542243, lon: 10.032659, time_offset_ms: 117_395},
      %Video.TimedPoint{lat: 53.542163, lon: 10.032724, time_offset_ms: 117_728},
      %Video.TimedPoint{lat: 53.542084, lon: 10.032789, time_offset_ms: 118_062},
      %Video.TimedPoint{lat: 53.542, lon: 10.03285, time_offset_ms: 118_396},
      %Video.TimedPoint{lat: 53.541912, lon: 10.032906, time_offset_ms: 118_729},
      %Video.TimedPoint{lat: 53.541816, lon: 10.032954, time_offset_ms: 119_063},
      %Video.TimedPoint{lat: 53.541713, lon: 10.032984, time_offset_ms: 119_396},
      %Video.TimedPoint{lat: 53.541611, lon: 10.032993, time_offset_ms: 119_730},
      %Video.TimedPoint{lat: 53.541511, lon: 10.03299, time_offset_ms: 120_064},
      %Video.TimedPoint{lat: 53.541408, lon: 10.032986, time_offset_ms: 120_397},
      %Video.TimedPoint{lat: 53.541312, lon: 10.032974, time_offset_ms: 120_731},
      %Video.TimedPoint{lat: 53.541221, lon: 10.032949, time_offset_ms: 121_064},
      %Video.TimedPoint{lat: 53.541135, lon: 10.032905, time_offset_ms: 121_398},
      %Video.TimedPoint{lat: 53.541053, lon: 10.032843, time_offset_ms: 121_732},
      %Video.TimedPoint{lat: 53.540981, lon: 10.032761, time_offset_ms: 122_065},
      %Video.TimedPoint{lat: 53.540918, lon: 10.032671, time_offset_ms: 122_399},
      %Video.TimedPoint{lat: 53.540861, lon: 10.032577, time_offset_ms: 122_732},
      %Video.TimedPoint{lat: 53.540806, lon: 10.032492, time_offset_ms: 123_066},
      %Video.TimedPoint{lat: 53.540753, lon: 10.032413, time_offset_ms: 123_400},
      %Video.TimedPoint{lat: 53.540703, lon: 10.032335, time_offset_ms: 123_733},
      %Video.TimedPoint{lat: 53.540657, lon: 10.032278, time_offset_ms: 124_067},
      %Video.TimedPoint{lat: 53.540622, lon: 10.032245, time_offset_ms: 124_400},
      %Video.TimedPoint{lat: 53.54061297305389, lon: 10.032237176646706, time_offset_ms: 124_601},
      %Video.TimedPoint{lat: 53.54059, lon: 10.032228, time_offset_ms: 124_601},
      %Video.TimedPoint{lat: 53.540576, lon: 10.032215, time_offset_ms: 124_935},
      %Video.TimedPoint{lat: 53.540535, lon: 10.032175, time_offset_ms: 125_268},
      %Video.TimedPoint{lat: 53.540476, lon: 10.032119, time_offset_ms: 125_602},
      %Video.TimedPoint{lat: 53.540411, lon: 10.032057, time_offset_ms: 125_935},
      %Video.TimedPoint{lat: 53.540343, lon: 10.031992, time_offset_ms: 126_269},
      %Video.TimedPoint{lat: 53.540272, lon: 10.031926, time_offset_ms: 126_603},
      %Video.TimedPoint{lat: 53.540199, lon: 10.031857, time_offset_ms: 126_936},
      %Video.TimedPoint{lat: 53.540119, lon: 10.031784, time_offset_ms: 127_270},
      %Video.TimedPoint{lat: 53.54003, lon: 10.031752, time_offset_ms: 127_603},
      %Video.TimedPoint{lat: 53.539937, lon: 10.031745, time_offset_ms: 127_937},
      %Video.TimedPoint{lat: 53.539856, lon: 10.031704, time_offset_ms: 128_271},
      %Video.TimedPoint{lat: 53.539805, lon: 10.031662, time_offset_ms: 128_604},
      %Video.TimedPoint{lat: 53.539731, lon: 10.031606, time_offset_ms: 128_938},
      %Video.TimedPoint{lat: 53.539636, lon: 10.031537, time_offset_ms: 129_271},
      %Video.TimedPoint{lat: 53.539538, lon: 10.031469, time_offset_ms: 129_605},
      %Video.TimedPoint{lat: 53.539448, lon: 10.031409, time_offset_ms: 129_939},
      %Video.TimedPoint{lat: 53.539361, lon: 10.031345, time_offset_ms: 130_272},
      %Video.TimedPoint{lat: 53.539277, lon: 10.031278, time_offset_ms: 130_606},
      %Video.TimedPoint{lat: 53.539191, lon: 10.031215, time_offset_ms: 130_939},
      %Video.TimedPoint{lat: 53.539103, lon: 10.031159, time_offset_ms: 131_273},
      %Video.TimedPoint{lat: 53.539017, lon: 10.031109, time_offset_ms: 131_607},
      %Video.TimedPoint{lat: 53.538933, lon: 10.031057, time_offset_ms: 131_940},
      %Video.TimedPoint{lat: 53.538849, lon: 10.031003, time_offset_ms: 132_274},
      %Video.TimedPoint{lat: 53.538768, lon: 10.030949, time_offset_ms: 132_607},
      %Video.TimedPoint{lat: 53.538687, lon: 10.030902, time_offset_ms: 132_941},
      %Video.TimedPoint{lat: 53.538607, lon: 10.030857, time_offset_ms: 133_275},
      %Video.TimedPoint{lat: 53.538529, lon: 10.030808, time_offset_ms: 133_608},
      %Video.TimedPoint{lat: 53.538451, lon: 10.030761, time_offset_ms: 133_942},
      %Video.TimedPoint{lat: 53.538376, lon: 10.030715, time_offset_ms: 134_275},
      %Video.TimedPoint{lat: 53.538294, lon: 10.030671, time_offset_ms: 134_609},
      %Video.TimedPoint{lat: 53.538212, lon: 10.030625, time_offset_ms: 134_943},
      %Video.TimedPoint{lat: 53.538131, lon: 10.030582, time_offset_ms: 135_276},
      %Video.TimedPoint{lat: 53.538052, lon: 10.030542, time_offset_ms: 135_610},
      %Video.TimedPoint{lat: 53.537973, lon: 10.030503, time_offset_ms: 135_943},
      %Video.TimedPoint{lat: 53.537893, lon: 10.030463, time_offset_ms: 136_277},
      %Video.TimedPoint{lat: 53.537812, lon: 10.030428, time_offset_ms: 136_611},
      %Video.TimedPoint{lat: 53.537735, lon: 10.030398, time_offset_ms: 136_944},
      %Video.TimedPoint{lat: 53.53766, lon: 10.030359, time_offset_ms: 137_278},
      %Video.TimedPoint{lat: 53.537587, lon: 10.030328, time_offset_ms: 137_611},
      %Video.TimedPoint{lat: 53.537514, lon: 10.030306, time_offset_ms: 137_945},
      %Video.TimedPoint{lat: 53.537441, lon: 10.030286, time_offset_ms: 138_279},
      %Video.TimedPoint{lat: 53.537372, lon: 10.030259, time_offset_ms: 138_612},
      %Video.TimedPoint{lat: 53.537302, lon: 10.030223, time_offset_ms: 138_946},
      %Video.TimedPoint{lat: 53.537231, lon: 10.030183, time_offset_ms: 139_279},
      %Video.TimedPoint{lat: 53.537163, lon: 10.030143, time_offset_ms: 139_613},
      %Video.TimedPoint{lat: 53.537093, lon: 10.030103, time_offset_ms: 139_947},
      %Video.TimedPoint{lat: 53.53702, lon: 10.030062, time_offset_ms: 140_280},
      %Video.TimedPoint{lat: 53.536948, lon: 10.030018, time_offset_ms: 140_614},
      %Video.TimedPoint{lat: 53.536878, lon: 10.029973, time_offset_ms: 140_947},
      %Video.TimedPoint{lat: 53.536805, lon: 10.029925, time_offset_ms: 141_281},
      %Video.TimedPoint{lat: 53.536731, lon: 10.029879, time_offset_ms: 141_615},
      %Video.TimedPoint{lat: 53.536659, lon: 10.029829, time_offset_ms: 141_948},
      %Video.TimedPoint{lat: 53.536586, lon: 10.029777, time_offset_ms: 142_282},
      %Video.TimedPoint{lat: 53.53651, lon: 10.029729, time_offset_ms: 142_615},
      %Video.TimedPoint{lat: 53.536438, lon: 10.029682, time_offset_ms: 142_949},
      %Video.TimedPoint{lat: 53.536365, lon: 10.029632, time_offset_ms: 143_283},
      %Video.TimedPoint{lat: 53.536294, lon: 10.029583, time_offset_ms: 143_616},
      %Video.TimedPoint{lat: 53.536226, lon: 10.029538, time_offset_ms: 143_950},
      %Video.TimedPoint{lat: 53.53616, lon: 10.02949, time_offset_ms: 144_283},
      %Video.TimedPoint{lat: 53.536094, lon: 10.029441, time_offset_ms: 144_617},
      %Video.TimedPoint{lat: 53.536029, lon: 10.029394, time_offset_ms: 144_951},
      %Video.TimedPoint{lat: 53.535963, lon: 10.029344, time_offset_ms: 145_284},
      %Video.TimedPoint{lat: 53.535897, lon: 10.029293, time_offset_ms: 145_618},
      %Video.TimedPoint{lat: 53.535833, lon: 10.029244, time_offset_ms: 145_951},
      %Video.TimedPoint{lat: 53.535769, lon: 10.029195, time_offset_ms: 146_285},
      %Video.TimedPoint{lat: 53.535703, lon: 10.029148, time_offset_ms: 146_619},
      %Video.TimedPoint{lat: 53.53564, lon: 10.029101, time_offset_ms: 146_952},
      %Video.TimedPoint{lat: 53.535578, lon: 10.029053, time_offset_ms: 147_286},
      %Video.TimedPoint{lat: 53.535514, lon: 10.029002, time_offset_ms: 147_619},
      %Video.TimedPoint{lat: 53.535453, lon: 10.028951, time_offset_ms: 147_953},
      %Video.TimedPoint{lat: 53.535394, lon: 10.028901, time_offset_ms: 148_287},
      %Video.TimedPoint{lat: 53.535332, lon: 10.02885, time_offset_ms: 148_620},
      %Video.TimedPoint{lat: 53.53527, lon: 10.0288, time_offset_ms: 148_954},
      %Video.TimedPoint{lat: 53.535209, lon: 10.028751, time_offset_ms: 149_287},
      %Video.TimedPoint{lat: 53.535149, lon: 10.0287, time_offset_ms: 149_621},
      %Video.TimedPoint{lat: 53.535087, lon: 10.028645, time_offset_ms: 149_955},
      %Video.TimedPoint{lat: 53.535027, lon: 10.028594, time_offset_ms: 150_288},
      %Video.TimedPoint{lat: 53.534966, lon: 10.028538, time_offset_ms: 150_622},
      %Video.TimedPoint{lat: 53.534905, lon: 10.028487, time_offset_ms: 150_955},
      %Video.TimedPoint{lat: 53.534842, lon: 10.02844, time_offset_ms: 151_289},
      %Video.TimedPoint{lat: 53.534781, lon: 10.028386, time_offset_ms: 151_623},
      %Video.TimedPoint{lat: 53.534723, lon: 10.028333, time_offset_ms: 151_956},
      %Video.TimedPoint{lat: 53.534664, lon: 10.028281, time_offset_ms: 152_290},
      %Video.TimedPoint{lat: 53.534604, lon: 10.028227, time_offset_ms: 152_623},
      %Video.TimedPoint{lat: 53.534545, lon: 10.028175, time_offset_ms: 152_957},
      %Video.TimedPoint{lat: 53.534485, lon: 10.028123, time_offset_ms: 153_291},
      %Video.TimedPoint{lat: 53.534425, lon: 10.028068, time_offset_ms: 153_624},
      %Video.TimedPoint{lat: 53.534368, lon: 10.028014, time_offset_ms: 153_958},
      %Video.TimedPoint{lat: 53.534309, lon: 10.02796, time_offset_ms: 154_291},
      %Video.TimedPoint{lat: 53.534248, lon: 10.027902, time_offset_ms: 154_625},
      %Video.TimedPoint{lat: 53.534191, lon: 10.027848, time_offset_ms: 154_959},
      %Video.TimedPoint{lat: 53.534134, lon: 10.027802, time_offset_ms: 155_292},
      %Video.TimedPoint{lat: 53.53409304191617, lon: 10.027765353293413, time_offset_ms: 155_532}
    ]
  end
end