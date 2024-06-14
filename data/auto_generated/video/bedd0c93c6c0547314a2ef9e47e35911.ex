defmodule Data.AutoGenerated.Video.Rendered_bedd0c93c6c0547314a2ef9e47e35911 do
  @moduledoc "#{"2022-11-15-vierlandenstrasse: Vierlandenstraße nach Süden"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-11-15-vierlandenstrasse: Vierlandenstraße nach Süden"
  end

  @impl Video.Rendered
  def hash() do
    "bedd0c93c6c0547314a2ef9e47e35911"
  end

  @impl Video.Rendered
  def length_ms() do
    13775
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2024-05-14-vr8/GX017551", "00:00:11.612", :end},
      {"2024-05-14-vr8/GX017552", :start, "00:00:01.034"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.209072,
      minLat: 53.48437622522522,
      maxLon: 10.210485,
      maxLat: 53.487337113772455
    }
  end

  @impl Video.Rendered
  def renderer() do
    5
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Mai 2024"}]
  end

  @impl Video.Rendered
  def street_names() do
    [
      %{timestamp: 0, text: "Vierlandenstraße"},
      %{timestamp: 13742, text: "Curslacker Neuer Deich"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.210475035928145, lat: 53.487337113772455, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.210485, lat: 53.487326, time_offset_ms: 64},
      %Video.TimedPoint{lon: 10.210472, lat: 53.48725, time_offset_ms: 398},
      %Video.TimedPoint{lon: 10.210445, lat: 53.487165, time_offset_ms: 731},
      %Video.TimedPoint{lon: 10.210407, lat: 53.487081, time_offset_ms: 1065},
      %Video.TimedPoint{lon: 10.21036, lat: 53.487001, time_offset_ms: 1398},
      %Video.TimedPoint{lon: 10.210323, lat: 53.486922, time_offset_ms: 1732},
      %Video.TimedPoint{lon: 10.21029, lat: 53.486834, time_offset_ms: 2066},
      %Video.TimedPoint{lon: 10.210253, lat: 53.486745, time_offset_ms: 2399},
      %Video.TimedPoint{lon: 10.210206, lat: 53.486656, time_offset_ms: 2733},
      %Video.TimedPoint{lon: 10.210151, lat: 53.486561, time_offset_ms: 3066},
      %Video.TimedPoint{lon: 10.210109, lat: 53.486465, time_offset_ms: 3400},
      %Video.TimedPoint{lon: 10.210075, lat: 53.486372, time_offset_ms: 3734},
      %Video.TimedPoint{lon: 10.210052, lat: 53.486277, time_offset_ms: 4067},
      %Video.TimedPoint{lon: 10.210025, lat: 53.486181, time_offset_ms: 4401},
      %Video.TimedPoint{lon: 10.209982, lat: 53.486084, time_offset_ms: 4734},
      %Video.TimedPoint{lon: 10.209937, lat: 53.485986, time_offset_ms: 5068},
      %Video.TimedPoint{lon: 10.209893, lat: 53.485888, time_offset_ms: 5402},
      %Video.TimedPoint{lon: 10.209854, lat: 53.485793, time_offset_ms: 5735},
      %Video.TimedPoint{lon: 10.209815, lat: 53.4857, time_offset_ms: 6069},
      %Video.TimedPoint{lon: 10.209783, lat: 53.485601, time_offset_ms: 6402},
      %Video.TimedPoint{lon: 10.209762, lat: 53.485507, time_offset_ms: 6736},
      %Video.TimedPoint{lon: 10.209735, lat: 53.485417, time_offset_ms: 7070},
      %Video.TimedPoint{lon: 10.209713, lat: 53.485325, time_offset_ms: 7403},
      %Video.TimedPoint{lon: 10.209692, lat: 53.485235, time_offset_ms: 7737},
      %Video.TimedPoint{lon: 10.209678, lat: 53.485144, time_offset_ms: 8070},
      %Video.TimedPoint{lon: 10.209669, lat: 53.485052, time_offset_ms: 8404},
      %Video.TimedPoint{lon: 10.20964, lat: 53.484962, time_offset_ms: 8738},
      %Video.TimedPoint{lon: 10.209602, lat: 53.484872, time_offset_ms: 9071},
      %Video.TimedPoint{lon: 10.209545, lat: 53.484787, time_offset_ms: 9405},
      %Video.TimedPoint{lon: 10.209465, lat: 53.484709, time_offset_ms: 9738},
      %Video.TimedPoint{lon: 10.209385, lat: 53.484635, time_offset_ms: 10072},
      %Video.TimedPoint{lon: 10.209311, lat: 53.484568, time_offset_ms: 10406},
      %Video.TimedPoint{lon: 10.209234, lat: 53.484522, time_offset_ms: 10739},
      %Video.TimedPoint{lon: 10.209186, lat: 53.484499, time_offset_ms: 11073},
      %Video.TimedPoint{lon: 10.209148, lat: 53.484488, time_offset_ms: 11406},
      %Video.TimedPoint{lon: 10.209107, lat: 53.484481, time_offset_ms: 11740},
      %Video.TimedPoint{lon: 10.209076, lat: 53.48447, time_offset_ms: 12074},
      %Video.TimedPoint{lon: 10.209072, lat: 53.484457, time_offset_ms: 12407},
      %Video.TimedPoint{lon: 10.209108, lat: 53.484425, time_offset_ms: 12741},
      %Video.TimedPoint{lon: 10.209113, lat: 53.48442, time_offset_ms: 13075},
      %Video.TimedPoint{lon: 10.209144, lat: 53.484402, time_offset_ms: 13408},
      %Video.TimedPoint{lon: 10.209183, lat: 53.484379, time_offset_ms: 13742},
      %Video.TimedPoint{lon: 10.209187162162161, lat: 53.48437622522522, time_offset_ms: 13775}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "wlr_eB}ienR??@?@?B?@?@?B@B?B?@?D?B?B@D?D?D@D?F@F?F@H@J@J@L@J@J@F@HBH@F@H@FBH@F@FBH@FBF@HBF@FBF@HBF@FBHBFBF@FBFBHBF@FBFBHBFBFBFBFBFBHBFBFBFBFBFDFBFBHBFBFBFDFBFBFBFBFDFBFBFBFBFBFBFBFBFBDBFBFBFBFBFBFBDBF@FBFBFBFBF@FBFBFBF@FBHBFBF@FBHBFBF@HBFBHBFBH@FBHBFBF@HBFBHBF@HBFBHBFBHBF@HBFBFBHBFBHBFBHBFBFBHBFBHBFBHBFBFBHDFBHBFBFBHDFBHBFDHBFBHDFBHDFBHDFBHDHBFDHDHBHDHDFBHDHDHBHDHDFBHDHBHDHBFDHBHDHBHBFBHDHBHBHBFDHBHBHBHBFBHBHBHBFBHBHBH@FBHBFBHBH@FBHBH@FBHBF@HBH@FBH@HBF@HBH@FBH@H@HBF@H@HBF@H@H@HBF@H@H@HBF@H@H@HBF@H@H@HBF@H@HBH@FBH@H@HBH@FBH@HBHBF@HBHBH@HBHBFBHBHBHBHBHBHBHBHBFBHBHBHBHDHBHBHBHBFDHBHBHBHBHDHBFBHBHDHBHBHBHBHDHBHBHBHDHBFBHBHBHDHBHBHBHBHDHBHBHBFBHDHBHBHBHBFBHBHBHBHBHBFBHBHBHBFBHBHBHBFBHBHBFBHBHBFBHBHBFBHBH@FBHBFBHBHBFBHBH@FBHBFBHBH@HBFBHBHBH@HBHBHBH@HBHBH@HBH@HBHBH@H@HBH@HBF@H@HBH@H@F@HBH@F@H@H@HBF@H@F@H@H@FBH@F@H@H@FBH@F@H@F@HBF@H@F@HBF@H@F@HBF@H@F@H@FBH@F@H@FBH@H@F@H@F@HBH@F@H@H@F@H@F@H@FBH@H@F@H@F@H@F@H@F@H@F@H@F@H@F@H@F@F@H@F?H@H@F@H@F@H@F?H@F@H@F?H@H@F?H@F@H?F@H@F?H@H?F@H@F?H@F?H@H@F?H@F@H?H@F@H?F@H@F@H@F@H@H@F@H@F@H@F@FBH@F@HBH@F@HBF@FBH@FBHBF@HBFBH@FBHBHBFBHBFBHBFBHBFBHBFBFBHBFDFBHBFDHBFDFBHDFBFDFDHBFDFDFDHDFDFDFDFFFDFDFFFDFFFDHFFDFFFFFDFFFFFFFFFFDFFFFFFFFFFFFFFFFFDFFFFFFFDFFFFFFFDFFFFFDFFFFFDFFFFFDFFFDFFFDDFFDFFFDFFFDFDFFHDFDFDFFFDFDFDFDHDFDFDHDFDHDFDHDFBFDHDHBFBFDFBFBFBFBFBD@FBD@FBD@D@DBB@D@D@B@D@B@D@B@D@B@D@D@B@D@B@D@BBB@B@B@B@B@B@@@B@@@B?@@B@@@@?@@@@B?@@@@@?@@@?@@@?@@@?@@@?@@??@@@?@?@@??@@@?@??@@?@@??@?@@??@??@@???@@??@??@@????@@?????@@?????@??@????@?????@?????@???@???@A??@?@??A@?@A@?@A@?@A@ABA@A@A@A@A@?@A@A@?@A??@A@???@A????@A??????@??A??@????A@??A@???@A??@A@A@??A@A@A@?@A@A@A@A@A@A@A@A@ABA@C@A@ABA@C@A@A@C?A@A@A@A?A@A?A@A@A?A@A?A@A",
      precision: 6
    }
  end
end