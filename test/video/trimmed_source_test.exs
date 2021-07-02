defmodule Video.TrimmedSourceTest do
  use ExUnit.Case, async: true

  test "clamps coords to GPX boundaries" do
    tsv = Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")
    from = %{lat: 53.47, lon: 9.98}
    to = %{lat: 53.46, lon: 9.977}

    cut = Video.TrimmedSource.cut(tsv, from, to, nil, nil, nil)

    expected = %{
      coords: [
        %Video.TimedPoint{lat: 53.460992, lon: 9.977524, time_offset_ms: 0},
        %Video.TimedPoint{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
        %Video.TimedPoint{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
        %Video.TimedPoint{lat: 53.460951, lon: 9.977433, time_offset_ms: 1001},
        %Video.TimedPoint{lat: 53.46095, lon: 9.977412, time_offset_ms: 1334}
      ],
      from: "0:00:00.000",
      to: "0:00:01.334"
    }

    assert cut == Map.merge(tsv, expected)
  end

  test "extracts parts between two timestamps" do
    tsv = Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")

    cut = Video.TrimmedSource.extract(tsv, "0:00:00.200", "0:00:00.999")

    expected = %{
      coords: [
        %Video.TimedPoint{lat: 53.46098301796407, lon: 9.977514419161677, time_offset_ms: 200},
        %Video.TimedPoint{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
        %Video.TimedPoint{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
        %Video.TimedPoint{lat: 53.460951, lon: 9.97743325748503, time_offset_ms: 999}
      ],
      from: "0:00:00.200",
      to: "0:00:00.999"
    }

    assert cut == Map.merge(cut, expected)
  end

  test "cuts properly 1" do
    tsv = Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")
    # roughly mid between 1st and 2nd point in gpx
    from = %{lat: 53.460984, lon: 9.977516}
    # last point in gpx
    to = %{lat: 53.460950, lon: 9.977412}

    cut = Video.TrimmedSource.cut(tsv, from, to, nil, nil, nil)

    expected = %{
      coords: [
        %Video.TimedPoint{lat: 53.460984143754885, lon: 9.977515620005212, time_offset_ms: 175},
        %Video.TimedPoint{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
        %Video.TimedPoint{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
        %Video.TimedPoint{lat: 53.460951, lon: 9.977433, time_offset_ms: 1001},
        %Video.TimedPoint{lat: 53.46095, lon: 9.977412, time_offset_ms: 1334}
      ],
      from: "0:00:00.175",
      to: "0:00:01.334"
    }

    assert cut == Map.merge(cut, expected)
  end

  test "cuts properly 2" do
    tsv = %Video.TrimmedSource{
      anonymized_path_rel: "bla",
      coords: [
        %Video.TimedPoint{lat: 53.552107, lon: 9.994336, time_offset_ms: 0},
        %Video.TimedPoint{lat: 53.552092, lon: 9.994364, time_offset_ms: 334},
        %Video.TimedPoint{lat: 53.552062, lon: 9.994423, time_offset_ms: 667},
        %Video.TimedPoint{lat: 53.552042, lon: 9.994468, time_offset_ms: 1001},
        %Video.TimedPoint{lat: 53.552033, lon: 9.994491, time_offset_ms: 1335},
        %Video.TimedPoint{lat: 53.552021, lon: 9.994508, time_offset_ms: 1668},
        %Video.TimedPoint{lat: 53.552002, lon: 9.994517, time_offset_ms: 2002},
        %Video.TimedPoint{lat: 53.551971, lon: 9.994514, time_offset_ms: 2336},
        %Video.TimedPoint{lat: 53.551938, lon: 9.994516, time_offset_ms: 2669},
        %Video.TimedPoint{lat: 53.551911, lon: 9.994523, time_offset_ms: 3003},
        %Video.TimedPoint{lat: 53.551893, lon: 9.994528, time_offset_ms: 3337},
        %Video.TimedPoint{lat: 53.551874, lon: 9.994535, time_offset_ms: 3670},
        %Video.TimedPoint{lat: 53.551848, lon: 9.994535, time_offset_ms: 4004},
        %Video.TimedPoint{lat: 53.551823, lon: 9.994537, time_offset_ms: 4338},
        %Video.TimedPoint{lat: 53.551778, lon: 9.994538, time_offset_ms: 4671},
        %Video.TimedPoint{lat: 53.551712, lon: 9.994524, time_offset_ms: 5005},
        %Video.TimedPoint{lat: 53.55165, lon: 9.994493, time_offset_ms: 5339},
        %Video.TimedPoint{lat: 53.551614, lon: 9.994469, time_offset_ms: 5672},
        %Video.TimedPoint{lat: 53.551579, lon: 9.99448, time_offset_ms: 6006},
        %Video.TimedPoint{lat: 53.551549, lon: 9.994555, time_offset_ms: 6340},
        %Video.TimedPoint{lat: 53.551516, lon: 9.994644, time_offset_ms: 6673},
        %Video.TimedPoint{lat: 53.551476, lon: 9.994728, time_offset_ms: 7007},
        %Video.TimedPoint{lat: 53.551433, lon: 9.994803, time_offset_ms: 7341},
        %Video.TimedPoint{lat: 53.551398, lon: 9.994886, time_offset_ms: 7674},
        %Video.TimedPoint{lat: 53.55136, lon: 9.994975, time_offset_ms: 8008},
        %Video.TimedPoint{lat: 53.551313, lon: 9.995015, time_offset_ms: 8342},
        %Video.TimedPoint{lat: 53.551237, lon: 9.994952, time_offset_ms: 8675},
        %Video.TimedPoint{lat: 53.551187, lon: 9.994858, time_offset_ms: 9009},
        %Video.TimedPoint{lat: 53.551127, lon: 9.994751, time_offset_ms: 9343},
        %Video.TimedPoint{lat: 53.551067, lon: 9.994658, time_offset_ms: 9676},
        %Video.TimedPoint{lat: 53.551014, lon: 9.994575, time_offset_ms: 10010},
        %Video.TimedPoint{lat: 53.55094, lon: 9.994476, time_offset_ms: 10344},
        %Video.TimedPoint{lat: 53.550854, lon: 9.994367, time_offset_ms: 10677},
        %Video.TimedPoint{lat: 53.55082, lon: 9.994267, time_offset_ms: 11011},
        %Video.TimedPoint{lat: 53.550829, lon: 9.994179, time_offset_ms: 11345},
        %Video.TimedPoint{lat: 53.550828, lon: 9.9941, time_offset_ms: 11678},
        %Video.TimedPoint{lat: 53.550786, lon: 9.994063, time_offset_ms: 12012},
        %Video.TimedPoint{lat: 53.550741, lon: 9.994097, time_offset_ms: 12346},
        %Video.TimedPoint{lat: 53.550701, lon: 9.994165, time_offset_ms: 12679},
        %Video.TimedPoint{lat: 53.55067, lon: 9.994238, time_offset_ms: 13013},
        %Video.TimedPoint{lat: 53.550646, lon: 9.994304, time_offset_ms: 13347},
        %Video.TimedPoint{lat: 53.550621, lon: 9.99436, time_offset_ms: 13680},
        %Video.TimedPoint{lat: 53.550598, lon: 9.994402, time_offset_ms: 14014},
        %Video.TimedPoint{lat: 53.550572, lon: 9.994393, time_offset_ms: 14348},
        %Video.TimedPoint{lat: 53.550541, lon: 9.994308, time_offset_ms: 14681},
        %Video.TimedPoint{lat: 53.55051, lon: 9.994193, time_offset_ms: 15015},
        %Video.TimedPoint{lat: 53.550477, lon: 9.994083, time_offset_ms: 15349},
        %Video.TimedPoint{lat: 53.550445, lon: 9.993953, time_offset_ms: 15682},
        %Video.TimedPoint{lat: 53.550383, lon: 9.993795, time_offset_ms: 16016},
        %Video.TimedPoint{lat: 53.550316, lon: 9.993651, time_offset_ms: 16349},
        %Video.TimedPoint{lat: 53.550248, lon: 9.993508, time_offset_ms: 16683},
        %Video.TimedPoint{lat: 53.550187, lon: 9.993363, time_offset_ms: 17017},
        %Video.TimedPoint{lat: 53.550134, lon: 9.993222, time_offset_ms: 17350},
        %Video.TimedPoint{lat: 53.550098, lon: 9.993098, time_offset_ms: 17684},
        %Video.TimedPoint{lat: 53.550085, lon: 9.992996, time_offset_ms: 18018},
        %Video.TimedPoint{lat: 53.550023, lon: 9.99287, time_offset_ms: 18351},
        %Video.TimedPoint{lat: 53.549934, lon: 9.99273, time_offset_ms: 18685},
        %Video.TimedPoint{lat: 53.549847, lon: 9.992597, time_offset_ms: 19019},
        %Video.TimedPoint{lat: 53.549771, lon: 9.992479, time_offset_ms: 19352},
        %Video.TimedPoint{lat: 53.549708, lon: 9.992378, time_offset_ms: 19686},
        %Video.TimedPoint{lat: 53.549674, lon: 9.992295, time_offset_ms: 20020},
        %Video.TimedPoint{lat: 53.549624, lon: 9.992208, time_offset_ms: 20353},
        %Video.TimedPoint{lat: 53.549574, lon: 9.992133, time_offset_ms: 20687},
        %Video.TimedPoint{lat: 53.549515, lon: 9.99205, time_offset_ms: 21021},
        %Video.TimedPoint{lat: 53.549468, lon: 9.99198, time_offset_ms: 21354},
        %Video.TimedPoint{lat: 53.549445, lon: 9.991943, time_offset_ms: 21688}
      ],
      from: "0:00:00.0000",
      source_path_rel: "bla",
      to: "0:00:21.0688",
      duration_ms_uncut: "0:00:21.0688"
    }

    from = %{lat: 53.5506939, lon: 9.9942354}
    to = %{lat: 53.5505342, lon: 9.9944973}

    cut = Video.TrimmedSource.cut(tsv, from, to, nil, nil, nil)

    assert %Video.TrimmedSource{
             anonymized_path_rel: "bla",
             coords: [
               %Video.TimedPoint{
                 lat: 53.550678788026,
                 lon: 9.994217305616196,
                 time_offset_ms: 12918
               },
               %Video.TimedPoint{lat: 53.55067, lon: 9.994238, time_offset_ms: 13013},
               %Video.TimedPoint{lat: 53.550646, lon: 9.994304, time_offset_ms: 13347},
               %Video.TimedPoint{lat: 53.550621, lon: 9.99436, time_offset_ms: 13680},
               %Video.TimedPoint{lat: 53.550598, lon: 9.994402, time_offset_ms: 14014},
               %Video.TimedPoint{lat: 53.550572, lon: 9.994393, time_offset_ms: 14348}
             ],
             from: "0:00:12.918",
             source_path_rel: "bla",
             to: "0:00:14.348",
             duration_ms_uncut: "0:00:21.0688"
           } == cut
  end

  test "splits properly every x seconds" do
    tsvs =
      Video.TrimmedSource.new_from_path(File.cwd!() <> "/test/fixtures/1")
      |> Video.TrimmedSource.split_every(0.6)

    assert [
             %Video.TrimmedSource{
               coords: [
                 %Video.TimedPoint{lat: 53.460992, lon: 9.977524, time_offset_ms: 0},
                 %Video.TimedPoint{lat: 53.460977, lon: 9.977508, time_offset_ms: 334},
                 %Video.TimedPoint{
                   lat: 53.460968333333334,
                   lon: 9.977497333333334,
                   time_offset_ms: 445
                 }
               ],
               from: "0:00:00.000",
               to: "0:00:00.445"
             },
             %Video.TrimmedSource{
               coords: [
                 %Video.TimedPoint{
                   lat: 53.460968333333334,
                   lon: 9.977497333333334,
                   time_offset_ms: 445
                 },
                 %Video.TimedPoint{lat: 53.460951, lon: 9.977476, time_offset_ms: 667},
                 %Video.TimedPoint{lat: 53.460951, lon: 9.977447419161676, time_offset_ms: 889}
               ],
               from: "0:00:00.445",
               to: "0:00:00.889"
             },
             %Video.TrimmedSource{
               coords: [
                 %Video.TimedPoint{lat: 53.460951, lon: 9.977447419161676, time_offset_ms: 889},
                 %Video.TimedPoint{lat: 53.460951, lon: 9.977433, time_offset_ms: 1001},
                 %Video.TimedPoint{lat: 53.46095, lon: 9.977412, time_offset_ms: 1334}
               ],
               from: "0:00:00.889",
               to: "0:00:01.334"
             }
           ] = tsvs
  end
end
