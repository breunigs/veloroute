defmodule Joiner.Manual do
  @moduledoc """
  Lets the user pick a join point by hand when the automatic detection fails or
  when none of its candidates are any good.

  Two mpv players are opened, one per video, in which the user seeks to roughly
  the same spot. The region around those two timestamps is then handed to the
  regular visual refinement (`Joiner.Visual.refine/2`), so the actual join is
  still frame-accurate and gets the usual metrics and preview.
  """

  require Logger

  @doc """
  Asks the user for rough join positions and refines them. Also returns a
  segment that cuts exactly at the positions the user picked, so that selection
  can be used as-is even when the refinement is unavailable — which is the case
  for videos with differing FPS, see `Joiner.Visual.refine/2`.
  """
  @spec candidates(Joiner.Segment.t(), Joiner.Options.t()) ::
          {:ok, [Joiner.Segment.t()], Joiner.Segment.t()}
          | {:error, binary(), Joiner.Segment.t() | nil}
          | :abort
  def candidates(segment, opts) do
    case ask_timestamps(segment, opts) do
      {:ok, from_ms, to_ms} ->
        rough = rough_segment(segment, from_ms, to_ms, opts)

        case refine(segment, from_ms, to_ms, opts) do
          {:ok, candidates} -> {:ok, candidates, rough}
          {:error, reason} -> {:error, reason, rough}
        end

      :abort ->
        :abort

      {:error, reason} ->
        {:error, reason, nil}
    end
  end

  @spec ask_timestamps(Joiner.Segment.t(), Joiner.Options.t()) ::
          {:ok, non_neg_integer(), non_neg_integer()} | {:error, binary()} | :abort
  defp ask_timestamps(segment, _opts) do
    from = open_player(segment, :from, "50%x50%+0+0")
    to = open_player(segment, :to, "50%x50%+100%+0")

    try do
      Owl.LiveScreen.update(:selector, instructions(segment))

      case Joiner.UI.read_valid_input(0, %{
             "" => :ready,
             "a" => :abort,
             "abort" => :abort
           }) do
        :ready ->
          with {:ok, from_ms} <- Joiner.Mpv.time_pos_ms(from),
               {:ok, to_ms} <- Joiner.Mpv.time_pos_ms(to) do
            Logger.info(
              "picked #{Video.Timestamp.from_milliseconds(from_ms)} in #{segment.from.ident} " <>
                "and #{Video.Timestamp.from_milliseconds(to_ms)} in #{segment.to.ident}"
            )

            {:ok, from_ms, to_ms}
          end

        :abort ->
          :abort
      end
    after
      Joiner.Mpv.close(from)
      Joiner.Mpv.close(to)
      Owl.LiveScreen.update(:selector, "")
    end
  end

  # joins usually sit near the end of the first and the start of the second
  # video, so that is where the players are opened
  @seek_back_ms 5_000
  defp open_player(segment, which, geometry) do
    video = Map.fetch!(segment, which)

    start_ms =
      case which do
        :from -> max(video.start.time_offset_ms, video.stop.time_offset_ms - @seek_back_ms)
        :to -> video.start.time_offset_ms
      end

    Joiner.Mpv.open!(Joiner.Segment.video_path(segment, which),
      title: "#{video.ident} (#{which}) | #{Settings.r(:sitebar_name)} Manual Join",
      start_s: start_ms / 1000.0,
      geometry: geometry
    )
  end

  defp instructions(segment) do
    [
      "\n",
      Owl.Data.tag("manually selecting join for #{Joiner.Segment.name(segment)}", :bright),
      "\n",
      "Seek both mpv windows to roughly the same place. The exact join point is\n",
      "then determined automatically by looking around your selection.\n",
      "In mpv: space = play/pause, , and . = step a single frame, arrows = seek\n",
      [Owl.Data.tag("enter", :red), ": use the current positions of both players\n"],
      [Owl.Data.tag("a", :red), ": abort, leave this join for later\n"]
    ]
  end

  @spec refine(Joiner.Segment.t(), non_neg_integer(), non_neg_integer(), Joiner.Options.t()) ::
          {:ok, [Joiner.Segment.t()]} | {:error, binary()}
  defp refine(segment, from_ms, to_ms, opts) do
    Logger.info(
      "refining manual join #{Joiner.Segment.name(segment)} around " <>
        "#{Video.Timestamp.from_milliseconds(from_ms)} / " <>
        "#{Video.Timestamp.from_milliseconds(to_ms)}"
    )

    # The user explicitly asked for this spot, so do not second-guess it with
    # the thresholds that exist to keep the automatic search cheap.
    opts = %{opts | visual_prune_below: 0.0, dino_prune_below: 0.0, distance_prune_below: 0.0}

    with {:ok, from} <- window(segment.from, from_ms, opts),
         {:ok, to} <- window(segment.to, to_ms, opts),
         {:ok, windowed} <- Joiner.Segment.new(from, to),
         {:ok, refined} <- Joiner.Visual.refine(windowed, opts) do
      refined
      |> Enum.map(&Joiner.Segment.set_speed_diff_metric/1)
      |> Enum.map(&Joiner.Segment.set_distance_metric(&1, opts))
      |> Enum.map(&Joiner.Segment.set_weighted_metric(&1, opts))
      |> Enum.sort_by(& &1.metrics.weighted, :desc)
      |> Joiner.Segment.remove_overlapping()
      |> Enum.take(opts.user_max_candidates)
      |> case do
        [] -> {:error, "no join candidates found around the selected timestamps"}
        candidates -> {:ok, candidates}
      end
    end
  end

  @doc """
  Trims the video to the region that should be searched for a join. Returns an
  error if the remaining region is too short to fade over.
  """
  @spec window(Joiner.Video.t(), non_neg_integer(), Joiner.Options.t()) ::
          {:ok, Joiner.Video.t()} | {:error, binary()}
  def window(video, center_ms, opts) do
    if center_ms < video.start.time_offset_ms || center_ms > video.stop.time_offset_ms do
      Logger.warning(
        "selected #{Video.Timestamp.from_milliseconds(center_ms)} in #{video.ident}, which is " <>
          "outside its allowed range " <>
          "#{Video.Timestamp.from_milliseconds(video.start.time_offset_ms)}–" <>
          "#{Video.Timestamp.from_milliseconds(video.stop.time_offset_ms)}; clamping"
      )
    end

    {lo, hi} =
      window_bounds(
        video.start.time_offset_ms,
        video.stop.time_offset_ms,
        center_ms,
        opts.manual_window_ms
      )

    if hi - lo < opts.fade_duration_ms do
      {:error,
       "selected region in #{video.ident} is only #{hi - lo}ms long, " <>
         "but at least #{opts.fade_duration_ms}ms are needed for a fade"}
    else
      {:ok, trim(video, lo, hi)}
    end
  end

  @doc """
  Calculates the region to search around `center_ms`. The region is shifted
  inwards rather than just clipped, so a timestamp near a video boundary still
  gets a full width region.

      iex> Joiner.Manual.window_bounds(1_000, 10_000, 5_000, 1_500)
      {3_500, 6_500}

      iex> Joiner.Manual.window_bounds(1_000, 10_000, 1_200, 1_500)
      {1_000, 4_000}

      iex> Joiner.Manual.window_bounds(1_000, 10_000, 9_900, 1_500)
      {7_000, 10_000}

      iex> Joiner.Manual.window_bounds(0, 1_000, 500, 1_500)
      {0, 1_000}
  """
  @spec window_bounds(
          start_ms :: non_neg_integer(),
          stop_ms :: non_neg_integer(),
          center_ms :: non_neg_integer(),
          radius_ms :: pos_integer()
        ) :: {non_neg_integer(), non_neg_integer()}
  def window_bounds(start_ms, stop_ms, center_ms, radius_ms) do
    latest_lo = max(start_ms, stop_ms - 2 * radius_ms)
    lo = (center_ms - radius_ms) |> max(start_ms) |> min(latest_lo)
    {lo, min(stop_ms, lo + 2 * radius_ms)}
  end

  @doc """
  Builds the segment that cuts exactly where the user pointed, without any
  refinement. Like the refined candidates, the first video covers the fade
  leading up to the cut and the second one the fade following it.
  """
  @spec rough_segment(
          Joiner.Segment.t(),
          non_neg_integer(),
          non_neg_integer(),
          Joiner.Options.t()
        ) :: Joiner.Segment.t()
  def rough_segment(segment, from_ms, to_ms, opts) do
    fade = opts.fade_duration_ms

    # keep at least one frame on either side of the cut, so that neither window
    # ends up empty
    frame1 = Joiner.Video.frame_duration_ms(segment.from)
    frame2 = Joiner.Video.frame_duration_ms(segment.to)

    cut1 =
      clamp(
        from_ms,
        segment.from.start.time_offset_ms + frame1,
        segment.from.stop.time_offset_ms
      )

    cut2 = clamp(to_ms, segment.to.start.time_offset_ms, segment.to.stop.time_offset_ms - frame2)

    from = trim(segment.from, max(segment.from.start.time_offset_ms, cut1 - fade), cut1)
    to = trim(segment.to, cut2, min(segment.to.stop.time_offset_ms, cut2 + fade))

    {:ok, rough} = Joiner.Segment.new(from, to)
    rough
  end

  @spec trim(Joiner.Video.t(), non_neg_integer(), non_neg_integer()) :: Joiner.Video.t()
  defp trim(video, lo, hi) do
    video
    |> Joiner.Video.advance_start(lo - video.start.time_offset_ms, :milliseconds)
    |> Joiner.Video.set_duration(hi - lo, :milliseconds)
  end

  defp clamp(val, lo, hi), do: val |> max(lo) |> min(hi)
end
