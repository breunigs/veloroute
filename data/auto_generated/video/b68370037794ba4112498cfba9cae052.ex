defmodule Data.AutoGenerated.Video.Rendered_b68370037794ba4112498cfba9cae052 do
  @moduledoc "#{"2022-10-18-reeperbahn: Millerntordamm (→ Michel)"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-10-18-reeperbahn: Millerntordamm (→ Michel)"
  end

  @impl Video.Rendered
  def hash() do
    "b68370037794ba4112498cfba9cae052"
  end

  @impl Video.Rendered
  def length_ms() do
    54347
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2023-03-28-w1-w5-w8sud/GX015282", "00:00:15.415", "00:00:25.759"},
      {"2024-01-27-bergedorf/GX016736", "00:00:33.300", :end},
      {"2024-01-27-bergedorf/GX016737", :start, "00:00:37.538"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.94921328742515,
      minLat: 53.548995335329344,
      maxLon: 9.97385249700599,
      maxLat: 53.549984
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "März 2023"}, %{timestamp: 10077, text: "Januar 2024"}]
  end

  @impl Video.Rendered
  def street_names() do
    [
      %{timestamp: 0, text: "Königstraße"},
      %{timestamp: 10077, text: "Reeperbahn"},
      %{timestamp: 43497, text: "Millerntorplatz"},
      %{timestamp: 48834, text: "Millerntordamm"},
      %{timestamp: 52838, text: "Ludwig-Erhard-Straße"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.94921328742515, lat: 53.548995335329344, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.949369, lat: 53.549023, time_offset_ms: 264},
      %Video.TimedPoint{lon: 9.949563, lat: 53.549074, time_offset_ms: 598},
      %Video.TimedPoint{lon: 9.949763, lat: 53.549113, time_offset_ms: 931},
      %Video.TimedPoint{lon: 9.949963, lat: 53.549152, time_offset_ms: 1265},
      %Video.TimedPoint{lon: 9.950159, lat: 53.549191, time_offset_ms: 1598},
      %Video.TimedPoint{lon: 9.95036, lat: 53.549229, time_offset_ms: 1932},
      %Video.TimedPoint{lon: 9.950561, lat: 53.549269, time_offset_ms: 2266},
      %Video.TimedPoint{lon: 9.950769, lat: 53.549307, time_offset_ms: 2599},
      %Video.TimedPoint{lon: 9.950976, lat: 53.549337, time_offset_ms: 2933},
      %Video.TimedPoint{lon: 9.95119, lat: 53.549365, time_offset_ms: 3266},
      %Video.TimedPoint{lon: 9.951402, lat: 53.549397, time_offset_ms: 3600},
      %Video.TimedPoint{lon: 9.951622, lat: 53.549428, time_offset_ms: 3934},
      %Video.TimedPoint{lon: 9.951844, lat: 53.549463, time_offset_ms: 4267},
      %Video.TimedPoint{lon: 9.952065, lat: 53.549491, time_offset_ms: 4601},
      %Video.TimedPoint{lon: 9.952296, lat: 53.549515, time_offset_ms: 4934},
      %Video.TimedPoint{lon: 9.952528, lat: 53.549538, time_offset_ms: 5268},
      %Video.TimedPoint{lon: 9.952754, lat: 53.549562, time_offset_ms: 5602},
      %Video.TimedPoint{lon: 9.952984, lat: 53.549576, time_offset_ms: 5935},
      %Video.TimedPoint{lon: 9.953209, lat: 53.549602, time_offset_ms: 6269},
      %Video.TimedPoint{lon: 9.953425, lat: 53.54962, time_offset_ms: 6602},
      %Video.TimedPoint{lon: 9.953639, lat: 53.549622, time_offset_ms: 6936},
      %Video.TimedPoint{lon: 9.953852, lat: 53.549624, time_offset_ms: 7270},
      %Video.TimedPoint{lon: 9.954054, lat: 53.549618, time_offset_ms: 7603},
      %Video.TimedPoint{lon: 9.954261, lat: 53.549605, time_offset_ms: 7937},
      %Video.TimedPoint{lon: 9.954468, lat: 53.549603, time_offset_ms: 8270},
      %Video.TimedPoint{lon: 9.954649, lat: 53.5496, time_offset_ms: 8604},
      %Video.TimedPoint{lon: 9.954812, lat: 53.549589, time_offset_ms: 8938},
      %Video.TimedPoint{lon: 9.954958, lat: 53.549589, time_offset_ms: 9271},
      %Video.TimedPoint{lon: 9.955121, lat: 53.549602, time_offset_ms: 9605},
      %Video.TimedPoint{lon: 9.95531, lat: 53.549611, time_offset_ms: 9938},
      %Video.TimedPoint{lon: 9.95562459281437, lat: 53.549638742514965, time_offset_ms: 10077},
      %Video.TimedPoint{lon: 9.955651, lat: 53.54964, time_offset_ms: 10137},
      %Video.TimedPoint{lon: 9.955811, lat: 53.549649, time_offset_ms: 10470},
      %Video.TimedPoint{lon: 9.955983, lat: 53.549656, time_offset_ms: 10804},
      %Video.TimedPoint{lon: 9.956161, lat: 53.549662, time_offset_ms: 11138},
      %Video.TimedPoint{lon: 9.956339, lat: 53.549655, time_offset_ms: 11471},
      %Video.TimedPoint{lon: 9.956513, lat: 53.549626, time_offset_ms: 11805},
      %Video.TimedPoint{lon: 9.956697, lat: 53.549607, time_offset_ms: 12138},
      %Video.TimedPoint{lon: 9.956888, lat: 53.549588, time_offset_ms: 12472},
      %Video.TimedPoint{lon: 9.957084, lat: 53.549569, time_offset_ms: 12806},
      %Video.TimedPoint{lon: 9.957256, lat: 53.549554, time_offset_ms: 13139},
      %Video.TimedPoint{lon: 9.957438, lat: 53.549546, time_offset_ms: 13473},
      %Video.TimedPoint{lon: 9.957612, lat: 53.549539, time_offset_ms: 13806},
      %Video.TimedPoint{lon: 9.957792, lat: 53.549537, time_offset_ms: 14140},
      %Video.TimedPoint{lon: 9.957915, lat: 53.54955, time_offset_ms: 14474},
      %Video.TimedPoint{lon: 9.958035, lat: 53.54957, time_offset_ms: 14807},
      %Video.TimedPoint{lon: 9.958117, lat: 53.549574, time_offset_ms: 15141},
      %Video.TimedPoint{lon: 9.958187, lat: 53.549569, time_offset_ms: 15474},
      %Video.TimedPoint{lon: 9.958246, lat: 53.549565, time_offset_ms: 15808},
      %Video.TimedPoint{lon: 9.958291, lat: 53.549566, time_offset_ms: 16142},
      %Video.TimedPoint{lon: 9.958306, lat: 53.549564, time_offset_ms: 16475},
      %Video.TimedPoint{lon: 9.958332, lat: 53.549553, time_offset_ms: 16809},
      %Video.TimedPoint{lon: 9.958348, lat: 53.549554, time_offset_ms: 17143},
      %Video.TimedPoint{lon: 9.958415, lat: 53.549551, time_offset_ms: 17476},
      %Video.TimedPoint{lon: 9.958536, lat: 53.549539, time_offset_ms: 17810},
      %Video.TimedPoint{lon: 9.958701, lat: 53.549527, time_offset_ms: 18143},
      %Video.TimedPoint{lon: 9.958878, lat: 53.549516, time_offset_ms: 18477},
      %Video.TimedPoint{lon: 9.959059, lat: 53.549506, time_offset_ms: 18811},
      %Video.TimedPoint{lon: 9.959243, lat: 53.549497, time_offset_ms: 19144},
      %Video.TimedPoint{lon: 9.959434, lat: 53.549488, time_offset_ms: 19478},
      %Video.TimedPoint{lon: 9.959628, lat: 53.549482, time_offset_ms: 19811},
      %Video.TimedPoint{lon: 9.959819, lat: 53.549473, time_offset_ms: 20145},
      %Video.TimedPoint{lon: 9.96001, lat: 53.549466, time_offset_ms: 20479},
      %Video.TimedPoint{lon: 9.960201, lat: 53.549461, time_offset_ms: 20812},
      %Video.TimedPoint{lon: 9.960384, lat: 53.549458, time_offset_ms: 21146},
      %Video.TimedPoint{lon: 9.960554, lat: 53.549455, time_offset_ms: 21479},
      %Video.TimedPoint{lon: 9.960714, lat: 53.549453, time_offset_ms: 21813},
      %Video.TimedPoint{lon: 9.960864, lat: 53.54945, time_offset_ms: 22147},
      %Video.TimedPoint{lon: 9.961005, lat: 53.549445, time_offset_ms: 22480},
      %Video.TimedPoint{lon: 9.961139, lat: 53.549444, time_offset_ms: 22814},
      %Video.TimedPoint{lon: 9.961267, lat: 53.549442, time_offset_ms: 23147},
      %Video.TimedPoint{lon: 9.961385, lat: 53.549439, time_offset_ms: 23481},
      %Video.TimedPoint{lon: 9.961495, lat: 53.549436, time_offset_ms: 23815},
      %Video.TimedPoint{lon: 9.961599, lat: 53.549436, time_offset_ms: 24148},
      %Video.TimedPoint{lon: 9.961698, lat: 53.549437, time_offset_ms: 24482},
      %Video.TimedPoint{lon: 9.961773, lat: 53.549438, time_offset_ms: 24815},
      %Video.TimedPoint{lon: 9.96182, lat: 53.549441, time_offset_ms: 25149},
      %Video.TimedPoint{lon: 9.961858, lat: 53.549443, time_offset_ms: 25483},
      %Video.TimedPoint{lon: 9.961892, lat: 53.549444, time_offset_ms: 25816},
      %Video.TimedPoint{lon: 9.96192, lat: 53.549447, time_offset_ms: 26150},
      %Video.TimedPoint{lon: 9.961949, lat: 53.549448, time_offset_ms: 26483},
      %Video.TimedPoint{lon: 9.961992, lat: 53.549448, time_offset_ms: 26817},
      %Video.TimedPoint{lon: 9.962068, lat: 53.549451, time_offset_ms: 27151},
      %Video.TimedPoint{lon: 9.962166, lat: 53.549455, time_offset_ms: 27484},
      %Video.TimedPoint{lon: 9.962278, lat: 53.549462, time_offset_ms: 27818},
      %Video.TimedPoint{lon: 9.962396, lat: 53.549472, time_offset_ms: 28151},
      %Video.TimedPoint{lon: 9.962523, lat: 53.549484, time_offset_ms: 28485},
      %Video.TimedPoint{lon: 9.96266, lat: 53.549496, time_offset_ms: 28819},
      %Video.TimedPoint{lon: 9.962802, lat: 53.54951, time_offset_ms: 29152},
      %Video.TimedPoint{lon: 9.962938, lat: 53.549523, time_offset_ms: 29486},
      %Video.TimedPoint{lon: 9.963071, lat: 53.549537, time_offset_ms: 29819},
      %Video.TimedPoint{lon: 9.963198, lat: 53.54955, time_offset_ms: 30153},
      %Video.TimedPoint{lon: 9.96332, lat: 53.549562, time_offset_ms: 30487},
      %Video.TimedPoint{lon: 9.963445, lat: 53.549576, time_offset_ms: 30820},
      %Video.TimedPoint{lon: 9.963586, lat: 53.549589, time_offset_ms: 31154},
      %Video.TimedPoint{lon: 9.963739, lat: 53.549604, time_offset_ms: 31487},
      %Video.TimedPoint{lon: 9.9639, lat: 53.54962, time_offset_ms: 31821},
      %Video.TimedPoint{lon: 9.964057, lat: 53.549636, time_offset_ms: 32155},
      %Video.TimedPoint{lon: 9.964213, lat: 53.549653, time_offset_ms: 32488},
      %Video.TimedPoint{lon: 9.964366, lat: 53.549669, time_offset_ms: 32822},
      %Video.TimedPoint{lon: 9.964522, lat: 53.549687, time_offset_ms: 33155},
      %Video.TimedPoint{lon: 9.964682, lat: 53.549704, time_offset_ms: 33489},
      %Video.TimedPoint{lon: 9.96484, lat: 53.54972, time_offset_ms: 33823},
      %Video.TimedPoint{lon: 9.964998, lat: 53.549737, time_offset_ms: 34156},
      %Video.TimedPoint{lon: 9.965156, lat: 53.549754, time_offset_ms: 34490},
      %Video.TimedPoint{lon: 9.965311, lat: 53.549773, time_offset_ms: 34823},
      %Video.TimedPoint{lon: 9.965469, lat: 53.549795, time_offset_ms: 35157},
      %Video.TimedPoint{lon: 9.965632, lat: 53.549815, time_offset_ms: 35491},
      %Video.TimedPoint{lon: 9.965798, lat: 53.549828, time_offset_ms: 35824},
      %Video.TimedPoint{lon: 9.965965, lat: 53.549839, time_offset_ms: 36158},
      %Video.TimedPoint{lon: 9.966133, lat: 53.549852, time_offset_ms: 36491},
      %Video.TimedPoint{lon: 9.966301, lat: 53.549868, time_offset_ms: 36825},
      %Video.TimedPoint{lon: 9.96647, lat: 53.549884, time_offset_ms: 37159},
      %Video.TimedPoint{lon: 9.966639, lat: 53.549903, time_offset_ms: 37492},
      %Video.TimedPoint{lon: 9.96681, lat: 53.549921, time_offset_ms: 37826},
      %Video.TimedPoint{lon: 9.966981, lat: 53.549935, time_offset_ms: 38159},
      %Video.TimedPoint{lon: 9.967155, lat: 53.54993, time_offset_ms: 38493},
      %Video.TimedPoint{lon: 9.967324, lat: 53.549916, time_offset_ms: 38827},
      %Video.TimedPoint{lon: 9.96749, lat: 53.549912, time_offset_ms: 39160},
      %Video.TimedPoint{lon: 9.967652, lat: 53.549906, time_offset_ms: 39494},
      %Video.TimedPoint{lon: 9.967814, lat: 53.549904, time_offset_ms: 39827},
      %Video.TimedPoint{lon: 9.967976, lat: 53.549916, time_offset_ms: 40161},
      %Video.TimedPoint{lon: 9.968139, lat: 53.549829, time_offset_ms: 40495},
      %Video.TimedPoint{lon: 9.968311, lat: 53.549802, time_offset_ms: 40828},
      %Video.TimedPoint{lon: 9.968481, lat: 53.549838, time_offset_ms: 41162},
      %Video.TimedPoint{lon: 9.968633, lat: 53.54984, time_offset_ms: 41495},
      %Video.TimedPoint{lon: 9.968787, lat: 53.549849, time_offset_ms: 41829},
      %Video.TimedPoint{lon: 9.968953, lat: 53.549872, time_offset_ms: 42163},
      %Video.TimedPoint{lon: 9.969077, lat: 53.549867, time_offset_ms: 42496},
      %Video.TimedPoint{lon: 9.96919, lat: 53.549844, time_offset_ms: 42830},
      %Video.TimedPoint{lon: 9.969314, lat: 53.549826, time_offset_ms: 43163},
      %Video.TimedPoint{lon: 9.969449, lat: 53.549816, time_offset_ms: 43497},
      %Video.TimedPoint{lon: 9.969597, lat: 53.549835, time_offset_ms: 43830},
      %Video.TimedPoint{lon: 9.96971, lat: 53.549876, time_offset_ms: 44164},
      %Video.TimedPoint{lon: 9.969753, lat: 53.549926, time_offset_ms: 44498},
      %Video.TimedPoint{lon: 9.969791, lat: 53.549964, time_offset_ms: 44831},
      %Video.TimedPoint{lon: 9.969866, lat: 53.549972, time_offset_ms: 45165},
      %Video.TimedPoint{lon: 9.969972, lat: 53.549961, time_offset_ms: 45498},
      %Video.TimedPoint{lon: 9.970102, lat: 53.549957, time_offset_ms: 45832},
      %Video.TimedPoint{lon: 9.970244, lat: 53.549961, time_offset_ms: 46166},
      %Video.TimedPoint{lon: 9.970393, lat: 53.549964, time_offset_ms: 46499},
      %Video.TimedPoint{lon: 9.970549, lat: 53.549969, time_offset_ms: 46833},
      %Video.TimedPoint{lon: 9.970708, lat: 53.549976, time_offset_ms: 47166},
      %Video.TimedPoint{lon: 9.97087, lat: 53.54998, time_offset_ms: 47500},
      %Video.TimedPoint{lon: 9.971032, lat: 53.549984, time_offset_ms: 47834},
      %Video.TimedPoint{lon: 9.971194, lat: 53.549983, time_offset_ms: 48167},
      %Video.TimedPoint{lon: 9.971352, lat: 53.549964, time_offset_ms: 48501},
      %Video.TimedPoint{lon: 9.971509, lat: 53.549936, time_offset_ms: 48834},
      %Video.TimedPoint{lon: 9.971663, lat: 53.549909, time_offset_ms: 49168},
      %Video.TimedPoint{lon: 9.971816, lat: 53.549874, time_offset_ms: 49502},
      %Video.TimedPoint{lon: 9.971972, lat: 53.549842, time_offset_ms: 49835},
      %Video.TimedPoint{lon: 9.972125, lat: 53.549811, time_offset_ms: 50169},
      %Video.TimedPoint{lon: 9.972285, lat: 53.549785, time_offset_ms: 50502},
      %Video.TimedPoint{lon: 9.972441, lat: 53.549758, time_offset_ms: 50836},
      %Video.TimedPoint{lon: 9.972594, lat: 53.549721, time_offset_ms: 51170},
      %Video.TimedPoint{lon: 9.972725, lat: 53.549662, time_offset_ms: 51503},
      %Video.TimedPoint{lon: 9.972807, lat: 53.549583, time_offset_ms: 51837},
      %Video.TimedPoint{lon: 9.9729, lat: 53.549537, time_offset_ms: 52170},
      %Video.TimedPoint{lon: 9.973024, lat: 53.549539, time_offset_ms: 52504},
      %Video.TimedPoint{lon: 9.97317, lat: 53.54954, time_offset_ms: 52838},
      %Video.TimedPoint{lon: 9.973318, lat: 53.549544, time_offset_ms: 53171},
      %Video.TimedPoint{lon: 9.973476, lat: 53.54953, time_offset_ms: 53505},
      %Video.TimedPoint{lon: 9.973629, lat: 53.549502, time_offset_ms: 53838},
      %Video.TimedPoint{lon: 9.973776, lat: 53.549474, time_offset_ms: 54172},
      %Video.TimedPoint{lon: 9.97385249700599, lat: 53.54946247305389, time_offset_ms: 54347}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "q{jceBubg~Q?EAGAGAI?ICKAKAMAMCOCOCSCSCWEWCUCWESCUESCSCSESCSEUCSESCUESCSESCQCSESCSCSESCSCSCSCSCSCSCQCSESCUCSCQASCSCSCSCSCSCSCSCSCSCSCSCSCSCSCSCSCSCSCSCSASCSCSCQCSCSCSCSCSCSCSCSCSCQCSCSCSCSASCQCSCSCSCQCSCSCSCSCSCSCSASCSCSCSCSCSCSCSCSCSCSCSASCSCSCUCSCSCSCSCQCSCSCSCUCSCSCSCSCSCSCSCSCSCUCSASCUCSCSCUCSCUCSCUCSCUASCSCUCSCSAUCSCUCSASCUASCSCSAUCSASCUASCSAUCSASCUASCSAUCSAUAUCSAUCUASCUAUCSAUCUAUASCUAUCSAUCSAUCUAUCSAUCSAUCSAUCSAUCUCSAUCSAUCUASCUASCUCUAUCUAUCSCUAUCUAUCUAUCUCUAUCUAUCUCUAUCUAUCUCUAUCUCWCUAUCUCUAWCUCUAUCUCUAUCUCUAUCWAUCUAUCUAUCUAUCUASCWAUAUCUAUCUAUAUAUCUAWAUCUAWAUCWAUAWAUCWAUAWAWAUCWAUAWAUAWCUAWAWAWAUAWCUAWAUAWAUAWCWAWAUAWAUAWCUAUAWAUAWAWCUAUAUAWAUAUCUAWAUAUAWAUAUAUAWAUAUAWAUAWAUAUAWAW?UAWAUAWAUAW?UAWAUAUAWAUAUAWAWAUAUAUAWAUAUCUAWAUAWAUCUAUAWAUAUAUCUAUAUAUAUAUAUAUAUAUAS?UAUAUAUAS?UAUAS?UAU?SAU?UAU?S?UAU?S?U?SAU?U?U?S?U?UAS?U?S?U?U?U?S?U?U?SAU?U?S?U?U?S?U?U?S?U?S?U?S?S?U?S@U?S?S?S?U@S?S?S?S@S?S?S@S?S?S@U?S@S?S@S?U@S?S@S?U@S?S@S?U@U?S@S?U@S?S@S?U@S?S?U@S?U?S@U?S?U?S@U?S?U?U?S?S@S?U?S?S?Q?S?S?S@Q?S?Q?Q?Q?Q@Q?Q?Q?Q?Q@Q?Q?Q@O?Q?Q@Q?O?Q@O?Q?O@Q?O@O?Q?O@O?O@O?O?O@O?M?O@O?O?M?O?M@M?O?M?O?M?M?M?M?M?O?M?M?MAM?O?M?OAM?O?OAM?O?OAO?OAM?QAO?OAQ?OAOAQ?OAQ?OAQ?QAO?QAQ?QAQAQ?QAO?QAQ?SAU?UAWAYA]A]Ac@Ce@Ak@Cq@E{@EgAGaBGcBEgACs@Aa@AWAI?G?I?IAK?I?KAK?KAM?M?OAO?OAQ?QAU?SAS?SAS?SAQ?QAO?Q?QAO?Q?OAQ?QAO?Q?QAO?Q?QAO?Q?QAQ?Q?QAO?Q?QAQ?O?Q?QAQ?Q?Q?Q?Q?Q?QAO?Q?Q?Q?Q?Q@Q?Q?Q?Q?Q@Q?O?Q@Q?Q@Q?Q@Q@O?Q@Q@O@Q@Q@Q@Q@O@Q@Q@O@Q@Q@QBQ@O@Q@QBQ@O@Q@Q@QBQ@Q@Q@Q@Q@QBQ@Q@Q@Q@S@Q@Q@Q@S@Q@Q@Q@Q@S@Q@S@Q?Q@S@Q@S@Q@Q@S@S@Q@S@Q@S@Q@S@S@Q@S@S@S@Q?S@S@S@S@Q@S@S@S@U@S@Q@S@S@Q@S@Q?Q@S@Q@Q@Q@Q?Q@Q@O@Q?O@Q@O?Q@O@Q?O@Q@O?Q@Q?O@Q@Q?Q@Q?Q@Q?Q@Q?Q@Q?S?Q@Q?Q@Q?Q@Q?Q?Q@Q?Q?Q@Q?O@Q?Q?Q@Q?O?Q@Q?O?Q?Q@O?Q?Q?O@Q?Q?Q?Q@Q?S?Q?Q?Q?S?Q?S?S?Q?Q?Q?Q?QAO?O?O?OAO?MAM?M?KAM?KAK?KAKAK?KAK?KAKAI?KAMAKAKAK?KAMAKAMAKAMAK?MAMAKAMAK?MAKAI?KAK?IAK?IAI?IAI?G?I?GAI?G?G?G?G?G?G?E?G?G?G?E?G?G?G?G?E?G?G?G?G?E?I?G@G?G?G?G?G?I?E@G?G?G?G@G?G?E?G?E@G?E?E?E@E?E?C?E?C?E@C?C?E?C?C?C@C?A?C?C?A?C?C?A@C?A?A?A?C?A?A?A?A?A@??A?A?A???A???A?A?????A???A???A??@A?A???A?A???A?A???A?A?A@??A?A?A???A?A???A?A???A??@A?A???A?????A???A???A?A???A?A?A@A?A?C?A?A?C?C@A?C?C?C?E@C?E?E?E@E?E?G@G?I@I?I@K?K@K@M?M@O?O@O@Q?Q@O@O?O@M@O?M@O@O?O@M@O?O@O?O@Q@O?O@Q@O?Q@Q@O?Q@Q?O@Q@O?Q@Q?Q@Q@O?Q@Q?Q@O?Q@Q@Q?Q@Q?Q@Q?Q@O?Q@Q?Q@Q@Q?Q@Q?Q@Q?Q@Q?Q@Q?Q@Q?Q@Q?Q@Q?Q@Q?S?Q@Q?Q@Q?Q@Q?S@Q?Q@Q?Q@S?Q@Q?Q?Q@S?Q@Q?Q@S?Q@S?Q?Q@S?Q@S?Q@S?Q@S?S?Q@S?Q@S?Q?S@Q?S@S?S?Q@S?S?Q@S?S?S@Q?S?S@S?Q?S@S?Q@S?Q?S@S?S?Q@S?Q@S?Q?S@Q?S@Q?S?S@Q?S@Q?Q@S?Q?S@S?Q@S?Q?S@Q?S?Q@S?Q?S@S?Q@S?Q?S?Q@S?Q?S@Q?S?S@Q?S?Q?S@S?Q?S?S@Q?S?Q?S@Q?S?Q?Q@S?Q?S?Q?Q?Q@S?Q?Q?Q?Q@S?Q?Q?Q?Q?Q?Q@Q?Q?O?S?Q?O@Q?Q?Q?O?Q?Q?O@Q?O?Q?O?Q?O?O?O@Q?O?O?Q?O?O?O?O@O?O?O?O?O?O?O?O@O?O?M?O?O?O?O?M@O?O?M?O?O?M?O@M?O?O?M?M?O@M?O?M?M?M@O?M?M?M?O@M?M?M?M?M@M?M?M?M?M?M@M?M?M?M?M?M?K@M?M?M?K?M?M?M?K?M@M?M?K?M?K?M?K?M?M?K?M@K?M?M?K?M?K?K?M?K?M@K?K?M?K?K?K?M?K?K@K?K?K?K?K?K?K@K?K?K?K?K?K?I@K?K?I?K?K?K?I?K@I?K?K?I?K?I?K?I@K?I?K?I?I?K?I?I?K?I?I?K?I@I?K?I?I?I?K?I?I?K?I?I?I?K?I?I?K?I?I?K?IAK?I?I?K?I?K?K?I?K?I?I?K?I?I?IAI?I?I?G?I?G?I?G?IAG?G?G?G?E?G?G?E?EAG?E?E?E?E?E?E?CAE?C?E?C?C?E?C?C?C?CAC?C?C?C?C?A?C?C?C?A?C?CAA?C?A?C?A?C?A?C?A?C?A?A?C?AAC?A?A?C?A?A?A?C?A?A?A?C?A?A?A?AAA?A?C?A?A?A?A?A?A?A?A?A?A?A?A?A?A?A?A?AAA?A?A?A?A?A?A?A?A?A?A?A?A?C?A?A?A?A?A?C?AAA?A?C?A?C?A?C?A?C?A?C?C?A?C?C?CAC?C?E?C?E?C?E?E?E?E?EAE?G?G?E?G?I?GAG?I?I?G?I?I?IAK?I?I?K?IAK?I?K?IAK?I?K?IAK?I?I?KAI?K?I?KAI?K?IAK?K?IAK?I?KAK?K?KAI?K?KAI?KAK?K?KAK?IAK?KAK?KAK?KAI?KAK?KAK?KAK?KAK?KAK?KAM?KAK?KAK?KAMAK?KAM?KAKAM?KAM?KAM?KAMAK?MAM?KAMAM?MAKAM?MAM?MAMAM?MAMAM?MAKAM?OAMAM?MAMAM?MAOAM?MAMAM?OAMAM?MAMAM?MAMAMAM?MAMAM?MAKAM?MAM?MAKAM?MAMAK?MAMAK?MAMAMAK?MAMAM?MAKAM?MAKAM?MAMAK?MAKAMAK?MAMAK?MAKAM?KAKAM?KAK?MAKAK?MAKAK?KAKAM?KAK?KAKAK?MAK?KAKAK?KAKAK?KAK?KAKAK?KAKAK?KAK?KAKAK?KAKAM?KAKAK?KAMAK?KAKAM?KAMAK?MAMAK?MAMAK?MAMAM?MAMAM?MAMAO?MAMAM?MAOAMAO?MAOAMAO?OAMAO?MAOAOAO?OAMAOAOAM?OAOAOAO?OAOAOAOAO?OAOAOAOAO?OAOAOAQAO?OAMAOAQAO?OAOAMAOAO?OAOAMAOAO?OAOAOAMAO?OAOAMAOAOAO?OAOAOAOAMAO?OAOAOAOAMAO?OAOAMAOAOAO?MAOAOAMAOAO?MAOAMAOAO?MAOAMAOAOAM?OAMAOAOAOAM?OAOAOAOAMAOAOAO?OAOAMAOAOAOAOAM?OAOAOAOAOAOAOAO?OAOAOAOAOAOAO?OAOAOAOAOAO?OAOAOAOAO?OAMAOAOAOAO?OAOAOAMAO?OAOAOAOAOAO?MAOAOAOAOAO?OAOAOAOAOAO?OAMAOAOAOAOAO?OAOAOAMAOAOAO?OAOAOAOAOAOAM?OAOAOAMAOAOAOAOAOAMAO?OAOAMAOAOAOAOAMAOAOAMAOAOAOAOAMAOAOAOAOAMAOAOAOCOAOAOAOAOAOAMAOAOAOAQAOAOAOAOAOAOAOAOAOAQAOAOAOAOAOAQAO?OAOAQAOAO?OAQAOAO?QAOAOAQ?OAOAO?QAO?OAOAQ?OAQAO?OAO?QAO?OAOAQ?OAQ?OAOAQ?OAO?OAQ?OAQAO?QAO?OAQAO?QAOAO?QAOAQ?OAOAQ?OAOAQ?OAQAOAQ?OAOAQAO?OAQAOAO?QAOAQAOAQ?OAOAQAOAO?QAOAQAOAQ?OAOAQAOAQ?OAQAOAOAQAO?QAOAOAQAOAQAOAQ?OAQAOAQAOAQAOAQAOAQAOAQAO?OAQAOAQAQAOAQAOAOAQAO?QAQAOAQAOAQAOAQ?OAQAOAQAQ?OAQAOAQ?QAOAQ?OAQAQ?OAQ?OAQ?O?QAO?Q?OAQ?Q?O?Q?Q?O?Q?O?Q?Q?Q@O?Q?Q?O@Q?Q@O?Q?O@Q?Q@O?Q@O?Q@O@Q?O@Q?O@Q?O@Q?O@Q?O@O?Q@O?O@Q?O@O?Q?O@Q?O?O@Q?O?O?Q@O?O?O?O@O?Q?O?O@O?O?Q@O?O?O?O@O?O?O?O@O?O?O?O?O@O?O?Q?O?O@O?O?O?O?Q?O?O?O?O?O?O?O?O?O?O?O?O?QAO?O?O?O?O?O?O?O?O?M?O?O?M@O?M@M@O@M@M@OBM@OBOBODOBQDODSFQDQFSFSFSFQFSFQDQDODQDQDODQBOBOBQBOBOBO@OBQ@O@Q@O@O?O@O?O?O?O?Q?O?O?QAOAO?QAOAQAQAQAQCQAQAQAQAOAQAOCO?QAOAOAOAM?OAO?MAM?OAM?OAM?M?OAM?O?M?MAO?M?OAO?M?OAM?OAM?O?MAO?OAM?OAO?MAOAO?OAMAOAQ?OAOAQAOAQAOAQAQAQAQ?QAQAOAO?QAO?MAO?OAM?M?M?M?M?K?M?K?K?K?K@K?I?K@K?K?I@K@I?K@K?I@K@K?I@K@I@K@I?K@K@K@I@K@K@I@K@K@I@K@K@K@K@K@K?K@K@K@K@M@K@K@K@K?M@K@K@M?K@K@M@M?K@M?K@M?K@M?K@M?M?M@M?K?M?M?M?M?K?M?O?MAM?MAO?MAOAM?OAMAOAOAMAMCOAMAMCMAMCMCMAMCKCMCKCKCKCKCKCKEKCICIEICICIEGCGCGEGCGEECGCECEEGCECEEECCCECEEECECCCECECCCEACCECCCEACCCAECCACACCCACACACACACACACACACACAC?CACAE?CACAC?EACAE?CAE?EAE?EAE?EAG?E?GAG?G?GAI?G?I?I?IAI?K@K?K?K?K?K?K@K?K?K@K?M?K@K?M?K@K?M?K?M@K?M?M?M@M?K?M?M?K?M?M?M?M?M?M?M?M?M?M?M?M?M?OAM?M?M?M?M?O?MAM?M?O?M?M?OAM?O?M?M?OAO?M?O?M?O?MAO?M?O?M?OAO?O?M?O?OAM?O?O?MAO?O?O?OAO?O?M?OAO?O?OAO?O?OAM?O?QAM?O?O?OAO?O?OAO?O?OAO?O?O?OAO?O?O?OAO?O?O?OAO?Q?O?OAO?O?O?O?OAO?O?Q?O?OAO?O?O?O?O?OAO?Q?O?O?O?OAO?O?O?O?O?O?Q?O?O?O?O?O?Q?O?O?O?O@O?O?O?O@O?O@O?O@O?O@O?O@O?O@M@O@O?O@O@O@O@O@M@O@O@O@O@OBO@O@M@O@OBO@O@OBO@O@OBO@O@OBO@M@OBO@O@OBM@OBO@O@MBO@O@MBO@MBO@O@OBM@OBM@OBM@OBO@MBO@OBMBO@OBM@OBOBM@OBOBO@MBOBO@MBOBO@MBOBOBO@OBM@OBOBO@OBMBO@OBOBO@OBM@OBOBM@OBO@OBO@MBO@MBOBO@MBO@MBO@OBM@O@OBM@OBO@MBO@OBO@O@OBO@OBO@O@OBO@O@OBO@O@OBO@O@OBO@O@OBO@M@OBO@OBM@O@OBO@MBO@O@MBO@OBM@OBOBO@MBOBO@MBOBOBM@OBMBOBOBMBOBMBMDOBMBMBMDMBODMBKDMDMBMDMDMDKDMDKDMDKDKDKFIDKDKFIDKFIDIFIDKFIFIDIFIFIFIDIFIFIFIDGDIFIDIDGDIDIDIDGBIDGBIBIBGBIBGBIBG@GBI@G@GBI@G@I@I@I@G@I@I?I@I@I?I@K?K@I?K@M?K?K?K@M?M?K?M?M?M?M?M?O?M?M?M?OAM?O?O?M?M?O?M?O?M?MAO?M?O?M?M?O?M?O?M?M?O?M?O?M?M?O?M?O?M?O?M@O?O?O@M?O@O?O@O?M@O@O?O@O@O@O@O?O@O@M@O@OBO@O@M@O@O@OBO@M@OBO@O@MBO@O@MBO@O@OBO@OBO@OBO@OBOBO@QBQ@QBSBQ@QBQ@MBO@K@K@K@I?G@I@G@G?G@E?E@E?E@E",
      precision: 6
    }
  end
end
