defmodule Data.AutoGenerated.Video.Rendered_8ea36cc9094ce21a0e95958c738d6e92 do
  @moduledoc "#{"ahrensburg-a6: U-Bahn Ahrensburg West → Zentrum"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "ahrensburg-a6: U-Bahn Ahrensburg West → Zentrum"
  end

  @impl Video.Rendered
  def hash() do
    "8ea36cc9094ce21a0e95958c738d6e92"
  end

  @impl Video.Rendered
  def length_ms() do
    65717
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-10-16-ahrensburg2/GX014939", "00:01:35.329", "00:01:38.765"},
      {"2022-10-16-ahrensburg2/GX014904", "00:01:34.561", :end},
      {"2022-10-16-ahrensburg2/GX014905", :start, "00:00:28.128"},
      {"2022-10-15-ahrensburg/GX014881", "00:03:19.766", :end},
      {"2022-10-15-ahrensburg/GX014882", :start, :end},
      {"2022-10-15-ahrensburg/GX014883", :start, "00:00:13.614"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 10.220332,
      minLat: 53.66378545345346,
      maxLon: 10.238984635110638,
      maxLat: 53.67283317823729
    }
  end

  @impl Video.Rendered
  def renderer() do
    3
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "Oktober 2022"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 10.22049892792793, lat: 53.664618057057055, time_offset_ms: 0},
      %Video.TimedPoint{lon: 10.220491, lat: 53.664601, time_offset_ms: 80},
      %Video.TimedPoint{lon: 10.220465, lat: 53.664536, time_offset_ms: 414},
      %Video.TimedPoint{lon: 10.220435, lat: 53.664466, time_offset_ms: 748},
      %Video.TimedPoint{lon: 10.220404, lat: 53.664399, time_offset_ms: 1081},
      %Video.TimedPoint{lon: 10.22037, lat: 53.664329, time_offset_ms: 1415},
      %Video.TimedPoint{lon: 10.220341, lat: 53.66426, time_offset_ms: 1748},
      %Video.TimedPoint{lon: 10.220332, lat: 53.664189, time_offset_ms: 2082},
      %Video.TimedPoint{lon: 10.22036, lat: 53.664121, time_offset_ms: 2416},
      %Video.TimedPoint{lon: 10.220416, lat: 53.664058, time_offset_ms: 2749},
      %Video.TimedPoint{lon: 10.220471, lat: 53.664007, time_offset_ms: 3083},
      %Video.TimedPoint{lon: 10.220522123123123, lat: 53.66378545345346, time_offset_ms: 3186},
      %Video.TimedPoint{lon: 10.220583, lat: 53.663811, time_offset_ms: 3367},
      %Video.TimedPoint{lon: 10.220682, lat: 53.66386, time_offset_ms: 3701},
      %Video.TimedPoint{lon: 10.220753, lat: 53.663899, time_offset_ms: 4034},
      %Video.TimedPoint{lon: 10.220798, lat: 53.663921, time_offset_ms: 4368},
      %Video.TimedPoint{lon: 10.220853, lat: 53.663953, time_offset_ms: 4404},
      %Video.TimedPoint{lon: 10.220876, lat: 53.663949, time_offset_ms: 4738},
      %Video.TimedPoint{lon: 10.220922, lat: 53.663928, time_offset_ms: 5071},
      %Video.TimedPoint{lon: 10.220982, lat: 53.663902, time_offset_ms: 5405},
      %Video.TimedPoint{lon: 10.221057, lat: 53.663913, time_offset_ms: 5738},
      %Video.TimedPoint{lon: 10.221125, lat: 53.663947, time_offset_ms: 6072},
      %Video.TimedPoint{lon: 10.22121, lat: 53.663991, time_offset_ms: 6406},
      %Video.TimedPoint{lon: 10.2213, lat: 53.664035, time_offset_ms: 6739},
      %Video.TimedPoint{lon: 10.221395, lat: 53.664083, time_offset_ms: 7073},
      %Video.TimedPoint{lon: 10.221499, lat: 53.664132, time_offset_ms: 7406},
      %Video.TimedPoint{lon: 10.221601, lat: 53.664182, time_offset_ms: 7740},
      %Video.TimedPoint{lon: 10.221705, lat: 53.664233, time_offset_ms: 8074},
      %Video.TimedPoint{lon: 10.221815, lat: 53.664285, time_offset_ms: 8407},
      %Video.TimedPoint{lon: 10.221924, lat: 53.664338, time_offset_ms: 8741},
      %Video.TimedPoint{lon: 10.222034, lat: 53.664392, time_offset_ms: 9074},
      %Video.TimedPoint{lon: 10.222148, lat: 53.664447, time_offset_ms: 9408},
      %Video.TimedPoint{lon: 10.222257, lat: 53.664498, time_offset_ms: 9742},
      %Video.TimedPoint{lon: 10.222364, lat: 53.664555, time_offset_ms: 10075},
      %Video.TimedPoint{lon: 10.222477, lat: 53.664611, time_offset_ms: 10409},
      %Video.TimedPoint{lon: 10.22259, lat: 53.664664, time_offset_ms: 10742},
      %Video.TimedPoint{lon: 10.222703, lat: 53.664719, time_offset_ms: 11076},
      %Video.TimedPoint{lon: 10.222815, lat: 53.664776, time_offset_ms: 11410},
      %Video.TimedPoint{lon: 10.222924, lat: 53.66483, time_offset_ms: 11743},
      %Video.TimedPoint{lon: 10.22303, lat: 53.664884, time_offset_ms: 12077},
      %Video.TimedPoint{lon: 10.223139, lat: 53.664939, time_offset_ms: 12410},
      %Video.TimedPoint{lon: 10.223251, lat: 53.664997, time_offset_ms: 12744},
      %Video.TimedPoint{lon: 10.223358, lat: 53.665052, time_offset_ms: 13078},
      %Video.TimedPoint{lon: 10.223469, lat: 53.665107, time_offset_ms: 13411},
      %Video.TimedPoint{lon: 10.223579, lat: 53.66516, time_offset_ms: 13745},
      %Video.TimedPoint{lon: 10.223691, lat: 53.665216, time_offset_ms: 14078},
      %Video.TimedPoint{lon: 10.223804, lat: 53.665274, time_offset_ms: 14412},
      %Video.TimedPoint{lon: 10.223911, lat: 53.66533, time_offset_ms: 14746},
      %Video.TimedPoint{lon: 10.224019, lat: 53.665384, time_offset_ms: 15079},
      %Video.TimedPoint{lon: 10.224129, lat: 53.665436, time_offset_ms: 15413},
      %Video.TimedPoint{lon: 10.224237, lat: 53.665492, time_offset_ms: 15746},
      %Video.TimedPoint{lon: 10.224349, lat: 53.665547, time_offset_ms: 16080},
      %Video.TimedPoint{lon: 10.224467, lat: 53.665604, time_offset_ms: 16414},
      %Video.TimedPoint{lon: 10.22458, lat: 53.665661, time_offset_ms: 16747},
      %Video.TimedPoint{lon: 10.224687, lat: 53.665719, time_offset_ms: 17081},
      %Video.TimedPoint{lon: 10.224801, lat: 53.665777, time_offset_ms: 17414},
      %Video.TimedPoint{lon: 10.224912, lat: 53.665835, time_offset_ms: 17748},
      %Video.TimedPoint{lon: 10.225023, lat: 53.66589, time_offset_ms: 18082},
      %Video.TimedPoint{lon: 10.225133, lat: 53.665945, time_offset_ms: 18415},
      %Video.TimedPoint{lon: 10.225243, lat: 53.665997, time_offset_ms: 18749},
      %Video.TimedPoint{lon: 10.225358, lat: 53.666052, time_offset_ms: 19082},
      %Video.TimedPoint{lon: 10.22547, lat: 53.666109, time_offset_ms: 19416},
      %Video.TimedPoint{lon: 10.225583, lat: 53.666165, time_offset_ms: 19750},
      %Video.TimedPoint{lon: 10.225697, lat: 53.666219, time_offset_ms: 20083},
      %Video.TimedPoint{lon: 10.225798, lat: 53.666282, time_offset_ms: 20417},
      %Video.TimedPoint{lon: 10.225892, lat: 53.666352, time_offset_ms: 20750},
      %Video.TimedPoint{lon: 10.226008, lat: 53.666412, time_offset_ms: 21084},
      %Video.TimedPoint{lon: 10.226127, lat: 53.666471, time_offset_ms: 21418},
      %Video.TimedPoint{lon: 10.226245, lat: 53.666529, time_offset_ms: 21751},
      %Video.TimedPoint{lon: 10.226364, lat: 53.666582, time_offset_ms: 22085},
      %Video.TimedPoint{lon: 10.226485, lat: 53.666641, time_offset_ms: 22418},
      %Video.TimedPoint{lon: 10.226603, lat: 53.6667, time_offset_ms: 22752},
      %Video.TimedPoint{lon: 10.226716, lat: 53.666758, time_offset_ms: 23086},
      %Video.TimedPoint{lon: 10.226827, lat: 53.666814, time_offset_ms: 23419},
      %Video.TimedPoint{lon: 10.226944, lat: 53.66687, time_offset_ms: 23753},
      %Video.TimedPoint{lon: 10.227057, lat: 53.666923, time_offset_ms: 24086},
      %Video.TimedPoint{lon: 10.227171, lat: 53.666977, time_offset_ms: 24420},
      %Video.TimedPoint{lon: 10.227286, lat: 53.667031, time_offset_ms: 24754},
      %Video.TimedPoint{lon: 10.227398, lat: 53.667087, time_offset_ms: 25087},
      %Video.TimedPoint{lon: 10.227512, lat: 53.667146, time_offset_ms: 25421},
      %Video.TimedPoint{lon: 10.227627, lat: 53.667203, time_offset_ms: 25754},
      %Video.TimedPoint{lon: 10.22774, lat: 53.667259, time_offset_ms: 26088},
      %Video.TimedPoint{lon: 10.227853, lat: 53.667317, time_offset_ms: 26422},
      %Video.TimedPoint{lon: 10.227969, lat: 53.667373, time_offset_ms: 26755},
      %Video.TimedPoint{lon: 10.228082, lat: 53.667425, time_offset_ms: 27089},
      %Video.TimedPoint{lon: 10.2282, lat: 53.667472, time_offset_ms: 27422},
      %Video.TimedPoint{lon: 10.228326, lat: 53.667524, time_offset_ms: 27756},
      %Video.TimedPoint{lon: 10.228448, lat: 53.667581, time_offset_ms: 28090},
      %Video.TimedPoint{lon: 10.228569, lat: 53.667639, time_offset_ms: 28423},
      %Video.TimedPoint{lon: 10.228689, lat: 53.667695, time_offset_ms: 28757},
      %Video.TimedPoint{lon: 10.228801, lat: 53.667757, time_offset_ms: 29090},
      %Video.TimedPoint{lon: 10.228922, lat: 53.667822, time_offset_ms: 29424},
      %Video.TimedPoint{lon: 10.229047, lat: 53.667881, time_offset_ms: 29758},
      %Video.TimedPoint{lon: 10.229165, lat: 53.667936, time_offset_ms: 30091},
      %Video.TimedPoint{lon: 10.229284, lat: 53.667993, time_offset_ms: 30425},
      %Video.TimedPoint{lon: 10.229407, lat: 53.66805, time_offset_ms: 30758},
      %Video.TimedPoint{lon: 10.229527, lat: 53.668111, time_offset_ms: 31092},
      %Video.TimedPoint{lon: 10.229651, lat: 53.668175, time_offset_ms: 31426},
      %Video.TimedPoint{lon: 10.229773, lat: 53.668239, time_offset_ms: 31759},
      %Video.TimedPoint{lon: 10.229888, lat: 53.668297, time_offset_ms: 32093},
      %Video.TimedPoint{lon: 10.23012281981982, lat: 53.668414009009005, time_offset_ms: 32282},
      %Video.TimedPoint{lon: 10.230143, lat: 53.668425, time_offset_ms: 32342},
      %Video.TimedPoint{lon: 10.230262, lat: 53.668486, time_offset_ms: 32676},
      %Video.TimedPoint{lon: 10.230379, lat: 53.668545, time_offset_ms: 33009},
      %Video.TimedPoint{lon: 10.230497, lat: 53.668606, time_offset_ms: 33343},
      %Video.TimedPoint{lon: 10.230617, lat: 53.668667, time_offset_ms: 33677},
      %Video.TimedPoint{lon: 10.23073, lat: 53.668721, time_offset_ms: 34010},
      %Video.TimedPoint{lon: 10.230844, lat: 53.668778, time_offset_ms: 34344},
      %Video.TimedPoint{lon: 10.230947, lat: 53.668828, time_offset_ms: 34677},
      %Video.TimedPoint{lon: 10.231039, lat: 53.668871, time_offset_ms: 35011},
      %Video.TimedPoint{lon: 10.23113, lat: 53.668896, time_offset_ms: 35345},
      %Video.TimedPoint{lon: 10.231152, lat: 53.668949, time_offset_ms: 35536},
      %Video.TimedPoint{lon: 10.231159, lat: 53.668953, time_offset_ms: 35870},
      %Video.TimedPoint{lon: 10.231174, lat: 53.668965, time_offset_ms: 36203},
      %Video.TimedPoint{lon: 10.2312, lat: 53.66898, time_offset_ms: 36537},
      %Video.TimedPoint{lon: 10.231242, lat: 53.669009, time_offset_ms: 36870},
      %Video.TimedPoint{lon: 10.231303, lat: 53.669047, time_offset_ms: 37204},
      %Video.TimedPoint{lon: 10.231377, lat: 53.669087, time_offset_ms: 37538},
      %Video.TimedPoint{lon: 10.23146, lat: 53.669133, time_offset_ms: 37871},
      %Video.TimedPoint{lon: 10.231547, lat: 53.669183, time_offset_ms: 38205},
      %Video.TimedPoint{lon: 10.231643, lat: 53.669231, time_offset_ms: 38538},
      %Video.TimedPoint{lon: 10.231745, lat: 53.669282, time_offset_ms: 38872},
      %Video.TimedPoint{lon: 10.231847, lat: 53.669334, time_offset_ms: 39206},
      %Video.TimedPoint{lon: 10.231949, lat: 53.669389, time_offset_ms: 39539},
      %Video.TimedPoint{lon: 10.232053, lat: 53.669444, time_offset_ms: 39873},
      %Video.TimedPoint{lon: 10.232161, lat: 53.669501, time_offset_ms: 40206},
      %Video.TimedPoint{lon: 10.232277, lat: 53.669555, time_offset_ms: 40540},
      %Video.TimedPoint{lon: 10.232394, lat: 53.66961, time_offset_ms: 40874},
      %Video.TimedPoint{lon: 10.232508, lat: 53.669668, time_offset_ms: 41207},
      %Video.TimedPoint{lon: 10.232626, lat: 53.669725, time_offset_ms: 41541},
      %Video.TimedPoint{lon: 10.232747, lat: 53.669784, time_offset_ms: 41874},
      %Video.TimedPoint{lon: 10.232866, lat: 53.669842, time_offset_ms: 42208},
      %Video.TimedPoint{lon: 10.232978, lat: 53.669897, time_offset_ms: 42542},
      %Video.TimedPoint{lon: 10.233088, lat: 53.669947, time_offset_ms: 42875},
      %Video.TimedPoint{lon: 10.233209, lat: 53.670003, time_offset_ms: 43209},
      %Video.TimedPoint{lon: 10.233329, lat: 53.670059, time_offset_ms: 43542},
      %Video.TimedPoint{lon: 10.233451, lat: 53.670118, time_offset_ms: 43876},
      %Video.TimedPoint{lon: 10.233568, lat: 53.670177, time_offset_ms: 44210},
      %Video.TimedPoint{lon: 10.233683, lat: 53.670235, time_offset_ms: 44543},
      %Video.TimedPoint{lon: 10.233797, lat: 53.670294, time_offset_ms: 44877},
      %Video.TimedPoint{lon: 10.23392, lat: 53.670347, time_offset_ms: 45210},
      %Video.TimedPoint{lon: 10.234045, lat: 53.670401, time_offset_ms: 45544},
      %Video.TimedPoint{lon: 10.234179, lat: 53.670446, time_offset_ms: 45878},
      %Video.TimedPoint{lon: 10.234292, lat: 53.670495, time_offset_ms: 46211},
      %Video.TimedPoint{lon: 10.234396, lat: 53.670547, time_offset_ms: 46545},
      %Video.TimedPoint{lon: 10.2345, lat: 53.670598, time_offset_ms: 46878},
      %Video.TimedPoint{lon: 10.234607, lat: 53.670632, time_offset_ms: 47212},
      %Video.TimedPoint{lon: 10.234716, lat: 53.670669, time_offset_ms: 47546},
      %Video.TimedPoint{lon: 10.234818, lat: 53.670714, time_offset_ms: 47879},
      %Video.TimedPoint{lon: 10.234922, lat: 53.670756, time_offset_ms: 48213},
      %Video.TimedPoint{lon: 10.235035, lat: 53.670792, time_offset_ms: 48546},
      %Video.TimedPoint{lon: 10.235142, lat: 53.670832, time_offset_ms: 48880},
      %Video.TimedPoint{lon: 10.235243, lat: 53.67088, time_offset_ms: 49214},
      %Video.TimedPoint{lon: 10.235341, lat: 53.670932, time_offset_ms: 49547},
      %Video.TimedPoint{lon: 10.235428, lat: 53.670979, time_offset_ms: 49881},
      %Video.TimedPoint{lon: 10.235512, lat: 53.671023, time_offset_ms: 50214},
      %Video.TimedPoint{lon: 10.235592, lat: 53.671065, time_offset_ms: 50548},
      %Video.TimedPoint{lon: 10.235669, lat: 53.6711, time_offset_ms: 50882},
      %Video.TimedPoint{lon: 10.235728, lat: 53.671141, time_offset_ms: 51215},
      %Video.TimedPoint{lon: 10.235768, lat: 53.671192, time_offset_ms: 51549},
      %Video.TimedPoint{lon: 10.235813, lat: 53.67122, time_offset_ms: 51882},
      %Video.TimedPoint{lon: 10.235877, lat: 53.671184, time_offset_ms: 52103},
      %Video.TimedPoint{lon: 10.236074, lat: 53.671289, time_offset_ms: 53437},
      %Video.TimedPoint{lon: 10.236191626983642, lat: 53.67145642368425, time_offset_ms: 54438},
      %Video.TimedPoint{lon: 10.23634636441803, lat: 53.671576338623694, time_offset_ms: 54772},
      %Video.TimedPoint{lon: 10.237000440475464, lat: 53.67190424548643, time_offset_ms: 57441},
      %Video.TimedPoint{lon: 10.237607626983644, lat: 53.67221113484899, time_offset_ms: 59442},
      %Video.TimedPoint{lon: 10.23826717790985, lat: 53.67253842303134, time_offset_ms: 61777},
      %Video.TimedPoint{lon: 10.238405720237733, lat: 53.67261049023879, time_offset_ms: 62445},
      %Video.TimedPoint{lon: 10.238610898147583, lat: 53.67271531226026, time_offset_ms: 63779},
      %Video.TimedPoint{lon: 10.238877626983644, lat: 53.67282971142585, time_offset_ms: 65447},
      %Video.TimedPoint{lon: 10.238984635110638, lat: 53.67283317823729, time_offset_ms: 65717}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "utljeBy{xnR@@@?@@@?B@@@B?@@B@B?B@B@B@B@D@B@D@D@D@DBD@FBFBH@HDHBHBFBH@FBFBF@DBFBF@FBD@FBD@FBD@FBDBF@DBF@DBD@FBD@FBD@DBD@FBD@DBF@DBDBF@DBD@FBD@FBDBF@DBFBD@DBFBD@FBFBD@FBD@FBDBF@DBF@DBFBF@D@DBF@FBD@DBF@D@F@DBF@D@F@D@F@D@F@D@F@D@F?D@F@D?F@D?F?D@F?D?F?D?F?D?D?FAD?FAD?FAD?DAFADADAFADADAFCDADCFADCDCFADCDCFCDCDEFCDCDEFCDCDEDCFEDEDCDCDEBCDEDCBCDCBCDEBCDCBCBCBCDCBABCBCBCDCDEFCHGJEJGPITK\\Md@Mn@OdASzAu@n@i@LKFEBC@C@C?CACACAEACAEAEAGAECGAGCGAGCICICICKEKCMEKEMEOEMEKEKEICIEICIEICGCIEGCGCGCECGCGAECECGAECECEAECEAECGCECEAGCEAEAECEAEAEACAEAECEAGAEAGCICICKCQEUAGAE?CAA?C?A?A?A???A?A???A?A?A???A@A?A?A?A?A?C@A?A?C?A@C?C?C@A?C?E@C?C@C?E@C?E?C@E@E?E@E?E@E?G@E@E?G@G@E@G?G@E@G?E@G?E@G?E@G?E?E@E?E?E?E?E?G?EAE?E?GAE?E?EAE?GAEAG?EAEAGAGAEAGAEAGAGCGAGAGCGCGAGCGCGAGCICGCGCGCICGCGCIEGCGCICIEGCICGEICGCICGEICGCIEGCICGCIEGCICGCICGEICGCICGEICGCICGEICGCIEICGCIEICGCIEICGCIEICICIEICGEICICIEICIEICIEICIEICKEICIEICIEKCIEICIEICKEICIEICIEKCIEICIEICICIEICIEKCIEICIEICIEICIEICIEKCIEICIEICIEICKEICIEIEICKEICIEICKEICIEIEKCIEKCIEIEKCIEKCIEKEICKEIEKCIEKCIEKEICKEIEKCIEKCIEKEICIEKEICKEIEKCIEKCIEIEKCIEKEICKEIEKCIEKEIEKCIEKEICKEIEKCIEKEICKEIEKEICKEKEKEICKEKEIEKCKEKEIEKEKCKEIEKCKEIEKCIEKEKCIEKEICIEKCIEICKEIEICKEICIEKCIEIEICKEIEKCIEIEKEICKEIEIEKEICKEIEKEIEKCIEKEIEKEIEKCIEKEIEKEKEICKEKEIEKEKEICKEKEIEKCKEIEKEKCIEKEKCIEKEICKEKEICKEIEKCKEIEKCIEKEICKEKEIEKCKEIEKCIEKEKEKCIEKEIEKCKEIEKEIEKCKEKEIEKEKEICKEIEKEKEKEIEKCIEKEKEIEKCIEKEIEKCKEIEKEIEKCIEIEKCIEKEICIEKEIEICKEIEICKEIEKCIEIEICKEIEICKEIEICIEKEICIEKEICIEIEKEICKEIEIEKCIEKEICIEKEIEKEICKEIEKEICKEIEKEIEKEKEIEKCIEKEKEIEKEKEKEIEKEIEKCIEKEIEKEKEICIEKEIEICKEIEICKEIEIEICKEIEICKEIEKEICKEIEIEKCKEIEKEIEKCIEKEKEICKEIEKCIEKEIEKCKEIEICKEIEKCIEIEKCIEKEICKEICKEIEICKEIEKEKCIEKEIEKCKEIEKEIEKEKCIEKEIEKEKCIEKEKEIEKEKEIEKCKEIEKEKEIEKEKEKEIEKEKCIEKEIEKEIEKEICKEIEKEIEICKEIEIEKCIEIEKEICIEKEIEICKEIEIEKCIEKEICIEKEIEKCIEKEICIEKEICIEKEICKEIEKCIEICKEIEKCIEIEKCIEKCIEKEICIEKEICKEIEKEICIEKEIEKCIEKEIEKCIEKEIEKCIEKEIEICKEIEKEKCIEIEKEICKEIEKEKCIEKEIEKCIEKEKEICKEKEKEKEIEKCKEKEKEKEKEKEKEKEICKEKEKEKEKEKEIEKEKCKEKEIEKEKEIEKCKEKEIEKEIEKEICKEIEKEIEKEIEKCIEIEKEIEICKEIEIEKEIEICKEIEKEIEKEIEKEIEKEICKEKEKEIEKEKEKEIEKEKEIEKEIEKEKEKEICKEKEIEKEIEKEIEKEKCIEKEIEKEIEKCIEKEKEIEKEICKEIEKEICKEIEKEIEKCIEKEIEKCIEKEICKEIEKEIEKCIEKEKEICKEIEKEKCIEKEICIEKEICKEIEKCIEKEICKEIEICKEICKEIEKCIEICKEIEKCIEKCIEKEKEICKEKEICKEKEKEIEKCKEKEKEICKEKEIEKEKEKCIEKEKEIEKCKEIEKEIEKEKCIEKEKEIEKCIEKEKEIEKEKCIEKEIEKEKCIEKEKEIEKCKEIEKEKCIEKEKEICKEKEIEKEKCIEKEIEKCKEIEKEIEKCIEKEIEIEKEIEIEKEIEIEIEIEKEIEIEIEIEIEIEIGIEIEIEIEIGIEIEGGIEIEIGIEIGIEIEIGIEIGIEIEIEIGIEIEIGKEIEIEKEIGKEIEIEKEKEIEKEKEIEKEKEKEIEKEKEKGKCKEKEKEIEKEKEKEKEKEKEKEKEKEKEKEKEIEKEKEKCKEKEKEKEKEKEKEKEKEKEKCKEKEKEKEKCIEKEKEKEKCKEKEKCIEKEKCKEKEKEICKEKEKCKEKEKCIEMEKEKEKEKEKEKCKEKEKEKEMEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKCKEKEIEKEKEKEKEKEKEKEIEKEKEKEKEKEICKEKEIEKEKEIEKEKEKEICKEIEKEIEKEKCIEKEIEKEIEKCKEIEKEICKEIEKEICKEIEKEKEICKEKEIEKEKCKEIEKEKEKEKCKEKEKEIEKEKCKEKEIEKCKEKEKCIEKEKEICKEKEICKEKEICKEICKEIEKCKEIEKCKEIEKCKEIEKCIEKEKCKEIEKCKEIEKCKEIEKEKCKEKEICKEKEIEKCKEIEKCKEKEIEKCKEIEKCKEIEKEKCKEIEKEICKEKEIEKCIEKEKEIEKCIEKEKEIEKEICKEKEKEIEKEIEKEKEKEIEKEKCKEKEIEKEKEIEKEKEKEKEIEKEKCKEIEKEKEKEIEKEKCKEIEKEKEIEKCKEKEIEKEKEICKEIEKEKCIEKEKEIEKCIEKEIEKEKCIEKEKEIEKEIEKCKEIEKEKEIEKEKEKCIEKEKEIEKEKEKEICKEKEKEKEKEIEKCKEKEKEKEICKEKEKEKCIEKEKEKCIEKEKCIEKCKEICKEIEKCKEICKEKCIEKCKEICKEKCKCIEKCKEICKCKEKCIEKCKCKEKCICKEKCKEKCKEKCMEKCKEKCKEKEMCKEKEMCKEMEKCKEKEMCKEKEKEMCKEKEKEKCMEKEKEKCKEKEKEMEKEKEKCKEKEKEKEKEKEKCMEKEKEKEKEKEKEKEMEKCKEKEKEKEKEKEKEKCKEKEKEKEKCIEKEKEKEKEKEKCKEKEIEKEKEKEKEKEIEKEKEIEKEKEKEIEKEKEIEKEKEIEKEKEIEKEKGKEKEKEIEKGKEKEKEKGMEKEKEKGKEMEKEKEKEKGKEMEKEKEKEKEMEKEKEKEKEMEKEKEKEKEKEMEKCKEKEKEKEKEKCKEKEKEKEKCIEKEKEKCKEKEKEICKEKEKEKEKCKEKEKEICKEKEKEKEKEKCKEKEKEKEKEKCKEKEKEKEKEKEMEKCKEKEKEKEKEKEMEKEKCKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKGMEKEKEKEKEKEKGMEKEKEKGMEKEKEKEKGMEKEKEKEKGMEKEKEKGMEKEKEKGKEMEKEKEKEKGKEKEICKEKEIEKEIEKCIEIEKCIEIEICIEKEKEKGMGOGQIQISKUKYM[O_@Qa@Si@Wo@Yu@]y@Um@Qc@M[KUGOEIAECGCGCGCGCGEGCIEICIEKEKGKEKEMGMGOGMEOGMGMEMGKEMEKEKEKEKEKEIEKEKEKEKEKEIEKEKCKEKEIGKEKEKEKEKCKEKGIEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKGKEKEKEKEKEKEKEKEKEKEKEKEKEKEKEKCIEKEKEIEKCKEIEKCIEKEICKEIEKCIEKEKEIEKCKEKEIEKEKCKEIEKEKEKEKEKEICKEKEIEKCIEKEKEICKEIEICKEICKEIEICIEICKEICICIEICIEICICIEICICICICGEICICICICICICICGCICICICGCICICGCICGCICGCGCIEGEICIEGEIEGEGCGEGEGEGEEEGCEEGEEEEEEEEEGCCCCCCAAACAAAAAAA??AA??A??A??A????????A??A??????AA??????AA???AA????AA????AA??A??AA??AA???AA??AA??AA??A?AA??AAA??AAAA?AA??AAAAA?AAAAAAAACAAAAACAAACAAACACACCCACCCACCECEACCECGEECECGCGEECGCGEECGCGEECGCGCECGEECGCECGCGCECGEGCECGCECGCGCGCECGCGCGEECGCGCGCGCGEGCGCGCGEGCGCGCGEGCIEGCGCGEICGCGEGCICGEGCIEGCGEICGEGCICGEICGEICGEICGEICGEICGEICGEICICGEICGEICIEGCIEICICGEICIEICGEICICIEICIEICIEICIEIEICIEICIEKCIEIEICIEICIEICIEKEICIEICIEIEICIEICIEKEICIEICIEIEICIEIEICIEKEICIEIEIEICIEKEICIEIEIEICIEIEKEICIEIEIEICKEIEICIEIEIEICIEKEIEICIEIEKEICIEIEIEKEICIEKEIEIEKCIEKEIEKEIEKCIEKEIEKEICKEIEKEIEKCKEIEKEKCIEKEKCIEKEKEKCKEIEKEKCKEIEKEKCKEKEKEICKEKEKCKEIEKEKEKCKEKEIEKEKCKEIEKEKEKCKEIEKEKEKEIEKEKCKEKEIEKEKEIEKCKEKEKEKEIEKEKEKCIEKEKEKEKEKEKCKEIEKEKEKEKEKEKEKCKEKEKEKEKEKEKEMEKEKEKEKEKEKEKEKEKEKEKEKCKEKEKEKEKEKEKEKEKEKEKEKCKEKEKEKEIEKEKCKEKEIEKEKCIEKEKEICKEKEICKEIEKCIEKCIEKEICKEICIEKCIEKCIEICKEICKEICIEKCIEKCIEKEICKEKEKCKEKEKEKCKEKEKEKEKEMCKEKEKEKEKEKCKEKEMEIEKCMEKEKEKEKCKEKEKEKEIEKCKEKEKEKEKEMEKCKEKEKEKEKEKEKEKEKEMEKEKEKEKEKEKEKCKEKEKEKEKEKEKEIEKEKEKEKEKEKEKEICKEKEKEIEKEKEKEKEIEKEKEKEKCIEKEKEKEIEKEKEIEKEKCIEKEKEKEKEIEKEKEIEKCKEKEIEKEKEKEKEICKEKEKEKEKEKCKEKEKEKCKEKEKCKEKEKEKCKEKEMCKEKEKCKEKEMCKEKEKCMEKEKCKEMEKCMEKCKEMEKCKEMCKEMCKEMCKEMCKCMEMCKEMCKEMCMEMCKCMEKCKCMEKCKEKCMCKEKCIEKCKCKEKCICKEKCIEKCIEICKCIEKCIEKCIEICKEICIEICKEIEICKEICIEICIEKCIEIEICKEICKEICIEIEKCIEKCIEKCIEKCIEICKCICIEICKCICICICKCICICICICIAICICICICKAICICICIAICKCICICKCIAICICKCICICKAICKCICKCICICKCICICICKCICKCICICIEKCICICICKCIEICICKCICICICIEICKCICICICICKCIEICICICICKCICICICKCICICICKCICKCICKCICICKCKAICKCICKCKCICKCICKCICKCIAKCICKCICICKCICICKCICICKCICICICKCICICIEICKCICICIEICICICKEICICIEICIEICICIEICIEICKEICIEICIEICIEIEICIEIEICKEICIEIEGCIEICIEICGEICIEGCIEICGCGEICGCIEGCGCIEGCGCGEICGCGCGEICGCGCGEICGCGCGCGEICGCGCGEICGCGCGCGCGEGCICGCGCGCGCGEGCGCICGCGCGCGCGCGCGCGCGCGCGCGCGCGCECGCGCGCECGCGAECGCECGCECGCECECEAGCECECECECECECECECECECECECEEECCCECEEECECEEEEEEGCGEEEGCEEGCECECEEEAECCCECCAEACCCACACCCACACAA?CACAAACAA?CAA?CAA?CAA?AAC?A?C?AAC?A?C?C?C?C?CAC?C?C?CAC?CAE?C?CAC?C?EAC?EAC?C?EAC?EAE?CAE?EAC?EAE?EAEAE?GAEAEAEAGAEAGAGAEAGAEAGAGCECGAGCEAGCGAECGAGCECEACCECEAECEAECECCAECECCAECCCECCAECECCACCECCCCAECCCCCECCACCCCECCCCCCCECCCCCCCCCECCCCCCECCECCCCECCCCCEECCECCCECCEECECCCEEECCCECEEECECEEECECEEECEEECECEEECEEEEECEEEEGCEEEEGEEEEEGGEEGGEEGEGGEGGGGGEGGGGGGGIKGIIKIKIKGKGKGIEIGKGIEIEIEIGIEIEIEIEIEGEIEICIEIEGEIEICGEICIEGEICGEICIEGCIEGCIEIEGCIEICIEGCIEICGEICIEGCICGCGEGCICGCGEGCICGCGEGCICGCGCICGEGCGCGCGCGCGCGCICGCGEGCGCGCGCGCGCICGCGCGEGCGCICGCGCGCGCGCICGEGCGCGCICGCGCGCGCGCIEGCGCGCGCGCICGCGCGCGCGEICGCGCGCGCICGCGEGCICGCGCGCICGEGCICGCGCGCICGEGCICGCGCIEGCGCICGCIEGCGCICGCIEGCGCICGEICGCICGEICGCICGEICGCICGEICGCIEGCICGCIEICGCIEGCICIEGCICGEICICGEICICGEICICGEICIEICGCIEICIEGCICIEICGEICICIEICIEGCIEICIEICIEICIEICIEICGEICIEICIEKCIEICIEIEICIEICIEICIEICIEICIEICIEICIEICIEIEICIEICIEICIEICIEICIEICIEICIEGCIEICIEICIEICICIEICIEICIEICGEICIEICIEICICIEICIEGCIEICIEICICIEICGEICIEICICIEICGEICIEICICIEGCIEICICIEICGEICIEICICIEGCICIEICGEICICIEICGEICICIEICGEICICIEGCICIEICGCIEICICGEICIEICGCIEICICGEICIEICICIEGCIEICICIEICGEICICIEICGCIEGCICICGEICGCIEICGCICGEICICGEICIEICICGEICIEICICGEICICIEICGEICIEICICIEICGEICICIEICIEGCICIEGCICIEGCICIEGCICIEGCICGEICICGEICGCICGCGEGCGCICGCGCGCEAECEAECECGAECEAECEAECCAEACCEACAEACCEAECCAEAECCAEACAECCAEACCEAECCAEAECCAECEAEAECCAECEAECEACAECEAECCAEAECEACCEAEACCEAECEACAECEACAECEACAECCAEAECCAEACAECCAEAECCAEACAECCAEAEACCEACAEAECCAEACCEAEACAECCAEAEACCEAEACAECEACAEAECCAEAEACCEAEACAECEACAEAEACCEAEACAECEACAEAEAECCAEAEACCEAEAEACAECEAEAEAECEACAEAECEAEAEAECEAEAEAEACCEAEAEAECEAEAEAEAECEAGAEAECEAEAGAECEAEAGAEAGCEAGAEAGAGCEAGAGAGAGAGAGAGAGAGAGAGAEAGAE?GAEAGAE?CAE?EAEAC?E?CAC?EAC?CAE?C?EAE?E?CAE?C?C?CAC",
      precision: 6
    }
  end
end