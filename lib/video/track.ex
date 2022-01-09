defmodule Video.Track do
  @known_params [
    :from,
    :to,
    :text,
    :parent_ref,
    :videos,
    :group,
    :direction,
    :fade
  ]

  @type plain :: [{binary(), Video.Timestamp.t() | :start, Video.Timestamp.t() | :end}]
  # 32*8=256
  @type hash :: <<_::256>>
  @type fade :: pos_integer() | nil

  @type t :: %__MODULE__{
          from: binary(),
          to: binary(),
          group: binary(),
          direction: :forward | :backward,
          text: binary(),
          parent_ref: module() | binary(),
          videos: plain(),
          fade: fade()
        }

  @enforce_keys @known_params
  defstruct @known_params

  defguard valid_hash(str) when is_binary(str) and byte_size(str) == 32

  @fade_frames 8
  def default_fade() do
    @fade_frames / Video.Source.fps()
  end

  @doc """
  Loads all references videos and turns them into a single stream of
  coordinates. It also calculates the hash for these.
  """
  @spec render(t()) :: {hash(), [Video.TimedPoint.t()]}
  def render(%__MODULE__{videos: videos, fade: fade}) do
    tsvs =
      videos
      |> Enum.map(&elem(&1, 0))
      |> Enum.uniq()
      |> Parallel.map(fn file -> {file, Video.TrimmedSource.new_from_path(file)} end)
      |> Enum.into(%{})

    tsv_list =
      Parallel.map(videos, fn {file, from, to} ->
        Video.TrimmedSource.extract(tsvs[file], from, to)
      end)

    {calc_hash(tsv_list, fade), coords(tsv_list, fade)}
  end

  @spec calc_hash([Video.TrimmedSource.t()], fade()) :: hash()
  defp calc_hash(tsv_list, fade) when is_list(tsv_list) do
    hsh = :crypto.hash_init(:md5)
    hsh = if fade, do: :crypto.hash_update(hsh, to_string(fade)), else: hsh

    tsv_list
    |> Enum.map(&Video.TrimmedSource.hash_ident(&1))
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
  defp coords(tsv_list, fade) when is_list(tsv_list) do
    tsv_list
    |> Enum.reduce({0, []}, fn tsv, {duration_so_far, acc} ->
      from = tsv.coord_from.time_offset_ms
      to = tsv.coord_to.time_offset_ms - round(fade || 0) * 1000

      %{coords: coords} = Video.TrimmedSource.coords(tsv, from, to)

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
      dur = if fade, do: dur - fade, else: dur + @video_concat_bump_ms
      {dur, acc ++ coords}
    end)
    |> elem(1)
  end
end
