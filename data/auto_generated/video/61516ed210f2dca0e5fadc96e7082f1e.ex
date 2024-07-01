defmodule Data.AutoGenerated.Video.Rendered_61516ed210f2dca0e5fadc96e7082f1e do
  @moduledoc "#{"2024-06-16-borgfelder-strasse: Borgfelder Straße stadtauswärts"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2024-06-16-borgfelder-strasse: Borgfelder Straße stadtauswärts"
  end

  @impl Video.Rendered
  def hash() do
    "61516ed210f2dca0e5fadc96e7082f1e"
  end

  @impl Video.Rendered
  def length_ms() do
    42929
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2024-06-16-13im-14gg/GX017703", "00:00:45.045", :end},
      {"2024-06-16-13im-14gg/GX017704", :start, :end},
      {"2024-06-16-13im-14gg/GX017705", :start, :end},
      {"2024-06-16-13im-14gg/GX017706", :start, "00:00:18.085"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.02483712275449,
      minLat: 53.55368826946108,
      maxLon: 10.042046350299401,
      maxLat: 53.555358
    }
  end

  @impl Video.Rendered
  def renderer() do
    5
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Juni 2024"}]
  end

  @impl Video.Rendered
  def street_names() do
    [
      %{timestamp: 0, text: "Berlinertordamm"},
      %{timestamp: 5829, text: "Borgfelder Straße"},
      %{timestamp: 39856, text: "Hammer Landstraße"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.02483712275449, lat: 53.55368826946108, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.024986, lat: 53.553698, time_offset_ms: 325},
      %Video.TimedPoint{lon: 10.025145, lat: 53.553712, time_offset_ms: 658},
      %Video.TimedPoint{lon: 10.025305, lat: 53.553726, time_offset_ms: 992},
      %Video.TimedPoint{lon: 10.025466, lat: 53.553741, time_offset_ms: 1325},
      %Video.TimedPoint{lon: 10.02563, lat: 53.553759, time_offset_ms: 1659},
      %Video.TimedPoint{lon: 10.025794, lat: 53.553775, time_offset_ms: 1993},
      %Video.TimedPoint{lon: 10.025946, lat: 53.553788, time_offset_ms: 2326},
      %Video.TimedPoint{lon: 10.026092, lat: 53.553802, time_offset_ms: 2660},
      %Video.TimedPoint{lon: 10.026229, lat: 53.553814, time_offset_ms: 2993},
      %Video.TimedPoint{lon: 10.026363, lat: 53.553826, time_offset_ms: 3327},
      %Video.TimedPoint{lon: 10.026499, lat: 53.553839, time_offset_ms: 3660},
      %Video.TimedPoint{lon: 10.026629, lat: 53.553852, time_offset_ms: 3994},
      %Video.TimedPoint{lon: 10.026734, lat: 53.553865, time_offset_ms: 4328},
      %Video.TimedPoint{lon: 10.026805, lat: 53.553863, time_offset_ms: 4661},
      %Video.TimedPoint{lon: 10.026847, lat: 53.553855, time_offset_ms: 4995},
      %Video.TimedPoint{lon: 10.026872, lat: 53.553852, time_offset_ms: 5328},
      %Video.TimedPoint{lon: 10.02688, lat: 53.553847, time_offset_ms: 5662},
      %Video.TimedPoint{lon: 10.026853, lat: 53.553833, time_offset_ms: 5829},
      %Video.TimedPoint{lon: 10.026863, lat: 53.553825, time_offset_ms: 6163},
      %Video.TimedPoint{lon: 10.026907, lat: 53.553805, time_offset_ms: 6496},
      %Video.TimedPoint{lon: 10.026968, lat: 53.553767, time_offset_ms: 6830},
      %Video.TimedPoint{lon: 10.027059, lat: 53.553728, time_offset_ms: 7163},
      %Video.TimedPoint{lon: 10.027188, lat: 53.553721, time_offset_ms: 7497},
      %Video.TimedPoint{lon: 10.027331, lat: 53.553739, time_offset_ms: 7831},
      %Video.TimedPoint{lon: 10.027485, lat: 53.553763, time_offset_ms: 8164},
      %Video.TimedPoint{lon: 10.027639, lat: 53.553795, time_offset_ms: 8498},
      %Video.TimedPoint{lon: 10.027815, lat: 53.55382, time_offset_ms: 8831},
      %Video.TimedPoint{lon: 10.027993, lat: 53.553842, time_offset_ms: 9165},
      %Video.TimedPoint{lon: 10.028161, lat: 53.553869, time_offset_ms: 9499},
      %Video.TimedPoint{lon: 10.028299, lat: 53.553895, time_offset_ms: 9832},
      %Video.TimedPoint{lon: 10.0284, lat: 53.55391, time_offset_ms: 10166},
      %Video.TimedPoint{lon: 10.0285, lat: 53.553923, time_offset_ms: 10499},
      %Video.TimedPoint{lon: 10.028621, lat: 53.553943, time_offset_ms: 10833},
      %Video.TimedPoint{lon: 10.028768, lat: 53.553969, time_offset_ms: 11167},
      %Video.TimedPoint{lon: 10.02893, lat: 53.553995, time_offset_ms: 11500},
      %Video.TimedPoint{lon: 10.0291, lat: 53.554025, time_offset_ms: 11834},
      %Video.TimedPoint{lon: 10.029275, lat: 53.554054, time_offset_ms: 12167},
      %Video.TimedPoint{lon: 10.029448, lat: 53.554084, time_offset_ms: 12501},
      %Video.TimedPoint{lon: 10.029617, lat: 53.554119, time_offset_ms: 12835},
      %Video.TimedPoint{lon: 10.029795, lat: 53.554149, time_offset_ms: 13168},
      %Video.TimedPoint{lon: 10.029969, lat: 53.554179, time_offset_ms: 13502},
      %Video.TimedPoint{lon: 10.030142, lat: 53.554212, time_offset_ms: 13835},
      %Video.TimedPoint{lon: 10.030316, lat: 53.554242, time_offset_ms: 14169},
      %Video.TimedPoint{lon: 10.030492, lat: 53.554273, time_offset_ms: 14503},
      %Video.TimedPoint{lon: 10.030664, lat: 53.554304, time_offset_ms: 14836},
      %Video.TimedPoint{lon: 10.030831, lat: 53.554326, time_offset_ms: 15170},
      %Video.TimedPoint{lon: 10.03099, lat: 53.554338, time_offset_ms: 15503},
      %Video.TimedPoint{lon: 10.03113, lat: 53.554349, time_offset_ms: 15837},
      %Video.TimedPoint{lon: 10.031241, lat: 53.554369, time_offset_ms: 16171},
      %Video.TimedPoint{lon: 10.031351, lat: 53.554381, time_offset_ms: 16504},
      %Video.TimedPoint{lon: 10.031434, lat: 53.554391, time_offset_ms: 16838},
      %Video.TimedPoint{lon: 10.031484, lat: 53.554404, time_offset_ms: 17171},
      %Video.TimedPoint{lon: 10.03155, lat: 53.554409, time_offset_ms: 17505},
      %Video.TimedPoint{lon: 10.031636, lat: 53.554418, time_offset_ms: 17839},
      %Video.TimedPoint{lon: 10.031732, lat: 53.554432, time_offset_ms: 18172},
      %Video.TimedPoint{lon: 10.031831, lat: 53.554443, time_offset_ms: 18506},
      %Video.TimedPoint{lon: 10.031936, lat: 53.554432, time_offset_ms: 18839},
      %Video.TimedPoint{lon: 10.032051, lat: 53.554429, time_offset_ms: 19173},
      %Video.TimedPoint{lon: 10.032147, lat: 53.554431, time_offset_ms: 19506},
      %Video.TimedPoint{lon: 10.032229, lat: 53.554452, time_offset_ms: 19840},
      %Video.TimedPoint{lon: 10.032339, lat: 53.554459, time_offset_ms: 20174},
      %Video.TimedPoint{lon: 10.032463, lat: 53.554463, time_offset_ms: 20507},
      %Video.TimedPoint{lon: 10.032577, lat: 53.554469, time_offset_ms: 20841},
      %Video.TimedPoint{lon: 10.032693, lat: 53.554477, time_offset_ms: 21174},
      %Video.TimedPoint{lon: 10.032771, lat: 53.554498, time_offset_ms: 21508},
      %Video.TimedPoint{lon: 10.032827, lat: 53.554513, time_offset_ms: 21842},
      %Video.TimedPoint{lon: 10.03286, lat: 53.554508, time_offset_ms: 22175},
      %Video.TimedPoint{lon: 10.032919, lat: 53.55451, time_offset_ms: 22242},
      %Video.TimedPoint{lon: 10.032936, lat: 53.554511, time_offset_ms: 22576},
      %Video.TimedPoint{lon: 10.033007, lat: 53.554515, time_offset_ms: 22909},
      %Video.TimedPoint{lon: 10.033119, lat: 53.554516, time_offset_ms: 23243},
      %Video.TimedPoint{lon: 10.033247, lat: 53.554519, time_offset_ms: 23576},
      %Video.TimedPoint{lon: 10.033378, lat: 53.554526, time_offset_ms: 23910},
      %Video.TimedPoint{lon: 10.033482, lat: 53.554529, time_offset_ms: 24244},
      %Video.TimedPoint{lon: 10.033545, lat: 53.554527, time_offset_ms: 24577},
      %Video.TimedPoint{lon: 10.033585, lat: 53.554508, time_offset_ms: 24844},
      %Video.TimedPoint{lon: 10.033596, lat: 53.554505, time_offset_ms: 25178},
      %Video.TimedPoint{lon: 10.033648, lat: 53.554484, time_offset_ms: 25511},
      %Video.TimedPoint{lon: 10.033736, lat: 53.554462, time_offset_ms: 25845},
      %Video.TimedPoint{lon: 10.033839, lat: 53.554483, time_offset_ms: 26178},
      %Video.TimedPoint{lon: 10.03396, lat: 53.554521, time_offset_ms: 26512},
      %Video.TimedPoint{lon: 10.034094, lat: 53.554558, time_offset_ms: 26846},
      %Video.TimedPoint{lon: 10.034239, lat: 53.554596, time_offset_ms: 27179},
      %Video.TimedPoint{lon: 10.034386, lat: 53.554635, time_offset_ms: 27513},
      %Video.TimedPoint{lon: 10.034547, lat: 53.554659, time_offset_ms: 27846},
      %Video.TimedPoint{lon: 10.034705, lat: 53.554685, time_offset_ms: 28180},
      %Video.TimedPoint{lon: 10.034865, lat: 53.554706, time_offset_ms: 28514},
      %Video.TimedPoint{lon: 10.035031, lat: 53.55473, time_offset_ms: 28847},
      %Video.TimedPoint{lon: 10.035202, lat: 53.554758, time_offset_ms: 29181},
      %Video.TimedPoint{lon: 10.035378, lat: 53.554786, time_offset_ms: 29514},
      %Video.TimedPoint{lon: 10.035572, lat: 53.554804, time_offset_ms: 29848},
      %Video.TimedPoint{lon: 10.035761, lat: 53.554811, time_offset_ms: 30182},
      %Video.TimedPoint{lon: 10.035945, lat: 53.554821, time_offset_ms: 30515},
      %Video.TimedPoint{lon: 10.036126, lat: 53.55484, time_offset_ms: 30849},
      %Video.TimedPoint{lon: 10.036303, lat: 53.55486, time_offset_ms: 31182},
      %Video.TimedPoint{lon: 10.036478, lat: 53.554883, time_offset_ms: 31516},
      %Video.TimedPoint{lon: 10.036639, lat: 53.554898, time_offset_ms: 31850},
      %Video.TimedPoint{lon: 10.036792, lat: 53.554922, time_offset_ms: 32183},
      %Video.TimedPoint{lon: 10.036972, lat: 53.55494, time_offset_ms: 32517},
      %Video.TimedPoint{lon: 10.037152, lat: 53.554955, time_offset_ms: 32850},
      %Video.TimedPoint{lon: 10.037336, lat: 53.554967, time_offset_ms: 33184},
      %Video.TimedPoint{lon: 10.037513, lat: 53.554985, time_offset_ms: 33518},
      %Video.TimedPoint{lon: 10.03768, lat: 53.55501, time_offset_ms: 33851},
      %Video.TimedPoint{lon: 10.037843, lat: 53.555044, time_offset_ms: 34185},
      %Video.TimedPoint{lon: 10.038005, lat: 53.555079, time_offset_ms: 34518},
      %Video.TimedPoint{lon: 10.038168, lat: 53.555103, time_offset_ms: 34852},
      %Video.TimedPoint{lon: 10.038332, lat: 53.555124, time_offset_ms: 35186},
      %Video.TimedPoint{lon: 10.038492, lat: 53.555147, time_offset_ms: 35519},
      %Video.TimedPoint{lon: 10.03865, lat: 53.555165, time_offset_ms: 35853},
      %Video.TimedPoint{lon: 10.038808, lat: 53.555184, time_offset_ms: 36186},
      %Video.TimedPoint{lon: 10.038961, lat: 53.555204, time_offset_ms: 36520},
      %Video.TimedPoint{lon: 10.039111, lat: 53.555223, time_offset_ms: 36854},
      %Video.TimedPoint{lon: 10.039268, lat: 53.555232, time_offset_ms: 37187},
      %Video.TimedPoint{lon: 10.039423, lat: 53.555236, time_offset_ms: 37521},
      %Video.TimedPoint{lon: 10.039582, lat: 53.555248, time_offset_ms: 37854},
      %Video.TimedPoint{lon: 10.039736, lat: 53.555258, time_offset_ms: 38188},
      %Video.TimedPoint{lon: 10.039891, lat: 53.555275, time_offset_ms: 38522},
      %Video.TimedPoint{lon: 10.040046, lat: 53.555292, time_offset_ms: 38855},
      %Video.TimedPoint{lon: 10.040186, lat: 53.555317, time_offset_ms: 39189},
      %Video.TimedPoint{lon: 10.040342, lat: 53.55534, time_offset_ms: 39522},
      %Video.TimedPoint{lon: 10.040507, lat: 53.555347, time_offset_ms: 39856},
      %Video.TimedPoint{lon: 10.040672, lat: 53.555349, time_offset_ms: 40190},
      %Video.TimedPoint{lon: 10.040837, lat: 53.555355, time_offset_ms: 40523},
      %Video.TimedPoint{lon: 10.041, lat: 53.555358, time_offset_ms: 40857},
      %Video.TimedPoint{lon: 10.041163, lat: 53.55535, time_offset_ms: 41190},
      %Video.TimedPoint{lon: 10.041329, lat: 53.555338, time_offset_ms: 41524},
      %Video.TimedPoint{lon: 10.041499, lat: 53.555323, time_offset_ms: 41858},
      %Video.TimedPoint{lon: 10.041668, lat: 53.555308, time_offset_ms: 42191},
      %Video.TimedPoint{lon: 10.041841, lat: 53.555293, time_offset_ms: 42525},
      %Video.TimedPoint{lon: 10.04201, lat: 53.555277, time_offset_ms: 42858},
      %Video.TimedPoint{lon: 10.042046350299401, lat: 53.555275299401195, time_offset_ms: 42929}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "s`tceBgyzbR?EAE?E?G?GAG?G?IAI?I?KAK?KAM?MAOAQ?OASAS?QAQAQ?OAQAO?OAOAO?OAOAO?OAOAOAO?OAOAO?OAOAO?OAOAOAO?OAMAQ?OAOAO?OAOAMAO?OAOAOAQ?OAOAO?OAOAOAO?OAOAOAOAO?OAOAOAO?OAOAOAQAOAO?OAOAOAOAQAOAO?QAOAOAOAOAQAO?OAOAOAQAOAOAQ?OAOAOAOAQ?OAOAQAOAO?OAOAOAO?OAOAOAO?OAOAM?OAOAOAM?OAMAO?OAMAO?MAMAO?MAOAM?OAMAO?MAOAM?MAOAM?MAOAM?MAMAO?MAMAM?MAMAM?MAMAM?MAM?MAMAM?KAMAM?MAK?MAM?KAMAM?MAMAK?MAM?KAM?KAMAM?MAK?MAMAK?MAKAM?MAM?MAKAM?MAMAM?MAKAM?MAMAM?MAM?KAMAM?MAMAM?KAMAMAM?MAKAM?MAMAK?MAMAM?KAMAKAM?KAM?KAMAK?KAKAM?KAK?KAK?KAK?K?KAK?K?I?K?K?I?O@Q@Q@K?M@I?I@I?E@G?E@E?E?E@C?E?C@C?C?A@C?C?A@C?A?A?A@A?C?A@A???A?A?A@A?A???A@A???A?A???A@??A?????A???A@????A?????A??????@A???????A??????????@A??????????????????????@????????@??????????@????????A??????@A???????A@??A???A@??A??@A?A@??A@A?A@A?A@A@A?A@A@A@A@C@A@C@A@C@CBC@CBC@EBCBEBEDGBGDGDGDIFIDKFIDKDKDKBGDIBIBGBIBIBGBIBIBGBIBI@IBI@IBI@IBI@I@IBK@I@K@I@K@I@K@K?K@K@M?K@M?K?K?M@M?K?M?MAM?M?M?KAM?MAM?MAO?MAMAMAO?MAMAOAMAMAOAMAOAOAMAOAMAOCOAOAMAOAOCOAMAOCOAOAMAOCMAOCOAOAMCOAOCMAOAMCOAOCMAOCOAOCMAOCOAOAOCOAQCOAQCOAQAOCQAQAQCOAQAQCQAQAQCQAQAOAQAQCQAQAQAQAQAQCOAQAQAQAQAQCQAQAQAOAQAQCOAQAQAQCQAOAQCQAOAQCOAQAQCQAOAOCQAOAOCOAOCOAOAOCMAOAOCMAOAMCOAMAMCOAKAMAMAMAKAKAKAKAKAKAKAKAIAIAKAI?GAIAIAI?GAIAI?GAIAG?IAGAI?IAGAI?IAGAI?IAGAI?GAIAI?IAGAI?KAIAIAIAI?KAIAKAIAKAKAK?KAKAKAKAKAKAKAMCKAMAKAMAMAMAMCMAMAMAMAOCMAMAOCMAOAOCMAOAMAOCOAOAMCOAOAOCOAOAOCOAOAOCOAOAOCQAOAOCOAOCQAOAOCQAOCQAOCOAQAOCQAOCQAQCOAQCOAQCOAQCOAQCQAOCQAQCOAQCQAQAOCQAQCQAQCOAQCQAQCOAQCQAOCQAQCQAOCQAOCQAQCOAQCQAOCQAOCQAOCQCOAQCQAOCQCOAQCOCQAOCOCQAOCQCOAQCOCQAOCQAOCQCQAOCQCQAQCQAQCOCQAQCQAQCQAQCQAQCOAQCQAQCQAQCQAOCQAQCOAQCQAOCQAQCOAQCQCOAQCOAQCQAOCQAQCQCOAQCQAOCQCQAQCOCQAQCOAQCOCQAQCOAQCQAQCOCQAOCQAQCOAQCQAOCQAQCOAQCQAOCQAQCQAOCQAQCQCOAQCQAQCOAQCQAQCQAQCOCQAQCOAQCQAQCQAOCQCQAOCQAQCOAQCQAQCOAQAOCQAOCQAOAQCOAQAOAQCOAQAOAOAQAOCQAOAQAOAOAO?OAQAOAOAOAOAQ?OAOAOAO?OAOAO?OAOAO?OAOAO?MAO?OAMAO?MAO?MAOAM?MAMAO?MAMAM?MAKAMAK?MAKAMAK?KAMAKAIAK?KAKAIAKAI?KAIAKAIAK?IAKAKAI?KAKAIAKAK?KAIAKAK?KAKAKAK?KAKAIAK?IAKAI?KAIAI?IAIAG?IAGAG?GAG?GAG?GAE?GAE?EAE?EAE?EAE?E?CAE?CAE?C?CAC?E?CAC?C?CAE?C?C?CAE?CAE?C?EAC?E?CAE?E?CAE?E?EAE?EAE?G?EAE?GAG?EAG?G?GAG?GAG?IAG?IAG?IAIAG?IAI?IAG?IAI?IAIAI?IAIAI?IAI?IAIAI?IAIAI?IAI?IAI?IAIAI?IAI?I?IAI?IAI?I?IAI?I?I?IAG?I?I?I?I?I?I?I?I?I?I?I?I?K@I?I?K?I?I@K?I?K?I@K?K?K@I?K?K?K@K?K?K?K?K@K?K?K?K?K?K?I?K?K?I?K?I?I?I?IAI?I?I?IAG?I?GAI?G?GAG?I?GAG?GAG?GAG?GAG?GAG?GAG?GAG?GAGAG?GAI?GAGAI?GAI?IAIAG?IAI?IAI?KAIAK?IAK?KAI?K?KAK?KAK?K?MAK?K?KAM?K?M?KAK?M?MAK?K?K?MAK?K?K?KAK?K?KAK?K?K?IAK?K?IAK?K?K?IAK?K?IAK?KAK?K?KAK?KAK?MAKAK?KAMAK?KAKAKAK?IAKAIAKAIAKAIAIAKAIAI?IAIAGAIAIAGAG?GAGAE?GAGAE?EAG?EAE?EAG?EAE?E?EAE?CAE?C?E?CAC?C?C?C?CAC?C?C?A?C?A?CAA?A?C?A?A?C?A?C?C?CAC?E?G?G?KAQ?I?G?E?C?CAC?A?A?A?A?A???A?A?A?A?A?A?A?C?A?C?C?C?C?C?CAC?E?E?E?E?E?E?G?E?GAG?G?G?G?I?I?IAI?I?K?K?K?MAM?M?O?M?MAM?M?M?K?M?K?MAK?M?K?M?K?M?K?MAM?K?M?M?KAM?K?M?M?KAM?M?MAK?M?M?MAM?M?KAO?M?M?KAM?M?MAK?M?M?KAM?M?K?K?M?K?KAK?K?M?K@K?I?K?K@K?I?I@I?I@G?I?E@G?E@E?E?E@E?C?E@C?C@E?C?C@C?C?C@C?C@C?A@C?C?C@C?C@A?C@C?A@C?A?A@A?A?A?A@A???A?A???A@????A???A???A@A?A?A@A?A?A@A?A?C@A?C@C@A?C@E?C@C@C@E?C@E@E@E@E@E@E@G?G@G@G@G@GBI@I@I@I@I@K@I?K@I@I?K@I?I?I?G@IAI?G?I?I?IAI?IAKAI?IAKAIAIAKAKAKCKAKAKCKAKCKCKAMCKCKCMCMAKCKCMCKCKCMCKAMCKCMCKCMCKCMCKCMAKCMCMCMCKCMCMCMAMCKCMCMCOCMCMCMCMCMCOAMCMCMCOCMCMCMCOCMCMCOCMCMAOCMCMCOCMCMCMCOCMAOCMCOCMCMAOCMCOAMCOCMAOCOAOCMAOCOAOCOAOAOCOAOAOCOAOAOCOAOAOAOCOAQAMAOCOAOAOAOCOAOAOAOCOAMAOAOAOCOAOAOAOAOCOAMAOAOAOAOAOAOAOCOAOAOAMAOAOAOAOAOCQAOAOAOAOAQAOCOAQAOAOAQCOAOAQAOCOAQAOAQCOAQAOCQAOAQCOAOAQCOAQCQAOAQCOAQAQCOAQCOAQAQCQAOCQAQAQCOAQAQCQAOAQCQAQAQAQCQAQAQAQASAQAQCSAQASAQASASAS?SASAQASAS?QASASAQ?SAS?QASAQ?SAQ?Q?SAQ?SAQ?SAQ?Q?SAQ?QAS?QAQ?S?QAQ?QAS?QAQ?SAQ?QAQAS?QAQ?QAQAQ?QAQAQ?SAQAQAQAQ?QAQAQAQAQAQAQAQAQ?QAQAQAQAQAQAQAQAQAQAQAQAQAOAQAQAQAQAQAQAOAQAQAQCOAQAQAQAQAQAOAQAQAQAQCQAQAQAOAQAQAOAQAOAQAOAQAOAQAO?OAOAOAOAOAOAOAO?OAOAMAOAOAMAOAOAOAMAOAOAMAOAOAMAOAMAOAMAOAMAOAOAOAOAOAQAOAQAOCQAQAOAQAQAQ?SAQAQAQAQAQAQAQAQAQ?SAQAQAQAQ?QAQAQAQAQ?QAQAQAQ?QAQAQ?QAQAQ?QAQAQ?QASAQ?QAQAQ?QASAQ?QAQAQ?SAQAQAQ?QAQAQAQ?QAQAQAQAOAQ?QAQAQAQAQAOAQAQAOAQAOAQAQCOAQAOAQAQAOAOCQAOAOCQAOAOAOCQAOCOAOCOAQCOAOCOAOCQAOCOAOCOCQAOCOCOAOCOCOCOAQCOCOAOCOCQCOAOCOCOAQCOCOCOAOCQAOCOAOCOAOCOAOCQAOCOAOAOCOAOAOAOCOAOAOAOCOAOAQAOAOAOAOCQAOAOAOAOAOAOAQAOAOCOAQAOAOAOAOAOAOAOAQAOCOAOAOAOAOAOAOAOAOCQAMAOAOAOAOAOAOAOAOAOAOAOAOAMAOAOAOAOAOAOAM?OAOAOAOAMAOAOAOAOAOAOAOAOAOAO?OAOAOAOAOAOAMAOAOAOAMAOAOAOAOAMAOAOAMAOAOAMAOAOAMAOAMAOAOAMAOAMAOAMAO?MAOAMAOAMAOAMAOAM?OAMAOAMAO?MAOAO?MAOAO?MAOAO?OAO?OAO?OAO?MAO?O?OAO?MAO?O?OAO?M?OAO?M?O?OAM?O?OAO?M?OAO?M?OAO?O?OAO?OAM?OAO?OAO?OAO?OAQ?OAO?OAM?OAO?OAOAO?OAO?MAO?OAM?OAO?MAOAO?MAO?MAOAO?MAO?OAMAOAO?OAMAO?OAMAOAO?OAOAMAOAOAO?MAOAOAMAOAO?OAOAOAMAOAOAOAOAOAOAMAO?OAMAOAMAOAMCOAMAMAMAMAMAMAMAMAMAMAMCMAMAMAMAMAMAMCMAOAMAOAMAOCOAMAOAOAMAOAOAOAOAOAOAOAOAOAOAO?OAOAO?OAOAO?OAQ?OAO?O?QAO?OAO?Q?O?OAO?Q?O?OAQ?O?O?O?OAQ?O?O?O?Q?OAO?O?O?Q?O?OAO?Q?O?OAO?Q?O?Q?OAO?O?Q?OAO?O?Q?OAO?O?O?QAO?O?O?O?Q?OAO?O?O?O?O?Q?O?O?O?O?O?O?O?O?O?Q@O?O?O?O?O@O?O?Q@O?O?O@O?O@Q?O@O?O@O?Q@O?O@O?O@O?Q@O?O@O?Q@O@Q?O@O@O?Q@O?O@Q@O@Q?O@Q@O?O@Q@O?Q@O@Q@Q?O@Q@O@Q?O@Q@O@Q?O@Q@O@O?Q@Q@O@O?Q@O@Q@O?Q@O@O@Q?O@Q@O@Q?Q@O@Q@O?Q@O@Q@Q?O@Q@Q@Q?O@Q@O@Q@Q?Q@Q@Q@Q@Q@S?S@U@UBW@[@Y@U@S?Q@M@M?K@I?I?I@G?E?G@E?E?C",
      precision: 6
    }
  end
end