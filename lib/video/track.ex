defmodule Video.Track do
  @known_params [
    :from,
    :to,
    :text,
    :parent_ref,
    :videos,
    :group,
    :direction
  ]

  @type plain :: [{binary(), Video.Timestamp.t() | :start, Video.Timestamp.t() | :end}]
  # 32*8=256
  @type hash :: <<_::256>>

  @type t :: %__MODULE__{
          from: binary(),
          to: binary(),
          group: binary(),
          direction: :forward | :backward,
          text: binary(),
          parent_ref: module() | binary(),
          videos: plain()
        }

  @enforce_keys @known_params
  defstruct @known_params

  defguard valid_hash(str) when is_binary(str) and byte_size(str) == 32

  @doc """
  Loads all references videos and turns them into a single stream of
  coordinates. It also calculates the hash for these.
  """
  @spec render(t()) :: {hash(), [Video.TimedPoint.t()]}
  def render(%__MODULE__{videos: videos}) do
    tsv_list =
      Enum.map(videos, fn {file, from, to} ->
        file |> Video.TrimmedSource.new_from_path() |> Video.TrimmedSource.extract(from, to)
      end)

    {calc_hash(tsv_list), coords(tsv_list)}
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

  # Returns a list of time offsets in milliseconds, relative to the beginning of
  # the trimmed and concatenated video and their corresponding lat/lon coordinates.
  @spec coords([Video.TrimmedSource.t()]) :: [Video.TimedPoint.t()]
  defp coords(tsv_list) when is_list(tsv_list) do
    tsv_list
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
