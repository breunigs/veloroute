defmodule Data.AutoGenerated.Video.Rendered_64539d4b3586c38e74a1d0fe7294fff5 do
  @moduledoc "#{"2022-01-15-rothenbaumchaussee: Rothenbaumchaussee Fahrtrichtung Süden"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2022-01-15-rothenbaumchaussee: Rothenbaumchaussee Fahrtrichtung Süden"
  end

  @impl Video.Rendered
  def hash() do
    "64539d4b3586c38e74a1d0fe7294fff5"
  end

  @impl Video.Rendered
  def fade() do
    0.26693360026693363
  end

  @impl Video.Rendered
  def length_ms() do
    83619
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-01-08-rothenbaumchaussee/GX013107", "00:00:14.481", "00:00:57.024"},
      {"2022-01-08-rothenbaumchaussee/GX013108", :start, "00:00:16.850"},
      {"2022-01-08-rothenbaumchaussee/GX013109", :start, "00:00:24.625"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.58135756456457,
      maxLon: 9.989817,
      minLat: 53.5618277027027,
      minLon: 9.988318
    }
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.58135756456457, lon: 9.98844151951952, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.581341, lon: 9.988464, time_offset_ms: 197},
      %Video.TimedPoint{lat: 53.581303, lon: 9.988487, time_offset_ms: 531},
      %Video.TimedPoint{lat: 53.581253, lon: 9.9885, time_offset_ms: 865},
      %Video.TimedPoint{lat: 53.581194, lon: 9.9885, time_offset_ms: 1198},
      %Video.TimedPoint{lat: 53.581125, lon: 9.988505, time_offset_ms: 1532},
      %Video.TimedPoint{lat: 53.58106, lon: 9.98851, time_offset_ms: 1865},
      %Video.TimedPoint{lat: 53.58099, lon: 9.988517, time_offset_ms: 2199},
      %Video.TimedPoint{lat: 53.580918, lon: 9.988528, time_offset_ms: 2533},
      %Video.TimedPoint{lat: 53.580844, lon: 9.988541, time_offset_ms: 2866},
      %Video.TimedPoint{lat: 53.580774, lon: 9.988554, time_offset_ms: 3200},
      %Video.TimedPoint{lat: 53.580703, lon: 9.988565, time_offset_ms: 3533},
      %Video.TimedPoint{lat: 53.580637, lon: 9.98857, time_offset_ms: 3867},
      %Video.TimedPoint{lat: 53.58057, lon: 9.988576, time_offset_ms: 4201},
      %Video.TimedPoint{lat: 53.580502, lon: 9.988579, time_offset_ms: 4534},
      %Video.TimedPoint{lat: 53.580439, lon: 9.98858, time_offset_ms: 4868},
      %Video.TimedPoint{lat: 53.580372, lon: 9.988588, time_offset_ms: 5201},
      %Video.TimedPoint{lat: 53.580305, lon: 9.988605, time_offset_ms: 5535},
      %Video.TimedPoint{lat: 53.580233, lon: 9.98861, time_offset_ms: 5869},
      %Video.TimedPoint{lat: 53.580159, lon: 9.988612, time_offset_ms: 6202},
      %Video.TimedPoint{lat: 53.580087, lon: 9.988622, time_offset_ms: 6536},
      %Video.TimedPoint{lat: 53.580016, lon: 9.988637, time_offset_ms: 6869},
      %Video.TimedPoint{lat: 53.579948, lon: 9.988646, time_offset_ms: 7203},
      %Video.TimedPoint{lat: 53.579882, lon: 9.988656, time_offset_ms: 7537},
      %Video.TimedPoint{lat: 53.579817, lon: 9.988666, time_offset_ms: 7870},
      %Video.TimedPoint{lat: 53.579755, lon: 9.988676, time_offset_ms: 8204},
      %Video.TimedPoint{lat: 53.579694, lon: 9.988683, time_offset_ms: 8537},
      %Video.TimedPoint{lat: 53.579631, lon: 9.988695, time_offset_ms: 8871},
      %Video.TimedPoint{lat: 53.579565, lon: 9.98871, time_offset_ms: 9205},
      %Video.TimedPoint{lat: 53.579504, lon: 9.98872, time_offset_ms: 9538},
      %Video.TimedPoint{lat: 53.579444, lon: 9.98873, time_offset_ms: 9872},
      %Video.TimedPoint{lat: 53.579386, lon: 9.988742, time_offset_ms: 10205},
      %Video.TimedPoint{lat: 53.579326, lon: 9.988755, time_offset_ms: 10539},
      %Video.TimedPoint{lat: 53.579272, lon: 9.988763, time_offset_ms: 10873},
      %Video.TimedPoint{lat: 53.579221, lon: 9.988767, time_offset_ms: 11206},
      %Video.TimedPoint{lat: 53.579169, lon: 9.988769, time_offset_ms: 11540},
      %Video.TimedPoint{lat: 53.579116, lon: 9.988774, time_offset_ms: 11873},
      %Video.TimedPoint{lat: 53.579052, lon: 9.988782, time_offset_ms: 12207},
      %Video.TimedPoint{lat: 53.578983, lon: 9.988795, time_offset_ms: 12541},
      %Video.TimedPoint{lat: 53.578916, lon: 9.988807, time_offset_ms: 12874},
      %Video.TimedPoint{lat: 53.57885, lon: 9.988819, time_offset_ms: 13208},
      %Video.TimedPoint{lat: 53.578789, lon: 9.988826, time_offset_ms: 13541},
      %Video.TimedPoint{lat: 53.578727, lon: 9.988836, time_offset_ms: 13875},
      %Video.TimedPoint{lat: 53.578666, lon: 9.988842, time_offset_ms: 14209},
      %Video.TimedPoint{lat: 53.578602, lon: 9.988851, time_offset_ms: 14542},
      %Video.TimedPoint{lat: 53.578537, lon: 9.988857, time_offset_ms: 14876},
      %Video.TimedPoint{lat: 53.578473, lon: 9.988864, time_offset_ms: 15209},
      %Video.TimedPoint{lat: 53.578407, lon: 9.988872, time_offset_ms: 15543},
      %Video.TimedPoint{lat: 53.57834, lon: 9.988878, time_offset_ms: 15877},
      %Video.TimedPoint{lat: 53.578273, lon: 9.988883, time_offset_ms: 16210},
      %Video.TimedPoint{lat: 53.578207, lon: 9.988888, time_offset_ms: 16544},
      %Video.TimedPoint{lat: 53.578145, lon: 9.988892, time_offset_ms: 16877},
      %Video.TimedPoint{lat: 53.578084, lon: 9.988893, time_offset_ms: 17211},
      %Video.TimedPoint{lat: 53.578018, lon: 9.988896, time_offset_ms: 17545},
      %Video.TimedPoint{lat: 53.577949, lon: 9.988896, time_offset_ms: 17878},
      %Video.TimedPoint{lat: 53.577879, lon: 9.988892, time_offset_ms: 18212},
      %Video.TimedPoint{lat: 53.577805, lon: 9.988887, time_offset_ms: 18545},
      %Video.TimedPoint{lat: 53.577736, lon: 9.98888, time_offset_ms: 18879},
      %Video.TimedPoint{lat: 53.577672, lon: 9.988872, time_offset_ms: 19213},
      %Video.TimedPoint{lat: 53.577614, lon: 9.988863, time_offset_ms: 19546},
      %Video.TimedPoint{lat: 53.577561, lon: 9.988851, time_offset_ms: 19880},
      %Video.TimedPoint{lat: 53.577494, lon: 9.988842, time_offset_ms: 20213},
      %Video.TimedPoint{lat: 53.577421, lon: 9.988838, time_offset_ms: 20547},
      %Video.TimedPoint{lat: 53.577345, lon: 9.988837, time_offset_ms: 20881},
      %Video.TimedPoint{lat: 53.577276, lon: 9.988839, time_offset_ms: 21214},
      %Video.TimedPoint{lat: 53.577207, lon: 9.988837, time_offset_ms: 21548},
      %Video.TimedPoint{lat: 53.577139, lon: 9.98883, time_offset_ms: 21881},
      %Video.TimedPoint{lat: 53.577071, lon: 9.988826, time_offset_ms: 22215},
      %Video.TimedPoint{lat: 53.577003, lon: 9.988819, time_offset_ms: 22549},
      %Video.TimedPoint{lat: 53.576933, lon: 9.98881, time_offset_ms: 22882},
      %Video.TimedPoint{lat: 53.576868, lon: 9.988801, time_offset_ms: 23216},
      %Video.TimedPoint{lat: 53.576805, lon: 9.988791, time_offset_ms: 23549},
      %Video.TimedPoint{lat: 53.576732, lon: 9.988786, time_offset_ms: 23883},
      %Video.TimedPoint{lat: 53.576658, lon: 9.988783, time_offset_ms: 24217},
      %Video.TimedPoint{lat: 53.576586, lon: 9.988778, time_offset_ms: 24550},
      %Video.TimedPoint{lat: 53.576513, lon: 9.988769, time_offset_ms: 24884},
      %Video.TimedPoint{lat: 53.57644, lon: 9.988767, time_offset_ms: 25217},
      %Video.TimedPoint{lat: 53.576372, lon: 9.988762, time_offset_ms: 25551},
      %Video.TimedPoint{lat: 53.576302, lon: 9.988755, time_offset_ms: 25885},
      %Video.TimedPoint{lat: 53.57623, lon: 9.988752, time_offset_ms: 26218},
      %Video.TimedPoint{lat: 53.576163, lon: 9.988743, time_offset_ms: 26552},
      %Video.TimedPoint{lat: 53.576094, lon: 9.988734, time_offset_ms: 26885},
      %Video.TimedPoint{lat: 53.576025, lon: 9.988723, time_offset_ms: 27219},
      %Video.TimedPoint{lat: 53.575953, lon: 9.988719, time_offset_ms: 27552},
      %Video.TimedPoint{lat: 53.575877, lon: 9.988714, time_offset_ms: 27886},
      %Video.TimedPoint{lat: 53.575802, lon: 9.98871, time_offset_ms: 28220},
      %Video.TimedPoint{lat: 53.575726, lon: 9.988706, time_offset_ms: 28553},
      %Video.TimedPoint{lat: 53.575648, lon: 9.988703, time_offset_ms: 28887},
      %Video.TimedPoint{lat: 53.575575, lon: 9.988701, time_offset_ms: 29220},
      %Video.TimedPoint{lat: 53.575501, lon: 9.988705, time_offset_ms: 29554},
      %Video.TimedPoint{lat: 53.575425, lon: 9.988701, time_offset_ms: 29888},
      %Video.TimedPoint{lat: 53.575347, lon: 9.988697, time_offset_ms: 30221},
      %Video.TimedPoint{lat: 53.575269, lon: 9.988691, time_offset_ms: 30555},
      %Video.TimedPoint{lat: 53.575194, lon: 9.988685, time_offset_ms: 30888},
      %Video.TimedPoint{lat: 53.575121, lon: 9.988681, time_offset_ms: 31222},
      %Video.TimedPoint{lat: 53.575037, lon: 9.988678, time_offset_ms: 31556},
      %Video.TimedPoint{lat: 53.574951, lon: 9.988672, time_offset_ms: 31889},
      %Video.TimedPoint{lat: 53.57487, lon: 9.988666, time_offset_ms: 32223},
      %Video.TimedPoint{lat: 53.574794, lon: 9.988658, time_offset_ms: 32556},
      %Video.TimedPoint{lat: 53.574712, lon: 9.988655, time_offset_ms: 32890},
      %Video.TimedPoint{lat: 53.574632, lon: 9.988651, time_offset_ms: 33224},
      %Video.TimedPoint{lat: 53.574554, lon: 9.988645, time_offset_ms: 33557},
      %Video.TimedPoint{lat: 53.574475, lon: 9.988641, time_offset_ms: 33891},
      %Video.TimedPoint{lat: 53.5744, lon: 9.988639, time_offset_ms: 34224},
      %Video.TimedPoint{lat: 53.57433, lon: 9.988633, time_offset_ms: 34558},
      %Video.TimedPoint{lat: 53.574257, lon: 9.988629, time_offset_ms: 34892},
      %Video.TimedPoint{lat: 53.574187, lon: 9.988623, time_offset_ms: 35225},
      %Video.TimedPoint{lat: 53.574114, lon: 9.988617, time_offset_ms: 35559},
      %Video.TimedPoint{lat: 53.574039, lon: 9.988618, time_offset_ms: 35892},
      %Video.TimedPoint{lat: 53.573965, lon: 9.988616, time_offset_ms: 36226},
      %Video.TimedPoint{lat: 53.573898, lon: 9.988608, time_offset_ms: 36560},
      %Video.TimedPoint{lat: 53.573827, lon: 9.988602, time_offset_ms: 36893},
      %Video.TimedPoint{lat: 53.573757, lon: 9.988602, time_offset_ms: 37227},
      %Video.TimedPoint{lat: 53.57369, lon: 9.988597, time_offset_ms: 37560},
      %Video.TimedPoint{lat: 53.573625, lon: 9.988594, time_offset_ms: 37894},
      %Video.TimedPoint{lat: 53.573568, lon: 9.98859, time_offset_ms: 38228},
      %Video.TimedPoint{lat: 53.573514, lon: 9.988583, time_offset_ms: 38561},
      %Video.TimedPoint{lat: 53.573461, lon: 9.98858, time_offset_ms: 38895},
      %Video.TimedPoint{lat: 53.573408, lon: 9.988579, time_offset_ms: 39228},
      %Video.TimedPoint{lat: 53.573353, lon: 9.988576, time_offset_ms: 39562},
      %Video.TimedPoint{lat: 53.573292, lon: 9.988576, time_offset_ms: 39896},
      %Video.TimedPoint{lat: 53.573232, lon: 9.988573, time_offset_ms: 40229},
      %Video.TimedPoint{lat: 53.573171, lon: 9.98857, time_offset_ms: 40563},
      %Video.TimedPoint{lat: 53.573111, lon: 9.988565, time_offset_ms: 40896},
      %Video.TimedPoint{lat: 53.573053, lon: 9.988561, time_offset_ms: 41230},
      %Video.TimedPoint{lat: 53.573002, lon: 9.988556, time_offset_ms: 41564},
      %Video.TimedPoint{lat: 53.572957, lon: 9.98855, time_offset_ms: 41897},
      %Video.TimedPoint{lat: 53.572916, lon: 9.988545, time_offset_ms: 42231},
      %Video.TimedPoint{lat: 53.57289987387387, lon: 9.988547687687689, time_offset_ms: 42410},
      %Video.TimedPoint{lat: 53.572843, lon: 9.988566, time_offset_ms: 42410},
      %Video.TimedPoint{lat: 53.572825, lon: 9.988564, time_offset_ms: 42744},
      %Video.TimedPoint{lat: 53.572774, lon: 9.988559, time_offset_ms: 43077},
      %Video.TimedPoint{lat: 53.572704, lon: 9.988554, time_offset_ms: 43411},
      %Video.TimedPoint{lat: 53.572624, lon: 9.988551, time_offset_ms: 43744},
      %Video.TimedPoint{lat: 53.57254, lon: 9.988548, time_offset_ms: 44078},
      %Video.TimedPoint{lat: 53.57245, lon: 9.988545, time_offset_ms: 44412},
      %Video.TimedPoint{lat: 53.572359, lon: 9.988539, time_offset_ms: 44745},
      %Video.TimedPoint{lat: 53.572266, lon: 9.988541, time_offset_ms: 45079},
      %Video.TimedPoint{lat: 53.572169, lon: 9.988555, time_offset_ms: 45412},
      %Video.TimedPoint{lat: 53.572068, lon: 9.98856, time_offset_ms: 45746},
      %Video.TimedPoint{lat: 53.571968, lon: 9.988554, time_offset_ms: 46080},
      %Video.TimedPoint{lat: 53.571865, lon: 9.988551, time_offset_ms: 46413},
      %Video.TimedPoint{lat: 53.571765, lon: 9.988545, time_offset_ms: 46747},
      %Video.TimedPoint{lat: 53.57167, lon: 9.988539, time_offset_ms: 47080},
      %Video.TimedPoint{lat: 53.571578, lon: 9.988518, time_offset_ms: 47414},
      %Video.TimedPoint{lat: 53.571481, lon: 9.988496, time_offset_ms: 47748},
      %Video.TimedPoint{lat: 53.571385, lon: 9.988478, time_offset_ms: 48081},
      %Video.TimedPoint{lat: 53.571287, lon: 9.988472, time_offset_ms: 48415},
      %Video.TimedPoint{lat: 53.571189, lon: 9.988468, time_offset_ms: 48748},
      %Video.TimedPoint{lat: 53.571094, lon: 9.988465, time_offset_ms: 49082},
      %Video.TimedPoint{lat: 53.570996, lon: 9.988463, time_offset_ms: 49416},
      %Video.TimedPoint{lat: 53.570897, lon: 9.988464, time_offset_ms: 49749},
      %Video.TimedPoint{lat: 53.5708, lon: 9.988462, time_offset_ms: 50083},
      %Video.TimedPoint{lat: 53.570704, lon: 9.988455, time_offset_ms: 50416},
      %Video.TimedPoint{lat: 53.570608, lon: 9.988446, time_offset_ms: 50750},
      %Video.TimedPoint{lat: 53.570513, lon: 9.988442, time_offset_ms: 51083},
      %Video.TimedPoint{lat: 53.570418, lon: 9.988437, time_offset_ms: 51417},
      %Video.TimedPoint{lat: 53.570322, lon: 9.988433, time_offset_ms: 51751},
      %Video.TimedPoint{lat: 53.570229, lon: 9.98843, time_offset_ms: 52084},
      %Video.TimedPoint{lat: 53.570133, lon: 9.988428, time_offset_ms: 52418},
      %Video.TimedPoint{lat: 53.570038, lon: 9.988421, time_offset_ms: 52751},
      %Video.TimedPoint{lat: 53.569945, lon: 9.988417, time_offset_ms: 53085},
      %Video.TimedPoint{lat: 53.569855, lon: 9.988415, time_offset_ms: 53419},
      %Video.TimedPoint{lat: 53.569759, lon: 9.988409, time_offset_ms: 53752},
      %Video.TimedPoint{lat: 53.569665, lon: 9.9884, time_offset_ms: 54086},
      %Video.TimedPoint{lat: 53.569562, lon: 9.988393, time_offset_ms: 54419},
      %Video.TimedPoint{lat: 53.569459, lon: 9.988388, time_offset_ms: 54753},
      %Video.TimedPoint{lat: 53.569354, lon: 9.988381, time_offset_ms: 55087},
      %Video.TimedPoint{lat: 53.569253, lon: 9.988372, time_offset_ms: 55420},
      %Video.TimedPoint{lat: 53.569149, lon: 9.988367, time_offset_ms: 55754},
      %Video.TimedPoint{lat: 53.569046, lon: 9.988371, time_offset_ms: 56087},
      %Video.TimedPoint{lat: 53.56894, lon: 9.988385, time_offset_ms: 56421},
      %Video.TimedPoint{lat: 53.568834, lon: 9.988388, time_offset_ms: 56755},
      %Video.TimedPoint{lat: 53.568732, lon: 9.988383, time_offset_ms: 57088},
      %Video.TimedPoint{lat: 53.568634, lon: 9.988377, time_offset_ms: 57422},
      %Video.TimedPoint{lat: 53.568532, lon: 9.988361, time_offset_ms: 57755},
      %Video.TimedPoint{lat: 53.568437, lon: 9.988338, time_offset_ms: 58089},
      %Video.TimedPoint{lat: 53.568344, lon: 9.988324, time_offset_ms: 58423},
      %Video.TimedPoint{lat: 53.568257, lon: 9.988318, time_offset_ms: 58756},
      %Video.TimedPoint{lat: 53.568191, lon: 9.988321, time_offset_ms: 59090},
      %Video.TimedPoint{lat: 53.56818666666666, lon: 9.988321222222222, time_offset_ms: 59127},
      %Video.TimedPoint{lat: 53.568056, lon: 9.98837, time_offset_ms: 59127},
      %Video.TimedPoint{lat: 53.568031, lon: 9.988365, time_offset_ms: 59461},
      %Video.TimedPoint{lat: 53.567967, lon: 9.988365, time_offset_ms: 59794},
      %Video.TimedPoint{lat: 53.567889, lon: 9.988362, time_offset_ms: 60128},
      %Video.TimedPoint{lat: 53.567808, lon: 9.988358, time_offset_ms: 60461},
      %Video.TimedPoint{lat: 53.567724, lon: 9.988348, time_offset_ms: 60795},
      %Video.TimedPoint{lat: 53.567635, lon: 9.98834, time_offset_ms: 61129},
      %Video.TimedPoint{lat: 53.567551, lon: 9.988336, time_offset_ms: 61462},
      %Video.TimedPoint{lat: 53.567453, lon: 9.988355, time_offset_ms: 61796},
      %Video.TimedPoint{lat: 53.567351, lon: 9.988386, time_offset_ms: 62129},
      %Video.TimedPoint{lat: 53.567256, lon: 9.988417, time_offset_ms: 62463},
      %Video.TimedPoint{lat: 53.567159, lon: 9.988442, time_offset_ms: 62797},
      %Video.TimedPoint{lat: 53.567065, lon: 9.988468, time_offset_ms: 63130},
      %Video.TimedPoint{lat: 53.566977, lon: 9.988485, time_offset_ms: 63464},
      %Video.TimedPoint{lat: 53.566893, lon: 9.988507, time_offset_ms: 63797},
      %Video.TimedPoint{lat: 53.566795, lon: 9.988535, time_offset_ms: 64131},
      %Video.TimedPoint{lat: 53.5667, lon: 9.988555, time_offset_ms: 64465},
      %Video.TimedPoint{lat: 53.566609, lon: 9.988575, time_offset_ms: 64798},
      %Video.TimedPoint{lat: 53.566511, lon: 9.988601, time_offset_ms: 65132},
      %Video.TimedPoint{lat: 53.566406, lon: 9.988636, time_offset_ms: 65465},
      %Video.TimedPoint{lat: 53.566296, lon: 9.988675, time_offset_ms: 65799},
      %Video.TimedPoint{lat: 53.566185, lon: 9.988714, time_offset_ms: 66133},
      %Video.TimedPoint{lat: 53.566076, lon: 9.988753, time_offset_ms: 66466},
      %Video.TimedPoint{lat: 53.565972, lon: 9.988789, time_offset_ms: 66800},
      %Video.TimedPoint{lat: 53.565867, lon: 9.988822, time_offset_ms: 67133},
      %Video.TimedPoint{lat: 53.565767, lon: 9.988855, time_offset_ms: 67467},
      %Video.TimedPoint{lat: 53.565665, lon: 9.988884, time_offset_ms: 67801},
      %Video.TimedPoint{lat: 53.565561, lon: 9.988916, time_offset_ms: 68134},
      %Video.TimedPoint{lat: 53.565458, lon: 9.988948, time_offset_ms: 68468},
      %Video.TimedPoint{lat: 53.565355, lon: 9.988977, time_offset_ms: 68801},
      %Video.TimedPoint{lat: 53.565243, lon: 9.989006, time_offset_ms: 69135},
      %Video.TimedPoint{lat: 53.565154, lon: 9.989034, time_offset_ms: 69469},
      %Video.TimedPoint{lat: 53.565063, lon: 9.989062, time_offset_ms: 69802},
      %Video.TimedPoint{lat: 53.564975, lon: 9.989084, time_offset_ms: 70136},
      %Video.TimedPoint{lat: 53.564909, lon: 9.989102, time_offset_ms: 70469},
      %Video.TimedPoint{lat: 53.564859, lon: 9.989118, time_offset_ms: 70803},
      %Video.TimedPoint{lat: 53.564817, lon: 9.989139, time_offset_ms: 71137},
      %Video.TimedPoint{lat: 53.564795, lon: 9.989145, time_offset_ms: 71470},
      %Video.TimedPoint{lat: 53.564782, lon: 9.989145, time_offset_ms: 71804},
      %Video.TimedPoint{lat: 53.56476, lon: 9.989149, time_offset_ms: 72137},
      %Video.TimedPoint{lat: 53.56471, lon: 9.989163, time_offset_ms: 72471},
      %Video.TimedPoint{lat: 53.564646, lon: 9.989178, time_offset_ms: 72805},
      %Video.TimedPoint{lat: 53.564571, lon: 9.989198, time_offset_ms: 73138},
      %Video.TimedPoint{lat: 53.564485, lon: 9.989217, time_offset_ms: 73472},
      %Video.TimedPoint{lat: 53.564392, lon: 9.989239, time_offset_ms: 73805},
      %Video.TimedPoint{lat: 53.564294, lon: 9.989263, time_offset_ms: 74139},
      %Video.TimedPoint{lat: 53.564197, lon: 9.989289, time_offset_ms: 74473},
      %Video.TimedPoint{lat: 53.5641, lon: 9.989314, time_offset_ms: 74806},
      %Video.TimedPoint{lat: 53.564, lon: 9.989341, time_offset_ms: 75140},
      %Video.TimedPoint{lat: 53.563906, lon: 9.989367, time_offset_ms: 75473},
      %Video.TimedPoint{lat: 53.563814, lon: 9.989392, time_offset_ms: 75807},
      %Video.TimedPoint{lat: 53.563713, lon: 9.989425, time_offset_ms: 76141},
      %Video.TimedPoint{lat: 53.563621, lon: 9.989458, time_offset_ms: 76474},
      %Video.TimedPoint{lat: 53.563537, lon: 9.989487, time_offset_ms: 76808},
      %Video.TimedPoint{lat: 53.563464, lon: 9.989508, time_offset_ms: 77141},
      %Video.TimedPoint{lat: 53.563381, lon: 9.98954, time_offset_ms: 77475},
      %Video.TimedPoint{lat: 53.56329, lon: 9.989575, time_offset_ms: 77809},
      %Video.TimedPoint{lat: 53.563195, lon: 9.989612, time_offset_ms: 78142},
      %Video.TimedPoint{lat: 53.563106, lon: 9.98964, time_offset_ms: 78476},
      %Video.TimedPoint{lat: 53.563014, lon: 9.98967, time_offset_ms: 78809},
      %Video.TimedPoint{lat: 53.562923, lon: 9.989696, time_offset_ms: 79143},
      %Video.TimedPoint{lat: 53.562838, lon: 9.989721, time_offset_ms: 79476},
      %Video.TimedPoint{lat: 53.562752, lon: 9.989747, time_offset_ms: 79810},
      %Video.TimedPoint{lat: 53.562665, lon: 9.989766, time_offset_ms: 80144},
      %Video.TimedPoint{lat: 53.562581, lon: 9.98978, time_offset_ms: 80477},
      %Video.TimedPoint{lat: 53.562481, lon: 9.989806, time_offset_ms: 80811},
      %Video.TimedPoint{lat: 53.562395, lon: 9.989807, time_offset_ms: 81144},
      %Video.TimedPoint{lat: 53.562315, lon: 9.98981, time_offset_ms: 81478},
      %Video.TimedPoint{lat: 53.562237, lon: 9.989813, time_offset_ms: 81812},
      %Video.TimedPoint{lat: 53.56215, lon: 9.989817, time_offset_ms: 82145},
      %Video.TimedPoint{lat: 53.562069, lon: 9.989806, time_offset_ms: 82479},
      %Video.TimedPoint{lat: 53.561991, lon: 9.989776, time_offset_ms: 82812},
      %Video.TimedPoint{lat: 53.561919, lon: 9.989746, time_offset_ms: 83146},
      %Video.TimedPoint{lat: 53.561854, lon: 9.989732, time_offset_ms: 83480},
      %Video.TimedPoint{lat: 53.5618277027027, lon: 9.989729912912914, time_offset_ms: 83619}
    ]
  end
end