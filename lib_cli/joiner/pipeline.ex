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
          {start.ident || stop.ident || :FIXME, start.start, stop.stop}
        end)
        |> make_consecutive_videos_seamless()
        |> inspect(limit: :infinity, pretty: true)
        |> Owl.Data.tag(:bright)

      Owl.LiveScreen.update(:selector, result)
      Owl.IO.puts(result)
    else
      {:error, reason} ->
        Owl.IO.puts("failed to load videos: #{reason}")
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

      [{:no_candidates, from, to}] ->
        selector(opts, [to, from | selections])

      {candidates, preview} when is_list(candidates) and length(candidates) > 0 ->
        {from, to} = select_candidate(candidates, preview, opts)
        selections = [to, from | selections]
        selector(opts, selections)

      other ->
        Logger.error("Received unexpected message in selector thread: #{inspect(other)}")
        selector(opts, selections)
    end
  end

  @spec select_candidate([Joiner.Segment.t()], Joiner.Preview.handle(), Joiner.Options.t()) :: {
          %{ident: binary(), stop: Video.Timestamp.t() | :end | :FIXME},
          %{ident: binary(), start: Video.Timestamp.t() | :start | :FIXME}
        }

  defp select_candidate(candidates, preview, opts) do
    # Logger.debug("waiting for video to render")
    Joiner.Preview.wait_until_rendered!(preview, opts)

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
          preview,
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
    videos = parse_args(videos)
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

  @doc """
  Takes a list of videos or timestamps and groups them properly

    iex> Joiner.Pipeline.parse_args(~w[foo/bar bar/baz])
    [
      {"foo/bar", :start, :end},
      {"bar/baz", :start, :end}
    ]

    iex> Joiner.Pipeline.parse_args(~w[foo/bar 3s 00:00:05.000 bar/baz start 99s])
    [
      {"foo/bar", "00:00:03.000", "00:00:05.000"},
      {"bar/baz", :start, "00:01:39.000"}
    ]

    iex> Joiner.Pipeline.parse_args(~w[])
    []

    iex> {:error, reason} = Joiner.Pipeline.parse_args(~w[foo/bar 1s 2s 3s])
    iex> String.contains?(reason, "too many")
    true
  """
  @spec parse_args([binary()]) ::
          [
            {binary(), :start | Video.Timestamp.t(), :end | Video.Timestamp.t()}
          ]
          | {:error, reason :: binary()}
  def parse_args([first | rest]) do
    Enum.reduce(rest, [[first]], fn v_or_ts, [prev | rest] ->
      case parse_ts(v_or_ts) do
        nil -> [[v_or_ts], prev | rest]
        ts -> [[ts | prev] | rest]
      end
    end)
    |> Enum.reduce_while([], fn
      [video], list ->
        {:cont, [{video, :start, :end} | list]}

      [start, video], list ->
        {:cont, [{video, start, :end} | list]}

      [stop, start, video], list ->
        {:cont, [{video, start, stop} | list]}

      other, _list ->
        {:halt, {:error, "found too many timestamps for video: #{inspect(Enum.reverse(other))}"}}
    end)
  end

  def parse_args([]), do: []

  def parse_ts("start"), do: :start
  def parse_ts("seamless"), do: :start
  def parse_ts("00:00:00.000"), do: :start
  def parse_ts("0s"), do: :start
  def parse_ts("end"), do: :end

  def parse_ts(ts) do
    if Video.Timestamp.valid?(ts) do
      ts
    else
      Video.Timestamp.from_string_duration(ts)
    end
  end

  @spec find_candidates_pair([Joiner.Video.t()], Joiner.Options.t()) ::
          [Joiner.Segment.t()] | [tuple()]
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
    |> Stream.take(opts.user_max_candidates)
    # we only do visual refinement for the first GpsTrack overlap segment if
    # possible. However, if the first segment didn't yield enough candidates the
    # next segment is looked at. We therefore need to sort again.
    |> Enum.sort_by(& &1.metrics.weighted, :desc)
    |> remove_overlapping_segments()
    |> with_preview(opts)
    |> maybe_set_fallback(segment)
  end

  defp with_preview([], _opts), do: []

  defp with_preview(candidates, opts),
    do: {candidates, Joiner.Preview.start_render!(candidates, opts)}

  defp maybe_set_fallback([], segment) do
    [
      {
        :no_candidates,
        %{ident: segment.from.ident, stop: :FIXME},
        %{ident: segment.to.ident, start: :FIXME}
      }
    ]
  end

  defp maybe_set_fallback(candidates, _seg), do: candidates

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
