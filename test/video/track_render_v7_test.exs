defmodule Video.TrackRenderV7Test do
  use ExUnit.Case, async: true

  @fps Video.Constants.output_fps()
  @fade_frames 8
  @fade_s @fade_frames / @fps

  describe "transition duration accounts for rife_transition fencepost" do
    test "transition is 9 frames (fade_frames + 1), not 8" do
      # rife_transition includes both endpoints: frame 0 = 100% clip A,
      # frame 8 = 100% clip B, giving 9 frames total
      transition_ms = round((@fade_frames + 1) / @fps * 1000)
      fade_in_ms = round(@fade_frames / @fps * 1000)

      assert transition_ms == 300
      assert fade_in_ms == 267
      assert transition_ms - fade_in_ms == 33
    end

    test "25 transitions accumulate 825ms of drift if using fade_in_ms" do
      transition_ms = round((@fade_frames + 1) / @fps * 1000)
      fade_in_ms = round(@fade_frames / @fps * 1000)

      drift_per_transition = transition_ms - fade_in_ms
      assert 25 * drift_per_transition == 825
    end
  end

  describe "frame counting uses ceil to match ffmpeg" do
    test "ceil produces more frames than round for sub-half fractional parts" do
      # ffmpeg includes all frames with PTS < end time, which corresponds to
      # ceil(duration * fps) frames
      examples = [
        {3.350, 100, 101},
        {7.123, 213, 214},
        {0.500, 15, 15}
      ]

      for {seg_dur, expected_round, expected_ceil} <- examples do
        assert round(seg_dur * @fps) == expected_round,
               "round(#{seg_dur} * #{@fps}) should be #{expected_round}"

        assert ceil(seg_dur * @fps) == expected_ceil,
               "ceil(#{seg_dur} * #{@fps}) should be #{expected_ceil}"
      end
    end

    test "10s grid segments give same result for round and ceil" do
      # 10.0 * 29.97 = 299.7 → round=300, ceil=300
      seg_dur = 10.0
      assert round(seg_dur * @fps) == ceil(seg_dur * @fps)
      assert round(seg_dur * @fps) == 300
    end

    test "ceil-based grid_split duration is longer than round-based" do
      source = "test/source"

      # Compute duration both ways for a range that creates boundary segments
      segments = Video.Segment.grid_split(source, 3.350, 47.2, [])

      dur_ceil =
        Enum.reduce(segments, 0, fn seg, acc ->
          seg_dur = seg.end_s - seg.start_s
          frames = ceil(seg_dur * @fps)
          acc + round(frames / @fps * 1000.0)
        end)

      dur_round =
        Enum.reduce(segments, 0, fn seg, acc ->
          seg_dur = seg.end_s - seg.start_s
          frames = round(seg_dur * @fps)
          acc + round(frames / @fps * 1000.0)
        end)

      # ceil should produce >= round (more frames)
      assert dur_ceil >= dur_round

      # For this specific range with boundary segments, they should differ
      assert dur_ceil > dur_round
    end
  end

  describe "effective range trimming matches segment.ex" do
    test "process_source trims by fade_s, not fade_in_ms" do
      # segment.ex uses Float.round(start_s + fade_s, 3) where
      # fade_s = default_fade() = 0.26693333...
      # NOT fade_in_ms/1000 = 267/1000 = 0.267
      fade_s = Video.Track.default_fade()

      assert fade_s != round(fade_s * 1000) / 1000
      assert_in_delta fade_s, 0.266933, 0.000001
    end

    test "trimmed range for middle clip removes fade on both sides" do
      start_s = 5.0
      end_s = 45.0

      effective_start = Float.round(start_s + @fade_s, 3)
      effective_end = Float.round(end_s - @fade_s, 3)

      # Should be trimmed by fade_s on each side
      assert effective_start > start_s
      assert effective_end < end_s
      assert_in_delta effective_end - effective_start, end_s - start_s - 2 * @fade_s, 0.001
    end

    test "first clip only trims end, last clip only trims start" do
      # This matches segment.ex process_source:
      # effective_start = if !is_first && from != :seamless, do: start + fade
      # effective_end = if next != nil && next_from != :seamless, do: end - fade

      start_s = 0.0
      end_s = 60.0

      # First clip with transition after
      first_start = Float.round(start_s, 3)
      first_end = Float.round(end_s - @fade_s, 3)
      assert first_start == 0.0
      assert first_end < 60.0

      # Last clip with transition before
      last_start = Float.round(start_s + @fade_s, 3)
      last_end = Float.round(end_s, 3)
      assert last_start > 0.0
      assert last_end == 60.0
    end

    test "segment.ex produces correctly trimmed regular segments" do
      Video.Metadata.fake()

      # Use explicit timestamps (not :end) to avoid metadata lookup for duration
      segments = Video.Segment.segments(FakeRenderedTwoClipsExplicit)
      regulars = Enum.filter(segments, &(&1.type == :regular))
      transitions = Enum.filter(segments, &(&1.type == :transition))

      # Should have exactly 1 transition
      assert length(transitions) == 1

      # First clip: regular from 0 to (50 - fade_s)
      source1 = "test/fixtures/1.MP4"
      first_regs = Enum.filter(regulars, &(&1.source == source1))
      first_start = Enum.min_by(first_regs, & &1.start_s).start_s
      first_end = Enum.max_by(first_regs, & &1.end_s).end_s

      assert_in_delta first_start, 0.0, 0.001
      assert_in_delta first_end, 50.0 - @fade_s, 0.001

      # Second clip: regular from fade_s to 45
      source2 = "test/fixtures/2.MP4"
      second_regs = Enum.filter(regulars, &(&1.source == source2))
      second_start = Enum.min_by(second_regs, & &1.start_s).start_s
      second_end = Enum.max_by(second_regs, & &1.end_s).end_s

      assert_in_delta second_start, @fade_s, 0.001
      assert_in_delta second_end, 45.0, 0.001
    end
  end

  describe "total duration correctness" do
    test "GPS duration for N clips = sum(regular) + (N-1) * transition" do
      # Mathematical proof: for 3 clips A, B, C with transitions:
      #
      # Processing A: dur = regular_A + transition_ms (for after)
      # Processing B: rollback transition_ms, add regular_B + 2*transition_ms
      #   dur = regular_A + regular_B + 2*transition_ms
      # Processing C: rollback transition_ms, add regular_C + transition_ms (for before)
      #   dur = regular_A + regular_B + regular_C + 2*transition_ms
      #
      # Which equals: sum(regular) + (N-1)*transition_ms
      transition_ms = round((@fade_frames + 1) / @fps * 1000)

      # Simulate with known values
      regulars = [10000, 20000, 15000]
      n = length(regulars)

      expected = Enum.sum(regulars) + (n - 1) * transition_ms
      assert expected == 45000 + 2 * 300
      assert expected == 45600
    end
  end
end

# Fake module for Video.Segment.segments/1 with explicit timestamps
defmodule FakeRenderedTwoClipsExplicit do
  def renderer(), do: 7

  def sources() do
    [
      {"test/fixtures/1.MP4", :start, "00:00:50.000", []},
      {"test/fixtures/2.MP4", :start, "00:00:45.000", []}
    ]
  end
end
