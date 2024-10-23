defmodule Data.AutoGenerated.Video.Rendered_881946682ae0810dce0cb1de30e62633 do
  @moduledoc "#{"2024-10-19-freiraum-ottensen: Ottenser Hauptstraße nach Westen"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2024-10-19-freiraum-ottensen: Ottenser Hauptstraße nach Westen"
  end

  @impl Video.Rendered
  def hash() do
    "881946682ae0810dce0cb1de30e62633"
  end

  @impl Video.Rendered
  def length_ms() do
    60828
  end

  @impl Video.Rendered
  def sources() do
    [{"2024-10-19-ottensen/GX010045_stabilized", "00:00:13.480", :end}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.9251112,
      minLat: 53.5510413,
      maxLon: 9.935112156451613,
      maxLat: 53.5522736
    }
  end

  @impl Video.Rendered
  def renderer() do
    5
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Oktober 2024"}]
  end

  @impl Video.Rendered
  def street_names() do
    [
      %{timestamp: 0, text: "Paul-Nevermann-Platz"},
      %{timestamp: 6173, text: "Ottenser Hauptstraße"},
      %{timestamp: 56806, text: "Bei der Reitbahn"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.935112156451613, lat: 53.5518651733871, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.9350663, lat: 53.5518664, time_offset_ms: 156},
      %Video.TimedPoint{lon: 9.9349149, lat: 53.5518677, time_offset_ms: 666},
      %Video.TimedPoint{lon: 9.9347559, lat: 53.5518652, time_offset_ms: 1162},
      %Video.TimedPoint{lon: 9.9345121, lat: 53.5518681, time_offset_ms: 1669},
      %Video.TimedPoint{lon: 9.9343595, lat: 53.5518791, time_offset_ms: 2165},
      %Video.TimedPoint{lon: 9.9342262, lat: 53.5519002, time_offset_ms: 2674},
      %Video.TimedPoint{lon: 9.9341095, lat: 53.5519114, time_offset_ms: 3170},
      %Video.TimedPoint{lon: 9.9340011, lat: 53.5519329, time_offset_ms: 3666},
      %Video.TimedPoint{lon: 9.9339151, lat: 53.5519775, time_offset_ms: 4176},
      %Video.TimedPoint{lon: 9.9338456, lat: 53.5520108, time_offset_ms: 4672},
      %Video.TimedPoint{lon: 9.93379, lat: 53.5520423, time_offset_ms: 5181},
      %Video.TimedPoint{lon: 9.9337374, lat: 53.5520722, time_offset_ms: 5677},
      %Video.TimedPoint{lon: 9.9336884, lat: 53.5520944, time_offset_ms: 6173},
      %Video.TimedPoint{lon: 9.933646, lat: 53.5521209, time_offset_ms: 6683},
      %Video.TimedPoint{lon: 9.93361, lat: 53.5521461, time_offset_ms: 7178},
      %Video.TimedPoint{lon: 9.933576, lat: 53.5521742, time_offset_ms: 7688},
      %Video.TimedPoint{lon: 9.9335401, lat: 53.5522034, time_offset_ms: 8184},
      %Video.TimedPoint{lon: 9.9334965, lat: 53.5522259, time_offset_ms: 8680},
      %Video.TimedPoint{lon: 9.9334426, lat: 53.5522398, time_offset_ms: 9189},
      %Video.TimedPoint{lon: 9.933387, lat: 53.5522436, time_offset_ms: 9685},
      %Video.TimedPoint{lon: 9.9333308, lat: 53.5522479, time_offset_ms: 10195},
      %Video.TimedPoint{lon: 9.9332754, lat: 53.5522534, time_offset_ms: 10691},
      %Video.TimedPoint{lon: 9.9332202, lat: 53.5522533, time_offset_ms: 11187},
      %Video.TimedPoint{lon: 9.9331625, lat: 53.5522541, time_offset_ms: 11696},
      %Video.TimedPoint{lon: 9.9331048, lat: 53.5522545, time_offset_ms: 12192},
      %Video.TimedPoint{lon: 9.9330453, lat: 53.5522578, time_offset_ms: 12702},
      %Video.TimedPoint{lon: 9.9329927, lat: 53.5522533, time_offset_ms: 13198},
      %Video.TimedPoint{lon: 9.9329295, lat: 53.5522496, time_offset_ms: 13694},
      %Video.TimedPoint{lon: 9.9328667, lat: 53.5522445, time_offset_ms: 14203},
      %Video.TimedPoint{lon: 9.9328187, lat: 53.552239, time_offset_ms: 14699},
      %Video.TimedPoint{lon: 9.9327611, lat: 53.5522528, time_offset_ms: 15195},
      %Video.TimedPoint{lon: 9.9327044, lat: 53.5522469, time_offset_ms: 15705},
      %Video.TimedPoint{lon: 9.932658, lat: 53.5522436, time_offset_ms: 16200},
      %Video.TimedPoint{lon: 9.9326061, lat: 53.5522496, time_offset_ms: 16710},
      %Video.TimedPoint{lon: 9.9325439, lat: 53.5522369, time_offset_ms: 17206},
      %Video.TimedPoint{lon: 9.9325072, lat: 53.5522439, time_offset_ms: 17702},
      %Video.TimedPoint{lon: 9.9324671, lat: 53.5522446, time_offset_ms: 18211},
      %Video.TimedPoint{lon: 9.9324214, lat: 53.5522515, time_offset_ms: 18707},
      %Video.TimedPoint{lon: 9.9323696, lat: 53.5522631, time_offset_ms: 19217},
      %Video.TimedPoint{lon: 9.9323191, lat: 53.5522736, time_offset_ms: 19713},
      %Video.TimedPoint{lon: 9.932262, lat: 53.5522731, time_offset_ms: 20209},
      %Video.TimedPoint{lon: 9.9322013, lat: 53.5522724, time_offset_ms: 20718},
      %Video.TimedPoint{lon: 9.9321327, lat: 53.552264, time_offset_ms: 21214},
      %Video.TimedPoint{lon: 9.932077, lat: 53.5522559, time_offset_ms: 21724},
      %Video.TimedPoint{lon: 9.9320333, lat: 53.5522489, time_offset_ms: 22220},
      %Video.TimedPoint{lon: 9.9319816, lat: 53.5522371, time_offset_ms: 22715},
      %Video.TimedPoint{lon: 9.9319311, lat: 53.5522217, time_offset_ms: 23225},
      %Video.TimedPoint{lon: 9.9318706, lat: 53.5522131, time_offset_ms: 23721},
      %Video.TimedPoint{lon: 9.9318157, lat: 53.5522077, time_offset_ms: 24231},
      %Video.TimedPoint{lon: 9.9317737, lat: 53.5522112, time_offset_ms: 24726},
      %Video.TimedPoint{lon: 9.9317184, lat: 53.5522062, time_offset_ms: 25222},
      %Video.TimedPoint{lon: 9.9316804, lat: 53.5522052, time_offset_ms: 25732},
      %Video.TimedPoint{lon: 9.9316261, lat: 53.5522092, time_offset_ms: 26228},
      %Video.TimedPoint{lon: 9.9316024, lat: 53.5521974, time_offset_ms: 26737},
      %Video.TimedPoint{lon: 9.931573, lat: 53.5522057, time_offset_ms: 27233},
      %Video.TimedPoint{lon: 9.931498, lat: 53.5521904, time_offset_ms: 27729},
      %Video.TimedPoint{lon: 9.9314172, lat: 53.5521973, time_offset_ms: 28239},
      %Video.TimedPoint{lon: 9.9313501, lat: 53.5521895, time_offset_ms: 28735},
      %Video.TimedPoint{lon: 9.9312847, lat: 53.5521821, time_offset_ms: 29244},
      %Video.TimedPoint{lon: 9.9312267, lat: 53.552187, time_offset_ms: 29740},
      %Video.TimedPoint{lon: 9.9311733, lat: 53.5521882, time_offset_ms: 30236},
      %Video.TimedPoint{lon: 9.9311186, lat: 53.5521924, time_offset_ms: 30746},
      %Video.TimedPoint{lon: 9.931064, lat: 53.5522056, time_offset_ms: 31242},
      %Video.TimedPoint{lon: 9.9310081, lat: 53.5522044, time_offset_ms: 31751},
      %Video.TimedPoint{lon: 9.9309488, lat: 53.5522106, time_offset_ms: 32247},
      %Video.TimedPoint{lon: 9.9308963, lat: 53.5522171, time_offset_ms: 32743},
      %Video.TimedPoint{lon: 9.9308354, lat: 53.5522221, time_offset_ms: 33253},
      %Video.TimedPoint{lon: 9.9307904, lat: 53.5522103, time_offset_ms: 33748},
      %Video.TimedPoint{lon: 9.9307371, lat: 53.5522047, time_offset_ms: 34258},
      %Video.TimedPoint{lon: 9.9307019, lat: 53.5521827, time_offset_ms: 34754},
      %Video.TimedPoint{lon: 9.9306607, lat: 53.5521589, time_offset_ms: 35250},
      %Video.TimedPoint{lon: 9.9306019, lat: 53.552151, time_offset_ms: 35759},
      %Video.TimedPoint{lon: 9.9305593, lat: 53.5521488, time_offset_ms: 36255},
      %Video.TimedPoint{lon: 9.9305034, lat: 53.5521455, time_offset_ms: 36751},
      %Video.TimedPoint{lon: 9.9304431, lat: 53.5521421, time_offset_ms: 37261},
      %Video.TimedPoint{lon: 9.9303749, lat: 53.5521369, time_offset_ms: 37757},
      %Video.TimedPoint{lon: 9.930325, lat: 53.5521336, time_offset_ms: 38266},
      %Video.TimedPoint{lon: 9.9303153, lat: 53.5521341, time_offset_ms: 38762},
      %Video.TimedPoint{lon: 9.9302466, lat: 53.5521375, time_offset_ms: 39258},
      %Video.TimedPoint{lon: 9.9301332, lat: 53.5521319, time_offset_ms: 39768},
      %Video.TimedPoint{lon: 9.9300202, lat: 53.5521191, time_offset_ms: 40263},
      %Video.TimedPoint{lon: 9.9299053, lat: 53.5521037, time_offset_ms: 40773},
      %Video.TimedPoint{lon: 9.9297803, lat: 53.5520886, time_offset_ms: 41269},
      %Video.TimedPoint{lon: 9.929655, lat: 53.552066, time_offset_ms: 41765},
      %Video.TimedPoint{lon: 9.9295301, lat: 53.5520486, time_offset_ms: 42274},
      %Video.TimedPoint{lon: 9.9294108, lat: 53.5520384, time_offset_ms: 42770},
      %Video.TimedPoint{lon: 9.9292915, lat: 53.5520131, time_offset_ms: 43280},
      %Video.TimedPoint{lon: 9.9291763, lat: 53.551986, time_offset_ms: 43776},
      %Video.TimedPoint{lon: 9.9290443, lat: 53.5519635, time_offset_ms: 44285},
      %Video.TimedPoint{lon: 9.9289242, lat: 53.551923, time_offset_ms: 44781},
      %Video.TimedPoint{lon: 9.9287919, lat: 53.5519006, time_offset_ms: 45277},
      %Video.TimedPoint{lon: 9.9286544, lat: 53.5518845, time_offset_ms: 45787},
      %Video.TimedPoint{lon: 9.9285248, lat: 53.5518585, time_offset_ms: 46283},
      %Video.TimedPoint{lon: 9.928389, lat: 53.5518444, time_offset_ms: 46779},
      %Video.TimedPoint{lon: 9.9282496, lat: 53.551825, time_offset_ms: 47288},
      %Video.TimedPoint{lon: 9.9281161, lat: 53.551804, time_offset_ms: 47784},
      %Video.TimedPoint{lon: 9.9279823, lat: 53.5517841, time_offset_ms: 48294},
      %Video.TimedPoint{lon: 9.927851, lat: 53.5517691, time_offset_ms: 48790},
      %Video.TimedPoint{lon: 9.9277145, lat: 53.5517549, time_offset_ms: 49285},
      %Video.TimedPoint{lon: 9.9275762, lat: 53.5517317, time_offset_ms: 49795},
      %Video.TimedPoint{lon: 9.9274392, lat: 53.5517185, time_offset_ms: 50291},
      %Video.TimedPoint{lon: 9.9273145, lat: 53.551702, time_offset_ms: 50801},
      %Video.TimedPoint{lon: 9.9271847, lat: 53.5516885, time_offset_ms: 51296},
      %Video.TimedPoint{lon: 9.9270447, lat: 53.5516769, time_offset_ms: 51792},
      %Video.TimedPoint{lon: 9.9269016, lat: 53.5516687, time_offset_ms: 52302},
      %Video.TimedPoint{lon: 9.9267632, lat: 53.551658, time_offset_ms: 52798},
      %Video.TimedPoint{lon: 9.9266223, lat: 53.5516472, time_offset_ms: 53307},
      %Video.TimedPoint{lon: 9.9264916, lat: 53.5516269, time_offset_ms: 53803},
      %Video.TimedPoint{lon: 9.9263548, lat: 53.5516095, time_offset_ms: 54299},
      %Video.TimedPoint{lon: 9.926217, lat: 53.5515942, time_offset_ms: 54809},
      %Video.TimedPoint{lon: 9.9260951, lat: 53.5515768, time_offset_ms: 55305},
      %Video.TimedPoint{lon: 9.9259871, lat: 53.5515799, time_offset_ms: 55814},
      %Video.TimedPoint{lon: 9.9258776, lat: 53.5515739, time_offset_ms: 56310},
      %Video.TimedPoint{lon: 9.9257665, lat: 53.5515335, time_offset_ms: 56806},
      %Video.TimedPoint{lon: 9.9256836, lat: 53.5514715, time_offset_ms: 57316},
      %Video.TimedPoint{lon: 9.9256111, lat: 53.5514059, time_offset_ms: 57812},
      %Video.TimedPoint{lon: 9.9255318, lat: 53.5513463, time_offset_ms: 58321},
      %Video.TimedPoint{lon: 9.9254642, lat: 53.5512802, time_offset_ms: 58817},
      %Video.TimedPoint{lon: 9.9253886, lat: 53.5512085, time_offset_ms: 59313},
      %Video.TimedPoint{lon: 9.9252907, lat: 53.5511572, time_offset_ms: 59823},
      %Video.TimedPoint{lon: 9.9252112, lat: 53.5510933, time_offset_ms: 60318},
      %Video.TimedPoint{lon: 9.9251133, lat: 53.5510429, time_offset_ms: 60828},
      %Video.TimedPoint{lon: 9.9251112, lat: 53.5510413, time_offset_ms: 60828}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "snpceB{mk}Q?@?B?@?B?B?B?B?B?B?B?D?B?D?D?D?D?D?F?D?F?F?H?FAJ?H?H?L?L?L?L?L?L?L?L?J?J?J?J?H?J?H?H?J?H?H?H?J?H?H?H?H?H?H?H?H?H@H?J?H?J?H?J?J?J?J?J?L?J?L?L?J?L?N?L?L?N?N?N?N?NAN?P?N?P?P?P?N?PAN?N?P?L?N?NAN?L?N?LAL?J?LAL?J?J?JAJ?J?JAH?JAH?H?JAH?F?HAH?HAH?H?HAF?HAH?FAH?HAF?HAF?HAH?FAH?HAFAH?FAH?HAF?FAHAF?HAF?HAFAF?HAF?FAH?FAF?FAHAF?FAF?FAH?FAF?FAF?FAF?FAF?DAF?FAF?FAF?DAF?FAF?DAF?FAF?DAFAF?FAD?FAFAD?FAFAD?FADAF?FADAFAD?FADAFADAF?DAFADADAFADADAFADADAFADADADAFCDADADAFADCDADADAFCDADADCDAFADCDADCDADADCDADADCDABADCDADABCDADABCDADABADCBABADABABCDABABADABABABCBABADABABABABABABABABABABABABCBABABA@ABABABABABABABA@ABABABABABA@ABABABAB?BA@ABABABABABABA@ABABABABA@ABABABABA@ABABABABA@ABABABA@ABAB?@ABABA@ABABA@ABAB?@ABA@ABA@ABA@?BA@ABA@AB?@ABA@ABA@?BA@ABA@A@AB?@ABA@A@AB?@ABA@A@AB?@ABA@A@ABA@?@ABA@A@AB?@A@ABA@A@AB?@A@A@ABA@?@A@ABA@A@A@?@ABA@A@A@?@ABA@A@A@A@?BA@A@A@A@?@ABA@A@A@A@?@ABA@A@A@A@A@?BA@A@A@A@ABA@?@A@A@A@ABA@A@A@A@?BA@A@A@ABA@A@A@ABA@?@ABA@A@ABA@A@ABA@A@AB?@A@ABA@ABA@A@ABA@?BA@A@ABA@ABA@?BA@A@ABA@?BA@ABA@?BA@ABA@?BA@A@?BA@AB?@ABA@?BA@AB?@AB?BA@AB?@AB?@AB?@AB?@AB?BA@?BA@?BAB?@AB?BA@?BAB?@?BAB?@AB?B?@AB?BA@?B?BAB?@?BAB?@?BAB?B?@?BAB?B?@AB?B?B?BA@?B?B?BAB?@?B?BAB?B?@?BAB?B?B?B?@AB?B?B?B?BA@?B?B?B?B?BA@?B?B?B?B?BAB?@?B?B?B?B?BA@?B?B?B?B?B?B?@AB?B?B?B?B?@?B?BAB?B?B?B?@?B?B?B?B?BAB?@?B?B?B?B?B?@?B?B?BAB?@?B?B?B?B?B?@?B?B?B?B?B?@?BAB?B?B?@?B?B?B?B?B?B?@?B?B?B?B?B?B?@?B?B?BAB?B?B?B?@?B?B?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?B?B?B?B?B?B?BAB?B?B?B?B?B?B?B?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?B?B?@?B?B?B?B?B?@?B?B?B?B?@?B?B?B@@?B?B?B?@?B?B?B?@?B?B?@?B?B?B?B?B@@?B?B?B?B?B?B?B?B?B@B?B?B?B?B?D?B?B?B@B?B?D?B?B?B?D@B?B?B?D?B?B?B@D?B?B?B?B?D?B@B?B?B?D?B?B?B?B@B?D?B?B?B?B?B?B?B?B?B@B?B?B?B?B?B?B?@?B?B?B?B?@?B?B?@?B?B?@?B?@@B?B?@?B?@?B?@?B?B?@?B?B?@?B?B?@?B?B?BA@?B?B?B?B?@?B?B?B?B?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?B?B?B?BAB?@?B?B?B?B?B?B?B?@?B?B?B?B?B?@?B?B?B?@?B?B?B?@?B?B?B?@?B?@?B?B?@?B?B?@?B?@?B?@?B?@?B@B?@?B?@?B?@?B?B?@?B?@?B?B?@?B?B?@?B?B?@?B?B?@?B?B@B?@?B?B?B?B?@?B?B?B?B?B?B?@?B?B?B?B?B?B?B@B?D?B?B?B?B?B?B?B?D?B?B?B?B?D?B?B?B?B?B?B?B?B?@?B?B?B?@?B?@?B?B?@?B?@?@?B?@?@?B?@?@?@?@?@?B?@?@?@?@?@?@?@?@AB?@?@?@?@?@?@?@?B?@?@?@?@?@?@A@?@?B?@?@?@?@?@?@?@?B?@A@?@?@?@?B?@?@?@AB?@?@?@?B?@?@?@AB?@?@?B?@?BA@?@?B?@?BA@?B?@?B?@AB?@?B?@AB?@?B?BA@?B?B?@AB?B?@?BAB?B?@?BAB?B?BAB?@?B?BAB?B?B?@AB?B?BAB?B?@?BAB?B?B?BA@?B?B?BAB?@?B?BAB?B?@?BAB?B?@?B?BAB?@?B?B?BA@?B?B?B?@?BAB?B?@?B?B?B?BA@?B?B?B?B?@?B?B?B?BAB?@?B?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?B?B?B?B?D?B?B?B?B@B?B?B?D?B?B?B?D?B?B@D?B?B?D?B?D@B?D?B?D?B@D?B?D?B@D?B?D?B@D?B?D?B@D?B?B?D@B?B?B@D?B?B?B@B?B?B?B@B?B?B?B@B?B?B?@@B?B?B?B@@?B?B?@@B?B?@@B?@?B?@@B?@?B?@@B?@?B?@@B?@?@?B?@@@?B?@?@@B?@?@?B@@?@?B?@@@?B?@@B?@?@?B@@?B?@@B?@?B@@?B?@?B@@?B?B@@?B@B?@?B@B?@?B@B?@?B@B?@?B@B?@@B?B?B@@?B?B@B?@@B?B?B@B?@?B@B?B@B?B?@@B?B@B?B?B@B?B?B@B?B@B?B?B@D?B@B?B?B@B?B?B@D?B?B@B?B?B@D?B?B@B?B?B?B@B?B?B@B?B?B?B?B@B?B?B?B@B?@?B?B?B?B@B?B?@?B?B?B@B?B?@?B?B?B?@@B?B?@?B?B?@?B?@?B?@@B?@?B?@?B?@?@?B?@?B?@?@?B?@?@?B@@?@?B?@?B?@?B?@?B?@?B?B?@?B?B?@?B?B@B?@?B?B?B?B?B?B?B?B?B?B?B?B?B@B?@?B?B?B?@?B?B?@?B?@?B?@?B?@?B?@?B?@?@@B?@?@?@?B?@?@?@?B?@?@?B?@?@?B?@?B?@?@?B?@?B?@@B?@?B?@?B?@?B?@?B?@?B?@?B?@?@?B?@?@@@?@?B?@?@?@?@?@?@?@?@?@???@?@?@?@???@?@@??@?@???@???@?@???@?@???@???@?@???@?@???@?@???@?@??@@?@?@???@?@???@?@?@?@?@?@?@?@?@?@?B?@?@@B?@?B?@?B?B?@?B?B@B?B?B?D?B?B?D@B?D?D?B?D?D?B@D?D?D?D?D?D@D?D?D?D?F?D@D?F?D?F?D?F@D?F?D?F?D?D?F@D?D?D?F?D?B?D?D@D?D?B?D?D?B?D?B@D?B?D?B?D?B?D?B@B?D?B?B?D?B?B?D?B@B?B?D?B?B?B?D?B@B?B?D?B?B?B?D?B?B@B?B?D?B?B?B?B?B?D?B?B@B?B?B?B?B?B?B?B?D?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?@?B?B?B?B?@?B?B?B?B?@AB?B?B?@?B?B?@?B?B?B?@AB?B?@?B?B?@?B?B?@AB?B?B?@?B?B?@?BAB?@?B?B?B?@?BAB?B?@?B?B?@AB?B?B?@?B?BAB?@?B?B?B?BA@?B?B?B?BA@?B?B?B?B?BA@?B?B?B?BAB?B?B?B?@AB?B?B?B?BAB?B?@?B?BAB?B?B?B?BA@?B?B?B?B?BA@?B?B?B?B?@AB?B?B?B?@?BAB?B?B?B?@?BAB?B?B?B?B?BAB?B?@?B?B?BAB?B?B?B?BAB?B?B?B?B?BAB?B?B?B?B?BAB?B?B?B?B?BAB?B?B?B?B?B?B?BAB?B?@?B?B?B?B?B?BA@?B?B?B?B?B?B?B?@?B?BAB?B?B?B?B?B?B?B?B?B?@?B?B?B?B?B?B?B?B?B?B?B?@?B?B?B@B?@?B?B?B?@?B?@?B@B?@?B?@?B?B@@?B?@?B?@?B@@?B?@?B@@?B?@?B?@@B?@?B@@?B?@?B@@?B?@@B?@?B?@@B?@?B@@?B?@@B?@@B?@?@@B?@?B@@?@@B?@?@@B?@@B?@?@@B?@@@?B@@?@@B?@?B@@?@@B?@@B?@@B?@@@?B@@@B?@@B?B@@?B@@?B@@@B?B@@?B@B?@@B?B@@@B?B@@?B@B?@@B@B?@@B?B@@?B@B?@@B?B@@?B@B?@@B?B@@?B?B@B?@@B?B@@?B?B@B?@@B?B?@@B?B?@@B?B?@@B?@?B?B@@?B?@?B@@?B?@?@@B?@?B?@?@?B@@?@?B?@?@?B@@?@?B?@?@?B@@?B?@?B?@?B?@@B?@?B?@?B?B?@@B?B?@?B?B?B?@@B?B?B?B?@?B?B?B@B?B?@?B?B?B?B?B@B?B?B?B?B?B?B?B@B?B?B?D?B?B?D@B?D?D?B?D?D@B?D?D?D?B?D@D?D?B?D?D?B@D?D?B?D?B?D@B?D?B?D?B?D?B@B?B?B?B?B?B?B?B?B@B?B?@?B?B?@?B?@?B?@?B?@?B@@?@?B?@?@?@?@?B?@?@?@?@?@?@???@?@?@?@???@?@???@???@???@???@???????@???????@?????@??@@???@???@?@?@???@?@?@?@?@?@?@?@?@?B?@?B?@?@?B?B?@?B?B?B?B?B?B?B?B?B?D?B?D?B?D?D?D?D?F?D?F?F@D?F?H?F?H?F?H?J?H@H?H?J?H?H@H?F?H?F@F?H?F?F@F?F?F@F?F?F@F?F?F@F?F@F?F?F@F?F@F?D?F@F?F@F?D?F@F?D@F?F@F?D?F@F?F@D?F@F?D@F?F@F?F@D?F?F@D?F@F?F@F?D@F?F@F?F@D?F@F?F@F?F@F?F@F?F@F?F@F?F@F@H?F@F?F@F?F@H?F@F@F?F@H?F@F?F@H@F?F@F@H?F@F?F@H@F?F@F@H?F@F@F?H@F@F?H@F@F?F@H@F@F?H@F@F?F@F@H?F@F@F?H@F@F?F@F@H?F@F?F@F@F?H@F?F@F@F?F@F?F@H?F@F?F@F?F@F?F@F?F@F?F@F?F@F?F@F?F@F?F@F?F@F?F?F@F?F@D?F@F?F@F?F@F?F@D?F@F?F@F@F?F@F?F@D@F?F@F?F@F@F?F@F@F@F?F@F@F@F?F@F@F@F?F@D@F@F@F?F@F@F@F@F@F?F@D@F@F@F@F@F?F@D@F@F@F@F?F@D@F@F@F@F?F@D@F@F@F?F@F@F@F@F@F@H?F@F@F@F@F@H@F?F@F@H@F@F@F@H@F@F?H@F@F@H@F@F@F@H@F@F@F@H@F@F@F@F@HBF@F@F@F@H@F@F@F@FBH@F@F@F@F@H@FBF@F@F@H@F@F@F@H@F@F@F@F@H@F@F@H@F@F@F@H@F@F?H@F@F@H@F@H?F@F@H@F?H@F@H?F@F@H?F@H@F?H@F@H?F@H@F?H@F@H?F@H?F@H@F?H@F@H?F@F@H?F@H?F@H@F@H?F@H@F?F@H@F?H@F@H@F?F@H@F?H@F@F@H?F@H@F@F?H@F@H?F@F@H@F?H@F@F?H@F@H?F@H@F?H@F?F@H@F?H@F?H@F@H?F@H?F@H?F@H@F?H@F?H@F?H@H@F?H@F?H@H?F@H@F?H@H?F@H@F?H@H?F@H@F?H@H@F?H@H?F@H@F?H@H@F?H@F@H?F@H@F?H@F@H?H@F@F?H@F@H?F@H@F@H?F@H@F?H@F@H?F@F@H?F@H@F?F@H@F?H@F@H?F@F@H?F@H@F?H@F@F?H@F?H@F@H?F@F@H?F@F?H@F@H?F@F?H@F@H?F@F?H@F?H@F@F?H@F?F@H?F@F?H@F?F@H?F@H?F@F?H@F?H@F?F@H?F@H?F@H?F@H?F@H?F@H?F@H?F@H@F?H@H?F@H?F@H?H@F?H@F@H?F@H?F@H?H@F@H?F@H@F?H@H?F@H@F?H@H@F?H@F@H?H@F@H?H@F@H?F@H@H?F@H@F?H@H?F@H@F?H@H?F@H@H?F@H?F@H?H@F?H@F@H?H@F?H@H?F@H?F@H?F@F?H@F?H@F?F@H?F@F?F@H?F@F?F@F?H@F?F@F?F@F?F?F@F?F@F?F@F?F@F?F@F?F@F?F@H?F@F?F@F?F@H?F@F?F@F?H?F@F?H@F?F@H?F@H?F@F?H?F@H?F@H?F@H?F@H?F?H@F?H@H?F?H@F?H@H?F?H@H?H@F?H?H@H?F@H?H?F@H?H?H@F?H?H@F?H?H@H?F?H@H?F?H@H?H?F@H?H?H@F?H?H@F?H?H?H@F?H?H@F?H?H@F?H?H@F?H?H?F@H?H?H@F?H?F@H?H?F@H?F?H@H?F?H@H?F@H?F?H@H?F?H@H?F?H@F?H?H@F?H@H?F?H@H?F?H@H?F@H?F?H@H?H@F?H@F?H?H@F?H@F?H@F?H@F?H@F?H@F?H@F?H@F@H?F@F?H@F?H@F@F?H@F?F@H@F?H@F?F@H@F?H@F?H@F@F?H@F@H?F@H?F@H@H?F@H?F@H@F?H@H?F@H@F?H@H?F@H@F?H@H?F@H?F@H?H@F@H?F@H?H@F?H@F?H@H@F?H@F?H@H?F@H?H@F?H@F@H?F@H?F@H?F@H?F@H?F@F@H?F@H?F@F?H@F?F@H?F?F@F?H@F?F@F?F?F@F?F?F@F?F?F@D?F?F?F@F?D?F?F?D@F?F?D?F?D?F?D@F?D?D?F?D?F?D?D?F?D@F?D?F?D?D?F?D?F?D@F?D?F?D?F?D@F?D?F?D@D?F?D?F@D?F?D@D?F@D?F?D@F?D@F@F?D@F?D@F@D@F?F@D@F@F@D@F@F@D@F@F@F@DBF@F@FBF@DBF@F@DBF@DBFBD@FBD@FBDBD@DBFBDBD@DBDBDBDBD@DBDBDBDBDBDBDBDBDBBBDBDBDBBBDBDBDBBBDDDBBBDBDBBBDBDDBBDBBBDBDBBBDDBBDBBBDBDBBDDBBBDBBBDBBBDBBDDBBBDBBBDBBBDBBBDBBBDBBBDBBBDBBBDBBBDBBBBBDBBBDBBBBBDBBBDBBBDBBBBBDBBBBDDBBBDBBBBBDBBBBBDBBDBBDBBBBBDBBDDBBBBBDDBBBBDBBDDBBBDDBBDBBDDBBBDDBBDDDBBBDDDBBDDBDBDDBBDBDDDBDBDBBDDBDBDBDBDBBBDBDBDBDBDBBBDBDBDBDBDBDBDBB@DBDBDBDBDBD@DBBBDBDBD@DBDBDBDBDBBBDBDBD@DBDBDBDBDBDBDBDBDBDBBBDBFBDDDBDBDBDBDBDBFBDDFDHDHDHDHDHDFDHBFBDBFBFBBBDBD@DBB@D@BBB@B@B@B@B@B@B@@@B?@@B@@@@?@@B@@?@",
      precision: 6
    }
  end
end