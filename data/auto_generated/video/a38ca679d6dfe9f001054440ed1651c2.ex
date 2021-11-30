defmodule Data.AutoGenerated.Video.Rendered_a38ca679d6dfe9f001054440ed1651c2 do
  @moduledoc "#{"2018-09-28-1-thadenstrasse: Umleitung Baustelle Thadenstraße stadteinwärts"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2018-09-28-1-thadenstrasse: Umleitung Baustelle Thadenstraße stadteinwärts"
  end

  @impl Video.Rendered
  def hash() do
    "a38ca679d6dfe9f001054440ed1651c2"
  end

  @impl Video.Rendered
  def length_ms() do
    22632
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2021-11-29-stephansplatz/GX013011", "00:00:20.821", :end},
      {"2021-11-29-stephansplatz/GX013012", :start, :end}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.559121,
      maxLon: 9.963794,
      minLat: 53.556545,
      minLon: 9.960344323353294
    }
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.55661649700599, lon: 9.960344323353294, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.556603, lon: 9.96043, time_offset_ms: 196},
      %Video.TimedPoint{lat: 53.556589, lon: 9.960548, time_offset_ms: 529},
      %Video.TimedPoint{lat: 53.556581, lon: 9.960618, time_offset_ms: 863},
      %Video.TimedPoint{lat: 53.55657, lon: 9.960684, time_offset_ms: 1196},
      %Video.TimedPoint{lat: 53.556559, lon: 9.960745, time_offset_ms: 1530},
      %Video.TimedPoint{lat: 53.556548, lon: 9.960804, time_offset_ms: 1864},
      %Video.TimedPoint{lat: 53.556545, lon: 9.960856, time_offset_ms: 2197},
      %Video.TimedPoint{lat: 53.556561, lon: 9.960901, time_offset_ms: 2531},
      %Video.TimedPoint{lat: 53.556604, lon: 9.960933, time_offset_ms: 2864},
      %Video.TimedPoint{lat: 53.556671, lon: 9.960966, time_offset_ms: 3198},
      %Video.TimedPoint{lat: 53.55675, lon: 9.961003, time_offset_ms: 3532},
      %Video.TimedPoint{lat: 53.556831, lon: 9.961041, time_offset_ms: 3865},
      %Video.TimedPoint{lat: 53.556913, lon: 9.961066, time_offset_ms: 4199},
      %Video.TimedPoint{lat: 53.557, lon: 9.961076, time_offset_ms: 4532},
      %Video.TimedPoint{lat: 53.557091, lon: 9.961076, time_offset_ms: 4866},
      %Video.TimedPoint{lat: 53.557173, lon: 9.961086, time_offset_ms: 5200},
      %Video.TimedPoint{lat: 53.55725, lon: 9.961106, time_offset_ms: 5533},
      %Video.TimedPoint{lat: 53.55733, lon: 9.961137, time_offset_ms: 5867},
      %Video.TimedPoint{lat: 53.557397, lon: 9.961162, time_offset_ms: 6200},
      %Video.TimedPoint{lat: 53.557446, lon: 9.96119, time_offset_ms: 6534},
      %Video.TimedPoint{lat: 53.557503, lon: 9.96123, time_offset_ms: 6868},
      %Video.TimedPoint{lat: 53.557588, lon: 9.961263, time_offset_ms: 7201},
      %Video.TimedPoint{lat: 53.557692, lon: 9.961294, time_offset_ms: 7535},
      %Video.TimedPoint{lat: 53.557794, lon: 9.961328, time_offset_ms: 7868},
      %Video.TimedPoint{lat: 53.557896, lon: 9.961357, time_offset_ms: 8202},
      %Video.TimedPoint{lat: 53.557994, lon: 9.96138, time_offset_ms: 8536},
      %Video.TimedPoint{lat: 53.558093, lon: 9.961401, time_offset_ms: 8869},
      %Video.TimedPoint{lat: 53.558188, lon: 9.961431, time_offset_ms: 9203},
      %Video.TimedPoint{lat: 53.558278, lon: 9.961465, time_offset_ms: 9536},
      %Video.TimedPoint{lat: 53.558372, lon: 9.961482, time_offset_ms: 9870},
      %Video.TimedPoint{lat: 53.558462, lon: 9.961497, time_offset_ms: 10204},
      %Video.TimedPoint{lat: 53.558552, lon: 9.961512, time_offset_ms: 10537},
      %Video.TimedPoint{lat: 53.55865, lon: 9.961517, time_offset_ms: 10871},
      %Video.TimedPoint{lat: 53.558738, lon: 9.961526, time_offset_ms: 11204},
      %Video.TimedPoint{lat: 53.558815, lon: 9.961537, time_offset_ms: 11538},
      %Video.TimedPoint{lat: 53.558879, lon: 9.961549, time_offset_ms: 11872},
      %Video.TimedPoint{lat: 53.558932, lon: 9.961563, time_offset_ms: 12205},
      %Video.TimedPoint{lat: 53.558971, lon: 9.961576, time_offset_ms: 12539},
      %Video.TimedPoint{lat: 53.559077, lon: 9.961543, time_offset_ms: 12624},
      %Video.TimedPoint{lat: 53.559092, lon: 9.961553, time_offset_ms: 12958},
      %Video.TimedPoint{lat: 53.559121, lon: 9.9616, time_offset_ms: 13291},
      %Video.TimedPoint{lat: 53.559111, lon: 9.961678, time_offset_ms: 13625},
      %Video.TimedPoint{lat: 53.559065, lon: 9.961759, time_offset_ms: 13958},
      %Video.TimedPoint{lat: 53.559007, lon: 9.961855, time_offset_ms: 14292},
      %Video.TimedPoint{lat: 53.558946, lon: 9.961962, time_offset_ms: 14626},
      %Video.TimedPoint{lat: 53.558881, lon: 9.962072, time_offset_ms: 14959},
      %Video.TimedPoint{lat: 53.558814, lon: 9.962168, time_offset_ms: 15293},
      %Video.TimedPoint{lat: 53.558748, lon: 9.962281, time_offset_ms: 15626},
      %Video.TimedPoint{lat: 53.558679, lon: 9.962399, time_offset_ms: 15960},
      %Video.TimedPoint{lat: 53.558609, lon: 9.962522, time_offset_ms: 16294},
      %Video.TimedPoint{lat: 53.558537, lon: 9.962645, time_offset_ms: 16627},
      %Video.TimedPoint{lat: 53.558456, lon: 9.962771, time_offset_ms: 16961},
      %Video.TimedPoint{lat: 53.558378, lon: 9.962894, time_offset_ms: 17294},
      %Video.TimedPoint{lat: 53.558298, lon: 9.963017, time_offset_ms: 17628},
      %Video.TimedPoint{lat: 53.558215, lon: 9.963138, time_offset_ms: 17962},
      %Video.TimedPoint{lat: 53.558135, lon: 9.963252, time_offset_ms: 18295},
      %Video.TimedPoint{lat: 53.55805, lon: 9.963363, time_offset_ms: 18629},
      %Video.TimedPoint{lat: 53.557957, lon: 9.963471, time_offset_ms: 18962},
      %Video.TimedPoint{lat: 53.55786, lon: 9.963559, time_offset_ms: 19296},
      %Video.TimedPoint{lat: 53.557761, lon: 9.963617, time_offset_ms: 19629},
      %Video.TimedPoint{lat: 53.557659, lon: 9.963663, time_offset_ms: 19963},
      %Video.TimedPoint{lat: 53.557562, lon: 9.963689, time_offset_ms: 20297},
      %Video.TimedPoint{lat: 53.55747, lon: 9.96371, time_offset_ms: 20630},
      %Video.TimedPoint{lat: 53.55738, lon: 9.96373, time_offset_ms: 20964},
      %Video.TimedPoint{lat: 53.557298, lon: 9.963748, time_offset_ms: 21297},
      %Video.TimedPoint{lat: 53.557219, lon: 9.963762, time_offset_ms: 21631},
      %Video.TimedPoint{lat: 53.557146, lon: 9.963771, time_offset_ms: 21965},
      %Video.TimedPoint{lat: 53.557085, lon: 9.963778, time_offset_ms: 22298},
      %Video.TimedPoint{lat: 53.557043, lon: 9.963794, time_offset_ms: 22632}
    ]
  end
end