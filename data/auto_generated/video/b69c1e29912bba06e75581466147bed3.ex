defmodule Data.AutoGenerated.Video.Rendered_b69c1e29912bba06e75581466147bed3 do
  @moduledoc "#{"lexikon/bettel-Und-bedarfs-ampel: entlang des Isebekkanals zum Grindelberg"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "lexikon/bettel-Und-bedarfs-ampel: entlang des Isebekkanals zum Grindelberg"
  end

  @impl Video.Rendered
  def hash() do
    "b69c1e29912bba06e75581466147bed3"
  end

  @impl Video.Rendered
  def length_ms() do
    56808
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2023-10-29-lenhart/GX016630", "00:00:16.683", :end},
      {"2023-10-29-lenhart/GX016631", :start, :end},
      {"2023-10-29-lenhart/GX016632", :start, :end},
      {"2023-10-29-lenhart/GX016633", :start, "00:00:02.469"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.961523,
      minLat: 53.57060136936937,
      maxLon: 9.976653,
      maxLat: 53.578263455089825
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{timestamp: 0, text: "Oktober 2023"}]
  end

  @impl Video.Rendered
  def street_names() do
    [
      %{timestamp: 0, text: "Weidenstieg"},
      %{timestamp: 1998, text: ""},
      %{timestamp: 11339, text: "Bundesstraße"},
      %{timestamp: 15943, text: ""},
      %{timestamp: 22949, text: "Goebenbrücke"},
      %{timestamp: 25617, text: ""},
      %{timestamp: 29287, text: "Kaiser-Friedrich-Ufer"},
      %{timestamp: 50670, text: ""},
      %{timestamp: 52004, text: "Grindelberg"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.96157453153153, lat: 53.57060136936937, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.961523, lat: 53.570642, time_offset_ms: 330},
      %Video.TimedPoint{lon: 9.961527, lat: 53.570681, time_offset_ms: 664},
      %Video.TimedPoint{lon: 9.961561, lat: 53.57073, time_offset_ms: 998},
      %Video.TimedPoint{lon: 9.961623, lat: 53.570778, time_offset_ms: 1331},
      %Video.TimedPoint{lon: 9.961691, lat: 53.57083, time_offset_ms: 1665},
      %Video.TimedPoint{lon: 9.96177, lat: 53.570889, time_offset_ms: 1998},
      %Video.TimedPoint{lon: 9.961856, lat: 53.570957, time_offset_ms: 2332},
      %Video.TimedPoint{lon: 9.96193, lat: 53.571032, time_offset_ms: 2666},
      %Video.TimedPoint{lon: 9.962, lat: 53.571116, time_offset_ms: 2999},
      %Video.TimedPoint{lon: 9.962068, lat: 53.571194, time_offset_ms: 3333},
      %Video.TimedPoint{lon: 9.962116, lat: 53.571244, time_offset_ms: 3666},
      %Video.TimedPoint{lon: 9.96219, lat: 53.571325, time_offset_ms: 4000},
      %Video.TimedPoint{lon: 9.962263, lat: 53.571411, time_offset_ms: 4334},
      %Video.TimedPoint{lon: 9.962331, lat: 53.571487, time_offset_ms: 4667},
      %Video.TimedPoint{lon: 9.962399, lat: 53.571566, time_offset_ms: 5001},
      %Video.TimedPoint{lon: 9.962464, lat: 53.57164, time_offset_ms: 5334},
      %Video.TimedPoint{lon: 9.962529, lat: 53.571718, time_offset_ms: 5668},
      %Video.TimedPoint{lon: 9.962607, lat: 53.571804, time_offset_ms: 6002},
      %Video.TimedPoint{lon: 9.962701, lat: 53.571905, time_offset_ms: 6335},
      %Video.TimedPoint{lon: 9.962794, lat: 53.571998, time_offset_ms: 6669},
      %Video.TimedPoint{lon: 9.962883, lat: 53.572082, time_offset_ms: 7002},
      %Video.TimedPoint{lon: 9.962975, lat: 53.572157, time_offset_ms: 7336},
      %Video.TimedPoint{lon: 9.963078, lat: 53.572243, time_offset_ms: 7670},
      %Video.TimedPoint{lon: 9.963177, lat: 53.572331, time_offset_ms: 8003},
      %Video.TimedPoint{lon: 9.963283, lat: 53.572418, time_offset_ms: 8337},
      %Video.TimedPoint{lon: 9.963393, lat: 53.572502, time_offset_ms: 8670},
      %Video.TimedPoint{lon: 9.963498, lat: 53.572587, time_offset_ms: 9004},
      %Video.TimedPoint{lon: 9.96361, lat: 53.572675, time_offset_ms: 9338},
      %Video.TimedPoint{lon: 9.963713, lat: 53.572751, time_offset_ms: 9671},
      %Video.TimedPoint{lon: 9.963797, lat: 53.572811, time_offset_ms: 10005},
      %Video.TimedPoint{lon: 9.963851, lat: 53.572859, time_offset_ms: 10338},
      %Video.TimedPoint{lon: 9.963901, lat: 53.572899, time_offset_ms: 10672},
      %Video.TimedPoint{lon: 9.963948, lat: 53.572935, time_offset_ms: 11006},
      %Video.TimedPoint{lon: 9.96398, lat: 53.572959, time_offset_ms: 11339},
      %Video.TimedPoint{lon: 9.964005, lat: 53.572978, time_offset_ms: 11673},
      %Video.TimedPoint{lon: 9.964028, lat: 53.572994, time_offset_ms: 12006},
      %Video.TimedPoint{lon: 9.964043, lat: 53.573005, time_offset_ms: 12340},
      %Video.TimedPoint{lon: 9.964107, lat: 53.573046, time_offset_ms: 12607},
      %Video.TimedPoint{lon: 9.964113, lat: 53.57305, time_offset_ms: 12941},
      %Video.TimedPoint{lon: 9.964144, lat: 53.57307, time_offset_ms: 13274},
      %Video.TimedPoint{lon: 9.964209, lat: 53.573099, time_offset_ms: 13608},
      %Video.TimedPoint{lon: 9.964287, lat: 53.573138, time_offset_ms: 13941},
      %Video.TimedPoint{lon: 9.964364, lat: 53.573185, time_offset_ms: 14275},
      %Video.TimedPoint{lon: 9.964421, lat: 53.573227, time_offset_ms: 14609},
      %Video.TimedPoint{lon: 9.964472, lat: 53.573267, time_offset_ms: 14942},
      %Video.TimedPoint{lon: 9.96454, lat: 53.573313, time_offset_ms: 15276},
      %Video.TimedPoint{lon: 9.964619, lat: 53.573358, time_offset_ms: 15609},
      %Video.TimedPoint{lon: 9.964707, lat: 53.573416, time_offset_ms: 15943},
      %Video.TimedPoint{lon: 9.964806, lat: 53.573474, time_offset_ms: 16277},
      %Video.TimedPoint{lon: 9.964919, lat: 53.57353, time_offset_ms: 16610},
      %Video.TimedPoint{lon: 9.965042, lat: 53.573585, time_offset_ms: 16944},
      %Video.TimedPoint{lon: 9.965168, lat: 53.57364, time_offset_ms: 17277},
      %Video.TimedPoint{lon: 9.965289, lat: 53.573695, time_offset_ms: 17611},
      %Video.TimedPoint{lon: 9.965416, lat: 53.573747, time_offset_ms: 17945},
      %Video.TimedPoint{lon: 9.965543, lat: 53.5738, time_offset_ms: 18278},
      %Video.TimedPoint{lon: 9.96567, lat: 53.573855, time_offset_ms: 18612},
      %Video.TimedPoint{lon: 9.9658, lat: 53.573911, time_offset_ms: 18945},
      %Video.TimedPoint{lon: 9.965929, lat: 53.573966, time_offset_ms: 19279},
      %Video.TimedPoint{lon: 9.966059, lat: 53.574023, time_offset_ms: 19613},
      %Video.TimedPoint{lon: 9.966187, lat: 53.574078, time_offset_ms: 19946},
      %Video.TimedPoint{lon: 9.966309, lat: 53.574128, time_offset_ms: 20280},
      %Video.TimedPoint{lon: 9.966427, lat: 53.574178, time_offset_ms: 20613},
      %Video.TimedPoint{lon: 9.966552, lat: 53.574229, time_offset_ms: 20947},
      %Video.TimedPoint{lon: 9.966677, lat: 53.574282, time_offset_ms: 21281},
      %Video.TimedPoint{lon: 9.966793, lat: 53.57433, time_offset_ms: 21614},
      %Video.TimedPoint{lon: 9.966911, lat: 53.574383, time_offset_ms: 21948},
      %Video.TimedPoint{lon: 9.967033, lat: 53.574437, time_offset_ms: 22281},
      %Video.TimedPoint{lon: 9.967137, lat: 53.574487, time_offset_ms: 22615},
      %Video.TimedPoint{lon: 9.96723, lat: 53.574531, time_offset_ms: 22949},
      %Video.TimedPoint{lon: 9.967324, lat: 53.574571, time_offset_ms: 23282},
      %Video.TimedPoint{lon: 9.967423, lat: 53.574612, time_offset_ms: 23616},
      %Video.TimedPoint{lon: 9.96752, lat: 53.574649, time_offset_ms: 23949},
      %Video.TimedPoint{lon: 9.967585, lat: 53.57467, time_offset_ms: 24283},
      %Video.TimedPoint{lon: 9.967672, lat: 53.574706, time_offset_ms: 24617},
      %Video.TimedPoint{lon: 9.967768, lat: 53.574743, time_offset_ms: 24950},
      %Video.TimedPoint{lon: 9.967872, lat: 53.574791, time_offset_ms: 25284},
      %Video.TimedPoint{lon: 9.967988, lat: 53.574842, time_offset_ms: 25617},
      %Video.TimedPoint{lon: 9.968115, lat: 53.574895, time_offset_ms: 25951},
      %Video.TimedPoint{lon: 9.968242, lat: 53.574951, time_offset_ms: 26284},
      %Video.TimedPoint{lon: 9.968371, lat: 53.575, time_offset_ms: 26618},
      %Video.TimedPoint{lon: 9.968498, lat: 53.575052, time_offset_ms: 26952},
      %Video.TimedPoint{lon: 9.96862, lat: 53.575104, time_offset_ms: 27285},
      %Video.TimedPoint{lon: 9.968733, lat: 53.575158, time_offset_ms: 27619},
      %Video.TimedPoint{lon: 9.968843, lat: 53.57522, time_offset_ms: 27952},
      %Video.TimedPoint{lon: 9.968963, lat: 53.575278, time_offset_ms: 28286},
      %Video.TimedPoint{lon: 9.969082, lat: 53.575328, time_offset_ms: 28620},
      %Video.TimedPoint{lon: 9.969189, lat: 53.575374, time_offset_ms: 28953},
      %Video.TimedPoint{lon: 9.969297, lat: 53.575424, time_offset_ms: 29287},
      %Video.TimedPoint{lon: 9.969422, lat: 53.575471, time_offset_ms: 29620},
      %Video.TimedPoint{lon: 9.969546, lat: 53.575524, time_offset_ms: 29954},
      %Video.TimedPoint{lon: 9.969665, lat: 53.575572, time_offset_ms: 30288},
      %Video.TimedPoint{lon: 9.969775, lat: 53.575617, time_offset_ms: 30621},
      %Video.TimedPoint{lon: 9.969875, lat: 53.575658, time_offset_ms: 30955},
      %Video.TimedPoint{lon: 9.969966, lat: 53.575697, time_offset_ms: 31288},
      %Video.TimedPoint{lon: 9.970058, lat: 53.575736, time_offset_ms: 31622},
      %Video.TimedPoint{lon: 9.970134, lat: 53.575769, time_offset_ms: 31956},
      %Video.TimedPoint{lon: 9.970201, lat: 53.575796, time_offset_ms: 32289},
      %Video.TimedPoint{lon: 9.970257, lat: 53.57582, time_offset_ms: 32623},
      %Video.TimedPoint{lon: 9.970303, lat: 53.575844, time_offset_ms: 32956},
      %Video.TimedPoint{lon: 9.970346, lat: 53.575864, time_offset_ms: 33290},
      %Video.TimedPoint{lon: 9.970381, lat: 53.575881, time_offset_ms: 33624},
      %Video.TimedPoint{lon: 9.970403, lat: 53.57589, time_offset_ms: 33957},
      %Video.TimedPoint{lon: 9.970429, lat: 53.575885, time_offset_ms: 33990},
      %Video.TimedPoint{lon: 9.97044, lat: 53.575892, time_offset_ms: 34324},
      %Video.TimedPoint{lon: 9.970491, lat: 53.575919, time_offset_ms: 34657},
      %Video.TimedPoint{lon: 9.97058, lat: 53.575957, time_offset_ms: 34991},
      %Video.TimedPoint{lon: 9.97069, lat: 53.575988, time_offset_ms: 35324},
      %Video.TimedPoint{lon: 9.97081, lat: 53.57603, time_offset_ms: 35658},
      %Video.TimedPoint{lon: 9.970938, lat: 53.576083, time_offset_ms: 35992},
      %Video.TimedPoint{lon: 9.971071, lat: 53.576137, time_offset_ms: 36325},
      %Video.TimedPoint{lon: 9.971208, lat: 53.576192, time_offset_ms: 36659},
      %Video.TimedPoint{lon: 9.971344, lat: 53.576246, time_offset_ms: 36992},
      %Video.TimedPoint{lon: 9.97148, lat: 53.576299, time_offset_ms: 37326},
      %Video.TimedPoint{lon: 9.971619, lat: 53.576358, time_offset_ms: 37660},
      %Video.TimedPoint{lon: 9.971763, lat: 53.57642, time_offset_ms: 37993},
      %Video.TimedPoint{lon: 9.971906, lat: 53.576477, time_offset_ms: 38327},
      %Video.TimedPoint{lon: 9.97205, lat: 53.576532, time_offset_ms: 38660},
      %Video.TimedPoint{lon: 9.972192, lat: 53.576589, time_offset_ms: 38994},
      %Video.TimedPoint{lon: 9.97234, lat: 53.576649, time_offset_ms: 39328},
      %Video.TimedPoint{lon: 9.972478, lat: 53.576711, time_offset_ms: 39661},
      %Video.TimedPoint{lon: 9.972607, lat: 53.576766, time_offset_ms: 39995},
      %Video.TimedPoint{lon: 9.972742, lat: 53.576825, time_offset_ms: 40328},
      %Video.TimedPoint{lon: 9.972872, lat: 53.576883, time_offset_ms: 40662},
      %Video.TimedPoint{lon: 9.972984, lat: 53.576929, time_offset_ms: 40996},
      %Video.TimedPoint{lon: 9.973068, lat: 53.576964, time_offset_ms: 41329},
      %Video.TimedPoint{lon: 9.973148, lat: 53.576996, time_offset_ms: 41663},
      %Video.TimedPoint{lon: 9.973228, lat: 53.577027, time_offset_ms: 41996},
      %Video.TimedPoint{lon: 9.973307, lat: 53.577058, time_offset_ms: 42330},
      %Video.TimedPoint{lon: 9.973385, lat: 53.57709, time_offset_ms: 42664},
      %Video.TimedPoint{lon: 9.97346, lat: 53.577122, time_offset_ms: 42997},
      %Video.TimedPoint{lon: 9.973532, lat: 53.577151, time_offset_ms: 43331},
      %Video.TimedPoint{lon: 9.9736, lat: 53.57718, time_offset_ms: 43664},
      %Video.TimedPoint{lon: 9.973665, lat: 53.577209, time_offset_ms: 43998},
      %Video.TimedPoint{lon: 9.973728, lat: 53.577235, time_offset_ms: 44332},
      %Video.TimedPoint{lon: 9.973791, lat: 53.577252, time_offset_ms: 44665},
      %Video.TimedPoint{lon: 9.973856, lat: 53.577256, time_offset_ms: 44999},
      %Video.TimedPoint{lon: 9.973936, lat: 53.577265, time_offset_ms: 45332},
      %Video.TimedPoint{lon: 9.974034, lat: 53.577291, time_offset_ms: 45666},
      %Video.TimedPoint{lon: 9.974139, lat: 53.577331, time_offset_ms: 46000},
      %Video.TimedPoint{lon: 9.974246, lat: 53.577374, time_offset_ms: 46333},
      %Video.TimedPoint{lon: 9.974348, lat: 53.577417, time_offset_ms: 46667},
      %Video.TimedPoint{lon: 9.97445, lat: 53.57746, time_offset_ms: 47000},
      %Video.TimedPoint{lon: 9.974552, lat: 53.577502, time_offset_ms: 47334},
      %Video.TimedPoint{lon: 9.974654, lat: 53.577542, time_offset_ms: 47668},
      %Video.TimedPoint{lon: 9.974757, lat: 53.577581, time_offset_ms: 48001},
      %Video.TimedPoint{lon: 9.974859, lat: 53.577622, time_offset_ms: 48335},
      %Video.TimedPoint{lon: 9.97496, lat: 53.577664, time_offset_ms: 48668},
      %Video.TimedPoint{lon: 9.97506, lat: 53.577701, time_offset_ms: 49002},
      %Video.TimedPoint{lon: 9.975167, lat: 53.577736, time_offset_ms: 49336},
      %Video.TimedPoint{lon: 9.975276, lat: 53.577769, time_offset_ms: 49669},
      %Video.TimedPoint{lon: 9.975382, lat: 53.577808, time_offset_ms: 50003},
      %Video.TimedPoint{lon: 9.975487, lat: 53.57785, time_offset_ms: 50336},
      %Video.TimedPoint{lon: 9.975592, lat: 53.577893, time_offset_ms: 50670},
      %Video.TimedPoint{lon: 9.975692, lat: 53.577935, time_offset_ms: 51004},
      %Video.TimedPoint{lon: 9.975787, lat: 53.57797, time_offset_ms: 51337},
      %Video.TimedPoint{lon: 9.975879, lat: 53.578004, time_offset_ms: 51671},
      %Video.TimedPoint{lon: 9.975963, lat: 53.578032, time_offset_ms: 52004},
      %Video.TimedPoint{lon: 9.976037, lat: 53.578058, time_offset_ms: 52338},
      %Video.TimedPoint{lon: 9.976107, lat: 53.578084, time_offset_ms: 52672},
      %Video.TimedPoint{lon: 9.976182, lat: 53.578094, time_offset_ms: 53005},
      %Video.TimedPoint{lon: 9.976243, lat: 53.57808, time_offset_ms: 53339},
      %Video.TimedPoint{lon: 9.976287, lat: 53.578055, time_offset_ms: 53672},
      %Video.TimedPoint{lon: 9.976335, lat: 53.578037, time_offset_ms: 54006},
      %Video.TimedPoint{lon: 9.976385, lat: 53.578053, time_offset_ms: 54339},
      %Video.TimedPoint{lon: 9.976398, lat: 53.578063, time_offset_ms: 54673},
      %Video.TimedPoint{lon: 9.976449, lat: 53.578093, time_offset_ms: 55006},
      %Video.TimedPoint{lon: 9.976516, lat: 53.578127, time_offset_ms: 55340},
      %Video.TimedPoint{lon: 9.976579, lat: 53.578158, time_offset_ms: 55673},
      %Video.TimedPoint{lon: 9.97663, lat: 53.578187, time_offset_ms: 56007},
      %Video.TimedPoint{lon: 9.976653, lat: 53.578215, time_offset_ms: 56341},
      %Video.TimedPoint{lon: 9.976632, lat: 53.578245, time_offset_ms: 56674},
      %Video.TimedPoint{lon: 9.976606323353293, lat: 53.578263455089825, time_offset_ms: 56808}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "ybudeBcd__RA@A?A@A@A@C?A@A@A@C?A@A@C?A@A@A?C@A?A@A?C?A@A?C?A?A@C?A?C?A?A?C?A?C?C?C?A?C?CAC?E?CAC?CAE?CACAEACACCEACCEACCEACCECCCECEECCECEECCEEEECCEECEEEEECEEECEEECEEEEECEEECEEGCEEEEECGEECEEGCEEEEGCEEGEECGEEEGCGEEEGEGEECGEGEGEGEEEGEGEGEGEGEGEGEIGGEGEGEGEGGGEIEGGGEGEIGGEGGIEGGGEGGGEIGGEGGGEGGGGGEGGGEGGEGGEGGGEGGEGGGGEEGGGGGEGGGGGEGGGGGEGGGGGEGGIGGEGGGGIGGEGGGEGGIGGEGGGEIGGGGEGGGGIEGGGGGEGGIGGEGGEEGEGEEGECEEGEEECEECECEECCEECCCCCCECCCCCCCECCEECEECCEEECEEEEGEEGGEEEGGGGIEGGGGIGGGIGGGGGIGGGGGIGGGIGGEGGGGIEGGGGIGGGIEGGGGGGIEGGGEGGGGGEIGGEGGEEGGGEGEGGGEEEGGGEGEEGGEGEGGEEGEGGGEGEGGGEGGGEEEGGGEGGIEGGEEGGGEGGGEGEGGGEEEGGGEGEGEEGGEGEEEGEGGEEGEGEEEGEGEEGGEGEEEGEGGGEEEGEGEGGGEGEEGGEGEGGGEGEGGGEGGGEGGGGGEGGIEGGGGGEGGIGGGGGIGGGIGGGGGIGIIGGIGIIIGIIIGIIIIIIIGIIKIIIIIIIIGIIIIIIIGIIIIIIGGIIIIIGGIIGIIGIIGIIGIIGGIIGGIIIGGIIGIIGGIIGGIGGIIGGGIGGIIGIGGGGGIGGGIGGGIGGGIEGGGGIGGGIEGGGGIEGGIGGEGGIGGGIGGEIGIGIGIIIGIGIGIGIGIIIGIGIIKGIIIGIGIIKGIGIIIGIIIGIGIIIGIIIGIGIIIGIIKGIGIIIGIGIIIGIGIIIGIIIGIGKIIGIGIIIGKGIIIGKGIIIGKGIIIGKGIGIIKGIGKIIGKGIGKIIGIGKGIIKGIGKGIGIIKGIGKGIIIGKGIGIGKIIGIGIGKGIIIGKGIGIGIIKGIGIGKIIGKIIGKGIIKGIIKGIGKIKGKIIGKIKGIGKIIGKGIGKIKGIGIGKGIGKGIGIGKGIGIGKEIGIGIEGGIEIGIGIEIGIEGEIGGEIEGGIEGEGEGEIEEEGEGEGEGEEEGCEEGEECEEGCEEECEEECECCEECECECCEECECCCECCCEEECCCECCCECECCCECCCECCEECECCCECECCCECCCECECEECCECCCECECCCECECCCECCCEACCCCECCACCCCEACCCAAACCCACAAACCAACAAACAAAAAA?CAAAAAAAAAA?AACAAA??AAAAAAA?AAAAA?AAAAA?AAA??AAAA?AAAAA?AAAAA?AAAAAAA?AAAAA?AAAAA?AAAAA??AA?AAAAA?AAA??AA?AAA??AAACAAAAACACAACEACCCCECECECECGEGEGCGCECECECEACCCACACAAAC?AAAAA???AA??A?????AA??A??AA?AAA??AA?AAA?AAAAA?CAAAAAAAC?AACAAACAAAC?AACACACACAACEACACACAECCAECEAECEAECGCECGCGCIEGCICIEICGEICICGCGCIEGCGCICGCGEGCGCICGEGCGCGEICGCGEGCGEGCGEICGEGCGEGCECGEGCEEGCECGCEEGCECECECECECECECECCCECECCCECECCCEACCECCCECCCECCCEACCECCCECCCEACCECECCCECECECECEEECECECECECEEGCECEEGCECGEECGCGEECGCEEGCGCGEECGCGEECGCGCGEECGCGEGCGEGCGCGEGEGCGEGCIEGEGCIEGEGEIEIEGEIEICGEIEIEGEIEIEIEGEIEIEIEIEGCIEIEIEIEIEIEIEIEICIEIEIEKEIEIEKCIEIEKEIEKEICKEIEKEKEIEKCKEKEIEKEKCKEKEKEKEKCKEKEKEKCKEKEKEMEKCKEKEKEKCMEKEKEKEMCKEKEKEMCKEKEMEKEKCMEKEKEKCMEKEKEKCKEMEKEKCKEKEKEKCKEKEMCKEKEKCKEKEKCKEKEKCMEKEKCKEMEKCKEKEKCMEKEKCMEKCKEMEKCKEKEMCKEMEKCKEMCKEKEMCKEKEMCKEMEKCKEMEKCKEKEMCKEMEKCKEMEKEKCKEMEKCKEMEKEMCKEKEMEKCKEMEKEMEKCMEKEMEKEMCKEMEKEMEKCMEKEMEKEMCKEMEKEMCKEMEKEMCKEKEMEKCMEKEMEKCKEMEKEKCMEKEMEKEMEKCMEKEMEKEMCKEMEKEMEMEKEMCKEKEMEKEMCKEMEKEMEKCMEMEKEKEMCKEMEKEMCKEKEMCKEKEKCMEKEKCKEMCKEKCKEKCKEKCKEKCKEKCKEKCKEKCKEKCKEKCKEKCKEKCICKEKCKEKCKEKCIEKCKEKCKEKCKEKCKEMCKEKCKEKCKEMEKCKEMCKEKEKCMEKCKEKEMCKEKEMCKEKEMCKEKCMEKEMEKCKEKCMEKEKCKEKCKEKCKEKCKEKCKCIEKCKEICKCKEICKEICKCKEICKEKCKEKCIEKCKEKEKCKEKCKEKEKCKEIEKCKEKEKCMEKEKEKCKEKEMEKEKCKEMEKEKEKCKEKEKCKEKEKCKEIEKCKEIEKCIEKCIEICKEICIEICKCIEICICIEICIEICICGCIEICICGCICGEICICGCICICGCICGCICGEICICGCICGCICICGCICGCICGCICICGCICICGCICICICICGCICICICICICICICICIEICICICKCICICICICKCICIEKCICICKCICICKCICICIAICGCIAGCGAGCGAGCGAGAEAGCEAEAEAEAEAEAEACAEAEAEAEAECEAEAEAGCEAGAECGAGCGAGCGAGCGCICGAICGCICICGAICICICICGCICICICICGCICIAICICGCICICICGCICICICIEICICICICIEKCICICIEKCIEKCICIEKCIEKCIEKCIEKCIEKCKEICKEKCKEICKEKEKCKEKCKEICKEKEKCMEKEKCKEKEMCKEKEKCMEKEMCKEKEMEKCKEMEKCKEMEKEMCKEMEKEMCKEKEMEKEMCKEMEKCMEKEKCMEKEMCKEMEKCKEMCKEKCKEMCKEMCKEKCMEKCKEMCKEKCMEKCMEKCKEMEKCKEMCKEMEKCKEMCKEKCMEKEKCKEMEKCKEKCMEKEKCKEKEMCKEKEKCKEKCKEKEKCKEIEKCKEKCKEIEKCKEIEKCIEKEKCIEKEICKEIEKEIEKEICKEIEKEKEIEKEKEIEKEKEIEKEKEIEKEKEIEKEKGKEKEIEKEKCKEKEKEKEKEKEKEKEKEKEKEKCKEKEKEKCMEKEKCKEKEKCIEKCKEKEKCKEKCKEICKCKEICKEKCICKEICKCIEKCICIEKCICIEICKCICIEICICKEICICKEICICKEICIEKCICIEKCKEICICKEKCIEKCICKEKCKEKCIEKCKCKEMCKEKCKEKCKEMCKEKCKEKCMEKCKEMCKEKCMEKEKCMEKCKEMEKCMEKEKCKEKCMEKCKEKEKCMEKCKEKCKEKCICKEKCKEKCKCKEKCICKEKCKEKCICKEKCKCIEKCKCICKEICKCKCIEICKCICICKEICICKCICICICIEICICICICKCICICGCICICICICGCICICICGCICICGCICICGCIAGCICGCICGCICGCICGCICICGCICICICGCICICGCICICICICGCICICGCICGCGCIAGCICGCGCGAGCGCGAGCGCGAGCGCEAGCGAGCEAGCEAGCGAECGAECGAECGAECEAGAECEAEAGCEAEAECEAEAECEAEAECEAEAEACCEAEAEAECCAEAEACAECEACAEAECCAEACAEAECCAEACAECEAEACAECEACAECEAEAECEAEAEAEACCEAEACAEACAEACACACAC?CAEAAAC?CACACAA?CAC?AACAA?CAA?CAA?AAA?CAA?AAA?A?AAA?A?AAA?A?AA??A?A?AA??A?A?AA??A?AAA?A?AACAE?AAA?A?A?A??A??A???A?????AAA???A?AA??A?AAA?AAC?AAA?CAA?CAAAC?CACAEACACAEAEAECEAGCEAGCICGCICKCIEKCKEMEMEMEKCKEKCKCICICKCICICKCIAICKCICICKCIAICKCIAKCICKCICKAICKCKCKCICKCKAKCKCKCICKCKEMCKCKCKCKCKEKCKCKEMCKEMCKCKEMCKEKCMEKEMCKEMEMCKEMEKCMEKEMCKEMEMCKEMEKEMCMEKEMCMEKEMCMEKEMEMCKEMEMCKEMEMEMCMEKEMEMCMEMEMEMCKEMEMEMCMEMEKEMCMEMEMEMCMEKEMCMEMEMEMCKEMEMCMEMEKCMEMEKCMEMEMCMEKEMCMEKEMCMEMEKCMEMEMCKEMEMCKEMEMEMEMCMEMEKEMEMEMCMEMEMEMEMEMEMEMEMEMEMEMEOEMEMEMGMEOEMEMEMEOEMEMEOEMEMEMEMEOEMEMGMEOCMEMEMEMEMEMEMEMEOCMEMEMEMEMCMEMEMEOEMEMCMEMEOEMEMCMEMEOEMCMEMEMEMCOEMEMEMEMCMEMEMEOEMCMEMEMEMEMCMEMEMEMEMEOEMCMEMEMEOEMEMEOEMEMEMEOEMEOEMEOEMEMEOEMEMEMEMEOGMEMEMEOEMEMEMEMEMEMGMEOEKEMEMEMEMEMEKEMEMEKCMEKEMEKCKEMEKEKCMEKEKEMCKEKEMEKCMEKEMEKEMEMEKEMCMEMEMEKEMEMEMEMEMEKEMEMEKEMEMEMEKEMEMEKEMEMEKEMEMEMCKEMEKEMEKCKEMEKCKEMEKCKEKCKEKCKEICKEKCKCIEKCICICICKCIEICICGAICICGCICGCGAGCICGCGAGCGAGCGCGAGCEAGCGCIAECGAGCGAGCGCEAGCGAGCGAGCGCGAGCGAGCGAGCGAGCECGAGCGAGCGAGCGCGAGCGAGCGAGCGAGCGAGCGCGAGCGAGCEAGCGAGCGCGAGCGAGCGAGCGAGCGCGAGCEAGCGCGAGCGAGCGCGAGCGAGCGCEAGCGAGCGCGAGCGCGAECGAGCGCGAGCGAECGCGAGCEAGCGAGCEAGCGAECGAGCEAGCEAGCGAECGAECGAECGAECGAECGAEAGCEAGCEAECGAECGAECGAEAECGAECGAECEAGCEAEAGCEAECGAECEAGAECGAECEAGCEAEAGCEAECGAEAECGAEAGCEAEAGAECEAEAGAEAEAGAECEAEAEAGAEAE?EAEAEAEAEAEAE?EAEAEAE?EAE?EACAE?EAE?EAEAC?EAE?EAE?C?EAE?EAC?EAE?E?EAE?EAE?EAE?GAE?EAG?EAG?EAG?GAE?GAG?GAG?GAGAG?IAGAGAIAGAI?IAGAIAICIAIAIAIAKCIAIAICIAKCIAICICKAICKCIAICKCICKCICKCICKCICKCICKCICICKCICKCICKEICKCICKCICICKEICKCICKCIEICICKCICICKEICICICICKCICICIEICICICICICICICKEICICICICICICIEICICKCICICICIEICICICKCICICIEICICICICICICKCICIEICICICICICICICKCICICICICIEICICICICICICKCICICICICICICICICICICICICKCICICICIAICICKCICICICICICICICICKCICICICICICICICICKCICICICICICICIEICKCICICICICICICICICKCICICIEICICICICKCICICICICICICICICICICKCGCICICIAICICICICICICIAICICICIAICICICICIAICKCICICIAICKCICIAKCICKCIAICKCICIAKCICKCIAICKCICKAICICKAICKCICIAKCICICKAICICKCICKAICICKCICICICKAICKCICICICKCICICICKCICICKCICICKCICIEKCICICICKCICICICKCIEICICKCICKCICICIEKCICICICKCIEICKCICICICICKEICICICKCICICIEICICICICKCICICICICICICICICICICGCICICIAICICGCICIAGCICICGCIAICGCIAICGCICIAICGCICIAGCICIAGCICICIAGCICIAGCIAGCICGAICGAICGAGCIAGCGAICGAGCGAGCGAGAGCGAGAGCGAGAGCGAEAGCGAGAECGAGAGAECGAGAEAGCEAGAGAGCEAGAGAGAEAGAGCGAGAGAGAEAGAG?GAGAEAGAG?GAG?EAG?GAG?EAG?G?EAG?E?G?E?G?E?E?E?E?E?E@E?E?E?E@E?C@E?E@E?E@E?E@E?C@E@E?E@E@E@E?G@E@E@G?E@G@E?E@E@E?E@E@E?E@C?E@E?C@E?C@C?E@C?C?C@E?C?C@C?C?A?C@C?C?A?C?C?A?C?A?C?C?A?C?A?C?A?C?AAC?C?A?CAA?A?C?AAA?A?C?AAA?A?A?A??AA?A?A???AA??A?A?AAA?A?AAA?AAC?AACAC?CACACACAEAEACAECEAEAECEAECECGAECECGCEAECGCGCECGEGCGCICGEGCGCICGCGCECGCGCGCECGCEAGCECGCECGCEAGCECECECGCECECEAECECECCCECECCCCCCAECCCACCCCCAACCACCAACAAAAACAAAAAA?AACAA?AAA?AAA??AA?A?AAA?A?AA??A?A?A?A???A?A?A???A?A?A???A?A?A?A???A@A?A?A?A@A?A?A@A?C@A?",
      precision: 6
    }
  end
end