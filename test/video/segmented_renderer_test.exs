defmodule Video.SegmentedRendererTest do
  use ExUnit.Case, async: true

  @fade_s Video.Track.default_fade()

  # -- Test modules -----------------------------------------------------------
  # Video.Segment.segments/1 only calls sources() and renderer() on its input,
  # so these don't need the full Video.Rendered behaviour.

  defmodule SingleFull do
    def renderer(), do: 7
    def sources(), do: [{"1.mp4", :start, :end, []}]
  end

  defmodule SingleTrimmed do
    def renderer(), do: 7
    def sources(), do: [{"1.mp4", "00:00:05.000", "00:00:25.000", []}]
  end

  defmodule TwoSourcesTransition do
    def renderer(), do: 7

    def sources(),
      do: [{"1.mp4", :start, :end, []}, {"2.mp4", "00:00:05.000", :end, []}]
  end

  defmodule SeamlessJoin do
    def renderer(), do: 7
    def sources(), do: [{"1.mp4", :start, :end, []}, {"2.mp4", :seamless, :end, []}]
  end

  # -- Helpers ----------------------------------------------------------------

  defp regular_segments(segments), do: Enum.filter(segments, &(&1.type == :regular))
  defp transition_segments(segments), do: Enum.filter(segments, &(&1.type == :transition))

  defp assert_contiguous(segments) do
    segments
    |> Enum.sort_by(& &1.start_s)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.each(fn [a, b] ->
      assert_in_delta a.end_s,
                      b.start_s,
                      0.001,
                      "Gap between segments at #{a.end_s} → #{b.start_s} for #{a.source}"
    end)
  end

  defp regulars_for(segments, source) do
    segments
    |> regular_segments()
    |> Enum.filter(&(&1.source == source))
    |> Enum.sort_by(& &1.start_s)
  end

  defp total_regular_duration(segments) do
    segments
    |> regular_segments()
    |> Enum.map(&(&1.end_s - &1.start_s))
    |> Enum.sum()
  end

  defp total_transition_duration(segments) do
    segments
    |> transition_segments()
    |> Enum.map(& &1.fade_s)
    |> Enum.sum()
  end

  # -- Segment Coverage Tests ------------------------------------------------

  describe "segment coverage" do
    setup do
      Video.Metadata.fake()
      :ok
    end

    test "single source full range — covers entire duration, no gaps" do
      segments = Video.Segment.segments(SingleFull)
      regulars = regulars_for(segments, "1.mp4")

      assert regulars != []
      assert_contiguous(regulars)

      first = List.first(regulars)
      last = List.last(regulars)
      assert_in_delta first.start_s, 0.0, 0.001
      assert_in_delta last.end_s, 60.0, 0.001

      assert transition_segments(segments) == []
    end

    test "single source full range — all segments are grid-aligned or boundary" do
      segments = Video.Segment.segments(SingleFull)
      regulars = regulars_for(segments, "1.mp4")

      # Middle segments should be exactly 10s and grid-aligned
      middle = Enum.slice(regulars, 1..-2//1)

      Enum.each(middle, fn seg ->
        assert_in_delta seg.end_s - seg.start_s,
                        10.0,
                        0.001,
                        "Middle segment not 10s: #{seg.start_s}→#{seg.end_s}"

        assert_in_delta rem(round(seg.start_s * 1000), 10_000),
                        0,
                        1,
                        "Middle segment not grid-aligned: #{seg.start_s}"
      end)
    end

    test "single source trimmed — covers exact trim range" do
      segments = Video.Segment.segments(SingleTrimmed)
      regulars = regulars_for(segments, "1.mp4")

      assert regulars != []
      assert_contiguous(regulars)

      first = List.first(regulars)
      last = List.last(regulars)
      assert_in_delta first.start_s, 5.0, 0.001
      assert_in_delta last.end_s, 25.0, 0.001

      assert transition_segments(segments) == []
    end

    test "two sources with transition — regular segments exclude fade zones" do
      segments = Video.Segment.segments(TwoSourcesTransition)
      fade = @fade_s

      # Source 1 (first source): no fade at start, fade at end for transition
      src1_regulars = regulars_for(segments, "1.mp4")
      assert_contiguous(src1_regulars)
      assert_in_delta List.first(src1_regulars).start_s, 0.0, 0.001
      assert_in_delta List.last(src1_regulars).end_s, 60.0 - fade, 0.01

      # Source 2 (last source): fade at start from transition, no fade at end
      src2_regulars = regulars_for(segments, "2.mp4")
      assert_contiguous(src2_regulars)
      assert_in_delta List.first(src2_regulars).start_s, 5.0 + fade, 0.01
      assert_in_delta List.last(src2_regulars).end_s, 60.0, 0.001
    end

    test "two sources with transition — exactly one transition" do
      segments = Video.Segment.segments(TwoSourcesTransition)
      transitions = transition_segments(segments)

      assert length(transitions) == 1

      [t] = transitions
      assert t.source_a == "1.mp4"
      assert t.source_b == "2.mp4"
      assert_in_delta t.end_a_s, 60.0, 0.001
      assert_in_delta t.start_b_s, 5.0, 0.001
      assert_in_delta t.fade_s, @fade_s, 0.001
    end

    test "seamless join — no transition, continuous coverage" do
      segments = Video.Segment.segments(SeamlessJoin)

      assert transition_segments(segments) == []

      src1_regulars = regulars_for(segments, "1.mp4")
      src2_regulars = regulars_for(segments, "2.mp4")

      assert_contiguous(src1_regulars)
      assert_contiguous(src2_regulars)

      # Source 1: full range (no fade at end because next is :seamless)
      assert_in_delta List.first(src1_regulars).start_s, 0.0, 0.001
      assert_in_delta List.last(src1_regulars).end_s, 60.0, 0.001

      # Source 2: full range (no fade at start because :seamless)
      assert_in_delta List.first(src2_regulars).start_s, 0.0, 0.001
      assert_in_delta List.last(src2_regulars).end_s, 60.0, 0.001
    end
  end

  # -- Duration Equivalence Tests --------------------------------------------

  describe "v6/v7 duration equivalence" do
    setup do
      Video.Metadata.fake()
      :ok
    end

    test "single source — segment durations sum to source duration" do
      segments = Video.Segment.segments(SingleFull)
      total = total_regular_duration(segments)
      assert_in_delta total, 60.0, 0.01
    end

    test "single source trimmed — segment durations sum to trim range" do
      segments = Video.Segment.segments(SingleTrimmed)
      total = total_regular_duration(segments)
      assert_in_delta total, 20.0, 0.01
    end

    test "two sources with transition — total matches v6 duration" do
      segments = Video.Segment.segments(TwoSourcesTransition)

      # v6 duration: sum of source durations minus one fade overlap
      # Source 1: 60s, Source 2: 55s (from 5s to 60s), fade: ~0.267s
      v6_duration = 60.0 + 55.0 - @fade_s

      v7_duration = total_regular_duration(segments) + total_transition_duration(segments)

      assert_in_delta v7_duration,
                      v6_duration,
                      0.01,
                      "v7 total #{v7_duration}s != v6 total #{v6_duration}s"
    end

    test "seamless join — total matches v6 duration" do
      segments = Video.Segment.segments(SeamlessJoin)

      # v6 duration: sum of both source durations (no fade for seamless)
      v6_duration = 60.0 + 60.0

      v7_duration = total_regular_duration(segments)
      assert_in_delta v7_duration, v6_duration, 0.01
    end
  end

  # -- Segment Reuse Tests ---------------------------------------------------

  describe "segment reuse across tracks" do
    setup do
      Video.Metadata.fake()
      :ok
    end

    test "shifting trim start only changes boundary segments, not middle ones" do
      segments_a = Video.Segment.segments(SingleTrimmed)

      # SingleTrimmed uses 5.0 → 25.0. Simulate a shift to 3.0 → 25.0
      # The middle 10s-aligned segments (10→20) should be identical
      middle_a =
        segments_a
        |> regular_segments()
        |> Enum.filter(fn s ->
          rem(round(s.start_s * 1000), 10_000) == 0 and
            s.end_s - s.start_s > 9.99
        end)
        |> Enum.map(&Video.Segment.basename/1)

      assert length(middle_a) >= 1,
             "Expected at least one full 10s segment in [5, 25]"

      # Same source, different start (3s instead of 5s)
      # The 10→20 segment should have the same basename
      shifted_segments =
        Video.Segment.grid_split("1.mp4", 3.0, 25.0, [])
        |> Enum.filter(fn s ->
          rem(round(s.start_s * 1000), 10_000) == 0 and
            s.end_s - s.start_s > 9.99
        end)
        |> Enum.map(&Video.Segment.basename/1)

      overlap = middle_a -- (middle_a -- shifted_segments)
      assert length(overlap) >= 1, "Expected shared segments between original and shifted trim"
    end
  end

  # -- Full Render Equivalence (Integration) ----------------------------------

  # These tests require Docker with the custom ffmpeg image and are excluded
  # from normal test runs. They generate deterministic test videos, render
  # with both v6 and v7, and compare output frame counts and PSNR.

  # Integration test modules need more callbacks since Video.Renderer.render/1
  # calls hash(), name(), renderer(), sources(), and length_ms() (via Progress).
  defmodule V6RenderExample do
    def name(), do: "v6_render_example"
    def hash(), do: "e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0"
    def length_ms(), do: 2_000
    def renderer(), do: 6
    def sources(), do: [{"2024-04-06-fr4/GX017043", "00:00:05.000", "00:00:07.000", []}]
  end

  defmodule V7RenderExample do
    def name(), do: "v7_render_example"
    def hash(), do: "f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0"
    def length_ms(), do: 2_000
    def renderer(), do: 7
    def sources(), do: [{"2024-04-06-fr4/GX017043", "00:00:05.000", "00:00:07.000", []}]
  end

  @tag :slow
  @tag timeout: :infinity
  test "v6 and v7 produce equivalent output for single source" do
    # Clean up any previous test renders
    for mod <- [V6RenderExample, V7RenderExample] do
      target = Video.Path.target(mod.hash())
      File.rm_rf(target)
    end

    # Render both versions
    assert :ok = Video.Renderer.render(V6RenderExample)
    assert :ok = Video.Renderer.render(V7RenderExample)

    v6_stream = Video.Path.stream(V6RenderExample.hash())
    v7_stream = Video.Path.stream(V7RenderExample.hash())

    assert File.exists?(v6_stream), "v6 stream.m3u8 missing"
    assert File.exists?(v7_stream), "v7 stream.m3u8 missing"

    # Compare duration via ffprobe
    v6_dur = probe_duration(v6_stream)
    v7_dur = probe_duration(v7_stream)

    assert_in_delta v6_dur, v7_dur, 0.1, "Duration mismatch: v6=#{v6_dur}s vs v7=#{v7_dur}s"

    # Compare frame count for default variant (stream_0)
    v6_frames = probe_frame_count(Video.Path.default_m3u8(V6RenderExample.hash()))
    v7_frames = probe_frame_count(Video.Path.default_m3u8(V7RenderExample.hash()))

    assert_in_delta v6_frames,
                    v7_frames,
                    1,
                    "Frame count mismatch: v6=#{v6_frames} vs v7=#{v7_frames}"

    # Compare PSNR between default variants
    psnr =
      compute_psnr(
        Video.Path.default_m3u8(V6RenderExample.hash()),
        Video.Path.default_m3u8(V7RenderExample.hash())
      )

    assert psnr > 30.0,
           "PSNR too low: #{psnr} dB (expected > 30 dB)"
  after
    for mod <- [V6RenderExample, V7RenderExample] do
      File.rm_rf(Video.Path.target(mod.hash()))
    end
  end

  # -- ffprobe/ffmpeg helpers for integration tests ---------------------------

  defp probe_duration(m3u8_path) do
    {output, 0} =
      System.cmd("ffprobe", [
        "-v",
        "error",
        "-show_entries",
        "format=duration",
        "-of",
        "default=noprint_wrappers=1:nokey=1",
        m3u8_path
      ])

    output |> String.trim() |> String.to_float()
  end

  defp probe_frame_count(m3u8_path) do
    {output, 0} =
      System.cmd("ffprobe", [
        "-v",
        "error",
        "-count_frames",
        "-select_streams",
        "v:0",
        "-show_entries",
        "stream=nb_read_frames",
        "-of",
        "default=noprint_wrappers=1:nokey=1",
        m3u8_path
      ])

    output |> String.trim() |> String.split("\n") |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end

  defp compute_psnr(m3u8_a, m3u8_b) do
    {output, 0} =
      System.cmd(
        "ffmpeg",
        [
          "-i",
          m3u8_a,
          "-i",
          m3u8_b,
          "-filter_complex",
          "[0:v][1:v]psnr",
          "-f",
          "null",
          "/dev/null"
        ],
        stderr_to_stdout: true
      )

    # Parse PSNR from ffmpeg output: "PSNR ... average:XX.XX ..."
    case Regex.run(~r/average:(\d+\.?\d*)/, output) do
      [_, psnr_str] -> String.to_float(psnr_str)
      nil -> raise "Could not parse PSNR from ffmpeg output:\n#{output}"
    end
  end
end
