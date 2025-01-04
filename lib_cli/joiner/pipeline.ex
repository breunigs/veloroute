defmodule Joiner.Pipeline do
  require Logger

  def run(args, opts) do
    Joiner.UI.setup_owl()

    with {:ok, videos} <- load(args) do
      pbar = "#{__MODULE__}.run"

      Owl.ProgressBar.start(
        id: pbar,
        label: "finding joins",
        total: length(videos) - 1,
        absolute_values: true
      )

      Owl.LiveScreen.add_block(:selector, state: "")
      selector = Task.async(fn -> selector(opts) end)

      videos
      |> Enum.chunk_every(2, 1, :discard)
      |> Stream.map(&find_candidates_pair(&1, opts))
      |> inc_pbar_each(pbar)
      |> Stream.each(&Logger.debug("#{length(&1)} candidates remain for user selection"))
      |> Stream.map(&send(selector.pid, &1))
      |> Stream.run()

      send(selector.pid, :stop)
      selections = Task.await(selector, :infinity)
      start = %{ident: hd(videos).ident, start: :start}
      stop = %{ident: List.last(videos).ident, stop: :end}
      selections = [start] ++ selections ++ [stop]

      result =
        selections
        |> Enum.chunk_every(2, 2, :discard)
        |> Enum.map(fn [start, stop] ->
          {start.ident, start.start, stop.stop}
        end)
        |> make_consecutive_videos_seamless()
        |> inspect(limit: :infinity, pretty: true)
        |> Owl.Data.tag(:bright)

      Owl.LiveScreen.update(:selector, result)
      Owl.IO.puts(result)
    end

    Owl.LiveScreen.await_render()
  end

  defp make_consecutive_videos_seamless([start | rest]) do
    Enum.reduce(rest, [start], fn next, [prev | rest] ->
      {i1, _s1, e1} = prev
      {i2, s2, e2} = next

      next =
        if e1 == :end && s2 == :start && Video.Path.seamless?(i1, i2),
          do: {i2, :seamless, e2},
          else: next

      [next, prev | rest]
    end)
    |> Enum.reverse()
  end

  defp selector(opts, selections \\ []) do
    receive do
      :stop ->
        Enum.reverse(selections)

      candidates when is_list(candidates) ->
        {from, to} = select_candidate(candidates, opts)
        selections = [to, from | selections]
        selector(opts, selections)

      other ->
        Logger.error("Received unexpected message in selector thread: #{inspect(other)}")
        selector(opts, selections)
    end
  end

  @spec select_candidate([Joiner.Segment.t()], Joiner.Options.t()) :: {
          %{ident: binary(), stop: Video.Timestamp.t() | :end | :FIXME},
          %{ident: binary(), start: Video.Timestamp.t() | :start | :FIXME}
        }
  defp select_candidate(candidates, opts) do
    {thead, tbody, tfoot} =
      candidates
      |> Enum.map(&Joiner.Segment.table_data(&1))
      |> Joiner.UI.table(opts)
      |> split_table()

    title = segments_title(candidates)

    data = [
      "\n",
      Owl.Data.tag(title, :bright),
      "\n",
      [Owl.Data.tag("?", :red), ": preview (default)\n"],
      [Owl.Data.tag("m", :red), ": none of these / manually enter later\n"],
      Enum.flat_map(thead, &["   ", &1, "\n"]),
      Joiner.UI.prefix_index(tbody),
      ["   ", tfoot, "\n"]
    ]

    Owl.LiveScreen.update(:selector, data)

    val =
      try do
        video_player_title = title <> " | #{Settings.r(:sitebar_name)} Join Preview"

        Joiner.UI.input_with_preview(
          candidates,
          opts,
          video_player_title,
          opts.preview_player_custom
        )
      after
        Joiner.Preview.stop()
      end

    Owl.LiveScreen.update(:selector, "")

    [data, "you selected ", Owl.Data.tag("#{val}", :red)]
    |> Owl.Data.add_prefix("    ")
    |> Owl.Data.to_chardata()
    |> Logger.info()

    {seg, stop1, start2} =
      if val == :none do
        # Even if the candidates are not all the same video idents, provide at
        # least some readable reference
        {hd(candidates), :FIXME, :FIXME}
      else
        seg = Enum.at(candidates, val - 1)
        {seg, Joiner.Segment.stop_human(seg, :from), Joiner.Segment.start_human(seg, :to)}
      end

    {
      %{ident: seg.from.ident, stop: stop1},
      %{ident: seg.to.ident, start: start2}
    }
  end

  @spec segments_title([Joiner.Segment.t()]) :: binary()
  defp segments_title(segments) do
    segments |> Enum.map(&Joiner.Segment.name/1) |> Enum.uniq() |> Enum.join(" | ")
  end

  defp split_table(table) do
    lines = Owl.Data.lines(table)
    {thead, trest} = Enum.split(lines, 3)
    {tbody, tfoot} = Enum.split(trest, -1)
    {thead, tbody, tfoot}
  end

  @spec load([binary()]) :: {:ok, [Joiner.Video.t()]} | {:error, reason :: binary()}
  def load(videos) do
    pbar = "#{__MODULE__}.load"

    Owl.ProgressBar.start(
      id: pbar,
      label: "Loading videos",
      total: length(videos),
      absolute_values: true
    )

    videos
    |> Task.async_stream(&Joiner.Video.load/1, timeout: :infinity)
    |> inc_pbar_each(pbar)
    |> Enum.reduce({[], []}, fn
      {:ok, {:ok, video}}, {videos, errors} -> {[video | videos], errors}
      {:ok, {:error, error}}, {videos, errors} -> {videos, ["* #{error}" | errors]}
      {:exit, reason}, {videos, errors} -> {videos, ["* Exit: #{inspect(reason)}" | errors]}
    end)
    |> case do
      {videos, []} ->
        {:ok, Enum.reverse(videos)}

      {_videos, errors} ->
        errs = errors |> Enum.reverse() |> Enum.join("\n")
        {:error, "failed to load some videos:\n#{errs}"}
    end
  end

  @spec find_candidates_pair([Joiner.Video.t()], Joiner.Options.t()) ::
          [Joiner.Segment.t()]
  def find_candidates_pair([v1, v2], opts) do
    # with preloaded videos, this should not fail
    {:ok, segment} = Joiner.Segment.new(v1, v2)
    Logger.info("processing #{Joiner.Segment.name(segment)}")

    segment
    |> Joiner.GpsTracks.candidates(opts)
    |> Stream.flat_map(fn segment ->
      Logger.debug(Joiner.Segment.debug(segment, "GPS track overlap found, matching visually…"))

      with {:ok, segments} <- Joiner.Visual.refine(segment, opts) do
        segments
        |> Enum.map(&Joiner.Segment.set_speed_diff_metric/1)
        |> Enum.map(&Joiner.Segment.set_distance_metric(&1, opts))
        |> Enum.map(&Joiner.Segment.set_weighted_metric(&1, opts))
        |> Enum.sort_by(& &1.metrics.weighted, :desc)
      else
        {:error, reason} ->
          Logger.warning("failed refinement #{Joiner.Segment.name(segment)}: #{reason}")
          []
      end
    end)
    |> Stream.reject(&(&1.metrics.clip < opts.openai_clip_prune_below))
    |> Stream.take(opts.user_max_candidates)
    # we only do visual refinement for the first GpsTrack overlap segment if
    # possible. However, if the first segment didn't yield enough candidates the
    # next segment is looked at. We therefore need to sort again.
    |> Enum.sort_by(& &1.metrics.weighted, :desc)
    |> remove_overlapping_segments()
  end

  defp inc_pbar_each(stream, id) do
    Stream.each(stream, fn _v -> Owl.ProgressBar.inc(id: id) end)
  end

  # this function assumes that the first entries are the most desirable
  defp remove_overlapping_segments(segments) do
    Enum.reduce(segments, [], fn
      candidate, segments ->
        overlap = Enum.any?(segments, &Joiner.Segment.overlap?(&1, candidate))
        if overlap, do: segments, else: [candidate | segments]
    end)
    |> Enum.reverse()
  end
end
