defmodule Video.SegmentTest do
  use ExUnit.Case, async: true

  doctest Video.Segment

  describe "format_timestamp/1" do
    test "exact seconds" do
      assert Video.Segment.format_timestamp(0.0) == "00_00_00"
      assert Video.Segment.format_timestamp(5.0) == "00_00_05"
      assert Video.Segment.format_timestamp(20.0) == "00_00_20"
      assert Video.Segment.format_timestamp(60.0) == "00_01_00"
      assert Video.Segment.format_timestamp(3600.0) == "01_00_00"
    end

    test "sub-second timestamps" do
      assert Video.Segment.format_timestamp(13.5) == "00_00_13.500"
      assert Video.Segment.format_timestamp(107.2) == "00_01_47.200"
      assert Video.Segment.format_timestamp(0.001) == "00_00_00.001"
      assert Video.Segment.format_timestamp(59.999) == "00_00_59.999"
    end

    test "large timestamps" do
      assert Video.Segment.format_timestamp(3661.5) == "01_01_01.500"
    end
  end

  describe "format_duration/1" do
    test "exact seconds" do
      assert Video.Segment.format_duration(10.0) == "10s"
      assert Video.Segment.format_duration(1.0) == "1s"
      assert Video.Segment.format_duration(0.0) == "0s"
    end

    test "sub-second durations" do
      assert Video.Segment.format_duration(6.5) == "6.500s"
      assert Video.Segment.format_duration(0.001) == "0.001s"
      assert Video.Segment.format_duration(10.123) == "10.123s"
    end
  end

  describe "grid_split/4" do
    @source "2024-04-06-fr4/GX017044"
    @opts []

    test "range within one 10s block" do
      result = Video.Segment.grid_split(@source, 13.5, 18.0, @opts)
      assert [%{start_s: 13.5, end_s: 18.0}] = result
    end

    test "range crossing one grid boundary" do
      result = Video.Segment.grid_split(@source, 13.5, 25.0, @opts)

      assert [
               %{start_s: 13.5, end_s: 20.0},
               %{start_s: 20.0, end_s: 25.0}
             ] = result
    end

    test "range crossing multiple grid boundaries" do
      result = Video.Segment.grid_split(@source, 13.5, 47.2, @opts)

      assert [
               %{start_s: 13.5, end_s: 20.0},
               %{start_s: 20.0, end_s: 30.0},
               %{start_s: 30.0, end_s: 40.0},
               %{start_s: 40.0, end_s: 47.2}
             ] = result
    end

    test "range starting on exact grid" do
      result = Video.Segment.grid_split(@source, 20.0, 40.0, @opts)

      assert [
               %{start_s: 20.0, end_s: 30.0},
               %{start_s: 30.0, end_s: 40.0}
             ] = result
    end

    test "range ending on exact grid" do
      result = Video.Segment.grid_split(@source, 13.5, 30.0, @opts)

      assert [
               %{start_s: 13.5, end_s: 20.0},
               %{start_s: 20.0, end_s: 30.0}
             ] = result
    end

    test "range starting at 0" do
      result = Video.Segment.grid_split(@source, 0.0, 25.0, @opts)
      assert length(result) == 3
      assert Enum.at(result, 0).start_s == 0.0
      assert Enum.at(result, 0).end_s == 10.0
      assert Enum.at(result, 1).start_s == 10.0
      assert Enum.at(result, 1).end_s == 20.0
      assert Enum.at(result, 2).start_s == 20.0
      assert Enum.at(result, 2).end_s == 25.0
    end

    test "very short range" do
      result = Video.Segment.grid_split(@source, 5.0, 8.0, @opts)
      assert [%{start_s: 5.0, end_s: 8.0}] = result
    end

    test "range shorter than 10s crossing grid" do
      result = Video.Segment.grid_split(@source, 8.0, 12.0, @opts)

      assert [
               %{start_s: 8.0, end_s: 10.0},
               %{start_s: 10.0, end_s: 12.0}
             ] = result
    end

    test "all segments have correct type, source, and opts" do
      opts = [vf: "some_filter"]
      result = Video.Segment.grid_split(@source, 13.5, 35.0, opts)

      assert Enum.all?(result, fn seg ->
               seg.type == :regular && seg.source == @source && seg.opts == opts
             end)
    end

    test "exactly 10s range on grid" do
      result = Video.Segment.grid_split(@source, 10.0, 20.0, @opts)
      assert [%{start_s: 10.0, end_s: 20.0}] = result
    end

    test "exactly 10s range off grid" do
      result = Video.Segment.grid_split(@source, 5.0, 15.0, @opts)

      assert [
               %{start_s: 5.0, end_s: 10.0},
               %{start_s: 10.0, end_s: 15.0}
             ] = result
    end
  end

  describe "basename/1" do
    test "regular segment basename" do
      seg = %{
        type: :regular,
        source: "2024-04-06-fr4/GX017044",
        start_s: 13.5,
        end_s: 20.0,
        opts: []
      }

      assert Video.Segment.basename(seg) == "2024-04-06-GX017044-00_00_13.500_6.500s"
    end

    test "regular segment on exact seconds" do
      seg = %{
        type: :regular,
        source: "2024-04-06-fr4/GX017044",
        start_s: 20.0,
        end_s: 30.0,
        opts: []
      }

      assert Video.Segment.basename(seg) == "2024-04-06-GX017044-00_00_20_10s"
    end

    test "regular segment with vf option" do
      seg = %{
        type: :regular,
        source: "2024-04-06-fr4/GX017044",
        start_s: 20.0,
        end_s: 30.0,
        opts: [vf: "hflip"]
      }

      basename = Video.Segment.basename(seg)
      assert basename =~ ~r/^2024-04-06-GX017044-00_00_20_10s_vf[0-9a-f]{8}$/
    end

    test "transition basename" do
      seg = %{
        type: :transition,
        source_a: "2024-04-06-fr4/GX017044",
        source_b: "2024-04-06-fr4/GX017046",
        end_a_s: 51.251,
        start_b_s: 5.0,
        fade_s: 0.267,
        opts_a: [],
        opts_b: []
      }

      assert Video.Segment.basename(seg) ==
               "xfade-GX017044@00_00_51.251+GX017046@00_00_05"
    end
  end
end
