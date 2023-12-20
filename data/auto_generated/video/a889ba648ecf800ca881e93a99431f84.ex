defmodule Data.AutoGenerated.Video.Rendered_a889ba648ecf800ca881e93a99431f84 do
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
    "a889ba648ecf800ca881e93a99431f84"
  end

  @impl Video.Rendered
  def length_ms() do
    64665
  end

  @impl Video.Rendered
  def sources() do
    [{"2023-06-03-vr10-vr7/GX015926", "00:00:48.949", "00:01:53.614"}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.113093621621621,
      minLat: 53.573962,
      maxLon: 10.143116345345344,
      maxLat: 53.576425
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Juni 2023", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Schimmelmannstraße"},
      %{timestamp: 2092, text: "Jenfelder Straße"},
      %{timestamp: 48796, text: "Bekkamp"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.113093621621621, lat: 53.576080972972974, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.113102, lat: 53.576098, time_offset_ms: 90},
      %Video.TimedPoint{lon: 10.113199, lat: 53.576146, time_offset_ms: 424},
      %Video.TimedPoint{lon: 10.11331, lat: 53.576197, time_offset_ms: 757},
      %Video.TimedPoint{lon: 10.113434, lat: 53.576257, time_offset_ms: 1091},
      %Video.TimedPoint{lon: 10.113567, lat: 53.576316, time_offset_ms: 1425},
      %Video.TimedPoint{lon: 10.113708, lat: 53.576377, time_offset_ms: 1758},
      %Video.TimedPoint{lon: 10.113868, lat: 53.576424, time_offset_ms: 2092},
      %Video.TimedPoint{lon: 10.114038, lat: 53.576425, time_offset_ms: 2425},
      %Video.TimedPoint{lon: 10.114201, lat: 53.576375, time_offset_ms: 2759},
      %Video.TimedPoint{lon: 10.114351, lat: 53.576308, time_offset_ms: 3093},
      %Video.TimedPoint{lon: 10.114481, lat: 53.576236, time_offset_ms: 3426},
      %Video.TimedPoint{lon: 10.114582, lat: 53.576147, time_offset_ms: 3760},
      %Video.TimedPoint{lon: 10.114654, lat: 53.576048, time_offset_ms: 4093},
      %Video.TimedPoint{lon: 10.114703, lat: 53.575947, time_offset_ms: 4427},
      %Video.TimedPoint{lon: 10.114739, lat: 53.575845, time_offset_ms: 4761},
      %Video.TimedPoint{lon: 10.114769, lat: 53.575738, time_offset_ms: 5094},
      %Video.TimedPoint{lon: 10.114795, lat: 53.575633, time_offset_ms: 5428},
      %Video.TimedPoint{lon: 10.114816, lat: 53.575526, time_offset_ms: 5761},
      %Video.TimedPoint{lon: 10.114821, lat: 53.575413, time_offset_ms: 6095},
      %Video.TimedPoint{lon: 10.114826, lat: 53.575308, time_offset_ms: 6429},
      %Video.TimedPoint{lon: 10.114835, lat: 53.575205, time_offset_ms: 6762},
      %Video.TimedPoint{lon: 10.11486, lat: 53.575098, time_offset_ms: 7096},
      %Video.TimedPoint{lon: 10.114926, lat: 53.574998, time_offset_ms: 7429},
      %Video.TimedPoint{lon: 10.115037, lat: 53.574913, time_offset_ms: 7763},
      %Video.TimedPoint{lon: 10.115173, lat: 53.57484, time_offset_ms: 8097},
      %Video.TimedPoint{lon: 10.115315, lat: 53.574782, time_offset_ms: 8430},
      %Video.TimedPoint{lon: 10.115459, lat: 53.574733, time_offset_ms: 8764},
      %Video.TimedPoint{lon: 10.1156, lat: 53.57468, time_offset_ms: 9097},
      %Video.TimedPoint{lon: 10.115743, lat: 53.574624, time_offset_ms: 9431},
      %Video.TimedPoint{lon: 10.115894, lat: 53.574576, time_offset_ms: 9765},
      %Video.TimedPoint{lon: 10.116048, lat: 53.574539, time_offset_ms: 10098},
      %Video.TimedPoint{lon: 10.116205, lat: 53.574504, time_offset_ms: 10432},
      %Video.TimedPoint{lon: 10.116356, lat: 53.574456, time_offset_ms: 10765},
      %Video.TimedPoint{lon: 10.116498, lat: 53.574392, time_offset_ms: 11099},
      %Video.TimedPoint{lon: 10.116637, lat: 53.574334, time_offset_ms: 11433},
      %Video.TimedPoint{lon: 10.116788, lat: 53.574288, time_offset_ms: 11766},
      %Video.TimedPoint{lon: 10.116945, lat: 53.574252, time_offset_ms: 12100},
      %Video.TimedPoint{lon: 10.117112, lat: 53.574224, time_offset_ms: 12433},
      %Video.TimedPoint{lon: 10.117294, lat: 53.574198, time_offset_ms: 12767},
      %Video.TimedPoint{lon: 10.117483, lat: 53.574176, time_offset_ms: 13101},
      %Video.TimedPoint{lon: 10.117668, lat: 53.574157, time_offset_ms: 13434},
      %Video.TimedPoint{lon: 10.117856, lat: 53.574137, time_offset_ms: 13768},
      %Video.TimedPoint{lon: 10.11805, lat: 53.574117, time_offset_ms: 14101},
      %Video.TimedPoint{lon: 10.118237, lat: 53.574098, time_offset_ms: 14435},
      %Video.TimedPoint{lon: 10.118426, lat: 53.574076, time_offset_ms: 14769},
      %Video.TimedPoint{lon: 10.118621, lat: 53.574054, time_offset_ms: 15102},
      %Video.TimedPoint{lon: 10.118816, lat: 53.574032, time_offset_ms: 15436},
      %Video.TimedPoint{lon: 10.119004, lat: 53.574009, time_offset_ms: 15769},
      %Video.TimedPoint{lon: 10.119196, lat: 53.57399, time_offset_ms: 16103},
      %Video.TimedPoint{lon: 10.119377, lat: 53.573973, time_offset_ms: 16437},
      %Video.TimedPoint{lon: 10.119559, lat: 53.573962, time_offset_ms: 16770},
      %Video.TimedPoint{lon: 10.119743, lat: 53.573968, time_offset_ms: 17104},
      %Video.TimedPoint{lon: 10.119922, lat: 53.573992, time_offset_ms: 17437},
      %Video.TimedPoint{lon: 10.120084, lat: 53.574035, time_offset_ms: 17771},
      %Video.TimedPoint{lon: 10.120218, lat: 53.574081, time_offset_ms: 18105},
      %Video.TimedPoint{lon: 10.120304, lat: 53.574117, time_offset_ms: 18438},
      %Video.TimedPoint{lon: 10.120386, lat: 53.574163, time_offset_ms: 18772},
      %Video.TimedPoint{lon: 10.120505, lat: 53.574206, time_offset_ms: 19105},
      %Video.TimedPoint{lon: 10.120639, lat: 53.574246, time_offset_ms: 19439},
      %Video.TimedPoint{lon: 10.120772, lat: 53.574288, time_offset_ms: 19773},
      %Video.TimedPoint{lon: 10.120904, lat: 53.574348, time_offset_ms: 20106},
      %Video.TimedPoint{lon: 10.121035, lat: 53.574408, time_offset_ms: 20440},
      %Video.TimedPoint{lon: 10.121164, lat: 53.574467, time_offset_ms: 20773},
      %Video.TimedPoint{lon: 10.121284, lat: 53.574528, time_offset_ms: 21107},
      %Video.TimedPoint{lon: 10.121406, lat: 53.574588, time_offset_ms: 21441},
      %Video.TimedPoint{lon: 10.121524, lat: 53.574653, time_offset_ms: 21774},
      %Video.TimedPoint{lon: 10.121642, lat: 53.574725, time_offset_ms: 22108},
      %Video.TimedPoint{lon: 10.121781, lat: 53.574774, time_offset_ms: 22441},
      %Video.TimedPoint{lon: 10.121922, lat: 53.574821, time_offset_ms: 22775},
      %Video.TimedPoint{lon: 10.122075, lat: 53.574876, time_offset_ms: 23109},
      %Video.TimedPoint{lon: 10.122231, lat: 53.574925, time_offset_ms: 23442},
      %Video.TimedPoint{lon: 10.122392, lat: 53.574963, time_offset_ms: 23776},
      %Video.TimedPoint{lon: 10.122562, lat: 53.575002, time_offset_ms: 24109},
      %Video.TimedPoint{lon: 10.122737, lat: 53.575029, time_offset_ms: 24443},
      %Video.TimedPoint{lon: 10.122912, lat: 53.575053, time_offset_ms: 24777},
      %Video.TimedPoint{lon: 10.123087, lat: 53.575078, time_offset_ms: 25110},
      %Video.TimedPoint{lon: 10.123258, lat: 53.575087, time_offset_ms: 25444},
      %Video.TimedPoint{lon: 10.123424, lat: 53.57508, time_offset_ms: 25777},
      %Video.TimedPoint{lon: 10.123608, lat: 53.575078, time_offset_ms: 26111},
      %Video.TimedPoint{lon: 10.123784, lat: 53.575088, time_offset_ms: 26445},
      %Video.TimedPoint{lon: 10.123952, lat: 53.575097, time_offset_ms: 26778},
      %Video.TimedPoint{lon: 10.124133, lat: 53.575096, time_offset_ms: 27112},
      %Video.TimedPoint{lon: 10.124312, lat: 53.575095, time_offset_ms: 27445},
      %Video.TimedPoint{lon: 10.124496, lat: 53.575103, time_offset_ms: 27779},
      %Video.TimedPoint{lon: 10.124665, lat: 53.575107, time_offset_ms: 28113},
      %Video.TimedPoint{lon: 10.124821, lat: 53.57511, time_offset_ms: 28446},
      %Video.TimedPoint{lon: 10.124968, lat: 53.575124, time_offset_ms: 28780},
      %Video.TimedPoint{lon: 10.125124, lat: 53.575123, time_offset_ms: 29113},
      %Video.TimedPoint{lon: 10.125276, lat: 53.575118, time_offset_ms: 29447},
      %Video.TimedPoint{lon: 10.125424, lat: 53.575118, time_offset_ms: 29781},
      %Video.TimedPoint{lon: 10.125569, lat: 53.575123, time_offset_ms: 30114},
      %Video.TimedPoint{lon: 10.125709, lat: 53.575127, time_offset_ms: 30448},
      %Video.TimedPoint{lon: 10.125859, lat: 53.575135, time_offset_ms: 30781},
      %Video.TimedPoint{lon: 10.126033, lat: 53.575148, time_offset_ms: 31115},
      %Video.TimedPoint{lon: 10.126221, lat: 53.57515, time_offset_ms: 31449},
      %Video.TimedPoint{lon: 10.126408, lat: 53.575148, time_offset_ms: 31782},
      %Video.TimedPoint{lon: 10.126606, lat: 53.575146, time_offset_ms: 32116},
      %Video.TimedPoint{lon: 10.126803, lat: 53.575145, time_offset_ms: 32449},
      %Video.TimedPoint{lon: 10.127002, lat: 53.575141, time_offset_ms: 32783},
      %Video.TimedPoint{lon: 10.127203, lat: 53.575141, time_offset_ms: 33117},
      %Video.TimedPoint{lon: 10.127406, lat: 53.575144, time_offset_ms: 33450},
      %Video.TimedPoint{lon: 10.127603, lat: 53.575148, time_offset_ms: 33784},
      %Video.TimedPoint{lon: 10.127803, lat: 53.575151, time_offset_ms: 34117},
      %Video.TimedPoint{lon: 10.127998, lat: 53.575151, time_offset_ms: 34451},
      %Video.TimedPoint{lon: 10.12819, lat: 53.575153, time_offset_ms: 34785},
      %Video.TimedPoint{lon: 10.128386, lat: 53.575156, time_offset_ms: 35118},
      %Video.TimedPoint{lon: 10.128576, lat: 53.575157, time_offset_ms: 35452},
      %Video.TimedPoint{lon: 10.128759, lat: 53.575159, time_offset_ms: 35785},
      %Video.TimedPoint{lon: 10.128948, lat: 53.575162, time_offset_ms: 36119},
      %Video.TimedPoint{lon: 10.129135, lat: 53.575168, time_offset_ms: 36453},
      %Video.TimedPoint{lon: 10.129323, lat: 53.57517, time_offset_ms: 36786},
      %Video.TimedPoint{lon: 10.129519, lat: 53.575176, time_offset_ms: 37120},
      %Video.TimedPoint{lon: 10.129718, lat: 53.57518, time_offset_ms: 37453},
      %Video.TimedPoint{lon: 10.129913, lat: 53.575185, time_offset_ms: 37787},
      %Video.TimedPoint{lon: 10.130114, lat: 53.575186, time_offset_ms: 38120},
      %Video.TimedPoint{lon: 10.130319, lat: 53.575186, time_offset_ms: 38454},
      %Video.TimedPoint{lon: 10.130524, lat: 53.575188, time_offset_ms: 38788},
      %Video.TimedPoint{lon: 10.130734, lat: 53.575192, time_offset_ms: 39121},
      %Video.TimedPoint{lon: 10.130945, lat: 53.575195, time_offset_ms: 39455},
      %Video.TimedPoint{lon: 10.131158, lat: 53.5752, time_offset_ms: 39788},
      %Video.TimedPoint{lon: 10.131375, lat: 53.575206, time_offset_ms: 40122},
      %Video.TimedPoint{lon: 10.131589, lat: 53.575209, time_offset_ms: 40456},
      %Video.TimedPoint{lon: 10.131792, lat: 53.575211, time_offset_ms: 40789},
      %Video.TimedPoint{lon: 10.13198, lat: 53.575213, time_offset_ms: 41123},
      %Video.TimedPoint{lon: 10.132142, lat: 53.575214, time_offset_ms: 41456},
      %Video.TimedPoint{lon: 10.132285, lat: 53.575213, time_offset_ms: 41790},
      %Video.TimedPoint{lon: 10.132419, lat: 53.57521, time_offset_ms: 42124},
      %Video.TimedPoint{lon: 10.132537, lat: 53.575205, time_offset_ms: 42457},
      %Video.TimedPoint{lon: 10.132623, lat: 53.5752, time_offset_ms: 42791},
      %Video.TimedPoint{lon: 10.132679, lat: 53.575197, time_offset_ms: 43124},
      %Video.TimedPoint{lon: 10.132728, lat: 53.575193, time_offset_ms: 43458},
      %Video.TimedPoint{lon: 10.132769, lat: 53.575188, time_offset_ms: 43792},
      %Video.TimedPoint{lon: 10.132825, lat: 53.575184, time_offset_ms: 44125},
      %Video.TimedPoint{lon: 10.132946, lat: 53.575175, time_offset_ms: 44459},
      %Video.TimedPoint{lon: 10.133099, lat: 53.575165, time_offset_ms: 44792},
      %Video.TimedPoint{lon: 10.133258, lat: 53.575149, time_offset_ms: 45126},
      %Video.TimedPoint{lon: 10.133418, lat: 53.575135, time_offset_ms: 45460},
      %Video.TimedPoint{lon: 10.133568, lat: 53.575122, time_offset_ms: 45793},
      %Video.TimedPoint{lon: 10.133715, lat: 53.575108, time_offset_ms: 46127},
      %Video.TimedPoint{lon: 10.133844, lat: 53.575094, time_offset_ms: 46460},
      %Video.TimedPoint{lon: 10.133952, lat: 53.575083, time_offset_ms: 46794},
      %Video.TimedPoint{lon: 10.134054, lat: 53.575073, time_offset_ms: 47128},
      %Video.TimedPoint{lon: 10.134143, lat: 53.575061, time_offset_ms: 47461},
      %Video.TimedPoint{lon: 10.134209, lat: 53.575043, time_offset_ms: 47795},
      %Video.TimedPoint{lon: 10.134286, lat: 53.575018, time_offset_ms: 48128},
      %Video.TimedPoint{lon: 10.134399, lat: 53.57498, time_offset_ms: 48462},
      %Video.TimedPoint{lon: 10.134536, lat: 53.574938, time_offset_ms: 48796},
      %Video.TimedPoint{lon: 10.134693, lat: 53.574895, time_offset_ms: 49129},
      %Video.TimedPoint{lon: 10.134868, lat: 53.574857, time_offset_ms: 49463},
      %Video.TimedPoint{lon: 10.135048, lat: 53.574829, time_offset_ms: 49796},
      %Video.TimedPoint{lon: 10.135229, lat: 53.57481, time_offset_ms: 50130},
      %Video.TimedPoint{lon: 10.135415, lat: 53.574803, time_offset_ms: 50464},
      %Video.TimedPoint{lon: 10.135594, lat: 53.574814, time_offset_ms: 50797},
      %Video.TimedPoint{lon: 10.135775, lat: 53.574833, time_offset_ms: 51131},
      %Video.TimedPoint{lon: 10.135965, lat: 53.574846, time_offset_ms: 51464},
      %Video.TimedPoint{lon: 10.136153, lat: 53.574855, time_offset_ms: 51798},
      %Video.TimedPoint{lon: 10.136346, lat: 53.574862, time_offset_ms: 52132},
      %Video.TimedPoint{lon: 10.136546, lat: 53.574871, time_offset_ms: 52465},
      %Video.TimedPoint{lon: 10.136743, lat: 53.574881, time_offset_ms: 52799},
      %Video.TimedPoint{lon: 10.136942, lat: 53.574891, time_offset_ms: 53132},
      %Video.TimedPoint{lon: 10.137141, lat: 53.574901, time_offset_ms: 53466},
      %Video.TimedPoint{lon: 10.137335, lat: 53.574909, time_offset_ms: 53800},
      %Video.TimedPoint{lon: 10.137533, lat: 53.574918, time_offset_ms: 54133},
      %Video.TimedPoint{lon: 10.137733, lat: 53.574928, time_offset_ms: 54467},
      %Video.TimedPoint{lon: 10.137925, lat: 53.574936, time_offset_ms: 54800},
      %Video.TimedPoint{lon: 10.138115, lat: 53.574937, time_offset_ms: 55134},
      %Video.TimedPoint{lon: 10.138307, lat: 53.574944, time_offset_ms: 55468},
      %Video.TimedPoint{lon: 10.138493, lat: 53.574951, time_offset_ms: 55801},
      %Video.TimedPoint{lon: 10.138683, lat: 53.574959, time_offset_ms: 56135},
      %Video.TimedPoint{lon: 10.138871, lat: 53.574975, time_offset_ms: 56468},
      %Video.TimedPoint{lon: 10.139054, lat: 53.574998, time_offset_ms: 56802},
      %Video.TimedPoint{lon: 10.139241, lat: 53.57501, time_offset_ms: 57136},
      %Video.TimedPoint{lon: 10.139432, lat: 53.575017, time_offset_ms: 57469},
      %Video.TimedPoint{lon: 10.139619, lat: 53.575025, time_offset_ms: 57803},
      %Video.TimedPoint{lon: 10.139807, lat: 53.575037, time_offset_ms: 58136},
      %Video.TimedPoint{lon: 10.14, lat: 53.575056, time_offset_ms: 58470},
      %Video.TimedPoint{lon: 10.140186, lat: 53.575072, time_offset_ms: 58804},
      %Video.TimedPoint{lon: 10.140368, lat: 53.575091, time_offset_ms: 59137},
      %Video.TimedPoint{lon: 10.140554, lat: 53.575112, time_offset_ms: 59471},
      %Video.TimedPoint{lon: 10.140733, lat: 53.575133, time_offset_ms: 59804},
      %Video.TimedPoint{lon: 10.140908, lat: 53.575154, time_offset_ms: 60138},
      %Video.TimedPoint{lon: 10.141082, lat: 53.575166, time_offset_ms: 60472},
      %Video.TimedPoint{lon: 10.141253, lat: 53.575181, time_offset_ms: 60805},
      %Video.TimedPoint{lon: 10.141425, lat: 53.575201, time_offset_ms: 61139},
      %Video.TimedPoint{lon: 10.1416, lat: 53.575222, time_offset_ms: 61472},
      %Video.TimedPoint{lon: 10.141771, lat: 53.575244, time_offset_ms: 61806},
      %Video.TimedPoint{lon: 10.141944, lat: 53.575269, time_offset_ms: 62140},
      %Video.TimedPoint{lon: 10.142124, lat: 53.575291, time_offset_ms: 62473},
      %Video.TimedPoint{lon: 10.1423, lat: 53.57531, time_offset_ms: 62807},
      %Video.TimedPoint{lon: 10.142472, lat: 53.575329, time_offset_ms: 63140},
      %Video.TimedPoint{lon: 10.142641, lat: 53.575351, time_offset_ms: 63474},
      %Video.TimedPoint{lon: 10.142801, lat: 53.575368, time_offset_ms: 63808},
      %Video.TimedPoint{lon: 10.14295, lat: 53.575356, time_offset_ms: 64141},
      %Video.TimedPoint{lon: 10.143061, lat: 53.575312, time_offset_ms: 64475},
      %Video.TimedPoint{lon: 10.143116345345344, lat: 53.575286324324324, time_offset_ms: 64665}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "yx_eeBcdghRAA?AAAAAACAAACACACCCAECCAECECECGCGCGEGCIEKEIGMGMGOGMEOEKEKEIEKCKEICKEIEKCKEIEKCKEIEKCKEIEKEKEKCKEKEKEMEKEKEKEMEKEMEKEKEKEMEKEKEMEKEMEKEMEKEMEKEMCKEMEKEMEMEKEMEMEKEMEMEKEMEMEMEMEMEMEMEOEMEMEMEMEOEMEMEMEOEMCMEOEMEOCOEMCOEOCMEOCOEOCQCOCOCOCOCQAOCOAOCOAOAOAOAOAOAQ?OAO?O?O?Q?O?O?O?O@O?Q@O@O@O@O@O@Q@OBO@OBOBOBOBQBOBQDOBODOBQDODOBODMDODODODODODODMDOFODMDOFODMDOFMDMFODMDMFMDMFMDMFMDMFMDKFMFMDKFKFMDKFKFKDMFKFIFKFKFKFKFKFIFKFIFIFKHIFIFIHKFIHIFGHIFIHGFIHGHIHGFIHGHGHGFGHGHGHGHEHGHGHEHGHEHEHGHEHEHEHEHEHEHEHEHCHEHEHCHEHCHEHCHEHCHCHEHCHCHCHCHEHCHCHCHCHAHCHCHCJCHCHCHAHCHCHCHAHCJCHAHCJCHAHCHAJCHCHAJCHAJCHAHCJAHCHAJCHAHAJCHAHCJAHAHCHAHAJCHAHAJAHCHAHAHAJCHAHAHAJAHCHAJAHAHAJAHAHAJAHAHAJAHAHAJAH?JAHAHAJ?JAH?JAHAJ?HAJ?J?HAJ?JAJ?H?J?JAH?J?HAJ?H?J?HAH?J?H?HAH?J?H?HAJ?H?HAH?H?H?JAH?H?HAH?HAJ?H?HAH?HAH?JAH?HAH?HAHAH?JAHAH?HAHAJAHAHAHAJAHAHAJCHAHAJCHCHAJCHCHAHEHCJCHCHCHEHCHEJEHEHEHEHEHEHGHEFGHGHGHEFGHIHGFGHIFGHIFIHIFGFKHIFIFIHKFKFIFKFKFIFKFKFKFMFKFKFKFMFKFMDKFMFMFMDKFMDMFMDMFMDKFMDMDMFMDMDMDMDODMDMDMDMDMDMDMDMDMDMBMDMDMDOBMDMDMBMDMBMDMBMDMBMDOBMDMBMDMBMDMBMDMBMDMDMBMDMBODMDMBMDMBMDMDMBMDMDMBMDMDMBMDMDOBMDMDMDMBMDMDODMBMDMDODMBMDMDOBMDMDMBODMBODMDOBMDMBOBMDOBMDOBODMBOBOBMDOBMBOBMBOBODMBOBOBMBOBOBM@OBMBOBOBMBOBM@OBOBMBOBOBO@OBMBOBOBM@OBOBOBMBOBOBO@MBOBOBMBOBOBMBODOBMBOBOBMDOBOBMDOBMDOBMDOBMDMDOBMDMDODMDOBMDMDODMDMDMDODMFMDODMDMDMDMDMDMDODMFMDMDMBMDMDMDMDMDMDMDMBMDMDMDMBMDMDMBMDMBODMBMDMBODMBODMBOBMDOBOBMBODMBOBMBOBOBMBOBOBOBMBOBMBOBO@OBMBOBOBO@OBOBM@OBOBO@QBO@OBOBO@OBQ@OBO@O@QBO@QBO@O@QBO@QBO@Q@QBQ@O@QBQ@Q@QBQ@O@SBQ@Q@Q@QBS@Q@Q@QBQ@Q@S@QBS@Q@Q@S@Q@Q@SBQ@S@S@Q@Q@S@Q@S@Q@Q@S@Q@SBQ@Q@Q@S@Q?Q@S@Q@Q@Q@S@Q@Q@Q@Q@Q@S@Q@Q@S@Q@Q@S@Q@Q@Q@S@Q@S@Q@S@Q@Q@S@Q@Q@S@Q@S@S@Q@S@S@Q@S@S@S@Q@S@S@S@S@Q@S@S@Q@S@Q@S@S@Q@S@Q@Q@S@Q@Q@Q?S@Q@Q@S@Q@Q@Q@S@Q@Q@S@Q@S@Q@QBS@Q@Q@S@Q@S@Q@S@Q@Q@S@Q@S@QBS@Q@S@S@Q@S@S@S@QBS@S@S@S@S@Q@S@S@QBS@S@S@S@Q@S@S@S@Q@SBS@S@Q@S@S@S@S@Q@SBS@Q@S@Q@S@S@Q@SBQ@S@Q@S@Q@Q@S@QBS@Q@Q@S@Q@Q@S@Q@S@Q@S@Q@S@Q@S@S@Q@S@S@S@Q@S@Q@S@Q@S@Q@Q@S@Q?S@Q@Q@Q@Q@Q@Q?Q@Q@Q@Q@Q?Q@Q@Q@Q?Q@Q@Q?Q@Q@Q?Q@S@Q?Q@Q?Q@Q?Q@S?Q?Q@Q?Q?Q@Q?Q?Q?Q?Q?S?Q?Q?Q?Q?QAQ?S?QAQ?Q?QAQ?QAQAS?QAQAQAQAQ?QAQAQAQCQAQAQAQAQCQAQAQCOAQCOCQAQCOCQAOCQCOCOCQCOCOCQCOEOCOCOCOCOCOEOCMCOEOCMCOEMCMCMEOCMCMEMCMEMCMCKEKCMCKCICKCICKCICICICGCICGCGAICECGAGCGCGCGAGCECGCGAGCGCGCGCGCGCGCGCGCGCGCGCICGCGCICGCICGCIEICICICKEICICKEKCICKCKEKCKCKEKCMCKCKCMEKCKCMCKCMCKCMCKCMEKCMCMCKCMCMCMCKCMCMCKCMCMEMCKCMCKCMCKCMCKCMCMEKCMCKCMEKCKCMEKCMEMCKEMCMEKEMCMEMEKEMEMEMEMEKEMEMEKEMEMEKEMEMEMEKEMEKEMEKEMEKEMEMEKEMEKEMEKEMEKEMEKEMEKEMEKEMEKEMEKEMEKEMEKEMEKEKEKEMCKEKEKGMEKEKEKCKEKEKEKEKEKEMEKEKEKEKEKEKEIEKEMEKGKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKGKEKEKEKEKEKGKEIEKEKGKEKEKEKGIEKEKGKEKGKEKEKGKEKGKEKGKEMGKEKGMEKGKEKEMEKEKEKGMEKEMCKEMEKEMEMCKEMEKCMEMCMEMCKEMCMCMEMCMEMCMEMCMCKEMCMCMEMCMCMEMCMCMEMCMEMCMEMCOEMCOEMEMCOEOCMEOEOEOCOEMEOEOCOEMEOCOEMCOEOEOCOEMCOEOCOEOCOEMCOEOCOCOEOCMCOCOEOCOCOCOCOCOCMCOEOAOCOCOCOCOCOCOCOCOCOCOCOCQCOCOCQAOCOCQCQCOCOCQCQCQCOAQCOCQCOCQAOCQCQAQCOAQCOAQCQAOCQAQCOAQAQCQAOAQCQAOAQCQAQAOCQAQAQAOAQCQAOAQAQCQAOAQAQAOCQAQAOAQCQAQAQAOAQCQAQAQAQAQCQAOAQAQAQAOAQAQAOAQ?QAQAOAQ?OAQAO?QAO?QAQ?O?QAO?Q?OAO?Q?O?O?Q?O?O?Q?O?O?O?O@Q?O?O?O?Q@O?O?Q?O?O@Q?Q?Q?Q?Q@O?Q?S?Q?Q?Q?Q@S?Q?Q?S?QAQ?Q?Q?Q?Q?Q?SAO?Q?QAQ?Q?QAO?QAQ?Q?QAQ?OAQ?QAO?QAO?Q?QAO?QAO?QAO?O?QAO?OAQ?O?OAQ?O?Q?OAQ?O?Q?QAQ?Q?O?Q?Q?Q?Q?Q?S?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?Q?O?Q?Q?QAS?Q?Q?QAQ?Q?S?QAQ?Q?SAQ?Q?SAQ?Q?QAQ?Q?Q?QAQ?Q?OAQ?Q?O?QAO?Q?O?Q?OAQ?O?O?O?OAQ?O?O?O?O?OAO?O?O?OAM?O?O?OAO?M?O?MAO?MAO?O?MAO?MAO?MAM?O?MAM?OAM?MAO?MAM?OAM?M?OAM?O?OAM?O?M?O?OAO?O?M?O?O?O?O?O?M?O@O?O?M?O?O?O?M?O@O?M?O?M?O@O?O?M?O?M?O?M@O?M?O?M?O?O?M?M?O?M@M?O?M?O?M?O?MAM?M?O?M?M?O?M?O?M?MAM?O?M?M?OAM?M?O?M?MAM?M?O?M?MAM?M?M?MAM?M?M?M?MAK?M?M?MAM?M?M?MAM?M?M?MAM?M?MAO?M?MAO?M?MAO?MAO?M?OAM?OAO?OAM?OAQ?OAO?OAQ?OAO?QAQAO?QAQ?QAQ?QAQ?QAQ?QAQ?Q?QAS?Q?QAQ?Q?Q?S?QAS?Q?S?Q?S?Q?S?Q?Q?S?Q?S?Q?Q?S?Q?Q?S?Q?Q?S?Q?Q?S?Q@Q?Q?S?Q?S?S?Q?S?S?Q?S@S?S?S?Q?U?S?S?S?S?Q@S?S?S?S?S?S?S?S?S?S?S?Q?S?S@S?S?S?Q?S?S?S?S?Q?S@S?S?S?S?S?S?S@Q?S?S?S?S?S?S@S?S?S?S?S?S?S?S?S@S?S?S?S?S?S?S?S?S?S?S?S?S?S?S?S?SAU?S?S?S?S?S?U?S?S?SAU?S?S?S?S?SAS?S?S?S?U?SAS?S?Q?S?S?SAS?Q?S?S?SAS?Q?S?S?S?QAS?S?S?S?S?SAS?U?S?S?S?SAS?S?S?S?S?S?S?S?Q?UAS?Q?S?S?S?Q?S?S?Q?S?S?S?S?Q?S?Q?S?S?Q?S?S?SAQ?S?Q?S?Q?S?Q?S?S?Q?S?QAS?Q?S?Q?S?S?S?QAS?S?S?S?S?Q?S?SAS?S?S?S?Q?S?S?QAS?S?S?Q?S?Q?S?Q?S?Q?S?SAQ?S?Q?Q?S?Q?Q?S?Q?Q?S?Q?Q?QAS?Q?Q?Q?Q?S?Q?Q?Q?QAQ?Q?Q?Q?S?Q?Q?SAQ?Q?S?Q?Q?S?QAS?Q?S?Q?S?QAS?Q?Q?S?QAS?Q?S?QAQ?Q?S?QAQ?S?Q?SAQ?Q?Q?SAQ?Q?S?Q?SAQ?Q?Q?S?Q?SAQ?Q?S?Q?S?QAQ?S?Q?S?Q?QAS?S?S?Q?SAQ?S?S?QAS?S?SAS?S?S?QAS?S?S?SAS?S?S?SAQ?U?S?S?SAQ?U?S?SAS?S?Q?S?SAS?S?S?SAS?Q?S?S?QAS?S?Q?SAS?S?Q?S?SAQ?S?S?Q?U?SAQ?S?S?S?U?S?S?S?S?S?SAS?S?S?S?S?U?S?S?S?S?U?S?S?S?S?S?S?U?S?U?S?S?S?S?S?U?S?S?U?S?SAS?S?U?S?S?S?S?U?S?S?SAU?S?S?S?U?S?UAS?S?U?S?U?SAU?S?U?U?SAU?S?U?S?S?UAS?U?U?S?U?SAU?S?S?U?S?UAU?S?U?S?UAS?U?S?U?U?SAU?U?S?UAU?S?U?S?UAU?U?S?UAS?U?UAS?U?U?UAU?S?U?UAS?U?UAU?U?U?UAU?S?U?UAU?S?U?UAU?U?U?S?UAU?S?U?U?SAU?U?U?S?U?S?UAS?U?S?U?S?U?S?SAU?S?S?U?S?S?U?S?S?SAS?S?S?Q?S?S?S?S?Q?SAS?Q?Q?S?Q?S?S?Q?Q?QAQ?Q?Q?Q?Q?Q?Q?O?Q?Q?O?Q?O?O?O?O?QAM?O?O?O?O?M?O?O?M?O?M?O?M@M?O?M?M?M?M?M?M?M?M?M?M?M?M?M@M?M?M?M?M?K?M?M@M?M?M?K?M?M@K?M?M?K?M@K?M?M?K?M@K?M?K?K@M?K?M@K?K?K?K@K?K?K?K@I?K?I@K?I?I?I@I?I?G?I@G?I?G?G@G?G?G?E@G?G?E?G?E@E?E?E?E?C@E?E?C?E?C?C@E?C?C?C?E?C@C?C?C?C?C?C@C?C?C?C?C?C?C@C?A?C?C?C?A?C@C?A?C?C?A?C?A@C?A?C?C?A?C?A?C@C?A?C?C?C?A@C?C?C?C?C?C@C?E?C?C?E@C?E?E?E@E?G?E?G@G?I@G?I?I@K?I@M?K@M?M@M?O@M?O@M?O@M@O?O@O?O@M?O@O?M@O?O@O@O?O@O?O@M@O?O@O?O@O@O?O@O@O?O@O@O?M@O@O@O?O@Q@M@O?O@O@O@O?O@O@O@Q?O@O@O@O?O@O@O@O?O@O@O?O@O@O?O@M@O@O?O@O@M?O@M@O?O@M@O?M@O@M?O@M@O?M@M@O?M@O@O?M@O@M?M@O@M?O@M@O@M?O@M@M?O@M@M@M?M@M@O?M@K@M@M?M@M@K?M@M@K?M@K@M?K@K@K?K@K@K?K@K?K@K@I?K@I?K@I?I@K@I?K@I?I@I?I@I?K@I?I@I?K@I@I?I@K?I@I?I@I?K@I@I?I@I?I@I@I?I@I@I?I@I@G?I@I@G?I@G@G?I@G@G@G?E@G@G?G@E@G@E?G@E@E?E@E@E?G@E@E@E?C@E@E@E?E@E@E@G@E@E@E@G?E@E@G@EBG@E@G@E@G@G@GBG@G@IBG@IBIBI@IBIBI@KBIBKBIBKBKBMBKBKBKBKBKBMBKBMBKBMBKDMBMBKBMBMBKBMBMBMDMBMBMBMBOBMBMBMDOBMBOBMBOBODMBOBOBOBOBOBODOBOBOBOBOBQBOBOBQBOBQBOBQBOBQBOBQBQBQBQ@QBOBQBQ@QBQBQBQ@QBQ@OBQ@QBQ@QBQ@QBQ@SBQ@O@QBQ@Q@Q@Q@QBQ@S@Q@O@Q@Q@Q@Q@Q@Q@Q@S@Q@Q@Q?Q@Q@Q@Q?Q@Q@Q?S@Q?Q@Q?Q@S?Q?Q@S?Q?S?Q@Q?Q?Q?Q?Q?S?Q?QAQ?Q?Q?QAQ?Q?QAQ?QAQ?QAQ?QAOAQ?QAQAQAQ?QAQAQAQ?QAQAQAQAQAQ?QAQAQAQAQAS?QAQAQAQASAQ?SAQAQAS?SAQAS?QASAQ?SAQ?SAQAS?QAS?QAS?QAS?QAQ?SAQ?QAQ?SAQ?SAQ?QAS?Q?QAS?QAS?S?QAS?QAS?Q?SAQ?S?QAS?SAQ?S?SAQ?SAS?Q?SAS?SAS?S?SAS?SAS?SAU?SAS?S?SAS?SAS?SAS?SAS?SAQ?SAS?SAS?QAS?SAS?SAS?QAS?S?SAQ?SASAS?SAS?SAS?SAS?SAS?SAS?SAS?SAS?SAS?QAS?UAS?SAQ?SAS?SAS?S?SAS?SAS?SAS?SAS?SAQ?SAS?SAS?Q?SAS?QAS?SAQ?S?SAQ?SAS?Q?SAQ?SAS?SAS?Q?SAS?SAS?SAS?SAS?S?SAQ?SAS?SAS?SAS?SAS?SAS?SAS?SAS?S?SAS?SAS?SAS?SAS?SAS?SAS?QAS?S?SAQ?SAS?Q?SAS?QAS?Q?S?QAS?Q?SAQ?S?Q?S?QAS?Q?S?Q?Q?S?SAQ?S?Q?Q?S?Q?SAQ?S?Q?S?SAQ?S?Q?SAQ?S?QAS?S?SAQ?S?QAS?Q?SAQ?S?QAS?Q?QAS?Q?SAQ?QAQ?S?QAQ?Q?SAQ?Q?QAS?QAS?Q?SAQ?Q?SAQ?SAQ?SAQ?SAQ?SAQ?SAQ?QAS?QASAS?QAQAS?QASAQAS?QASAQASAQAQ?QASAQAQASAQAQAQASAQAQAQAQAQAQASAQAQAQAQAQAQASAQAQASAQ?QAQAQAS?QAQAQ?SAQAS?QAQ?QAS?QAQAS?Q?SAQ?SAQ?SAS?QAS?Q?SAS?QAS?Q?SAQ?S?QAS?QAS?Q?SAQ?Q?SAQ?QAQ?S?QAS?QAQ?QAS?QAQ?QAS?QAS?QAQ?SAQ?SAQAQ?SAQ?SAQAQ?SAQAQ?SAQASASAQ?SAQASASAQAS?SAQASASASAQASASAQAS?QASAQASAQASAQAQ?QASAQAQASAQ?QAQAQASAQAQ?QAQASAQAQAQAQAQASAQ?QAQAQAQAQAQAQAQAQAQAQASAQAQASAQAQAQAQASAQASAQAQASCQAQAQASAQAQAQAQASAQAQAQAQAQAQAQAQAQAQAQCOAQAQAQAQAOAQAQAQAQAQAQAOAQAQAOAQAQAQAQAOAQAQAO?QAQAQAOAQAQ?OAQAQAO?QAQAO?QAQAO?QAQAO?QAOAQ?QAOAQ?QAOAQAQ?OAQAOAQ?OAQAOAQ?OAQAOAQAOAQ?QAOAQAOAQAOAQAOAQAQAOAQAQAOAQAOAQAOAQAQAQAOAQAQAQAOAQAQAQAQAOAQAQAQCOAQAQAOAQAQAOAQAQAOAQAOAQCOAQAOAQAQAOAOAQAOCQAOAQAQAOAQCOAQAQAOAQAOCQAQAOAQCQAOAQAQAOAQCQAQAQAQAOCQAQAQAQAQAQAQCSAQAQAQAQAQAOAQAQAQAQAQAQAQAQAOAQAQAQAQAQAOAQAQAOAQAQAOAQAQAQAOAQ?QAOAQAQAOAQAQAOAQAOAQAOAQAOAQAOAQAQAOAQAOAQAOAQAOCQAQAOAQAOAQAOAOAQAOAOAQAOAOAQAO?OAOAOAO?OAOAO?OAO?OAO?OAM?O?O?O?O?M?O?O?M@O?O@M?O@M@O?M@M@M@M@MBM@M@MBK@MBMBM@KBMBMBMDMBODMBMDKBKBIBIBI@GBG@GBG@E@EBE@E@C@E@C@C@C?C@C",
      precision: 6
    }
  end
end
