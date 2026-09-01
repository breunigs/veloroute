defmodule Video.Track do
  require Logger

  @known_params [
    :from,
    :via,
    :to,
    :text,
    :parent_ref,
    :videos,
    :group,
    :direction,
    :renderer,
    :historic,
    :end_action
  ]

  @typep start :: Video.Timestamp.t() | :start | :seamless
  @typep stop :: Video.Timestamp.t() | :end
  @typep video :: {binary(), start(), stop()} | {binary(), start(), stop(), [{atom(), binary()}]}
  @type plain :: [video()]

  # 32*8=256
  @type hash :: <<_::256>>
  @type timed_info :: [%{timestamp: non_neg_integer(), text: binary()}]
  @typep historic :: %{hash() => Data.RoughDate.t()}
  @typep play_action :: %{
           action: :play,
           route: module(),
           group: binary(),
           direction: :forward | :backward
         }
  @type end_action :: :loop | :reverse | play_action()

  @type fade :: float() | :none | nil
  defguard valid_fade(val) when val == :none or (is_float(val) and val >= 0)

  @type t :: %__MODULE__{
          from: binary(),
          to: binary(),
          via: nil | [binary()],
          group: binary(),
          direction: :forward | :backward,
          text: binary(),
          parent_ref: module(),
          videos: plain(),
          renderer: pos_integer(),
          historic: historic(),
          end_action: end_action() | nil
        }

  @enforce_keys @known_params -- [:via, :historic, :end_action]
  defstruct @known_params

  @doc """
  Calculate the hash for the given video track
  """
  @spec hash(t()) :: hash()
  def hash(%__MODULE__{} = t) do
    t |> render() |> elem(0)
  end

  @doc """
  Returns a human readable name, describing the video's from/via/to
  """
  @spec name(t()) :: binary()
  def name(%__MODULE__{text: text}) when text != "", do: text

  def name(%__MODULE__{from: from, via: via, to: to}) do
    text = "von #{from} nach #{to}"
    if via == nil || via == [], do: text, else: "#{text} (via #{Enum.join(via, ", ")})"
  end

  @doc """
  Check if any of the source videos were recorded on or after the given date.
  Date format is 2020-11-23.
  """
  def newer?(%__MODULE__{videos: videos}, date) do
    want = Date.from_iso8601!(date)

    videos
    |> Enum.map(&elem(&1, 0))
    |> Enum.any?(fn <<date::binary-size(10)>> <> _rest ->
      have = Date.from_iso8601!(date)
      Date.compare(want, have) != :gt
    end)
  end

  @doc """
  Returns the most recent recording date the video is made up of
  """
  @spec recording_date_max(t()) :: Date.t()
  def recording_date_max(%__MODULE__{videos: videos}) do
    videos
    |> Enum.map(fn {<<date::binary-size(10)>> <> _rest, _start, _end} ->
      Date.from_iso8601!(date)
    end)
    |> Enum.max()
  end

  @doc """
  Return all historic videos for the given hash.
  """
  @spec historic_for(t(), hash()) :: historic()
  def historic_for(%__MODULE__{historic: hist}, hash) when is_map_key(hist, hash),
    do: Map.delete(hist, hash)

  def historic_for(%__MODULE__{}, _hash), do: %{}

  @type render_opts :: [street_names: boolean()]
  @typep render_opts_priv :: %{required(atom()) => term()}
  @default_render_opts [street_names: true]
  @spec render_opts(render_opts()) :: render_opts_priv()
  defp render_opts(opts) do
    @default_render_opts
    |> Keyword.merge(opts)
    |> Keyword.validate!(@default_render_opts)
    |> Enum.into(%{})
  end

  @doc """
  Loads all references videos and turns them into a single stream of
  coordinates. It also calculates the hash for these.
  """
  @spec render(t(), render_opts()) ::
          {
            hash(),
            [Video.TimedPoint.t()],
            recording_dates :: timed_info(),
            street_names :: timed_info()
          }
          | {:error, binary()}

  def render(track, opts \\ [])

  def render(%__MODULE__{videos: []}, _opts) do
    {:error, "track has no videos"}
  end

  # Experimentally determined time to add between two consecutive videos to
  # ensure that there's no long term drift. Not sure why it is needed, since
  # it's necessary even though we use the video length to determine where to
  # start the next coordinates from.
  @video_concat_bump_ms 85
  @fade_frames 8
  def render(%__MODULE__{videos: videos, renderer: renderer} = t, opts) when renderer <= 2 do
    opts = render_opts(opts)
    tsvs = tsvs(videos)

    tsv_list =
      Enum.map(videos, fn {file, from, to} ->
        Video.TrimmedSource.extract(tsvs[file], from, to)
      end)

    fade = fade(t)
    fade_in_ms_halfed = if fade == :none, do: 0, else: round(fade * 1000 / 2)

    {_dur, coords, recording_dates} =
      Enum.reduce(tsv_list, {0, [], []}, fn tsv, {duration_so_far, acc, recording_dates} ->
        from = tsv.coord_from.time_offset_ms
        to = tsv.coord_to.time_offset_ms - fade_in_ms_halfed

        recording_dates = [%{timestamp: duration_so_far, text: tsv_date(tsv)} | recording_dates]
        %{coords_cut: coords} = Video.TrimmedSource.extract(tsv, from, to)

        coords =
          Enum.map(
            coords,
            &Map.put(
              &1,
              :time_offset_ms,
              &1.time_offset_ms - from + duration_so_far
            )
          )

        dur = duration_so_far + (to - from)
        dur = if fade == :none, do: dur + @video_concat_bump_ms, else: dur
        {dur, acc ++ coords, recording_dates}
      end)

    hash = calc_hash(tsv_list, fade)

    {hash, coords, reverse_compact_recording_dates(recording_dates),
     compact_street_names(coords, hash, opts)}
  end

  def render(%__MODULE__{videos: videos, renderer: renderer}, opts)
      when renderer in [3, 4, 5, 6, 7] do
    opts = render_opts(opts)
    videos = normalize_video_tuples(videos)

    tsvs = tsvs(videos)
    hsh = :crypto.hash_init(:md5)
    hsh = if renderer >= 7, do: :crypto.hash_update(hsh, "renderer #{renderer}"), else: hsh
    fade_in_ms = round(fade(renderer) * 1000)

    nexts = tl(videos) ++ [nil]
    videos_with_next = Enum.zip(videos, nexts)

    joined =
      Enum.reduce(videos_with_next, {0, [], [], hsh}, fn
        _any, {:error, reason} ->
          {:error, reason}

        {{file, from, to, opts}, next}, acc ->
          next_from = if next, do: elem(next, 1)

          with %Video.TrimmedSource{} = tsv <- tsvs[file],
               {:ok, segment} <-
                 render_segment(fade_in_ms, tsv, from, to, opts, next_from, acc) do
            segment
          else
            {:error, reason} -> {:error, reason}
            nil -> {:error, "Could not find a TrimmedSourceVideo for #{file}."}
          end

        {other, _next}, _acc ->
          {:error,
           """
           Unexpected video segment definition. Expected a triple of
             {video_name, start_time, end_time}
             or a 4-tuple of
             {video_name, start_time, end_time, options}
           where
             video_name = relative path to video (may omit .MP4 file endings)
             start_time = :start or :seamless or a timestamp like hh:mm:ss.ms (e.g. 00:00:45.781)
             end_time   = :end or a timestamp
             options    = a list like [vf: "some ffmpeg complex filter"]
           but got
             #{inspect(other)}
           """}
      end)

    with {_dur, rev_coords, recording_dates, hsh} <- joined do
      hsh = hsh |> :crypto.hash_final() |> Base.encode16(case: :lower)
      coords = Enum.reverse(rev_coords)

      {hsh, coords, reverse_compact_recording_dates(recording_dates),
       compact_street_names(coords, hsh, opts)}
    end
  end

  def render(%__MODULE__{renderer: renderer} = track, _opts) do
    {:error,
     "Tried to render track with unknown renderer version: #{renderer}. Full track: #{inspect(track)}"}
  end

  @doc """
  Takes a track or a list of videos and ensures all tuples are expanded to
  include options field
  """
  @spec normalize_video_tuples(t() | plain()) :: t() | plain()
  def normalize_video_tuples(%__MODULE__{videos: videos} = mod) do
    %{mod | videos: normalize_video_tuples(videos)}
  end

  def normalize_video_tuples(videos) when is_list(videos) do
    Enum.map(videos, fn tuple ->
      case tuple_size(tuple) do
        3 ->
          Tuple.insert_at(tuple, 3, [])

        4 ->
          tuple

        other ->
          raise(
            "video segment definition has invalid tuple (length=#{other}, allowed=3,4): #{inspect(tuple)}"
          )
      end
    end)
  end

  defp render_segment(
         fade_in_ms,
         tsv,
         from,
         to,
         opts,
         next_from,
         {dur, rev_coords, recording_dates, hsh}
       ) do
    is_first = rev_coords == []
    has_transition_before = !is_first && from != :seamless
    has_transition_after = next_from != nil && next_from != :seamless

    # rife_transition produces @fade_frames + 1 frames (includes both endpoints)
    transition_ms = round((@fade_frames + 1) / Video.Constants.output_fps() * 1000)

    {dur, rev_coords, hsh} =
      cond do
        is_first ->
          {dur, rev_coords, hsh}

        from == :seamless ->
          # we assume that the previous :end inserted an extrapolated
          # coordinate which won't get removed since there's no fade, so
          # let's just skip it.
          {dur, tl(rev_coords), hsh}

        true ->
          {
            dur - transition_ms,
            Enum.drop_while(rev_coords, &(&1.time_offset_ms >= dur - transition_ms)),
            :crypto.hash_update(hsh, "fade #{fade_in_ms}")
          }
      end

    vf = Keyword.get(opts, :vf)
    hsh = if vf, do: :crypto.hash_update(hsh, "vf #{vf}"), else: hsh

    with %Video.TrimmedSource{} = tsv <-
           Video.TrimmedSource.extract(tsv, from, to, extrapolate_end: true),
         {:ok, meta} <- Video.Metadata.for(tsv) do
      from_ms = tsv.coord_from.time_offset_ms
      to_ms = tsv.coord_to.time_offset_ms
      clip_ms = to_ms - from_ms

      # Compute effective range matching segment.ex's process_source exactly:
      # use article timestamps resolved to seconds with Float.round(..., 3)
      fade_s = default_fade()
      start_s = resolve_start(from)
      end_s = resolve_end(to, tsv.source)

      effective_start_s =
        if has_transition_before,
          do: Float.round(start_s + fade_s, 3),
          else: Float.round(start_s, 3)

      effective_end_s =
        if has_transition_after,
          do: Float.round(end_s - fade_s, 3),
          else: Float.round(end_s, 3)

      regular_ms = grid_split_duration_ms(tsv.source, effective_start_s, effective_end_s, meta)

      output_ms =
        regular_ms +
          if(has_transition_before, do: transition_ms, else: 0) +
          if(has_transition_after, do: transition_ms, else: 0)

      rev_coords =
        Enum.reduce(tsv.coords_cut, rev_coords, fn new, rev_coords ->
          offset = round((new.time_offset_ms - from_ms) / clip_ms * output_ms)
          new = Map.put(new, :time_offset_ms, dur + offset)
          [new | rev_coords]
        end)

      recording_dates = [%{timestamp: dur, text: tsv_date(tsv)} | recording_dates]

      dur = dur + output_ms
      segment = {dur, rev_coords, recording_dates, :crypto.hash_update(hsh, tsv.hash_ident)}

      {:ok, segment}
    end
  end

  # Compute the actual video duration by simulating the grid-split frame counting
  # that the segmented renderer uses. Each grid segment independently rounds to a
  # whole number of frames, which makes the total video slightly longer than the
  # raw millisecond duration would suggest.
  defp grid_split_duration_ms(source, from_s, to_s, meta) do
    effective_fps =
      if meta.pts_correction == 1,
        do: meta.fps,
        else: Video.Constants.output_fps()

    Video.Segment.grid_split(source, from_s, to_s, [])
    |> Enum.reduce(0, fn seg, acc ->
      seg_dur = (seg.end_s - seg.start_s) * meta.pts_correction
      frames = ceil(seg_dur * effective_fps)
      acc + round(frames / effective_fps * 1000.0)
    end)
  end

  defp resolve_start(:start), do: 0.0
  defp resolve_start(:seamless), do: 0.0
  defp resolve_start(timestamp), do: Video.Timestamp.in_seconds(timestamp)

  defp resolve_end(:end, source) do
    {:ok, meta} = Video.Metadata.for(%{source: source})
    meta.duration
  end

  defp resolve_end(timestamp, _source), do: Video.Timestamp.in_seconds(timestamp)

  @spec default_fade :: float
  @doc """
  Returns the fade duration in seconds
  """
  def default_fade() do
    @fade_frames / Video.Constants.output_fps()
  end

  @spec fade(t() | pos_integer()) :: fade()
  @doc """
  Get fade values for hashing/rendering and for GPX trimming
  """
  def fade(%__MODULE__{renderer: v}), do: fade(v)
  def fade(1), do: :none
  def fade(2), do: @fade_frames / 29.97
  def fade(3), do: @fade_frames / 29.97
  def fade(4), do: default_fade()
  def fade(5), do: default_fade()
  def fade(6), do: default_fade()
  def fade(7), do: default_fade()

  @spec calc_hash([Video.TrimmedSource.t()], float()) :: hash()
  defp calc_hash(tsv_list, fade) when is_list(tsv_list) and valid_fade(fade) do
    hsh = :crypto.hash_init(:md5)
    hsh = if fade == :none, do: hsh, else: :crypto.hash_update(hsh, to_string(fade))

    tsv_list
    |> Enum.map(& &1.hash_ident)
    |> Enum.reduce(hsh, fn str, hsh ->
      :crypto.hash_update(hsh, str)
    end)
    |> :crypto.hash_final()
    |> Base.encode16(case: :lower)
  end

  @typep maybe_tsv :: {:error, binary()} | Video.TrimmedSource.t()
  @spec tsvs([plain()]) :: %{binary() => maybe_tsv()}
  defp tsvs(videos) do
    videos
    |> Enum.map(&elem(&1, 0))
    |> Enum.uniq()
    |> Parallel.map(fn file -> {file, Video.TrimmedSource.new_from_path(file)} end)
    |> Enum.into(%{})
  end

  defp tsv_date(tsv),
    do:
      tsv.date
      |> Data.RoughDate.parse()
      |> Data.RoughDate.without_day(Settings.r(:default_language))

  @spec reverse_compact_recording_dates(timed_info()) :: timed_info()
  defp reverse_compact_recording_dates(dates) do
    Enum.reduce(dates, [], fn
      %{timestamp: dur, text: str}, [%{timestamp: _dur2, text: str} | rest] ->
        [%{timestamp: dur, text: str} | rest]

      entry, acc ->
        [entry | acc]
    end)
  end

  @min_street_duration_ms 2000
  @max_gap_removal_duration_ms 2500
  @spec compact_street_names([Video.TimedPoint.t()], hash(), render_opts_priv()) :: timed_info()
  defp compact_street_names(_coords, _hash, %{street_names: false}), do: []

  defp compact_street_names(coords, hash, _opts) when is_list(coords) do
    map_matcher = Application.get_env(:veloroute, :map_matcher)

    with {:ok, matched} <- map_matcher.match(coords) do
      matched
      |> Enum.reduce([], fn
        coord, list when list == [] ->
          [%{timestamp: coord.time_offset_ms, text: coord.match_name}]

        %{match_name: name}, [%{text: name} | _rest] = list ->
          list

        # remove short gaps if current and previous name are the same
        coord, [%{text: ""} = gap, prev | rest]
        when coord.match_name == prev.text and
               coord.time_offset_ms - gap.timestamp < @max_gap_removal_duration_ms ->
          [prev | rest]

        # remove street names only visible for a very short duration.
        # this might create repeated names, which we'll clear out later
        coord, [prev | rest]
        when coord.time_offset_ms - prev.timestamp < @min_street_duration_ms ->
          # special case start of video: extend 2nd name to start
          ts = if prev.timestamp == 0, do: 0, else: coord.time_offset_ms
          [%{timestamp: ts, text: coord.match_name} | rest]

        coord, list ->
          [%{timestamp: coord.time_offset_ms, text: coord.match_name} | list]
      end)
      |> Enum.reduce([], fn
        # clear repeated names
        cur, [prev | rest] when cur.text == prev.text -> [cur | rest]
        cur, list -> [cur | list]
      end)
    else
      {:error, reason} ->
        Logger.error("failed to generate street names for #{hash}: #{reason}")
        []
    end
  end
end
