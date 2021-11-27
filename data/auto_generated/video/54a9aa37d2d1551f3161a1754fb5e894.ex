defmodule Data.AutoGenerated.Video.Rendered_54a9aa37d2d1551f3161a1754fb5e894 do
  @moduledoc "#{"2020-10-17-hammer-landstrasse: Hammer Landstraße (stadteinwärts)"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2020-10-17-hammer-landstrasse: Hammer Landstraße (stadteinwärts)"
  end

  @impl Video.Rendered
  def hash() do
    "54a9aa37d2d1551f3161a1754fb5e894"
  end

  @impl Video.Rendered
  def length_ms() do
    27172
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2021-07-10-13uhr-14gg/GX012183", "00:00:16.116", :end},
      {"2021-07-10-13uhr-14gg/GX012184", :start, "00:00:09.176"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.55478590690691,
      maxLon: 10.071208946107784,
      minLat: 53.55244276047904,
      minLon: 10.058475963963964
    }
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.55478590690691, lon: 10.058475963963964, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.554779, lon: 10.058592, time_offset_ms: 230},
      %Video.TimedPoint{lat: 53.554752, lon: 10.058728, time_offset_ms: 564},
      %Video.TimedPoint{lat: 53.554726, lon: 10.058871, time_offset_ms: 897},
      %Video.TimedPoint{lat: 53.554703, lon: 10.059032, time_offset_ms: 1231},
      %Video.TimedPoint{lat: 53.554679, lon: 10.059204, time_offset_ms: 1565},
      %Video.TimedPoint{lat: 53.554656, lon: 10.059371, time_offset_ms: 1898},
      %Video.TimedPoint{lat: 53.554626, lon: 10.059532, time_offset_ms: 2232},
      %Video.TimedPoint{lat: 53.554608, lon: 10.059703, time_offset_ms: 2565},
      %Video.TimedPoint{lat: 53.55459, lon: 10.059869, time_offset_ms: 2899},
      %Video.TimedPoint{lat: 53.554575, lon: 10.060033, time_offset_ms: 3233},
      %Video.TimedPoint{lat: 53.554559, lon: 10.060206, time_offset_ms: 3566},
      %Video.TimedPoint{lat: 53.554543, lon: 10.060368, time_offset_ms: 3900},
      %Video.TimedPoint{lat: 53.554524, lon: 10.060525, time_offset_ms: 4233},
      %Video.TimedPoint{lat: 53.554509, lon: 10.060685, time_offset_ms: 4567},
      %Video.TimedPoint{lat: 53.554496, lon: 10.060851, time_offset_ms: 4901},
      %Video.TimedPoint{lat: 53.554486, lon: 10.061028, time_offset_ms: 5234},
      %Video.TimedPoint{lat: 53.554462, lon: 10.061199, time_offset_ms: 5568},
      %Video.TimedPoint{lat: 53.554437, lon: 10.061362, time_offset_ms: 5901},
      %Video.TimedPoint{lat: 53.554413, lon: 10.061537, time_offset_ms: 6235},
      %Video.TimedPoint{lat: 53.554388, lon: 10.061709, time_offset_ms: 6569},
      %Video.TimedPoint{lat: 53.554362, lon: 10.061879, time_offset_ms: 6902},
      %Video.TimedPoint{lat: 53.554335, lon: 10.062046, time_offset_ms: 7236},
      %Video.TimedPoint{lat: 53.554308, lon: 10.062221, time_offset_ms: 7569},
      %Video.TimedPoint{lat: 53.554281, lon: 10.062394, time_offset_ms: 7903},
      %Video.TimedPoint{lat: 53.554254, lon: 10.062561, time_offset_ms: 8237},
      %Video.TimedPoint{lat: 53.554226, lon: 10.06273, time_offset_ms: 8570},
      %Video.TimedPoint{lat: 53.554198, lon: 10.062902, time_offset_ms: 8904},
      %Video.TimedPoint{lat: 53.554172, lon: 10.063073, time_offset_ms: 9237},
      %Video.TimedPoint{lat: 53.554148, lon: 10.063248, time_offset_ms: 9571},
      %Video.TimedPoint{lat: 53.554122, lon: 10.063419, time_offset_ms: 9905},
      %Video.TimedPoint{lat: 53.554098, lon: 10.063591, time_offset_ms: 10238},
      %Video.TimedPoint{lat: 53.554076, lon: 10.063757, time_offset_ms: 10572},
      %Video.TimedPoint{lat: 53.55405, lon: 10.06393, time_offset_ms: 10905},
      %Video.TimedPoint{lat: 53.554026, lon: 10.064098, time_offset_ms: 11239},
      %Video.TimedPoint{lat: 53.553999, lon: 10.064265, time_offset_ms: 11573},
      %Video.TimedPoint{lat: 53.553972, lon: 10.064434, time_offset_ms: 11906},
      %Video.TimedPoint{lat: 53.553946, lon: 10.064598, time_offset_ms: 12240},
      %Video.TimedPoint{lat: 53.553918, lon: 10.064763, time_offset_ms: 12573},
      %Video.TimedPoint{lat: 53.553893, lon: 10.064933, time_offset_ms: 12907},
      %Video.TimedPoint{lat: 53.553876, lon: 10.065105, time_offset_ms: 13241},
      %Video.TimedPoint{lat: 53.553851, lon: 10.06527, time_offset_ms: 13574},
      %Video.TimedPoint{lat: 53.553826, lon: 10.065439, time_offset_ms: 13908},
      %Video.TimedPoint{lat: 53.553798, lon: 10.065608, time_offset_ms: 14241},
      %Video.TimedPoint{lat: 53.553774, lon: 10.065781, time_offset_ms: 14575},
      %Video.TimedPoint{lat: 53.553749, lon: 10.065951, time_offset_ms: 14909},
      %Video.TimedPoint{lat: 53.553723, lon: 10.066116, time_offset_ms: 15242},
      %Video.TimedPoint{lat: 53.553694, lon: 10.066277, time_offset_ms: 15576},
      %Video.TimedPoint{lat: 53.553662, lon: 10.066431, time_offset_ms: 15909},
      %Video.TimedPoint{lat: 53.55363, lon: 10.066579, time_offset_ms: 16243},
      %Video.TimedPoint{lat: 53.553605, lon: 10.066736, time_offset_ms: 16577},
      %Video.TimedPoint{lat: 53.553567, lon: 10.066885, time_offset_ms: 16910},
      %Video.TimedPoint{lat: 53.553527, lon: 10.067038, time_offset_ms: 17244},
      %Video.TimedPoint{lat: 53.553489, lon: 10.067177, time_offset_ms: 17577},
      %Video.TimedPoint{lat: 53.553462, lon: 10.067267, time_offset_ms: 17911},
      %Video.TimedPoint{lat: 53.553454, lon: 10.067329, time_offset_ms: 17996},
      %Video.TimedPoint{lat: 53.55345, lon: 10.067344, time_offset_ms: 18330},
      %Video.TimedPoint{lat: 53.55343, lon: 10.067399, time_offset_ms: 18663},
      %Video.TimedPoint{lat: 53.553405, lon: 10.067494, time_offset_ms: 18997},
      %Video.TimedPoint{lat: 53.553385, lon: 10.067617, time_offset_ms: 19330},
      %Video.TimedPoint{lat: 53.553364, lon: 10.067747, time_offset_ms: 19664},
      %Video.TimedPoint{lat: 53.553342, lon: 10.067884, time_offset_ms: 19998},
      %Video.TimedPoint{lat: 53.553309, lon: 10.068035, time_offset_ms: 20331},
      %Video.TimedPoint{lat: 53.55327, lon: 10.068187, time_offset_ms: 20665},
      %Video.TimedPoint{lat: 53.553229, lon: 10.068341, time_offset_ms: 20998},
      %Video.TimedPoint{lat: 53.553187, lon: 10.068498, time_offset_ms: 21332},
      %Video.TimedPoint{lat: 53.553146, lon: 10.068649, time_offset_ms: 21666},
      %Video.TimedPoint{lat: 53.553105, lon: 10.068802, time_offset_ms: 21999},
      %Video.TimedPoint{lat: 53.553062, lon: 10.068961, time_offset_ms: 22333},
      %Video.TimedPoint{lat: 53.553021, lon: 10.069117, time_offset_ms: 22666},
      %Video.TimedPoint{lat: 53.552979, lon: 10.069275, time_offset_ms: 23000},
      %Video.TimedPoint{lat: 53.552934, lon: 10.069434, time_offset_ms: 23334},
      %Video.TimedPoint{lat: 53.552892, lon: 10.069587, time_offset_ms: 23667},
      %Video.TimedPoint{lat: 53.552851, lon: 10.069741, time_offset_ms: 24001},
      %Video.TimedPoint{lat: 53.552805, lon: 10.069897, time_offset_ms: 24334},
      %Video.TimedPoint{lat: 53.552762, lon: 10.07005, time_offset_ms: 24668},
      %Video.TimedPoint{lat: 53.55272, lon: 10.070204, time_offset_ms: 25002},
      %Video.TimedPoint{lat: 53.552678, lon: 10.070362, time_offset_ms: 25335},
      %Video.TimedPoint{lat: 53.552635, lon: 10.070516, time_offset_ms: 25669},
      %Video.TimedPoint{lat: 53.552592, lon: 10.070671, time_offset_ms: 26002},
      %Video.TimedPoint{lat: 53.552548, lon: 10.070831, time_offset_ms: 26336},
      %Video.TimedPoint{lat: 53.552506, lon: 10.070981, time_offset_ms: 26670},
      %Video.TimedPoint{lat: 53.552463, lon: 10.071129, time_offset_ms: 27003},
      %Video.TimedPoint{lat: 53.55244276047904, lon: 10.071208946107784, time_offset_ms: 27172}
    ]
  end
end