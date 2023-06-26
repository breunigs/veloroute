defmodule Video.Track do
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
    :historic
  ]

  @type plain :: [
          {
            binary(),
            Video.Timestamp.t() | :start | :seamless,
            Video.Timestamp.t() | :end
          }
        ]
  # 32*8=256
  @type hash :: <<_::256>>
  # yyyy-mm = 7 chars. 7*8 = 56
  @typep date_year_month :: <<_::56>>

  @type recording_dates :: [%{timestamp: non_neg_integer(), text: binary()}]

  @type fade :: float() | :none | nil
  defguard valid_fade(val) when val == :none or (is_float(val) and val >= 0)

  @type t :: %__MODULE__{
          from: binary(),
          to: binary(),
          via: nil | [binary()],
          group: binary(),
          direction: :forward | :backward,
          text: binary(),
          parent_ref: module() | binary(),
          videos: plain() | nil,
          renderer: pos_integer(),
          historic: %{hash() => date_year_month()} | nil
        }

  @enforce_keys @known_params -- [:via, :historic]
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
  Loads all references videos and turns them into a single stream of
  coordinates. It also calculates the hash for these.
  """
  @spec render(t()) :: {hash(), [Video.TimedPoint.t()], recording_dates()} | {:error, binary()}

  # Experimentally determined time to add between two consecutive videos to
  # ensure that there's no long term drift. Not sure why it is needed, since
  # it's necessary even though we use the video length to determine where to
  # start the next coordinates from.
  @video_concat_bump_ms 85
  def render(%__MODULE__{videos: videos, renderer: renderer} = t) when renderer <= 2 do
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

    {calc_hash(tsv_list, fade), coords, reverse_compact_recording_dates(recording_dates)}
  end

  def render(%__MODULE__{videos: videos, renderer: renderer}) when renderer in [3, 4] do
    tsvs = tsvs(videos)
    hsh = :crypto.hash_init(:md5)
    fade_in_ms = round(fade(renderer) * 1000)

    joined =
      Enum.reduce(videos, {0, [], [], hsh}, fn
        _any, {:error, reason} ->
          {:error, reason}

        {file, from, to}, acc ->
          with %Video.TrimmedSource{} = tsv <- tsvs[file],
               {:ok, segment} <- render_segment(fade_in_ms, tsv, from, to, acc) do
            segment
          else
            {:error, reason} -> {:error, reason}
            nil -> {:error, "Could not find a TrimmedSourceVideo for #{file}."}
          end

        other, _acc ->
          {:error,
           """
           Unexpected video segment definition. Expected a triple of
             {video_name, start_time, end_time}
           where
             video_name = relative path to video (may omit .MP4 file endings)
             start_time = :start or :seamless or a timestamp like hh:mm:ss.ms (e.g. 00:00:45.781)
             end_time   = :end or a timestamp
           but got
             #{inspect(other)}
           """}
      end)

    with {_dur, rev_coords, recording_dates, hsh} <- joined do
      hsh = hsh |> :crypto.hash_final() |> Base.encode16(case: :lower)
      {hsh, Enum.reverse(rev_coords), reverse_compact_recording_dates(recording_dates)}
    end
  end

  defp render_segment(fade_in_ms, tsv, from, to, {dur, rev_coords, recording_dates, hsh}) do
    {dur, rev_coords, hsh} =
      cond do
        rev_coords == [] ->
          {dur, rev_coords, hsh}

        from == :seamless ->
          # we assume that the previous :end inserted an extrapolated
          # coordinate which won't get removed since there's no fade, so
          # let's just skip it.
          {dur, tl(rev_coords), hsh}

        true ->
          {
            dur - fade_in_ms,
            Enum.drop_while(rev_coords, &(&1.time_offset_ms >= dur - fade_in_ms)),
            :crypto.hash_update(hsh, "fade #{fade_in_ms}")
          }
      end

    with %Video.TrimmedSource{} = tsv <-
           Video.TrimmedSource.extract(tsv, from, to, extrapolate_end: true),
         {:ok, meta} <- Video.Metadata.for(tsv) do
      from_ms = tsv.coord_from.time_offset_ms
      to_ms = tsv.coord_to.time_offset_ms

      rev_coords =
        Enum.reduce(tsv.coords_cut, rev_coords, fn new, rev_coords ->
          offset = round((new.time_offset_ms - from_ms) * meta.pts_correction)
          new = Map.put(new, :time_offset_ms, dur + offset)
          [new | rev_coords]
        end)

      recording_dates = [%{timestamp: dur, text: tsv_date(tsv)} | recording_dates]

      dur = dur + round((to_ms - from_ms) * meta.pts_correction)
      segment = {dur, rev_coords, recording_dates, :crypto.hash_update(hsh, tsv.hash_ident)}

      {:ok, segment}
    end
  end

  @fade_frames 8
  @spec default_fade :: float
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
    do: tsv.date |> Data.RoughDate.parse() |> Data.RoughDate.without_day()

  @spec reverse_compact_recording_dates(recording_dates()) :: recording_dates()
  defp reverse_compact_recording_dates(dates) do
    Enum.reduce(dates, [], fn
      %{timestamp: dur, text: str}, [%{timestamp: _dur2, text: str} | rest] ->
        [%{timestamp: dur, text: str} | rest]

      entry, acc ->
        [entry | acc]
    end)
  end
end
