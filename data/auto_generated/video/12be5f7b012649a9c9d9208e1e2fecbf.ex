defmodule Data.AutoGenerated.Video.Rendered_12be5f7b012649a9c9d9208e1e2fecbf do
  @moduledoc "#{"2021-02-10-hammer-strasse: Hammer Straße → Horner Kreisel"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2021-02-10-hammer-strasse: Hammer Straße → Horner Kreisel"
  end

  @impl Video.Rendered
  def hash() do
    "12be5f7b012649a9c9d9208e1e2fecbf"
  end

  @impl Video.Rendered
  def length_ms() do
    18685
  end

  @impl Video.Rendered
  def sources() do
    [{"2022-12-27-neumarkt-krogmann/GX015085", "00:00:03.737", "00:00:22.422"}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.066946456456456,
      minLat: 53.559635,
      maxLon: 10.069231,
      maxLat: 53.56303914114114
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Dezember 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Hammer Straße"},
      %{timestamp: 11942, text: "Grenzknick"},
      %{timestamp: 12943, text: ""},
      %{timestamp: 15612, text: "Sievekingsallee"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.066946456456456, lat: 53.56303914114114, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.066984, lat: 53.563, time_offset_ms: 266},
      %Video.TimedPoint{lon: 10.067039, lat: 53.56294, time_offset_ms: 600},
      %Video.TimedPoint{lon: 10.067095, lat: 53.562872, time_offset_ms: 933},
      %Video.TimedPoint{lon: 10.067146, lat: 53.562802, time_offset_ms: 1267},
      %Video.TimedPoint{lon: 10.067197, lat: 53.562734, time_offset_ms: 1601},
      %Video.TimedPoint{lon: 10.067242, lat: 53.56267, time_offset_ms: 1934},
      %Video.TimedPoint{lon: 10.067305, lat: 53.562597, time_offset_ms: 2268},
      %Video.TimedPoint{lon: 10.067367, lat: 53.562524, time_offset_ms: 2601},
      %Video.TimedPoint{lon: 10.06742, lat: 53.562454, time_offset_ms: 2935},
      %Video.TimedPoint{lon: 10.067482, lat: 53.562382, time_offset_ms: 3269},
      %Video.TimedPoint{lon: 10.067545, lat: 53.562309, time_offset_ms: 3602},
      %Video.TimedPoint{lon: 10.067607, lat: 53.562237, time_offset_ms: 3936},
      %Video.TimedPoint{lon: 10.067671, lat: 53.562161, time_offset_ms: 4269},
      %Video.TimedPoint{lon: 10.067736, lat: 53.562086, time_offset_ms: 4603},
      %Video.TimedPoint{lon: 10.067798, lat: 53.562015, time_offset_ms: 4937},
      %Video.TimedPoint{lon: 10.067862, lat: 53.561946, time_offset_ms: 5270},
      %Video.TimedPoint{lon: 10.067926, lat: 53.561872, time_offset_ms: 5604},
      %Video.TimedPoint{lon: 10.067989, lat: 53.561798, time_offset_ms: 5937},
      %Video.TimedPoint{lon: 10.06805, lat: 53.561723, time_offset_ms: 6271},
      %Video.TimedPoint{lon: 10.068108, lat: 53.561651, time_offset_ms: 6605},
      %Video.TimedPoint{lon: 10.068169, lat: 53.56158, time_offset_ms: 6938},
      %Video.TimedPoint{lon: 10.068231, lat: 53.561508, time_offset_ms: 7272},
      %Video.TimedPoint{lon: 10.068292, lat: 53.561433, time_offset_ms: 7605},
      %Video.TimedPoint{lon: 10.068354, lat: 53.561359, time_offset_ms: 7939},
      %Video.TimedPoint{lon: 10.068419, lat: 53.561288, time_offset_ms: 8273},
      %Video.TimedPoint{lon: 10.068485, lat: 53.561217, time_offset_ms: 8606},
      %Video.TimedPoint{lon: 10.06855, lat: 53.561142, time_offset_ms: 8940},
      %Video.TimedPoint{lon: 10.068616, lat: 53.561069, time_offset_ms: 9273},
      %Video.TimedPoint{lon: 10.068683, lat: 53.560993, time_offset_ms: 9607},
      %Video.TimedPoint{lon: 10.068748, lat: 53.560918, time_offset_ms: 9941},
      %Video.TimedPoint{lon: 10.068811, lat: 53.560844, time_offset_ms: 10274},
      %Video.TimedPoint{lon: 10.068877, lat: 53.56077, time_offset_ms: 10608},
      %Video.TimedPoint{lon: 10.068942, lat: 53.560699, time_offset_ms: 10941},
      %Video.TimedPoint{lon: 10.069013, lat: 53.56063, time_offset_ms: 11275},
      %Video.TimedPoint{lon: 10.069075, lat: 53.560557, time_offset_ms: 11609},
      %Video.TimedPoint{lon: 10.069126, lat: 53.560482, time_offset_ms: 11942},
      %Video.TimedPoint{lon: 10.069159, lat: 53.560403, time_offset_ms: 12276},
      %Video.TimedPoint{lon: 10.069186, lat: 53.560328, time_offset_ms: 12609},
      %Video.TimedPoint{lon: 10.069219, lat: 53.560258, time_offset_ms: 12943},
      %Video.TimedPoint{lon: 10.069231, lat: 53.560186, time_offset_ms: 13277},
      %Video.TimedPoint{lon: 10.069227, lat: 53.560109, time_offset_ms: 13610},
      %Video.TimedPoint{lon: 10.069192, lat: 53.560035, time_offset_ms: 13944},
      %Video.TimedPoint{lon: 10.069135, lat: 53.559966, time_offset_ms: 14277},
      %Video.TimedPoint{lon: 10.069052, lat: 53.559905, time_offset_ms: 14611},
      %Video.TimedPoint{lon: 10.068965, lat: 53.559851, time_offset_ms: 14945},
      %Video.TimedPoint{lon: 10.06888, lat: 53.559796, time_offset_ms: 15278},
      %Video.TimedPoint{lon: 10.068797, lat: 53.559741, time_offset_ms: 15612},
      %Video.TimedPoint{lon: 10.068717, lat: 53.559689, time_offset_ms: 15945},
      %Video.TimedPoint{lon: 10.068628, lat: 53.559647, time_offset_ms: 16279},
      %Video.TimedPoint{lon: 10.068523, lat: 53.559635, time_offset_ms: 16613},
      %Video.TimedPoint{lon: 10.068414, lat: 53.559643, time_offset_ms: 16946},
      %Video.TimedPoint{lon: 10.068302, lat: 53.559656, time_offset_ms: 17280},
      %Video.TimedPoint{lon: 10.068197, lat: 53.559669, time_offset_ms: 17613},
      %Video.TimedPoint{lon: 10.068083, lat: 53.559681, time_offset_ms: 17947},
      %Video.TimedPoint{lon: 10.067968, lat: 53.559697, time_offset_ms: 18281},
      %Video.TimedPoint{lon: 10.067849, lat: 53.559714, time_offset_ms: 18614},
      %Video.TimedPoint{lon: 10.067823491017965, lat: 53.5597169760479, time_offset_ms: 18685}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "}gfdeBc`meR@A@A@A@A@A@A@ABA@A@ABC@ABA@CBCBABCBCBCBCBCDCDEBEDCFEDEFGFEFGDEFEDEFEDEFEDEFEDEDEFEDEFEDEFEDEFEDCFEDEFEDEFCDEFEDEFCDEFEDCFEDEFCDEFEDCFEDEFCDEFCDEDCFEDEFCDEFCDEFEDCFEDCFEDCDEFCDEFCDEDCFEDCDCDEFCDEDCDCDCFEDCDCDEDCDCDEDCDCDEFCDCDEDCDEFEDCFEDEFEDCFEFEDEFEFGFEDEFEFEFEDGFEFEFEDEFGFEFEDEFEFEFEDGFEFEFEDEFEFEDEFEDEFEDEFEFEDCFEDEFEDCDEFEDEFCDEFEDCDEFEDEFCDEFEDEFEDEFEDCFEDEFEFEDEFEFGDEFEDEFEFEDEFEFEDEFGFEDEFEFEDEFGFEDEFEFEDEFGFEDEFEDEFEFEDEFGFEDEFEDEFEDEFEFEDEFEDEFEFGDEFEDEFEFEDEFEFGFEDEFEFEFGDEFEFEFGFEFEDEFGFEFEFEDEFGFEFEFGDEFEFEFGFEDEFEFGFEDEFEFGFEDEFEFEDEFGFEDEFEDEFEDEFGDEFEFEDEFEDEFEDEFGDEDEFEDEFEDEFEDEFGDEFEDEFEDEDEFEDGFEDEFEDEFEDGFEFEDEFEDGFEFEDEFEFGFEDEFEFGDEFEFEDEFGFEFEDEFEFGFEDEFEFEDEFGFEFEDEFEFEDEFEFGDEFEFEFEFEDEFEFEDEFGFEFEFEDEFEFEDEFEFEFEDEFEFEDEFEFEDEFEDEFEDCFEFEDEFEDEFEDEFEFEDEFEDEFEDEFEDEFEFEDEFEDEFEFEDEFEDEFEDEFEDEFEDEFEFEDEFEDEFEDEFGFEDEFEDEFEFEDEFEFEDEFEFEDGFEFEDEFEFEFEDEFEFEFGFEDEFEFEDEFEFEFEDEFGFEFEDEFEFEDEFEFEFGDEFEFEDEFEDEFEFGDEFEFEDEFGDEFEDEFEFEDGFEDEFEDEFGDEFEDEFGDEFEFEDGFEDEFEDGFEDEFEFGDEFEDEFGDEFEFEDGFEFEDGFEFEDEFGFEDEFGFEFEDGFEFEFGDEFEFEDGFEFEFGDEFEFEDGFEFEDEFGFEDEFEFGDEFEDEFGFEFEDGFEFEFGDEFEFGFEDEFGFEFGFEFEDGFEFEFGDEFEFGFEFEFGDEFEFEDGFEFEFEFGDEFEFEDEFGFEDEFEFEFGDEFEFEFEDGFEFEDEFEFGDEFEFEDEFEFGDEFEFEFGDEFEFEDGFEFEDEFGFEFEDGFEFEDEFGFEDEFGFEDEFGDEFEFEDGFEDEFEDGFEDEFGDEFEDGFEDEFGDEFEDGFEDGFEDEFGDEFEDGFEDGFEDEFGDEFEDGFEDEFGFEDEFEDGFEDEFEFEDEFGFEDEFEFCDEFEFEDEFEFEFCDEFEFCFEDEFCFEFCDEFCFCFEDCFCFCFEFCFCFCDCFCFCFCFCFCFCFAFCFCFCFCFAFCDAFCFCFAFCFAFCFADCFAFCFAFCDAFCFAFCDAFCFADAFCDAFCFADCFADCFADCFADAFCDAFAFCDAFADCDAFADAFADAFADAFADAFADAFADAF?DAFAF?DAFAD?F?FAD?F?FAD?F?F?F?D?F?F?F?F?F@F?D?F@F?F@F?D@F@F@F@F@D@F@F@F@DBF@F@DBF@FBFBDBF@DBFBFBDBFDDBFBFBDDFBDDFBDDFDDBDDFDDDFDDDDDFDDDDFDDFDDFDDDFFFDDDFDFDFDFFFDFDFDFDFDFDFDFDHDFDFDFDHDFDFBFDFDHDFBFDFDHDFBFDFDFBHDFDFDFBHDFDFDFBHDFDFDHBFDFDFDHBFDFDHDFBFDFDFBHDFDFDFDHBFDFDFDFBFDHDFDFBFDHDFDFBFDFDFBFDHDFBFDFDFBFDHDFBFDFBFDFBHDFBFDFBFDFBHBFDFBHBFBHDFBFBHBFBHBFBHBHBF@HBH@FBH@FBH@FBH@H@F@H@H@F@H@H@H@F?H@H@H?H@H?H@H?H@H?H?H?J?H@H?H?J?H?H?JAH?J?H?J?HAJ?H?JAH?JAH?JAH?JAJ?HAJ?JAH?JAJ?HAJAJ?JAHAJ?HAJ?HAJAH?JAHAH?JAH?HAJAH?HAHAH?JAH?HAHAH?JAH?HAJAH?HAJAH?JAH?JAHAJ?JAJAH?JAJAH?JAJAH?JAJAJAJ?HAJAJ?HAJAJAJ?HAJAJAJAJAL?JAJANALANCPARANANALALALAHAJ?HAHAH?FAD?FAF?DAD?D?BAD?B?BAB?B",
      precision: 6
    }
  end
end
