defmodule Data.AutoGenerated.Video.Rendered_c3c9ef00fb70ed773bbcf7c742842973 do
  @moduledoc "#{"2021-05-06-valentinskamp: Valentinskamp (Richtung Johannes-Brahms-Platz)"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2021-05-06-valentinskamp: Valentinskamp (Richtung Johannes-Brahms-Platz)"
  end

  @impl Video.Rendered
  def hash() do
    "c3c9ef00fb70ed773bbcf7c742842973"
  end

  @impl Video.Rendered
  def length_ms() do
    24825
  end

  @impl Video.Rendered
  def sources() do
    [{"2022-08-14-geesthacht-rev/GX014575", "00:00:03.737", :end}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.979926479041916,
      minLat: 53.555364,
      maxLon: 9.988158786786787,
      maxLat: 53.555763
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "August 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.988158786786787, lat: 53.555470006006004, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.98815, lat: 53.555474, time_offset_ms: 266},
      %Video.TimedPoint{lon: 9.988099, lat: 53.555493, time_offset_ms: 600},
      %Video.TimedPoint{lon: 9.988035, lat: 53.555521, time_offset_ms: 933},
      %Video.TimedPoint{lon: 9.987962, lat: 53.555556, time_offset_ms: 1267},
      %Video.TimedPoint{lon: 9.98788, lat: 53.555595, time_offset_ms: 1601},
      %Video.TimedPoint{lon: 9.987776, lat: 53.555633, time_offset_ms: 1934},
      %Video.TimedPoint{lon: 9.987648, lat: 53.555659, time_offset_ms: 2268},
      %Video.TimedPoint{lon: 9.987508, lat: 53.555665, time_offset_ms: 2601},
      %Video.TimedPoint{lon: 9.987362, lat: 53.555667, time_offset_ms: 2935},
      %Video.TimedPoint{lon: 9.987211, lat: 53.555675, time_offset_ms: 3269},
      %Video.TimedPoint{lon: 9.987056, lat: 53.555677, time_offset_ms: 3602},
      %Video.TimedPoint{lon: 9.986908, lat: 53.555681, time_offset_ms: 3936},
      %Video.TimedPoint{lon: 9.986761, lat: 53.555685, time_offset_ms: 4269},
      %Video.TimedPoint{lon: 9.98662, lat: 53.555697, time_offset_ms: 4603},
      %Video.TimedPoint{lon: 9.986483, lat: 53.555714, time_offset_ms: 4937},
      %Video.TimedPoint{lon: 9.986348, lat: 53.555727, time_offset_ms: 5270},
      %Video.TimedPoint{lon: 9.986215, lat: 53.555733, time_offset_ms: 5604},
      %Video.TimedPoint{lon: 9.986089, lat: 53.555731, time_offset_ms: 5937},
      %Video.TimedPoint{lon: 9.985961, lat: 53.555723, time_offset_ms: 6271},
      %Video.TimedPoint{lon: 9.985836, lat: 53.555719, time_offset_ms: 6605},
      %Video.TimedPoint{lon: 9.985714, lat: 53.55572, time_offset_ms: 6938},
      %Video.TimedPoint{lon: 9.985588, lat: 53.555723, time_offset_ms: 7272},
      %Video.TimedPoint{lon: 9.985465, lat: 53.555732, time_offset_ms: 7605},
      %Video.TimedPoint{lon: 9.985341, lat: 53.555741, time_offset_ms: 7939},
      %Video.TimedPoint{lon: 9.985213, lat: 53.555746, time_offset_ms: 8272},
      %Video.TimedPoint{lon: 9.985086, lat: 53.555751, time_offset_ms: 8606},
      %Video.TimedPoint{lon: 9.984962, lat: 53.555756, time_offset_ms: 8940},
      %Video.TimedPoint{lon: 9.984836, lat: 53.555759, time_offset_ms: 9273},
      %Video.TimedPoint{lon: 9.984711, lat: 53.55576, time_offset_ms: 9607},
      %Video.TimedPoint{lon: 9.984586, lat: 53.555761, time_offset_ms: 9940},
      %Video.TimedPoint{lon: 9.984464, lat: 53.555763, time_offset_ms: 10274},
      %Video.TimedPoint{lon: 9.984339, lat: 53.555763, time_offset_ms: 10608},
      %Video.TimedPoint{lon: 9.984216, lat: 53.555759, time_offset_ms: 10941},
      %Video.TimedPoint{lon: 9.98409, lat: 53.555746, time_offset_ms: 11275},
      %Video.TimedPoint{lon: 9.983961, lat: 53.555739, time_offset_ms: 11608},
      %Video.TimedPoint{lon: 9.983835, lat: 53.555734, time_offset_ms: 11942},
      %Video.TimedPoint{lon: 9.98371, lat: 53.555731, time_offset_ms: 12276},
      %Video.TimedPoint{lon: 9.983581, lat: 53.555731, time_offset_ms: 12609},
      %Video.TimedPoint{lon: 9.983454, lat: 53.555732, time_offset_ms: 12943},
      %Video.TimedPoint{lon: 9.983322, lat: 53.555724, time_offset_ms: 13276},
      %Video.TimedPoint{lon: 9.983186, lat: 53.555715, time_offset_ms: 13610},
      %Video.TimedPoint{lon: 9.983057, lat: 53.55571, time_offset_ms: 13944},
      %Video.TimedPoint{lon: 9.982927, lat: 53.555708, time_offset_ms: 14277},
      %Video.TimedPoint{lon: 9.982795, lat: 53.555704, time_offset_ms: 14611},
      %Video.TimedPoint{lon: 9.982667, lat: 53.555701, time_offset_ms: 14944},
      %Video.TimedPoint{lon: 9.982537, lat: 53.555697, time_offset_ms: 15278},
      %Video.TimedPoint{lon: 9.982406, lat: 53.555694, time_offset_ms: 15612},
      %Video.TimedPoint{lon: 9.982279, lat: 53.555689, time_offset_ms: 15945},
      %Video.TimedPoint{lon: 9.982152, lat: 53.555686, time_offset_ms: 16279},
      %Video.TimedPoint{lon: 9.982025, lat: 53.555683, time_offset_ms: 16612},
      %Video.TimedPoint{lon: 9.981902, lat: 53.555682, time_offset_ms: 16946},
      %Video.TimedPoint{lon: 9.981779, lat: 53.555675, time_offset_ms: 17280},
      %Video.TimedPoint{lon: 9.981657, lat: 53.555663, time_offset_ms: 17613},
      %Video.TimedPoint{lon: 9.981536, lat: 53.555654, time_offset_ms: 17947},
      %Video.TimedPoint{lon: 9.981412, lat: 53.555646, time_offset_ms: 18280},
      %Video.TimedPoint{lon: 9.981287, lat: 53.555638, time_offset_ms: 18614},
      %Video.TimedPoint{lon: 9.981166, lat: 53.555626, time_offset_ms: 18948},
      %Video.TimedPoint{lon: 9.981048, lat: 53.555607, time_offset_ms: 19281},
      %Video.TimedPoint{lon: 9.980929, lat: 53.555587, time_offset_ms: 19615},
      %Video.TimedPoint{lon: 9.980822, lat: 53.555562, time_offset_ms: 19948},
      %Video.TimedPoint{lon: 9.980718, lat: 53.555526, time_offset_ms: 20282},
      %Video.TimedPoint{lon: 9.980618, lat: 53.555486, time_offset_ms: 20616},
      %Video.TimedPoint{lon: 9.98053, lat: 53.555442, time_offset_ms: 20949},
      %Video.TimedPoint{lon: 9.980459, lat: 53.555406, time_offset_ms: 21283},
      %Video.TimedPoint{lon: 9.980434, lat: 53.55539, time_offset_ms: 21616},
      %Video.TimedPoint{lon: 9.980416, lat: 53.555376, time_offset_ms: 21950},
      %Video.TimedPoint{lon: 9.980346, lat: 53.555364, time_offset_ms: 22284},
      %Video.TimedPoint{lon: 9.980275, lat: 53.555398, time_offset_ms: 22617},
      %Video.TimedPoint{lon: 9.980212, lat: 53.555437, time_offset_ms: 22951},
      %Video.TimedPoint{lon: 9.980151, lat: 53.555474, time_offset_ms: 23284},
      %Video.TimedPoint{lon: 9.980092, lat: 53.555508, time_offset_ms: 23618},
      %Video.TimedPoint{lon: 9.98004, lat: 53.555537, time_offset_ms: 23952},
      %Video.TimedPoint{lon: 9.979996, lat: 53.555563, time_offset_ms: 24285},
      %Video.TimedPoint{lon: 9.979953, lat: 53.55559, time_offset_ms: 24619},
      %Video.TimedPoint{lon: 9.979926479041916, lat: 53.555606652694614, time_offset_ms: 24825}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "kpwceBsas`R????A??@???????????@????A@???@???@A@?@??A@?@?@A@?@AB?@A@?BA@A@?BABA@?BABABABABABABADABADADADCDADCFAFCFCFCFCHCHCHCHCFCFCFCFAFCFCDAFCFCFCFCFCFADCFCFCFCFAFCFCFCFCFCFCFAFCFCFCHCFCFCFCHCFCFAHCFCHCHCFCHCHCHCHCHCHCHAHCJCHCJCHCHAJCHCJCJAHCJCJAJCJAJCJAJCJALAJCLAJALAJALAJCLAJ?LAJALALALAL?JALAL?LAL?LAL?LAL?L?LAL?L?LAL?L?L?L?LAN?L?L?L?LAL?N?L?L?NAL?L?N?L?LAN?L?L?NAN?L?L?NAL?N?LAN?N?LAN?N?L?NAL?N?L?NAN?N?L?NAN?N?L?N?NAN?N?N?L?N?NAN?L?N?L?N?NAN?L?N?L?L?NAL?N?L?N?L?LAN?L?L?N?LAL?L?N?L?NAL?L?N?LAN?L?L?NAL?N?LAL?N?LAL?L?LAN?LAL?L?LAL?LAL?LANAL?LAL?LALAL?LAJAL?LALAL?LALALAL?LALALAJ?LALALALAL?LAJALAL?LALAL?JALALAL?LAJAL?LALAL?JAL?LAJ?LAL?LAJ?LAL?LAJ?LAL?J?LAL?J?L?LAL?J?L?JAL?J?L?J?L?J?L?J?J?L?J?J?L?J?J?J?L?J?J?J@J?L?J?J?J@L?J?L?J@J?L?J?J@L?J?L@J?L?J@L?J?J?L@J?J?L@J?L?J?J@J?L?J?J?J@L?J?J?J?J?J?L@J?J?J?J?J?J?L?J?J?J?J?J?J?J?J?J?J?J?L?J?J?JAJ?J?L?J?J?J?J?LAJ?J?L?J?JAL?J?J?L?JAJ?J?LAJ?J?JAJ?L?JAJ?J?JAL?JAJ?J?JAJ?JAJ?L?JAJ?JAJ?JAL?J?JAJ?JAJ?J?LAJ?JAJ?J?LAJ?JAJ?L?JAJ?L?JAJ?L?JAL?J?L?JAL?J?JAL?J?L?JAJ?L?J?LAJ?J?L?JAJ?L?J?LAJ?J?L?JAJ?L?J?JAJ?L?J?JAJ?L?J?JAJ?J?J?LAJ?J?J?J?JAL?J?J?J?JAL?J?J?J?LAJ?L?J?J?J?L?JAJ?L?J?J?L?J?J?JAL?J?J?L?J?J?J?J?L?J?J?LAJ?J?J?J?L?J?J?J?L?J?J?J?L?J?J?L?JAJ?L?J?J?J?J?L?J?J?J?J?L?J?J?JAJ?J?J?J?J?J?J?L?J?J?J?J?J?J?J?JAJ?L?J?J?J?J?J?L?J?J?L?J?J?J@L?J?J?J?J?L?J?J?J?J@L?J?J?J?J@J?J?L?J@J?J?J@J?J?J@J?L@J?J?J@L?J@J?J@L?J@J?L@J?J@L?J@J?L@J?L@J?L@J?J@L?L@J?L?J@L?J@L?J?J@L?J?L@J?J?L@J?L?J@J?L?J?J@L?J?J?L@J?J?J?L@J?J?J?J?L@J?J?J?L?J?J@J?J?J?L?J?J@J?L?J?J?J?L?J?J?L?J?J@L?J?L?J?L?J?L?J?L?J?L?J?J?L?J?L?J?L?J?J?L?J?J?L?J?J?J?L?J?J?L?J?J?J@L?J?J?L?J?L@J?L?J?L@L?J?L@L?J?L@L?J?L@J?L@L?L?L@J?L@L?L?L@J?L@L?L@L?L?L@L?L@J?L?L@J?L?L@L?J?L@J?L?J?J@L?J?L@J?J?L?J?J@L?J?J?L?J@L?J?L?J?L?J@L?J?J?L?L?J?L@J?L?J?J?L?L?J@L?L?J?L?J?L@J?L?L?J?L?L@J?L?J?L?L@J?L?J?L?J?L@J?L?J?J?L?J@J?L?J?L?J?J@J?L?J?L?J?L@J?J?L?J?L?J@L?J?L?J?L@J?L?J?L?J?L@J?L?L?J?L@J?L?J?L?J?L@L?J?L?J?L@J?L?J?L?J@L?J?L?J?J@L?J?L?J?J@L?J?L?J?J@J?L?J?J?J@L?J?L?J?J@J?L?J?J?L?J@L?J?J?L?J?J@J?L?J?L?J?J?L@J?L?J?J?L?J?L@J?L?J?J?J?L?J?J@J?L?J?J?J?L?J?J?J@J?J?J?L?J?J?J@J?J?J?J?J?J@L?J?J?J@J?J?J@J?J?L@J?J?J@J?J@J?J?J@L?J@J?J@J?J@L?J@J?J@J?J@L?J@J?J@J?J@J?J@J?J@J?J@J?J@J?J@J?J@J?J@L?J@J?J@J?J?J@J?J@J?J@J?J?J@L?J@J?J@L?J?J@J?J@L?J?J@J?J@L?J?J@L?J@J?J@L?J?J@J?L@J?J@J?L@J?J@J?J@J?L@J?J@J?J@J?J@J@J?J@J?J@J@J?J@J@J@J?J@J@J@J?J@J@J@J@J?J@J@H@J@J@J@J@J@J@J@J?J@J@J@J@J@J@J@J@JBJ@J@J@J@J@J@J@J@H@J@JBH@J@J@H@J@HBJ@H@J@H@HBJ@H@H@HBH@H@JBH@HBH@HBH@JBH@HBH@HBJBH@HBHBJBH@HBJBHBHBH@HBJBHBHBHBJBHBHBHBHBHBHBHBHBHBHBHBHBHDHBHBHBFBHBHBHDHBHBHBFDHBHBHDHBHBHDHBHDHBHDHDHBHDHDJBFDHBHBFBFBFBFBDBFBD@DBD@DBB@D@B@B@B@B@B@B@B?@@B@@?B@@?@@@?@?@@@?@@@?@?@@@?@??@@?@?@?@@??@?@?@@??@?@?@@@???@@@?B?@?@@@?B?@@B?B?@@B?B?B@B?B?D?B@B?D?B?D?B?D?B?D?DAD?D?DAD?DAF?FAFAFAFAHAFAHAHAHCHAHCHCHCFAHCFCFCFCFCDCFCFCFCDCFCDCFCDCDAFCDCDCDCFCDCDCDCDCFCDADCDCDCDCFCDCDCDADCDCDCDCDCFADCDCDCDCDADCDCDCDADCDCDCDADCDCDADCBCDADCDADCBADCDABCDABCDADCBADCBABCDABADCBADCBADCDABCDCDABCDABCDABABCBABABABABABCBABA@ABABABA@ABA@AB?@ABA@ABA@A@AB?@A@A@AB?@A@A@A@?@A@?@A@A@?@A@?@A@",
      precision: 6
    }
  end
end