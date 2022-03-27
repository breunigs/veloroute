defmodule Video.Track do
  @known_params [
    :from,
    :to,
    :text,
    :parent_ref,
    :videos,
    :group,
    :direction,
    :renderer
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

  @type fade :: float() | :none | nil
  defguard valid_fade(val) when val == :none or (is_float(val) and val >= 0)

  @type t :: %__MODULE__{
          from: binary(),
          to: binary(),
          group: binary(),
          direction: :forward | :backward,
          text: binary(),
          parent_ref: module() | binary(),
          videos: plain(),
          renderer: pos_integer()
        }

  @enforce_keys @known_params
  defstruct @known_params

  defguard valid_hash(str) when is_binary(str) and byte_size(str) == 32

  @doc """
  Calculate the hash for the given video track
  """
  @spec hash(t()) :: hash()
  def hash(%__MODULE__{} = t) do
    t |> render() |> elem(0)
  end

  @doc """
  Loads all references videos and turns them into a single stream of
  coordinates. It also calculates the hash for these.
  """
  @spec render(t()) :: {hash(), [Video.TimedPoint.t()]}
  def render(%__MODULE__{videos: videos, renderer: renderer} = t) when renderer <= 2 do
    tsvs = tsvs(videos)

    tsv_list =
      Parallel.map(videos, fn {file, from, to} ->
        Video.TrimmedSource.extract(tsvs[file], from, to)
      end)

    {calc_hash(tsv_list, fade(t)), coords(tsv_list, fade(t))}
  end

  def render(%__MODULE__{videos: videos, renderer: 3}) do
    tsvs = tsvs(videos)
    hsh = :crypto.hash_init(:md5)
    fade_in_ms = round(default_fade() * 1000)

    {_dur, rev_coords, hsh} =
      Enum.reduce(videos, {0, [], hsh}, fn {file, from, to}, {dur, rev_coords, hsh} ->
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

        tsv = Video.TrimmedSource.extract(tsvs[file], from, to, extrapolate_end: true)
        from_ms = tsv.coord_from.time_offset_ms
        to_ms = tsv.coord_to.time_offset_ms

        rev_coords =
          Enum.reduce(tsv.coords_cut, rev_coords, fn new, rev_coords ->
            new = Map.put(new, :time_offset_ms, new.time_offset_ms - from_ms + dur)
            [new | rev_coords]
          end)

        # unclear why half_frame_duration_ms() is needed
        dur = dur + to_ms - from_ms + half_frame_duration_ms()
        {dur, rev_coords, :crypto.hash_update(hsh, tsv.hash_ident)}
      end)

    hsh = hsh |> :crypto.hash_final() |> Base.encode16(case: :lower)
    {hsh, Enum.reverse(rev_coords)}
  end

  @spec fade(t() | pos_integer()) :: fade()
  @doc """
  Get fade values for hashing/rendering and for GPX trimming
  """
  def fade(%__MODULE__{renderer: v}), do: fade(v)
  def fade(1), do: :none
  def fade(2), do: default_fade()

  @fade_frames 8
  @spec default_fade :: float
  defp default_fade() do
    @fade_frames / Video.Source.fps()
  end

  defp half_frame_duration_ms() do
    round(1 / Video.Source.fps() * 1000 / 2)
  end

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

  # Experimentally determined time to add between two consecutive videos to
  # ensure that there's no long term drift. Not sure why it is needed, since
  # it's necessary even though we use the video length to determine where to
  # start the next coordinates from.
  @video_concat_bump_ms 85
  # Returns a list of time offsets in milliseconds, relative to the beginning of
  # the trimmed and concatenated video and their corresponding lat/lon coordinates.

  @spec coords([Video.TrimmedSource.t()], fade()) :: [Video.TimedPoint.t()]
  defp coords(tsv_list, fade) when is_list(tsv_list) and valid_fade(fade) do
    fade_in_ms_halfed = if fade == :none, do: 0, else: round(fade * 1000 / 2)

    tsv_list
    |> Enum.reduce({0, []}, fn tsv, {duration_so_far, acc} ->
      from = tsv.coord_from.time_offset_ms
      to = tsv.coord_to.time_offset_ms - fade_in_ms_halfed

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
      {dur, acc ++ coords}
    end)
    |> elem(1)
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
end
