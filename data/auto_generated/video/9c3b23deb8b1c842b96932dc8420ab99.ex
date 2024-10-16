defmodule Data.AutoGenerated.Video.Rendered_9c3b23deb8b1c842b96932dc8420ab99 do
  @moduledoc "#{"ahrensburg-a8: Erlenhof → Schlosspark"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "ahrensburg-a8: Erlenhof → Schlosspark"
  end

  @impl Video.Rendered
  def hash() do
    "9c3b23deb8b1c842b96932dc8420ab99"
  end

  @impl Video.Rendered
  def length_ms() do
    69879
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-10-16-ahrensburg2/GX014938", "00:00:49.373", "00:01:44.404"},
      {"2022-10-16-ahrensburg2/GX014936", "00:00:02.703", "00:00:07.941"},
      {"2022-10-16-ahrensburg2/GX014936", "00:00:11.378", "00:00:21.488"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.240612,
      minLat: 53.67931948951049,
      maxLon: 10.243026734265735,
      maxLat: 53.6957921235012
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
    [%{timestamp: 0, text: "Lübecker Straße"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.242127946043166, lat: 53.6957921235012, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.241948, lat: 53.695537, time_offset_ms: 1334},
      %Video.TimedPoint{lon: 10.241789, lat: 53.695197, time_offset_ms: 3002},
      %Video.TimedPoint{lon: 10.24163, lat: 53.694775, time_offset_ms: 5004},
      %Video.TimedPoint{lon: 10.241566, lat: 53.694473, time_offset_ms: 6338},
      %Video.TimedPoint{lon: 10.241466, lat: 53.694249, time_offset_ms: 7339},
      %Video.TimedPoint{lon: 10.241442, lat: 53.6941, time_offset_ms: 8006},
      %Video.TimedPoint{lon: 10.2414, lat: 53.693525, time_offset_ms: 10341},
      %Video.TimedPoint{lon: 10.241413, lat: 53.693292, time_offset_ms: 11342},
      %Video.TimedPoint{lon: 10.241406, lat: 53.692985, time_offset_ms: 12676},
      %Video.TimedPoint{lon: 10.241368, lat: 53.692407, time_offset_ms: 15012},
      %Video.TimedPoint{lon: 10.241326, lat: 53.691926, time_offset_ms: 17013},
      %Video.TimedPoint{lon: 10.241311, lat: 53.691842, time_offset_ms: 17347},
      %Video.TimedPoint{lon: 10.241247, lat: 53.69168, time_offset_ms: 18014},
      %Video.TimedPoint{lon: 10.241098, lat: 53.689708, time_offset_ms: 25353},
      %Video.TimedPoint{lon: 10.241086, lat: 53.689443, time_offset_ms: 26354},
      %Video.TimedPoint{lon: 10.241103, lat: 53.689356, time_offset_ms: 26688},
      %Video.TimedPoint{lon: 10.241108, lat: 53.689179, time_offset_ms: 27355},
      %Video.TimedPoint{lon: 10.240997, lat: 53.687954, time_offset_ms: 32025},
      %Video.TimedPoint{lon: 10.24094, lat: 53.68768, time_offset_ms: 33026},
      %Video.TimedPoint{lon: 10.240882, lat: 53.686846, time_offset_ms: 36028},
      %Video.TimedPoint{lon: 10.240814, lat: 53.686316, time_offset_ms: 38030},
      %Video.TimedPoint{lon: 10.240759, lat: 53.685732, time_offset_ms: 40365},
      %Video.TimedPoint{lon: 10.24076, lat: 53.685662, time_offset_ms: 40699},
      %Video.TimedPoint{lon: 10.240782, lat: 53.685592, time_offset_ms: 41032},
      %Video.TimedPoint{lon: 10.240786, lat: 53.685513, time_offset_ms: 41366},
      %Video.TimedPoint{lon: 10.240745, lat: 53.685256, time_offset_ms: 42367},
      %Video.TimedPoint{lon: 10.240731, lat: 53.685083, time_offset_ms: 43034},
      %Video.TimedPoint{lon: 10.240736, lat: 53.684905, time_offset_ms: 43701},
      %Video.TimedPoint{lon: 10.240773, lat: 53.684731, time_offset_ms: 44368},
      %Video.TimedPoint{lon: 10.240756, lat: 53.684479, time_offset_ms: 45369},
      %Video.TimedPoint{lon: 10.24069, lat: 53.683862, time_offset_ms: 47704},
      %Video.TimedPoint{lon: 10.240674, lat: 53.683598, time_offset_ms: 48705},
      %Video.TimedPoint{lon: 10.240651, lat: 53.683507, time_offset_ms: 49039},
      %Video.TimedPoint{lon: 10.240612, lat: 53.683422, time_offset_ms: 49372},
      %Video.TimedPoint{lon: 10.24062, lat: 53.683339, time_offset_ms: 49706},
      %Video.TimedPoint{lon: 10.240658, lat: 53.683265, time_offset_ms: 50040},
      %Video.TimedPoint{lon: 10.240731, lat: 53.682823, time_offset_ms: 52041},
      %Video.TimedPoint{lon: 10.240786, lat: 53.682693, time_offset_ms: 52708},
      %Video.TimedPoint{lon: 10.240875, lat: 53.682571, time_offset_ms: 53376},
      %Video.TimedPoint{lon: 10.240945, lat: 53.68243, time_offset_ms: 54043},
      %Video.TimedPoint{lon: 10.241138802821512, lat: 53.682106196824755, time_offset_ms: 54781},
      %Video.TimedPoint{lon: 10.241262014715195, lat: 53.681895674191935, time_offset_ms: 56081},
      %Video.TimedPoint{lon: 10.24130081349182, lat: 53.68182249699727, time_offset_ms: 56415},
      %Video.TimedPoint{lon: 10.241317, lat: 53.68166, time_offset_ms: 57082},
      %Video.TimedPoint{lon: 10.241339, lat: 53.68158, time_offset_ms: 57416},
      %Video.TimedPoint{lon: 10.241686, lat: 53.681084, time_offset_ms: 59751},
      %Video.TimedPoint{lon: 10.241774616766467, lat: 53.680996473053895, time_offset_ms: 59769},
      %Video.TimedPoint{lon: 10.241788, lat: 53.680959, time_offset_ms: 60067},
      %Video.TimedPoint{lon: 10.241863, lat: 53.680854, time_offset_ms: 60734},
      %Video.TimedPoint{lon: 10.241914, lat: 53.680804, time_offset_ms: 61068},
      %Video.TimedPoint{lon: 10.242056, lat: 53.680751, time_offset_ms: 61735},
      %Video.TimedPoint{lon: 10.242121, lat: 53.680714, time_offset_ms: 62069},
      %Video.TimedPoint{lon: 10.24257, lat: 53.680047, time_offset_ms: 65738},
      %Video.TimedPoint{lon: 10.242676, lat: 53.679835, time_offset_ms: 66739},
      %Video.TimedPoint{lon: 10.24281, lat: 53.679634, time_offset_ms: 67740},
      %Video.TimedPoint{lon: 10.242848, lat: 53.67956, time_offset_ms: 68073},
      %Video.TimedPoint{lon: 10.242862, lat: 53.679486, time_offset_ms: 68407},
      %Video.TimedPoint{lon: 10.242857, lat: 53.679421, time_offset_ms: 68740},
      %Video.TimedPoint{lon: 10.242886, lat: 53.679379, time_offset_ms: 69074},
      %Video.TimedPoint{lon: 10.243026734265735, lat: 53.67931948951049, time_offset_ms: 69879}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "_qileBiccpR@@@@@@B@@@@@B?@BB@B@@@BBB@B@BBD@BBB@BBFDDBFDFBDDFBDDFDFBFDDBFDFDDBFDFBDDFBDDFBDDFBDBFDDBFDDBDBFBDBDDFBDBDBDBFBDDDBDBDBFBDBDBDBFBDBDBDBFBDBDBDBFBDBDBDBFBDBDBD@FBDBDBFBDBDBFBD@DBDBFBDBDBF@DBDBFBDBD@FBDBDBF@DBDBFBD@DBFBDBD@FBDBD@FBDBD@FBDBD@FBDBF@DBDBF@DBF@DBFBD@DBFBD@FBD@FBDBF@DBF@DBFBD@FBD@FBDBF@DBF@DBD@FBD@FBD@FBD@FBD@DBF@DBF@DBF@DBF@DBD@FBD@FBD@FBD@FBD@DBF@D@FBD@FBD@FBD@FBD@F@DBF@DBD@F@DBF@DBF@DBF@D@FBD@FBD@F@DBF@D@FBD@FBD@F@DBF@DBF@D@FBD@F@DBF@D@FBD@F@DBF@D@FBD@F@DBF@D@FBD@F@DBF@D@FBD@F@FBD@F@D@FBD@F@DBF@D@F@DBF@D@FBD@F@F@D@FBD@F@D@FBF@D@F@D@FBD@F@F@D@FBD@F@D@F@F@DBF@D@F@F@F@DBF@F@F@D@F@F@FBD@F@F@F@D@F@F@F@F@D@FBF@F@D@F@F@D@F?F@D@F@F@D@F@F@D@F@F@D@F@F?D@F@F@D@F@F@D?F@F@D@F@F@D@F?F@F@D@F@F@F@D@F@F?F@D@F@F@D@F@F@F@D@F@F@F@D@F@F@F@DBF@F@F@D@F@F@FBD@F@F@F@D@FBF@F@DBF@F@F@DBF@FBF@FBF@FBD@F@FBFBF@FBD@FBF@FBFBF@DBF@FBFBF@FBD@FBF@DBF@FBD@FBF@D@FBF@DBF@F@FBD@F@FBF@F@D@FBF@F@F@D@F@D@F@D@F@D@F@D@D@F@D?D@F@D@D?D@D?D@D@D?D@F?D@F?D@F?D@F?F@F?F@D?F@F?F@F?F@F?H@F?F@F?H?F@F?F@H?F@F?H?F@F?H@F?F?H@F?F@F?H?F@F?F?H@F?F?F@F?H?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F?F@F?F?F@F?F?F@F?H?F@F?H?F@F?H?F?H@F?F?H@F?F?H@F?F?H@F?F?F?F@F?F?F@F?F?F?F@H?F?F?F@F?F?F?F@F?F?F?F@F?F?F?F?F@F?F?F?F@F?F?F?F?F@F?H?F?F?F?F@F?F?F?F?F@F?H?F?F?F?F?H@F?F?F?F?H?F?F?H?F?F?H@F?F?F?F?F?F?F?F?F?F?F?F?F?DAF?D?F?F?D?F?D?F?F?DAF?F?D?F?F?D?F?FAF?D?F?F?F?D?FAF?F?F?F?F?D?F?FAF?F?F?D?F?F?F?F?F?F?D?F?F?F?F?FAD?F?F?F?F?F?D?F?F?F?F?F@D?F?F?F?F?D?F?F?F?D?F?F?F?D?F?F?D?F?D?F@D?F?F?D?F?D?F?F?F?F?F@F?F?F?F?H?F?F@F?F?H?F?F?F?F@H?F?F?F?F?F@F?F?F?F?F@F?F?F?F?F?F@F?F?F?F?F@F?F?F?F?F@F?F?F?F@F?F?F?F?F@F?F?F?F@F?F?F?F?F@H?F?F?F@F?F?F?F@F?F?F?F@F?F?F?F?F@H?F?F@F?F?F?F@F?F?F?F@F?H?F?F@F?F?F?H@F?F?H@F?F?F?H@F?F?F?H@F?F?F@F?F?H?F@F?F?F@F?F?F?F@F?H?F@F?F?F?F@F?F?F@H?F?F?F@F?F?F@F?F?F?H@F?F?F@F?F?F?F@F?F?F@F?F?H@F?F?F?F@F?F?F@F?F?F@F?F?F?F@H?F?F@F?F?F@F?F?F@F?F?F@F?F?F?H@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?H@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F@F?F?F@F?F?F@F?F?F@F?F?F@F?F@F?F?F@F?F?F@H?F?H@F?F@H?F@H?F?F@H?F@F?H?F@F?F@H?F?F@H?F@F?H@F?F@H?F@F?H?F@H@F?F@H?F@F?H@F?D@F@F?F@D?D@D?D@D?D@D@F@D?F@D@B@D?F@D@F@D@F@D@F@DBF@F@D@F@D@FBD@F@F@FBD@F@F@D@FBD@F@F@F@F@F@H@F@FBF@H@F@F@F@H@H?H@F@H@H?F@H@H@F?H@H@H@F?H@H@F@H?H@H?H@F?H@H@H?H@H?F@H?H@H?H@H@F?H@H?H@H?F@H?H@H?F@F?H@F?H@F?H@F?F?H@F?H@F?H@F?H@F?F?H@F?H@F?H@F?F@H?F?H@F?H@F?H@F?H?F@F?H@F?H?F@H?F@H?F?H@F?F@H?F?H@F?H@F?H?F@H?F@H?F?F@H?F@H?F?H@F?H@F?H?F@H?F?H@F?F@H?F?H@F?H?F@H?F@H?F?H@F?F?H@F?H@F?H?F@H?F?H@F?H@F?H?F@F?H?F@H?F@H?F?H@F?H?F@H?F?H@F?H@F?F?H@F?H?F@H?F?H@F?H?F@H?F@H?F?H@F?H?F@F?H?F@H?F?H@F?H?F@H?F@H?F?H@F?H?F@H?F?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@F?H?F@H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?F?H@F?H?F@H?F?H@F?H?F@H?F?H?F@H?F?H@F?F?H@F?H?F@H?F?H@F?H?F@H?F?H@F?H?F@H?F?F@H?F?H@F?H?F?H@H?F?H@F?H?H@F?H?F@H?F?H@H?F?H@F?H?F@H?H?F@H?H?F?H@H?H?H@H?H?H@H?H?H@H?H?H@H?F?H@H?H?F@H?F?F?F?F@H?F?F?F@F?F?H?F@H?F?H?F?H@F?H?F?D?F?F?D?F@F?F?H?H?H?F?H?H?F?H?H?F?H?HAF?H?F?H?FAF?H?F?FAD?F?FAD?F?DAF?DAF?D?FAF?D?DAF?FAF?F?FAF?FAF?H?FAF?F?HAF?F?F?HAF?F?F?F?FAD?F?D?F?F?H?H?F?H?H?F?H?H@H?H?H?F?H@H?H?H?H@H?H?H?F@F?F?F?F@F?H?F?F@F?F?F?F@F?F?F?F@H?H?F@H?H@H?H?F@H?H?H@H?F?H@H?H?H@F?H@H?F?H@F?H?F@H?F?F@H?F@H?F?H@F?H?F@F?H?F@H?F?H@F?H@F?F?H@F?F?H@F?H@F?F?H@F?F?H@F?H@F?F?H@F?F?H@F?F@H?F?H@F?F?H@F?F@H?F?H@F?F?H@F?F@H?F?H@F?F@H?F?F@H?F?H@F?F@H?F?F@H?F@H?F?F@H?F@F?H?F@H?F@F?H?F@F?H@F?H?F@F?H@F?H?F@F?H@F?F?H@F?H?F@F?H@F?F?H@F?H@F?F@H?F?F@H?F@H?F?F@H?F@F?H?F@F?H@F?H@F?F?H@F?F@H?F?H@F?F@H?F@H?F?F@H?F@F?H@F?H?F@F?H@F?H@F?F?H@F?F@H?F@H?F?F@H?F@H?F@F?H@F?H@F?F?H@F?H@F?F@H?F@H?F@F?H@F?H?F@F?H@F?H@H?H@H@F?H@H?H@H?F@H?H@H?H@F?H@H@H?H@F?H@F?H@F?F@F?H@F?F@H@F?F@H?F@F?F@H?F@F?H@F@H?F@F@H?F@H?F@F@H?F@F@H?F@H@F?F@H@F@H?F@F@H@F?F@D@F?F@F@D?F@F@F@H?F@F@F?F@H@F?F@H@H@H?H@H@H?H@H@H@H?H@F@H?H@F?H@F?H@F?H@F?H@F@H?F@H?F?H@F?H@F?H@F?H@F?F@H?F@H?F@H?F?H@F?H@F?H@F?H?F@H?F@H?F?H@F?H@H?H@H?F?H@H?H@H?F?H@H?H@H?H?F@H?H@H?F?H@H?H?H@F?H@H?H?F@H?H?H@F?H?H@H?F@H?H?H@F?H?H@F?H?F@H?H?F?H@H?F?H@H?F?H@F?H?H@F?H?H@F?H?F@H?H?F@H?F?H@H?F?H@F?H?H@F?H?H@F?H@F?H?H@F?H?F@H?F?H@H?F@H?F?H@H?F?H@F?H?H@F?H@F?H?H@H?H@F?H?H@H?F@H?H?H@H?F@H?H@H?F?H@H?F@H?F?H@F?H@F?H@F?H?F@H?F@H?F?H@F?H@F?H@F?H@F?H?F@H?F@H?F@H?F@H?F?H@F?F@H?F@H?F@H?F@H?F@H?F@H?F@F?H@F?H@F?H@F?H@F?F@H?F@H?F@F?H@F?H@F?H@F?F@F@H?F@F?F@H?F@F?H@F?F@F?H@F@F?H@F?F@H?F@H?F@F?H@F@H?F@F?H@F?F@H?F@F?H@F?F@H?F@F?H@F?F@H?F@F?H@F?F@H?F@F?H@F?F@F?H@F?F@H?F@F?H@F?F@F?H@F?F@F?H@F?F?H@F?F@F?H@F?F@F?H@F?F@F?H?F@F?H@F?F@F?H@F?F?F@F?H@F?F@F?H?F@F?F@F?H@F?F@F?H?F@F?F@F?H?F@F?F@F?F?H@F?F@F?F@H?F?F@H?F@F?H?F@H?F@F?H?F@F?H@F?H@F?F?F@F?F?F@H?F@F?F?F@F?F?F@F?F@F?F?F@F?H?F@F?F@F?F?F@F?F?F@F?H?F@H?F@H?H?F@H?F@H?F?H@H?F@H?H?H@H?H?F@H?H@H?H?F?H@H?F?H?H@F?D?F?F?F?F?D?D?DAD?D?D?B?D?DAB?D?BAD?BAD?D?DAD?BAD?DADAD?DAD?FADAD?DAFAD?DAF?DADAF?DAD?DAF?DAD?F?DAD?F?DAF?D?F?F?D?F?F?F?F?H?F@H?F?H@H?F?H@F?H@H?F@H?F@H?H@F@H?H@F@H?F@H?F@H@F?H@F@H@H?H@F@H?H@F@H@F?H@H@F?H@F@F?H@F?H@F@F?H@F@H?F@F?H@F?F@F?F@H@F?F@F?F@H?F@F?F?H@F?F@H?F@F?F@H?F?F@F?F?H@F?F?F@H?F?F@F?H?F?F@F?H?F?F?F?H@F?F?H?F?F?H?F@H?F?F?H?F?H?F?F?H?F?H?F?HAF?H?F?H?F?H?FAH?F?F?H?FAH?F?HAF?H?FAF?HAF?FAH?FAH?FAF?HAF?FAHAF?FAHAF?FAFAHAF?FAHAFAF?HAFAF?FAHAF?FAFAH?FAF?HAF?FAF?HAF?FAF?F?HAF?F?F?FAF?F?H?F?F?F?H?FAF?F?H@F?F?H?F?F?F?H?F?F?F@H?F?F?F?F@F?F?F?F@F?F?D?F@F?F?F@F?F?F@H?F?H@F?H?F@H?H@F?H?F@H?H@F?H?H@F?H@H?F@H?F?F@H?F@F?F?H@F?F@H?F?F@H?F@F?H@F?F?H@F?F@H?F@F?F?H@F?H@F?F@H?F@F?H?F@F?H@F?F@H?F@F?H?F@F?H@F?F@H?F@F?H@F?F?H@F?H@F?H@H?H@F?H@H?H@F?H@H?F@H?H@H?F@H?F@H?F@H?F@F?H@F?F@H?F?F@H?F@H?F@F?H@F?F?H@F?F@H?F@F?H@F?F?H@F?H@F?F@H?F?F@H?F@H?F@F?H?F@F?H@F?F?H@F?H@F?F?H@F?F@H?F?H@F?H@H?H@F?H?H@F?H@H?F?H@H?F?H@H?F@H?H?F@F?H?F@F?F?F?F@H?F?F@H?F?F@H?F?F?H@F?H?F@H?F?H@F?H@H?H?F@H?H@F?H@F?H@H?H@F?H@H@H?F@H@F@H?F@F@F@H@F?F@F@F@F@F@FBF@F@F@F@FBF@F@FBF@FBF@HBF@FBH@FBF@HBF@F@F@HBF@F@F?F@F@H@F?F@F?F?F?F@F?HAF?F?F?FAF?DAFAD?FADAD?FADADADAD?DADADAFABADADADADAFADADADCFADADAFAFAHAFCFAFAFAFAHAFAFAHAFCFAFAHAF?DAFAFAFAD?FAFAFAF?DAFAFAF?FAFAFAF?FAFAFAF?DAFAF?FAFAF?FAFAF?FAFAD?FAFAF?FADAF?FAFAD?FAFAF?DAF?FAFAD?FAFAF?DAFAF?FADAF?FAFAD?FAFAF?FAFADAF?FAFAFAF?FAFADAF?FAFADAF?FADAFAD?FAFADAFAF?DAFAFADAFAFAD?FAFAFADAFCFAFADAFAFADAFADAFADAFADCDADADADADADCDADADADADCDADADCBADADCDADCDADADCDCDADCDADCDCDCDADCDCDCDCDCDADCDCDCDCDCFCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCFEDCDCDCDCDCDCFCDCDCDCFCDCDCFCDCDCDAFCDCDCDCFCDADCDCDCFADCDCDCFCDAFCDCFCFCFCDCHCFEFCHCFEHEJEHEJCHEJGHEJEJEHEJGJELGJEJGJGLEJGJGJELGJGLGLGNGLGLILGNININGNILGLGJGLGLGJGJGJEJGHEJEHEJGHEHEHEHCFEHEHEHEFCFEHEFCFEHCFEFCFCDEFCFCFCFEFCDCFCDCFCFEDCFCDCFCDCDCFCDCDADCDCDCFCBADCDCDADCBCDADCDABCDCDADCDCDABCDCDADCDCDADCDCDADCDCDCDADCDCDCDADCFCBCDADCDADCDCDABADCDABCDABADCDABADCDADADADCBADADADADADCFADADADAFAFADAFAFAFAFAH?FAFAHAFAH?FAHAHAF?HAHAH?FAHAH?FAH?FAHAF?HAF?HAFAF?FADAF?DAF?DADAD?DADAD?DADADADADADADADABADADAFCDAFCDADCFCFCFCFCFCFEFCFCFCFEFCFEFCFEFCFEHCFEFCFEFEDCFEFCFEFCFEFCDEFCFEFCDEFCFEFCDEFCFEDCFEFCFEDCFEDCFEDCFEDCFCDEFCDEFCDCFEDCFEDCFEFCDEFCFEFEDCFEFEFCDEFCFEFEDCFEFCFEDEFCDEFCDEFCFEDCFEDCFEDCFEFEDCFEFEFCDEFEFCFEFEFEDCFEFEFEFEFEFEHEFEFEFEFEHEFEFGFEHEFGHEFEHGFEHGFEHGHGHGHGHGHGJIHIJIJIJILKNMh@a@VQJIFEFEBADCBABC@?@ABA@ABA@ABABCBABA@ABABCBADABCBADCBCDADCBCDCDCDCFCDCDEDCFEFCDEFCDEDCFEDCDEDCDCDEDCDCDEBCDCBEDCBCDCBCBCBEBCBCBCBCBEBCBCBCBE@CBCBE@CBCBE@CBEBE@CBEBE@EBEBE@EBGBEBG@EBEBGBG@GBGBGBGBE@GBGBG@EBG@EBGBE@E@GBE@E@EBE@E@CBE@E@C@E@C@CBE@C@C@C@C@C@C@CBC@CBC@CBC@EBCBCBEBCBCBEBCBCBEBCFGDEFEFEDGFEFEDGFEFEDEFEDEFCDEDEFCDEFCDEFCDEDCFEDCFEDCDEDCDCDCDCDCDCDCDEDCDCDCDCDCDCDCDEDCDCBCDCDCDCDCDCDCDCDCDCBCDCDCDCDCDCDCDCDCBCDCDCDCDCDCDCDCDCBCDCDCDCDCDCDCDCDADCBCDCDCDCDCDCDEFCDCFEDCFCDEFCDEFCDCFEDCFCDEFCFEDCFCDEFCDCFEDCFEDCFCDEDCDCDCDCDCDCDADCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDADCDCDCDCDCDCDCDCDCDCDCFCDCDCDCDCDCDCDCDCDCDCDCDADCDCFCDCDCDCDCDCDCDCDCDCFCDCDCFCDCFCDCFEDCDCFCDCFCDCFCDCFCDCDCFCDCFCDCFCDCDCFCDCFCDCDADCDCFCDADCDCDCDAFCDCDADCDCFADCDCFCDCDAFCDCDCFADCDCFCDADCDCDCFCDCFCDCFADCFCDCFCDCDCFCDCFCDCFCDCDCFEDCFCDCFCDCDCFCDCFEDCFCDCFCDEFCDCFCDEFCDCFCDEFCFCDEFCDCFEDCFCFEDCFCFEDCFEFCDCFEFCFCDEFCFEFCFCDCFCFEDCFCDCFCDCDAFCDCDCFADCDADCFCDADADCFADADCDAFADADAFADAFADAFADAFAFAD?FAFAF?DAFAF?FAD?F?FAF?DAF?D?FAF?DAD?FAD?DAD?BADAD?BADAB?BABADAB?@ABABABABA@ABA@ABA@ABC@ABA@CBA@ABC@CBA@CBC@EBCBC@EBCBEBEBEBE@EBCBE@EBE@EBCBE@EBE@C@EBE@CBE@C@E@C@E@CBC?C@C@C@C@C@C@C?A@C@A?C@A?A@A?C",
      precision: 6
    }
  end
end
