defmodule Data.AutoGenerated.Video.Rendered_7210b7ccddec805d100c7ad56d116ba7 do
  @moduledoc "#{"2018-01-01-cch: Umleitung Tiergartenstraße"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2018-01-01-cch: Umleitung Tiergartenstraße"
  end

  @impl Video.Rendered
  def hash() do
    "7210b7ccddec805d100c7ad56d116ba7"
  end

  @impl Video.Rendered
  def length_ms() do
    43300
  end

  @impl Video.Rendered
  def sources() do
    [{"2021-08-01-freizeit9-anfang/GX012481", "00:00:03.070", :end}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.976396,
      minLat: 53.557899,
      maxLon: 9.988784508982036,
      maxLat: 53.564104
    }
  end

  @impl Video.Rendered
  def renderer() do
    1
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "August 2021", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Gorch-Fock-Wall"},
      %{timestamp: 10941, text: "Jungiusstraße"},
      %{timestamp: 19281, text: "St. Petersburger Straße"},
      %{timestamp: 36295, text: "Messeplatz"},
      %{timestamp: 41299, text: "Rentzelstraße"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.988784508982036, lat: 53.5584308502994, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.98872, lat: 53.558442, time_offset_ms: 266},
      %Video.TimedPoint{lon: 9.988608, lat: 53.558419, time_offset_ms: 600},
      %Video.TimedPoint{lon: 9.988476, lat: 53.558399, time_offset_ms: 933},
      %Video.TimedPoint{lon: 9.988335, lat: 53.558385, time_offset_ms: 1267},
      %Video.TimedPoint{lon: 9.988188, lat: 53.558376, time_offset_ms: 1600},
      %Video.TimedPoint{lon: 9.988043, lat: 53.558358, time_offset_ms: 1934},
      %Video.TimedPoint{lon: 9.987906, lat: 53.558329, time_offset_ms: 2268},
      %Video.TimedPoint{lon: 9.987743, lat: 53.558305, time_offset_ms: 2601},
      %Video.TimedPoint{lon: 9.987575, lat: 53.558278, time_offset_ms: 2935},
      %Video.TimedPoint{lon: 9.987421, lat: 53.558256, time_offset_ms: 3268},
      %Video.TimedPoint{lon: 9.987261, lat: 53.558247, time_offset_ms: 3602},
      %Video.TimedPoint{lon: 9.987091, lat: 53.558236, time_offset_ms: 3936},
      %Video.TimedPoint{lon: 9.986925, lat: 53.558226, time_offset_ms: 4269},
      %Video.TimedPoint{lon: 9.986759, lat: 53.558219, time_offset_ms: 4603},
      %Video.TimedPoint{lon: 9.986588, lat: 53.558212, time_offset_ms: 4936},
      %Video.TimedPoint{lon: 9.98642, lat: 53.558201, time_offset_ms: 5270},
      %Video.TimedPoint{lon: 9.986252, lat: 53.558189, time_offset_ms: 5604},
      %Video.TimedPoint{lon: 9.986076, lat: 53.558176, time_offset_ms: 5937},
      %Video.TimedPoint{lon: 9.985899, lat: 53.558161, time_offset_ms: 6271},
      %Video.TimedPoint{lon: 9.985732, lat: 53.558146, time_offset_ms: 6604},
      %Video.TimedPoint{lon: 9.98556, lat: 53.55813, time_offset_ms: 6938},
      %Video.TimedPoint{lon: 9.98539, lat: 53.558118, time_offset_ms: 7272},
      %Video.TimedPoint{lon: 9.985222, lat: 53.558105, time_offset_ms: 7605},
      %Video.TimedPoint{lon: 9.985057, lat: 53.558087, time_offset_ms: 7939},
      %Video.TimedPoint{lon: 9.984904, lat: 53.558067, time_offset_ms: 8272},
      %Video.TimedPoint{lon: 9.984767, lat: 53.558044, time_offset_ms: 8606},
      %Video.TimedPoint{lon: 9.984615, lat: 53.558025, time_offset_ms: 8940},
      %Video.TimedPoint{lon: 9.984465, lat: 53.557995, time_offset_ms: 9273},
      %Video.TimedPoint{lon: 9.984311, lat: 53.557959, time_offset_ms: 9607},
      %Video.TimedPoint{lon: 9.984167, lat: 53.557925, time_offset_ms: 9940},
      %Video.TimedPoint{lon: 9.984049, lat: 53.557903, time_offset_ms: 10274},
      %Video.TimedPoint{lon: 9.983931, lat: 53.557899, time_offset_ms: 10608},
      %Video.TimedPoint{lon: 9.983812, lat: 53.557936, time_offset_ms: 10941},
      %Video.TimedPoint{lon: 9.983697, lat: 53.557987, time_offset_ms: 11275},
      %Video.TimedPoint{lon: 9.983587, lat: 53.558047, time_offset_ms: 11608},
      %Video.TimedPoint{lon: 9.983506, lat: 53.558127, time_offset_ms: 11942},
      %Video.TimedPoint{lon: 9.983436, lat: 53.558208, time_offset_ms: 12276},
      %Video.TimedPoint{lon: 9.983371, lat: 53.558285, time_offset_ms: 12609},
      %Video.TimedPoint{lon: 9.983309, lat: 53.558362, time_offset_ms: 12943},
      %Video.TimedPoint{lon: 9.983252, lat: 53.558441, time_offset_ms: 13276},
      %Video.TimedPoint{lon: 9.983198, lat: 53.558516, time_offset_ms: 13610},
      %Video.TimedPoint{lon: 9.983142, lat: 53.558591, time_offset_ms: 13944},
      %Video.TimedPoint{lon: 9.983084, lat: 53.558664, time_offset_ms: 14277},
      %Video.TimedPoint{lon: 9.983028, lat: 53.558739, time_offset_ms: 14611},
      %Video.TimedPoint{lon: 9.982971, lat: 53.558818, time_offset_ms: 14944},
      %Video.TimedPoint{lon: 9.982914, lat: 53.558893, time_offset_ms: 15278},
      %Video.TimedPoint{lon: 9.982857, lat: 53.558971, time_offset_ms: 15612},
      %Video.TimedPoint{lon: 9.982806, lat: 53.559046, time_offset_ms: 15945},
      %Video.TimedPoint{lon: 9.982754, lat: 53.55912, time_offset_ms: 16279},
      %Video.TimedPoint{lon: 9.982703, lat: 53.55919, time_offset_ms: 16612},
      %Video.TimedPoint{lon: 9.982649, lat: 53.559264, time_offset_ms: 16946},
      %Video.TimedPoint{lon: 9.982592, lat: 53.559339, time_offset_ms: 17280},
      %Video.TimedPoint{lon: 9.982532, lat: 53.559414, time_offset_ms: 17613},
      %Video.TimedPoint{lon: 9.982481, lat: 53.559487, time_offset_ms: 17947},
      %Video.TimedPoint{lon: 9.982426, lat: 53.559563, time_offset_ms: 18280},
      %Video.TimedPoint{lon: 9.982369, lat: 53.559638, time_offset_ms: 18614},
      %Video.TimedPoint{lon: 9.982299, lat: 53.559711, time_offset_ms: 18948},
      %Video.TimedPoint{lon: 9.982223, lat: 53.55978, time_offset_ms: 19281},
      %Video.TimedPoint{lon: 9.982168, lat: 53.559853, time_offset_ms: 19615},
      %Video.TimedPoint{lon: 9.982092, lat: 53.559923, time_offset_ms: 19948},
      %Video.TimedPoint{lon: 9.981996, lat: 53.559983, time_offset_ms: 20282},
      %Video.TimedPoint{lon: 9.981899, lat: 53.560043, time_offset_ms: 20616},
      %Video.TimedPoint{lon: 9.98179, lat: 53.560097, time_offset_ms: 20949},
      %Video.TimedPoint{lon: 9.98168, lat: 53.56015, time_offset_ms: 21283},
      %Video.TimedPoint{lon: 9.981565, lat: 53.560204, time_offset_ms: 21616},
      %Video.TimedPoint{lon: 9.981441, lat: 53.560258, time_offset_ms: 21950},
      %Video.TimedPoint{lon: 9.981307, lat: 53.560304, time_offset_ms: 22284},
      %Video.TimedPoint{lon: 9.981168, lat: 53.560339, time_offset_ms: 22617},
      %Video.TimedPoint{lon: 9.981037, lat: 53.560373, time_offset_ms: 22951},
      %Video.TimedPoint{lon: 9.980905, lat: 53.560407, time_offset_ms: 23284},
      %Video.TimedPoint{lon: 9.98077, lat: 53.560462, time_offset_ms: 23618},
      %Video.TimedPoint{lon: 9.980633, lat: 53.560538, time_offset_ms: 23952},
      %Video.TimedPoint{lon: 9.980498, lat: 53.560607, time_offset_ms: 24285},
      %Video.TimedPoint{lon: 9.980364, lat: 53.560674, time_offset_ms: 24619},
      %Video.TimedPoint{lon: 9.980246, lat: 53.56074, time_offset_ms: 24952},
      %Video.TimedPoint{lon: 9.980111, lat: 53.560799, time_offset_ms: 25286},
      %Video.TimedPoint{lon: 9.979985, lat: 53.56086, time_offset_ms: 25620},
      %Video.TimedPoint{lon: 9.979853, lat: 53.560918, time_offset_ms: 25953},
      %Video.TimedPoint{lon: 9.979717, lat: 53.560977, time_offset_ms: 26287},
      %Video.TimedPoint{lon: 9.979587, lat: 53.561038, time_offset_ms: 26620},
      %Video.TimedPoint{lon: 9.979456, lat: 53.561096, time_offset_ms: 26954},
      %Video.TimedPoint{lon: 9.979328, lat: 53.561156, time_offset_ms: 27288},
      %Video.TimedPoint{lon: 9.979204, lat: 53.561213, time_offset_ms: 27621},
      %Video.TimedPoint{lon: 9.979084, lat: 53.56127, time_offset_ms: 27955},
      %Video.TimedPoint{lon: 9.978951, lat: 53.561326, time_offset_ms: 28288},
      %Video.TimedPoint{lon: 9.97882, lat: 53.561379, time_offset_ms: 28622},
      %Video.TimedPoint{lon: 9.978691, lat: 53.561435, time_offset_ms: 28956},
      %Video.TimedPoint{lon: 9.978561, lat: 53.561492, time_offset_ms: 29289},
      %Video.TimedPoint{lon: 9.978443, lat: 53.561549, time_offset_ms: 29623},
      %Video.TimedPoint{lon: 9.978324, lat: 53.561604, time_offset_ms: 29956},
      %Video.TimedPoint{lon: 9.978185, lat: 53.561657, time_offset_ms: 30290},
      %Video.TimedPoint{lon: 9.978052, lat: 53.561711, time_offset_ms: 30623},
      %Video.TimedPoint{lon: 9.977901, lat: 53.56176, time_offset_ms: 30957},
      %Video.TimedPoint{lon: 9.977771, lat: 53.561807, time_offset_ms: 31291},
      %Video.TimedPoint{lon: 9.977652, lat: 53.561851, time_offset_ms: 31624},
      %Video.TimedPoint{lon: 9.97758, lat: 53.561881, time_offset_ms: 31958},
      %Video.TimedPoint{lon: 9.977516, lat: 53.561903, time_offset_ms: 32291},
      %Video.TimedPoint{lon: 9.977425, lat: 53.561931, time_offset_ms: 32625},
      %Video.TimedPoint{lon: 9.977336, lat: 53.561976, time_offset_ms: 32959},
      %Video.TimedPoint{lon: 9.977243, lat: 53.562029, time_offset_ms: 33292},
      %Video.TimedPoint{lon: 9.977137, lat: 53.562089, time_offset_ms: 33626},
      %Video.TimedPoint{lon: 9.97704, lat: 53.562155, time_offset_ms: 33959},
      %Video.TimedPoint{lon: 9.97694, lat: 53.562217, time_offset_ms: 34293},
      %Video.TimedPoint{lon: 9.976837, lat: 53.562278, time_offset_ms: 34627},
      %Video.TimedPoint{lon: 9.976721, lat: 53.562333, time_offset_ms: 34960},
      %Video.TimedPoint{lon: 9.976605, lat: 53.562386, time_offset_ms: 35294},
      %Video.TimedPoint{lon: 9.976494, lat: 53.562447, time_offset_ms: 35627},
      %Video.TimedPoint{lon: 9.976411, lat: 53.562524, time_offset_ms: 35961},
      %Video.TimedPoint{lon: 9.976396, lat: 53.562617, time_offset_ms: 36295},
      %Video.TimedPoint{lon: 9.976433, lat: 53.562707, time_offset_ms: 36628},
      %Video.TimedPoint{lon: 9.97648, lat: 53.562789, time_offset_ms: 36962},
      %Video.TimedPoint{lon: 9.97653, lat: 53.562863, time_offset_ms: 37295},
      %Video.TimedPoint{lon: 9.976579, lat: 53.562945, time_offset_ms: 37629},
      %Video.TimedPoint{lon: 9.976628, lat: 53.563026, time_offset_ms: 37963},
      %Video.TimedPoint{lon: 9.976684, lat: 53.563097, time_offset_ms: 38296},
      %Video.TimedPoint{lon: 9.97674, lat: 53.563172, time_offset_ms: 38630},
      %Video.TimedPoint{lon: 9.976794, lat: 53.563252, time_offset_ms: 38963},
      %Video.TimedPoint{lon: 9.976844, lat: 53.563334, time_offset_ms: 39297},
      %Video.TimedPoint{lon: 9.976896, lat: 53.563416, time_offset_ms: 39631},
      %Video.TimedPoint{lon: 9.976943, lat: 53.563495, time_offset_ms: 39964},
      %Video.TimedPoint{lon: 9.976987, lat: 53.56357, time_offset_ms: 40298},
      %Video.TimedPoint{lon: 9.97703, lat: 53.563644, time_offset_ms: 40631},
      %Video.TimedPoint{lon: 9.97707, lat: 53.563718, time_offset_ms: 40965},
      %Video.TimedPoint{lon: 9.977108, lat: 53.563782, time_offset_ms: 41299},
      %Video.TimedPoint{lon: 9.977157, lat: 53.563845, time_offset_ms: 41632},
      %Video.TimedPoint{lon: 9.977215, lat: 53.563907, time_offset_ms: 41966},
      %Video.TimedPoint{lon: 9.977263, lat: 53.563968, time_offset_ms: 42299},
      %Video.TimedPoint{lon: 9.977309, lat: 53.564031, time_offset_ms: 42633},
      %Video.TimedPoint{lon: 9.977355, lat: 53.564078, time_offset_ms: 42967},
      %Video.TimedPoint{lon: 9.977373, lat: 53.564104, time_offset_ms: 43300}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "ci}ceBaht`R?@?@?B?@?B?@?B?B?B?B?B?B?B?D?B@D?D?D?D?F@F?F@F?H@H?H@J?L@J@L@N@N@L@L@N@L@L@J@L@LBL@L@J@L@L@L@L@J@L@L@L@J@L@L@L?L@L@L@L@L@J?L@L@L@L?L@N@L?L@L@L?L@L@L?L@N?L@L@L?N@L?L@N?L@L@N?L@N?L@L@N?L@L?L@N@L@N?L@L@N@L?L@L@L@N@L@L@N@L@L@L@L@L@L@L@L@LBL@L@J@L@L@LBL@J@L@LBL@L@LBL@L@L@LBL@N@NBL@N@NBN@L@NBN@N@PBN@N@P@NBN@N@PBN@N@PBN@P@N@PBN@P@NBP@N@PBP@N@PBN@N@PBN@N@N@NBN@N@N@N@N@N@N@L@N@N@L@N@L@N@N@L@N@L@N?N@N@N@L?N@N@N?L@N?N@N?N@N@N?N@N?N@N?N@N?P@N?N@P?N@N?P@N?P@N?P@P?N@P@N?P@N?P@N?P@N?P@N?P@N?N@P?N@P?N@N?P@N?N@N?N@P?N?N@N?P@N?N@P?N?N@N?N@N?P?N@N?P?N@N?N?P@N?N@P?N?P@N?P?N@P?N?P@N?P@P?P?N@P?N@P?N?P@N?P@N?P@N?P@N?N@P?N@P?N@N?P@N?P@N?N@P?N@N?N@P@N?P@N?N@P@N?N@N?P@N?P@N@N?P@N?P@N@P?N@P@P?N@P?N@P@P?P@P@P?P@N@P?P@P@P?N@P@P?P@P@P@P?N@P@P?P@P@P@N?P@P@P@P?P@P@N@P?P@N@P@P?N@P@N@P?N@P@N@N?P@N@N@P?N@N@N@P?N@N@P@N?P@N@P@N@P?N@P@P@N?P@P@N@P?P@N@P@N?P@N@P?P@N@P?N@P@N?P@N@P?N@P@N?P@N?N@P@N?P@N@P?N@P@N?N@P@N?P@N@P?N@P@N?N@N@P?N@N@P@N@P?N@N@P@N@N?N@P@N@N@P@N@N@P@N@N?N@N@N@N@N@N@N@N@N@N@L@N@N@N@L@N@N@L@N@L@LBN@L@L@L@N@L@L@J@L@L@L@J@L@L@L@J@L@L@L@J@L@L@N@LBL@L@N@L@L@N@L@N@N@L@N@NBL@N@L@N@L@NBN@L@N@LBN@L@NBN@L@LBN@NBL@NBL@NBL@NBLBN@LBNBN@LBNBN@NBLBNBN@NBNBNBLBN@NBLBNBL@NBNBLBNBN@LBNBLBN@LBNBLBN@LBN@LBLBL@LBL@L@JBL@L@J@JBJ@J@J@J@J@J@J@J@H?J@J@H@J?J@H?J@J?H@J?H?J@J?H?J?H?J?H?J?J?H?HAJ?HAJ?HAJAH?JAJAHAJAJAJCJAJCJALCJCJAJCJCJCJCJCJCJCJEJCJCJCJEJCJEJCHEJCJEJCJEHCJEJEJCHEJEHEJCJEHEJEJEHEJEHEHEJEHEJEHGHEHEHEHGHEHGHEFGHEHGFEHGHGFGFEHGFGHGFGFGFGFGFGFGFGFGFGFGFIDGFGFGDGFGFGDGFGFGDGFGDGFGDGFGDGDGFGDGFGDGDGFGDEDGFGDGDGDGDEFGDGDGDGDEDGFGDGDGDGDEDGDGFGDGDEDGDGDGDGDGDGDEDGDGDGDGDGDGDGDGDGDGDGDGDGDGDGDGDGDEBGDGDGDGDGDGBGDGDEDGBGDGDEDGBGDEDGBGDGDEBGDGDEDGBGDGDEBGDGDGDEBGDGDGDEDGBGDGDEDGDGDEBGDGDGDEDGDGBEDGDGDGDEDGDEBGDGDGDEDGDEBGDGDEDGDGBEDGDGDEDGDGBGDEDGDGDEBGDGDGDEDGBGDGDEDGDGDGBGDGDGDGDGDGDGDGDGDGDGBGDGDGDGDEDGDGDGBGDGDGDEDGDGBGDEDGDGBGDEDGDGDEBGDGDGDEDGDGBGDGDGDGDEDGBGDGDGDGDGDGDGBGDGDGDEBGDGDGDGBGDEDGBGDGDEBGDGBGDEDGBGDEBGDGBGDEBGDGDGBEDGDGBEDGBGDGDEBGDGBGDEDGBEDGBGDEBGDGDEBEDGBGDEBGDEBEDGBEDGBEDGBEDGBEDGBEDGDEBGDGBEDGDEBGDGDEDGBGDGDEDGBGDGDEDGBGDGDEDGDGBGDEDGDGDEBGDGDGDGDEDGDGBEDGDGDGDGDEDGDGDGDGDEDGDGDGDGDEDGDGBGDEDGDGDGDEBGDGDEDGBGDEDGBEDGBGDEDGBEDGBGDEDGBEDGBGDGDEBGDGDGDEBGDGDGBGDEDGDGDGBGDEDGDGDGBGDEDGDGDGBEDGDGDGDEDGDGDGDEBGDGDEDGDGFEDGDGDEDGDGFGDEDGFEDGDGFGDEFGDGFEDGFEDGFGFEDGFEFGDGFEDGFEFGDEFGFEDGFGDEFGDEFGDEDGFEDGDEFGDEDGDEDGDEDGDEFGDEDGDEDGDEDGDEDGFEDGDGFEDGDEFGFEDGFEDGFEFGFEFGFEFGFEFEFGFEFEHEFGFEHEFEHEFEFEHGHEFEHEHEFEHEHEFEHEHEHEFEHEHEHEHEHEFEHEHEHEHEHEHCHEHEHEHEHEHEHEHCJEHEHEHEHEJCHEHEJEHCJEHEHEJCHEJEHCHEJEHEJCHEJCHEJEHCHEJEHCJEHEJCHEJCHEJEHCJEHEJCJEHEJCHEJEJCJEHEJCJEJEHEJCJEJEJCJEHEJCLEJEJEJCJEJEJCJEJELCJEJELCJEJELCJEJCLEJCLEJCLEJCLCJELCJELCLCLEJCLCLCJCLCLELCJCLCLCLCLCLCLCLCLCLCLALCLCLCLCJCLALCLCLCJALCLCLCJALCLCJALCJCLAJCLCJALCJCLAJCJCLAJCLCJCLAJCLCJAJCLCJCLAJCLCJCJCLCJCLAJCLEJCLCJCLCLEJCLCLEJCLELCJELELELELCJELELELGJELELELGLELGLELGLELGLGLENGLGLGLGLELGLGLELGLGLEJGLGLELGLEJGLELGLEJGLELGLEJELGJELGLEJELGLELGLEJELGLEJGLELELGJELGLEJGLEJELGJEJELGJELEJEJGJEJEJEJEJGJEJEJEJEJEJEJGJEJEJELEJEJELEJELEJELGJELELEJELELEJELEJELELEJELEJELEJELEJEJELEJEJELEJELEJEJELEJEJELEJEJELEJELCJELEJELEJELELEJELEJELEJELCLEJELELEJELELELEJELELELEJELELELELEJELELELEJELELEJELELEJELELEJELEJELELEJELEJELEJEJELEJELELEJELEJELEJELCJEJELELEJELEJEJELEJELEJELEJELEJCLEJELEJEJELEJELEJELEJELEJEJEJELEJELEJEJEJELCJEJEJELEJEJEJEJCJEJELEJEJCJEJEJEJEJEJCJEJEJEJEJCJEJEJEJEJCJEJEJELCJEJELEJEJELCJELELEJELEJELELCLEJELELEJCLEJELELCJELELCJELEJCJELEJCLELEJCJELEJCLEJELEJCLEJELCJELEJEJCLEJELEJELCJELEJELEJCJELEJELELEJCLEJELEJELEJELELEJELCJEJELEJEJEJELCJEJEJEJEJEJCJEJEJEJEJCJEJEJEJCHEJEJEJEJCJEJEJEJCHEJEJCJEJEJEJCJEJEJCJEJEJCLEJEJCLEJELEJCLELEJCLELELELELCLELELCLELELCJELELELCLEJELCLELCJELELCJELCLEJCLELELCLELCLELELCNELCLENELCNELCNENELCNELCNELCNELCLELCLELCLCLELCJCLELCJCLEJCLCJELCJCLEJCJCLEJCLCJELCJELCJELCLCJEJCLEJCJCJCJEJCHCJCHCHCHAHCFCFAFCFAFCFADAFCDADAFADCDADADADADADADADABADADADADADABADADADABADADADCDAFADAFADCFADAFAFCFAFCFAFCHAFCHCFAHCFCHAFCHCHCFCHCHCHAFCHCHEFCHCHCFCHCHEFCHCHCFEHCFCHEHCFEHCFCHEHEFCHEHCHEFEHCHEHEFCHEHEHCHEHEHEHEHEHEHEHEHEHEJEHEHEJEHEHEJEHEHGHEHEHEJEHGHEHEHEHEHGJEHEHEHGHEHEHEHGHEFEHEHEHGHEHEHEHEHEHGHEHEHEHEFEJEHEFEHEHGHEHEHEHEHEJEHEHEHEHEHEHEHEHEJEHEHEHEJEHEHEHEJEHEJCHEJEHEJEHEJEJEHCJEJEJEJEHEJCJEJEHEJCJEJEHCJEJEJCHEJEJCHEJEJEJCHEJEHCJEJEHEJCJEHEJEJEHEJEHEJEJEHEJEHEJGHEHEJEHEHGHEHEHGHEHGFEHGHGFEFGHGFEFGFGFGFGDGFGDGDGDGDGDGBGDGBIBGBGBGBI@GBI@G@I@I@G?I@G?I?G?I?I?G?IAG?IAGAIAIAGAIAGCIAGCIAICGCICGAGCICGCICGCGEICGCGCGCIEGCGCGCGEGCGCGEGCGCGEGCGCGEGCGEECGCGEGCECGEGCECGEGCECGEGCEEGCGCGEECGEGCGEGCGCGEGCGEGCGEIEGCGEGCGEGCGEGCIEGCGEGCGEGCGEICGEGCGEGCGEGEGCGEGCGEGEGCEEGCGEGEGCEEGEGCEEGCEEGEECGEGEECGEEEGCEEGEECGEGEEEGCGEEEGEGCEEGEGEGEECGEGEGEECGEGEGEGCGEGEGEECGEGEGEGCGEGEIEGCGEGEGCGEGEGCGEGCGEGEGCGEGCGEGEGCGEICGEGCGEGCGEGEGCGEGCIEGCGEGCGEGEGCGEICGEGEGCGEGCGEGCIEGCGEGCGEGCGEGCGEGCGEGCGCGEGCGEGCGCECGEGCGCGEGCGCGEECGCGCGCEEGCGCGCECGEGCGCECGCGEECGCGCGCECGEGCECGCGCGCECGEGCGCECGCGCECGCGEECGCGCGCECGCGCGCECGEGCGCGCECGCGCECGCGCECGCECGCECECGCECECECGCECECECECECECECECECECGCECECECECECEEECECGCEEECEEECEEECGCEEEEECEEECGEEEECEEEEEEGCEEEEEEECGEEEEEECEEEEECEEGEECEEEEECEEECEEECEEECEEECEEECECEEECGEECECEEECEEGCEEECEEGEECEEGEECGEEEEEGCEEGEEEGEGEEEEEECECCEECCACCCCCCCAAACCAACAAAAAAAAAAAAAAAA?AAAA??AAAA??A??AA??AA??AA???AA????",
      precision: 6
    }
  end
end
