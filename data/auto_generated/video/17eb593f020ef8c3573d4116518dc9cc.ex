defmodule Data.AutoGenerated.Video.Rendered_17eb593f020ef8c3573d4116518dc9cc do
  @moduledoc "#{"2021-08-06-louise-schroeder-strasse: Louise-Schroeder-Straße nach Altona"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2021-08-06-louise-schroeder-strasse: Louise-Schroeder-Straße nach Altona"
  end

  @impl Video.Rendered
  def hash() do
    "17eb593f020ef8c3573d4116518dc9cc"
  end

  @impl Video.Rendered
  def length_ms() do
    22022
  end

  @impl Video.Rendered
  def sources() do
    [{"2021-06-22-velo7-und-pauli-altona/GX011953", :start, "00:00:22.022"}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{minLon: 9.947634, minLat: 53.55095, maxLon: 9.956167, maxLat: 53.551748}
  end

  @impl Video.Rendered
  def renderer() do
    1
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Juni 2021", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Simon-von-Utrecht-Straße"},
      %{timestamp: 2002, text: "Louise-Schroeder-Straße"},
      %{timestamp: 15349, text: ""}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.956167, lat: 53.551748, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.956142, lat: 53.551747, time_offset_ms: 334},
      %Video.TimedPoint{lon: 9.956061, lat: 53.551747, time_offset_ms: 667},
      %Video.TimedPoint{lon: 9.955943, lat: 53.551745, time_offset_ms: 1001},
      %Video.TimedPoint{lon: 9.955818, lat: 53.55174, time_offset_ms: 1335},
      %Video.TimedPoint{lon: 9.955675, lat: 53.55173, time_offset_ms: 1668},
      %Video.TimedPoint{lon: 9.955521, lat: 53.551713, time_offset_ms: 2002},
      %Video.TimedPoint{lon: 9.955361, lat: 53.55169, time_offset_ms: 2336},
      %Video.TimedPoint{lon: 9.955219, lat: 53.551667, time_offset_ms: 2669},
      %Video.TimedPoint{lon: 9.95506, lat: 53.551638, time_offset_ms: 3003},
      %Video.TimedPoint{lon: 9.954921, lat: 53.551615, time_offset_ms: 3337},
      %Video.TimedPoint{lon: 9.95477, lat: 53.551588, time_offset_ms: 3670},
      %Video.TimedPoint{lon: 9.954648, lat: 53.551563, time_offset_ms: 4004},
      %Video.TimedPoint{lon: 9.954508, lat: 53.551532, time_offset_ms: 4338},
      %Video.TimedPoint{lon: 9.95437, lat: 53.5515, time_offset_ms: 4671},
      %Video.TimedPoint{lon: 9.954244, lat: 53.551468, time_offset_ms: 5005},
      %Video.TimedPoint{lon: 9.954112, lat: 53.551435, time_offset_ms: 5339},
      %Video.TimedPoint{lon: 9.953975, lat: 53.551398, time_offset_ms: 5672},
      %Video.TimedPoint{lon: 9.953854, lat: 53.551372, time_offset_ms: 6006},
      %Video.TimedPoint{lon: 9.953715, lat: 53.551357, time_offset_ms: 6340},
      %Video.TimedPoint{lon: 9.953579, lat: 53.551332, time_offset_ms: 6673},
      %Video.TimedPoint{lon: 9.953458, lat: 53.551297, time_offset_ms: 7007},
      %Video.TimedPoint{lon: 9.953341, lat: 53.55126, time_offset_ms: 7341},
      %Video.TimedPoint{lon: 9.953225, lat: 53.551228, time_offset_ms: 7674},
      %Video.TimedPoint{lon: 9.953104, lat: 53.551195, time_offset_ms: 8008},
      %Video.TimedPoint{lon: 9.95299, lat: 53.551167, time_offset_ms: 8342},
      %Video.TimedPoint{lon: 9.952858, lat: 53.551139, time_offset_ms: 8675},
      %Video.TimedPoint{lon: 9.952734, lat: 53.551112, time_offset_ms: 9009},
      %Video.TimedPoint{lon: 9.952616, lat: 53.551089, time_offset_ms: 9343},
      %Video.TimedPoint{lon: 9.952481, lat: 53.55107, time_offset_ms: 9676},
      %Video.TimedPoint{lon: 9.95236, lat: 53.551056, time_offset_ms: 10010},
      %Video.TimedPoint{lon: 9.952245, lat: 53.55104, time_offset_ms: 10344},
      %Video.TimedPoint{lon: 9.952118, lat: 53.551026, time_offset_ms: 10677},
      %Video.TimedPoint{lon: 9.951999, lat: 53.551015, time_offset_ms: 11011},
      %Video.TimedPoint{lon: 9.951866, lat: 53.551005, time_offset_ms: 11345},
      %Video.TimedPoint{lon: 9.951734, lat: 53.550995, time_offset_ms: 11678},
      %Video.TimedPoint{lon: 9.951603, lat: 53.55099, time_offset_ms: 12012},
      %Video.TimedPoint{lon: 9.951476, lat: 53.550984, time_offset_ms: 12346},
      %Video.TimedPoint{lon: 9.951326, lat: 53.550977, time_offset_ms: 12679},
      %Video.TimedPoint{lon: 9.951194, lat: 53.550973, time_offset_ms: 13013},
      %Video.TimedPoint{lon: 9.951062, lat: 53.550959, time_offset_ms: 13347},
      %Video.TimedPoint{lon: 9.950933, lat: 53.550951, time_offset_ms: 13680},
      %Video.TimedPoint{lon: 9.950785, lat: 53.55095, time_offset_ms: 14014},
      %Video.TimedPoint{lon: 9.950634, lat: 53.550952, time_offset_ms: 14348},
      %Video.TimedPoint{lon: 9.950489, lat: 53.550959, time_offset_ms: 14681},
      %Video.TimedPoint{lon: 9.950352, lat: 53.550972, time_offset_ms: 15015},
      %Video.TimedPoint{lon: 9.95021, lat: 53.550986, time_offset_ms: 15349},
      %Video.TimedPoint{lon: 9.950074, lat: 53.551004, time_offset_ms: 15682},
      %Video.TimedPoint{lon: 9.949952, lat: 53.55102, time_offset_ms: 16016},
      %Video.TimedPoint{lon: 9.949816, lat: 53.551039, time_offset_ms: 16350},
      %Video.TimedPoint{lon: 9.949695, lat: 53.551055, time_offset_ms: 16683},
      %Video.TimedPoint{lon: 9.949556, lat: 53.551072, time_offset_ms: 17017},
      %Video.TimedPoint{lon: 9.949428, lat: 53.55109, time_offset_ms: 17351},
      %Video.TimedPoint{lon: 9.949303, lat: 53.551109, time_offset_ms: 17684},
      %Video.TimedPoint{lon: 9.949162, lat: 53.551128, time_offset_ms: 18018},
      %Video.TimedPoint{lon: 9.949043, lat: 53.551146, time_offset_ms: 18352},
      %Video.TimedPoint{lon: 9.948904, lat: 53.551169, time_offset_ms: 18685},
      %Video.TimedPoint{lon: 9.948774, lat: 53.551186, time_offset_ms: 19019},
      %Video.TimedPoint{lon: 9.948657, lat: 53.551202, time_offset_ms: 19353},
      %Video.TimedPoint{lon: 9.948528, lat: 53.551222, time_offset_ms: 19686},
      %Video.TimedPoint{lon: 9.948391, lat: 53.551245, time_offset_ms: 20020},
      %Video.TimedPoint{lon: 9.948274, lat: 53.551268, time_offset_ms: 20354},
      %Video.TimedPoint{lon: 9.948141, lat: 53.551291, time_offset_ms: 20687},
      %Video.TimedPoint{lon: 9.948001, lat: 53.551315, time_offset_ms: 21021},
      %Video.TimedPoint{lon: 9.947893, lat: 53.551332, time_offset_ms: 21355},
      %Video.TimedPoint{lon: 9.947757, lat: 53.55135, time_offset_ms: 21688},
      %Video.TimedPoint{lon: 9.947634, lat: 53.551364, time_offset_ms: 22022}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "egpceByqt~Q?@?????@?????@???@?????@?@???@?@???@?@?B?@?@?@?B?@?B?B?B?B?B?D?B?D?D?D?D?F?D?F?H?H?H?J?H@L?N?L?P?N?L?N?L@J?L?J?L?J?L?J@J?L?J?J?L@J?J?J?J?J@L?J?J@L?J?J?L@J?L?J@L?L@J?L?L@L?L@L?L@L?N@L?L@N?L@L@L?N@L?N@L@N?L@N@L@N?N@L@N@N@L@N?N@N@N@L@N@N@N@L@P@N@N@N@N@N@N@N@N@NBN@N@P@N@N@LBN@N@N@L@N@LBN@L@L@N@L@L@L@LBL@L@L@L@L@L@LBL@L@L@NBN@L@NBN@NBN@N@NBN@NBN@PBN@N@NBL@NBN@N@LBN@L@L@L@LBL@L@L@L@J@LBL@L@L@J@L@LBL@L@N@LBL@N@LBN@N@NBL@NBN@NBN@N@LBN@L@LBL@L@LBL@J@L@JBJ@J@J@J@JBJ@J@J@J@HBJ@J@J@LBJ@JBL@J@LBJ@LBL@LBL@LBL@LBNBL@LBL@LBLBL@LBL@NBLBL@LBL@LBLBL@LBLBL@LBLBL@LBJ@LBL@JBLBL@JBJ@LBJBJ@LBJ@JBJ@LBJ@JBJ@JBLBJ@JBJ@LBJBL@JBL@JBJBL@JBLBJ@LBLBJ@LBJBLBL@LBJBLBL@LBLBLBLBLBL@LBLBNBLBLBL@LBLBJ@LBLBJ@LBJ@LBJ@J@JBJ@J@J@JBJ@J@H@J@J@JBJ@J@L@J@J@L@J@J@L@J@L@L@L@J@L@N@L@J@L@L@L@L@L@L@L@L@L@L@L@L@L@LBL@J@L@LBL@L@LBJ@LBJ@L@JBL@JBLBJ@JBJ@JBL@JBJBJ@JBJBJ@JBJBJBJ@JBJBJBJBJ@JBJBJBJ@JBJBJBJBJ@JBHBJBJ@JBJBHBJ@JBJBJ@HBJBJ@JBHBJ@JBJBH@JBJ@HBJBJ@JBJBH@JBJ@JBJBJ@JBLBJ@JBJBJ@JBLBJ@JBJ@JBJ@HBJBJ@JBJ@J@HBJ@HBJ@J@HBJ@H@JBH@J@HBJ@JBJ@J@JBJ@JBL@J@JBL@LBJ@LBL@JBL@LBL@JBL@LBJ@L@LBJ@LBJ@L@JBJ@J@LBJ@J@LBJ@J@JBJ@J@J@JBJ@J@J@J@JBJ@H@J@J@J@H@J@J@J@HBJ@J@J@J@J@J@L@J@L@J@L@J@L@L@L@L@L@LBL?L@L@L@J@L@L@J@L@L@J?J@L@J@J@J?J@J@J@J?J@J@J?H@J@J@J?J@H@J@J?J@H@J@J?H@J@J?H@J@J@H?J@J@J@H?J@J@J?J@L@J@J?J@L@J@J?L@J@L@J?L@J@J?L@J@J?J@L@J?J@J?J@J@J?J@H?J@J?J@J?J@H?J@J@J?J@J?J@L?J@J?L@J?L@J?L@J?L@L?L@L@J?L@L?J@L?L@L?L@J?L@L?J@L?L@L?J?L@L?J@L?J@L?J?L@L?J@L?J?L@L?J?L@J?L?J@L?J?L@L?J?L@J?J?L?J@J?L?J@J?L?J?J@J?J?J?L@J?J?J@L?J?J?L@J?L?J@L?L?L@N?L?L@N?N?L@N?N?N@N?L?N@L?N?L@N?L?L@N?L?L?L@J?L?L@J?L?J@L?J?L@J?J?L@J?L?J@L?J@L?L@J?L@J?L@J?L@L?J@L?L@J@L?J@L?J@L?J@L?J@L?J@J?L@J?L@J?J?L@J?J?L@J?J?L@L?J?L?L@L?L?L?L?L@L?N?L?L?N?N?L?N?L?N?L?N?L?N?N?L?N?L?N?N?L?N?L?N?N?LAN?N?L?N?L?LAN?L?N?NAL?L?N?LAL?N?LAL?NAL?L?LAL?LAN?L?LAL?LAL?LALAJ?LAL?LAJ?LAL?LALAL?JALAL?LALAL?LALAL?LALAL?LALALAL?LANALAL?LALALAL?LALALALAL?LALALALALALALAL?LALALAJALALAJ?LAJALAJAJAJ?JAJALAHAJ?JAJAJAJ?JAJAJAJAJAJ?LAJALAJALAJALALALALALALAL?LALALALALAJALAJALAJ?JALAJAJAJAJ?JAJAHAJ?JAJAJAJ?JAJAJALAJAL?JALAJALALALAL?LALANALALALALALALALAJ?LALALALAJALAJALAJ?JALAJALAJAJAJALAJ?JAJAJALAJAJAJAJAJAJ?LAJAJAJAJALAJAJAJALAJAL?LALALAJALALALANALALALCNALALANAJAL?LALAJALAJALAJAJAJAJAJ?HAJAJAHAJAJAJ?HAJAJAJALAJALAJALAJALCLALALALANALALANCLALALALALALALALAJALALALAJALAJALAL?JALAJAJALAJAJ?JAJAJALAHAJ?JAJAJAH?JAJAHAJAJ?HAJAJAHAJAJ?JAJAJAJAJAJALAJALAJAJALALAJALAJALAJALALAJALALALCLALALALALALALCLALALALALCLAJALAJALAJCLAJAJAJAJAJAHAJAJAHAJAJAHCJAJAJAHAJAJAJALAJAJCJALAJALAJALCLALAJALALCLALALAJALCLANALALCLALALANCLALANALCNALALAJALALAJAJAJALAHAJAJAHAJAH?HAHAHAHAH?HAHAJAHAH?JAJAJAJAJAJAJAL?LAJALALALANALANALANALAPANANANALALAJ?JAHAH?HAF?HAF?FAF?D?DAF?D?DAB?D?B",
      precision: 6
    }
  end
end
