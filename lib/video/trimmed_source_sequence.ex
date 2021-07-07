defmodule Video.TrimmedSourceSequence do
  @known_params [
    :name,
    :tsvs,
    :hash
  ]

  @enforce_keys @known_params
  defstruct @known_params

  # 32*8=256
  @type hash :: <<_::256>>
  @type t :: %__MODULE__{
          name: binary(),
          tsvs: [Video.TrimmedSource.t()],
          hash: hash()
        }

  defguard valid_hash(str) when is_binary(str) and byte_size(str) == 32

  @spec new_from_tsv_list([Video.TrimmedSource.t()], binary()) :: t()
  def new_from_tsv_list(tsv_list, name) when is_list(tsv_list) do
    hash = calc_hash(tsv_list)
    %__MODULE__{tsvs: tsv_list, hash: hash, name: name}
  end

  @spec new_from_track(Video.Track.t()) :: t()
  def new_from_track(track) do
    track.videos
    |> Enum.map(fn {file, from, to} ->
      file |> Video.TrimmedSource.new_from_path() |> Video.TrimmedSource.extract(from, to)
    end)
    |> new_from_tsv_list("#{track.parent_text}: #{track.text}")
  end

  @spec calc_hash([Video.TrimmedSource.t()]) :: hash()
  defp calc_hash(tsv_list) when is_list(tsv_list) do
    tsv_list
    |> Enum.map(&Video.TrimmedSource.hash_ident(&1))
    |> Enum.reduce(:crypto.hash_init(:md5), fn str, hsh ->
      :crypto.hash_update(hsh, str)
    end)
    |> :crypto.hash_final()
    |> Base.encode16(case: :lower)
  end

  @spec sources(t) :: [Video.Track.plain()]
  def sources(%__MODULE__{tsvs: tsvs}) do
    Enum.map(tsvs, &Video.TrimmedSource.source(&1))
  end

  @doc """
  Returns a list of time offsets in milliseconds, relative to the beginning of
  the trimmed and concatenated video and their corresponding lat/lon coordinates.
  """
  def coords(%__MODULE__{} = tsv_seq) do
    tsv_seq.tsvs
    |> Enum.reduce({0, []}, fn tsv, {prev_time_offset_ms, acc} ->
      %{first: %{time_offset_ms: cur_time_offset_ms}, coords: coords} =
        Video.TrimmedSource.coords(tsv)

      coords =
        Enum.map(
          coords,
          &Map.put(
            &1,
            :time_offset_ms,
            &1.time_offset_ms - cur_time_offset_ms + prev_time_offset_ms
          )
        )

      prev_time_offset_ms = List.last(coords).time_offset_ms
      {prev_time_offset_ms, acc ++ coords}
    end)
    |> elem(1)
  end
end
