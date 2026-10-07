defmodule Video.SpeedupTest do
  use ExUnit.Case, async: true
  doctest Video.Speedup

  alias Video.Constants
  alias Video.Speedup

  @out Constants.output_fps()

  describe "baseline" do
    test "a 5x recording at the output frame rate is not sped up further" do
      assert Speedup.baseline(5, @out) == 5.0
      assert Speedup.density(5 / Speedup.baseline(5, @out), @out) == 1.0
    end

    test "a 5x recording at 25fps renders at its natural rate, above the default" do
      assert_in_delta Speedup.baseline(5, 25.0), 5.994, 0.001
      assert_in_delta Speedup.density(5 / Speedup.baseline(5, 25.0), 25.0), 1.0, 1.0e-9
    end

    test "under-sped recordings are still statically sped up to the default" do
      # natural would be 1.0x (realtime) and 2.0x, i.e. barely sped up at all
      assert Speedup.baseline(1, @out) == 5.0
      assert Speedup.baseline(2, @out) == 5.0
      # and a realtime 59.94fps _stabilized file, whose natural is only 0.5x
      assert Speedup.baseline(1, 59.9401) == 5.0
    end

    test "the baseline never requires generated frames" do
      for {tl, fps} <- [{5, @out}, {5, 25.0}, {1, @out}, {2, @out}, {1, 59.9401}, {5, 59.9401}] do
        slope = tl / Speedup.baseline(tl, fps)
        assert Speedup.density(slope, fps) <= 1.0 + 1.0e-9, "tl=#{tl} fps=#{fps}"
      end
    end
  end

  describe "speedup clamps" do
    test "a standing still clip uses the baseline instead of dividing by zero" do
      assert Speedup.speedup(0.0, 5, @out) == {5.0, :baseline}
      assert Speedup.speedup(0.0, 1, @out) == {5.0, :baseline}
      assert Speedup.speedup(nil, 1, @out) == {5.0, :baseline}
    end

    test "a realtime clip at a red light is not rendered at 1x" do
      # the regression a `natural` fallback would have introduced
      {speedup, _} = Speedup.speedup(0.0, 1, @out)
      assert speedup == 5.0
    end

    test "nothing is sped up past its baseline to reach the target" do
      # 8.4 km/h would want 13.7x; apparent speed stays below the target
      {speedup, reason} = Speedup.speedup(8.4, 5, @out)
      assert reason == :baseline
      assert speedup == 5.0
      assert 8.4 * speedup < Constants.target_apparent_speed_kmh()
    end

    test "above the threshold apparent speed is pinned to the target" do
      # a narrow band: below ~20 km/h the baseline wins, above ~30 the fps floor
      for real <- [21.0, 25.0, 29.0] do
        {speedup, reason} = Speedup.speedup(real, 5, @out)
        assert reason == :target
        assert_in_delta real * speedup, Constants.target_apparent_speed_kmh(), 0.001
      end
    end

    test "the frame rate floor bounds the slowdown, at the cost of exceeding the target" do
      floor_speedup = Speedup.natural(5, 25.0) / Constants.max_interpolation_density()

      for real <- [50.0, 200.0] do
        {speedup, reason} = Speedup.speedup(real, 5, 25.0)
        assert reason == :min_fps
        assert_in_delta speedup, floor_speedup, 1.0e-9

        # exactly at the floor, and knowingly above the target
        assert_in_delta effective_fps(5 / speedup, 25.0), Constants.min_output_fps(), 1.0e-9
        assert real * speedup > Constants.target_apparent_speed_kmh()
      end
    end

    test "the frame rate never drops below the floor for any plausible speed" do
      for real <- [0.0, 1.0, 5.0, 20.0, 40.0, 80.0, 500.0],
          tl <- [1, 2, 5],
          fps <- [@out, 25.0] do
        {speedup, _} = Speedup.speedup(real, tl, fps)

        assert effective_fps(tl / speedup, fps) >= Constants.min_output_fps() - 1.0e-9,
               "real=#{real} tl=#{tl} fps=#{fps}"
      end
    end

    # the rate a slope renders at: output_fps / density. Note this can exceed the
    # output rate when the warp compresses — the filter's rate cap is what holds
    # the delivered rate down, see the filter tests below.
    defp effective_fps(slope, src_fps), do: @out / Speedup.density(slope, src_fps)
  end

  describe "filter_parts" do
    @meta_25 %Video.Metadata{duration: 100.0, fps: 25.0, time_base: 1 / 1000, time_lapse: 5}

    test "a changed source lowers the frame rate instead of interpolating" do
      warp = Speedup.testing_warp([0.0, 5.0], [0.9, 1.3])
      [filter] = Speedup.filter_parts(warp, @meta_25, 0.0, 10.0, "[blur0]")

      # the warp, then a cap that drops but never duplicates
      assert filter =~ "setpts='("
      assert filter =~ "prev_selected_t"
      assert String.ends_with?(filter, "settb=AVTB[blur0]")

      # and emphatically no frame generation
      refute filter =~ "rife"
      refute filter =~ "split"
      refute filter =~ "fps="
    end

    test "the cap is the output frame rate, so the delivered rate never exceeds it" do
      assert Speedup.rate_cap() =~ "1/(#{Video.Constants.output_fps_s()})"
    end

    test "an unchanged source still emits nothing" do
      at_output_fps = %Video.Metadata{@meta_25 | fps: @out}

      assert Speedup.filter_parts(Speedup.constant("x", 1.0), at_output_fps, 0.0, 10.0, "[b]") ==
               []
    end
  end

  describe "warp traversal" do
    test "round trips between the two timelines" do
      warp = Speedup.testing_warp([0.0, 1.0, 2.5], [0.8, 1.3, 0.9])

      for source_s <- [0.0, 0.5, 1.0, 1.7, 2.5, 4.0] do
        assert_in_delta Speedup.source_s(warp, Speedup.output_s(warp, source_s)),
                        source_s,
                        1.0e-9
      end
    end

    test "a constant warp is a plain multiplication" do
      warp = Speedup.constant("x", 0.25)
      assert Speedup.output_s(warp, 8.0) == 2.0
      assert Speedup.source_s(warp, 2.0) == 8.0
      assert Speedup.slope_at(warp, 123.0) == 0.25
      assert Speedup.max_slope(warp, 0.0, 999.0) == 0.25
    end
  end

  describe "identity?" do
    test "true only for the warp the pre-rework code would have produced" do
      at_output_fps = %Video.Metadata{
        duration: 10.0,
        fps: @out,
        time_base: 1 / 1000,
        time_lapse: 5
      }

      assert Speedup.identity?(Speedup.constant("x", 1.0), at_output_fps)
      refute Speedup.identity?(Speedup.constant("x", 0.2), at_output_fps)
      refute Speedup.identity?(Speedup.testing_warp([0.0, 1.0], [1.0, 1.0]), at_output_fps)
    end

    test "false at a different frame rate even when the slope is 1.0" do
      # this is the hole a value test against time_lapse/desired would leave:
      # same slope, different content, so it must not look like a no-op
      at_25 = %Video.Metadata{duration: 10.0, fps: 25.0, time_base: 1 / 1000, time_lapse: 5}
      refute Speedup.identity?(Speedup.constant("x", 1.0), at_25)
    end

    test "tolerates a frame rate stated as 2997/100" do
      assert Speedup.same_fps?(2997 / 100)
      assert Speedup.same_fps?(@out)
      refute Speedup.same_fps?(25.0)
      refute Speedup.same_fps?(59.9401)
    end
  end

  describe "the existing corpus must not re-render" do
    @describetag :requires_mount

    # The most important guarantee of the whole rework: a source the rework does
    # not change must emit no filter and keep its segment names byte-identical,
    # or 1965 videos re-render for nothing.
    @legacy [
      # 29.97fps @5x, the shape 1965 of 1971 sources have
      "2024-01-27-bergedorf/GX016741.MP4",
      # a derived .mkv, whose time lapse stays the assumed 5 because its GPX
      # overruns the video rather than being a whole multiple of it
      "2021-04-03-freizeitroute-5-realtime/GX011115.MP4_time_lapse.mkv"
    ]

    # these four do change, and must say so in their names
    @changed [
      # realtime 59.94fps, measured as 1x rather than the assumed 5x
      "2024-07-06-louise/GX010017_stabilized.MP4",
      # 25fps @5x, speed targeted because it postdates the cutoff
      "2026-09-10-rothe/GX018973.MP4"
    ]

    test "legacy sources emit no filter at all" do
      for ident <- @legacy do
        path = Video.Path.source(ident)
        {:ok, meta} = Video.Metadata.for(path)
        {:ok, warp} = Speedup.for(path)

        assert Speedup.identity?(warp, meta), "#{ident} should be unchanged"
        assert Speedup.filter_parts(warp, meta, 10.0, 20.0, "[blur0]") == []
      end
    end

    test "legacy segment and transition names are unsuffixed" do
      for ident <- @legacy do
        refute Video.Segment.basename(regular(ident)) =~ "_w"
        refute Video.Segment.transition_basename(transition(ident)) =~ "_w"
      end
    end

    test "changed sources are suffixed, so their stale segments are not reused" do
      for ident <- @changed do
        assert Video.Segment.basename(regular(ident)) =~ "_w"
        assert Video.Segment.transition_basename(transition(ident)) =~ "_w"
      end
    end

    defp regular(ident),
      do: %{type: :regular, source: ident, start_s: 10.0, end_s: 20.0, opts: []}

    defp transition(ident) do
      %{
        type: :transition,
        source_a: ident,
        source_b: ident,
        end_a_s: 20.0,
        start_b_s: 5.0,
        fade_s: 0.267,
        opts_a: [],
        opts_b: []
      }
    end
  end

  describe "module boundaries" do
    test "Video.Metadata does not call Video.Speedup" do
      # Video.Speedup reads metadata, never the reverse. A cycle would deadlock
      # the metadata Agent, whose :pending marker sleep-loops on re-entry.
      {:ok, {_mod, [imports: imports]}} =
        Video.Metadata |> :code.which() |> :beam_lib.chunks([:imports])

      callees = imports |> Enum.map(fn {mod, _f, _a} -> mod end) |> Enum.uniq()
      refute Video.Speedup in callees
    end
  end
end
