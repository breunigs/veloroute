defmodule Joiner.Visual do
  require Logger

  def refine(segment, opts) do
    with {:ok, fade_frames} <- fade_frames(segment, opts),
         {:ok, metrics} <- Joiner.FfmpegMetrics.calculate(segment, opts),
         :ok <- Joiner.OpenAIClip.ensure_started() do
      results =
        metrics
        |> top_fades(fade_frames, Joiner.Segment.start_end?(segment), opts)
        |> tap(fn
          [] -> Logger.debug("no candidates remain in this segment")
          candidates -> Logger.debug("found #{length(candidates)} visual candidates, refining…")
        end)
        |> Enum.take(opts.visual_max_candidates)
        |> Task.async_stream(
          fn {candidate_metric_val, f1offset, f2offset} ->
            from = cut_video(segment.from, f1offset, fade_frames)
            to = cut_video(segment.to, f2offset, fade_frames)

            segment =
              segment
              |> Joiner.Segment.set_from_to(from, to)
              |> Joiner.Segment.set_metric(opts, candidate_metric_val)

            with {:ok, clip} <- Joiner.OpenAIClip.similarity(segment, fade_frames) do
              Joiner.Segment.set_metric(segment, :clip, clip)
            else
              {:error, reason} ->
                msg = "Failed to calculate CLIP similarity for"
                Logger.warning("#{msg} #{Joiner.Segment.name_full(segment)}: #{reason}")
                Joiner.Segment.set_metric(segment, :clip, 0.0)
            end
          end,
          timeout: :infinity,
          max_concurrency: 2
        )
        |> Stream.map(&elem(&1, 1))
        |> Stream.reject(fn seg ->
          seg.metrics.clip < opts.openai_clip_prune_below && !Joiner.Segment.start_end?(seg)
        end)
        |> Enum.sort_by(& &1.metrics.clip, :desc)

      top_ratio = 1.0 - opts.openai_clip_top_percent / 100.0
      min_val = with [best | _] <- results, do: best.metrics.clip * top_ratio
      results = Enum.take_while(results, &(&1.metrics.clip >= min_val))
      Logger.debug("#{length(results)} remain after refinement")

      {:ok, results}
    end
  end

  @spec cut_video(Joiner.Video.t(), non_neg_integer(), non_neg_integer()) :: Joiner.Video.t()
  defp cut_video(video, offset, fade_frames) do
    video
    |> Joiner.Video.advance_start(offset, :frames)
    |> Joiner.Video.set_duration(fade_frames, :frames)
  end

  @spec top_fades(
          list(list(float())),
          fade_frames :: pos_integer(),
          keep_start_end :: boolean(),
          opts :: Joiner.Options.t()
        ) ::
          [
            {
              metric_sum :: float(),
              video1_frame_offset :: non_neg_integer(),
              video2_frame_offset :: non_neg_integer()
            }
          ]
  defp top_fades(metrics, fade_frames, keep_start_end, opts) when is_integer(fade_frames) do
    inner_loop_length = length(hd(metrics))

    candidates =
      2..fade_frames
      |> Enum.reduce([List.flatten(metrics)], fn _, l ->
        # consecutively drop inner+1 frames, to jump forward to the next frame for
        # both video1 and video2. Results approximately a matrix where each column
        # represents a potential fade.
        [Enum.drop(hd(l), inner_loop_length + 1) | l]
      end)
      |> Enum.zip()
      |> Enum.with_index()
      |> Enum.map(fn {frame_metrics, idx} ->
        sum = Tuple.sum(frame_metrics) / opts.visual_image_height / fade_frames
        ^fade_frames = tuple_size(frame_metrics)

        v1offset = Integer.floor_div(idx, inner_loop_length)
        v2offset = Integer.mod(idx, inner_loop_length)
        {sum, v1offset, v2offset}
      end)
      |> normalize_metric()

    candidates
    |> Enum.reject(&(elem(&1, 0) < opts.visual_prune_below))
    |> Enum.sort_by(&elem(&1, 0), :desc)
    |> take_top_percent(opts)
    |> remove_overlapping_offsets(fade_frames)
    |> maybe_add_start_end(candidates, keep_start_end)
    |> Enum.map(&Tuple.delete_at(&1, 0))
  end

  defp maybe_add_start_end(filtered, [first | rest], true) do
    start_end =
      Enum.reduce(rest, first, fn {_, _, v1o, v2o} = candidate, {_, _, a1o, _} = acc ->
        if v1o > a1o && v2o == 0, do: candidate, else: acc
      end)

    [start_end | filtered] |> Enum.uniq() |> Enum.sort_by(&elem(&1, 0), :desc)
  end

  defp maybe_add_start_end(filtered, _, _), do: filtered

  # this function assumes that the first entries are the most desirable
  defp remove_overlapping_offsets(candidates, fade_frames) do
    Enum.reduce(candidates, [], fn
      {_sum, _sum_norm, v1o, v2o} = c, candidates ->
        overlap =
          Enum.any?(candidates, fn {_, _, c1o, c2o} ->
            abs(c1o - v1o) <= fade_frames && abs(c2o - v2o) <= fade_frames
          end)

        if overlap, do: candidates, else: [c | candidates]
    end)
    |> Enum.reverse()
  end

  # this function expects the list to be already sorted
  defp take_top_percent(candidates, opts) do
    top_ratio = 1.0 - opts.visual_top_percent / 100.0
    min_val = with [{_, best_norm, _, _} | _] <- candidates, do: best_norm * top_ratio

    Enum.take_while(candidates, &(elem(&1, 1) >= min_val))
  end

  defp normalize_metric([]), do: []

  defp normalize_metric(candidates) do
    {{min, _, _}, {max, _, _}} = Enum.min_max_by(candidates, &elem(&1, 0))
    diff = max - min

    candidates
    |> Enum.map(fn {sum, v1offset, v2offset} -> {sum, (sum - min) / diff, v1offset, v2offset} end)
  end

  defp fade_frames(%{from: %{meta: %{fps: fps}}, to: %{meta: %{fps: fps}}}, opts) do
    fade = round(opts.fade_duration_ms * fps / 1000.0)

    if fade < 1 do
      {:error,
       "fade duration of #{opts.fade_duration_ms}ms with #{fps} fps results in a 0 frame fade transition"}
    else
      {:ok, fade}
    end
  end

  defp fade_frames(%{from: %{meta: %{fps: fps1}}, to: %{meta: %{fps: fps2}}}, _opts) do
    {:error,
     "video with different FPS (#{fps1} vs #{fps2}) not implemented, need to port renderer hack"}
  end
end
