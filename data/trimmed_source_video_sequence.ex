defmodule TrimmedSourceVideoSequence do
  @valid_single_way_types ["detour"]

  @known_params [
    :tsvs,
    :hash
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{}

  @spec new_from_tsv_list([TrimmedSourceVideo.t()]) :: t()
  def new_from_tsv_list(tsv_list) when is_list(tsv_list) do
    hash = calc_hash(tsv_list)
    %__MODULE__{tsvs: tsv_list, hash: hash}
  end

  def new_from_way(%{tags: %{video: video_name, type: type}} = way)
      when is_binary(video_name)
      when type in @valid_single_way_types do
    tsv_seq =
      way
      |> TrimmedSourceVideo.new_from_way()
      |> List.wrap()
      |> new_from_tsv_list()

    {:ok, tsv_seq}
  end

  def new_from_way(%{tags: %{video: video_name}, id: id}) do
    {:invalid_type, "way id=#{id} refers to video=#{video_name}, but doesn't have a valid type"}
  end

  def new_from_way(%{id: id}),
    do: {:no_video, "way id=#{id} does not seem to have video associated"}

  @spec list_from_map(struct()) :: [t()]
  @doc """
  Extracts all video references from the Data.Map
  """
  def list_from_map(%Data.Map{} = map) do
    map
    |> collect_all()
    |> uniq()
  end

  @spec uniq([t()]) :: [t()]
  @doc """
  Takes a list of TSV Sequences and removes any duplicates
  """
  def uniq(list_of_tsv_seqs) when is_list(list_of_tsv_seqs) do
    Enum.uniq_by(list_of_tsv_seqs, & &1.hash)
  end

  def already_rendered?(%__MODULE__{} = tsv_seq) do
    tda = target_dir_abs(tsv_seq)
    File.dir?(tda) && File.exists?(Path.join(tda, "stream.m3u8"))
  end

  defp collect_all(%Data.Map{ways: ways, relations: _relations}) do
    collect_single_ways(ways)
  end

  defp collect_single_ways(ways) do
    ways
    |> Map.values()
    |> Enum.map(&new_from_way/1)
    |> Enum.reject(&is_nil/1)
  end

  defp calc_hash(tsv_list) when is_list(tsv_list) do
    tsv_list
    |> Enum.map(&TrimmedSourceVideo.to_str(&1))
    |> Enum.reduce(:crypto.hash_init(:md5), fn str, hsh ->
      :crypto.hash_update(hsh, str)
    end)
    |> :crypto.hash_final()
    |> Base.encode16(case: :lower)
  end

  @doc """
  Returns the command to concatenate the given video(s) and output them to stdout.
  """
  def concat(%__MODULE__{tsvs: tsvs}) do
    tsvs
    |> Enum.reduce(["./tools/video_concat.rb"], fn tsv, cmd ->
      [tsv.to | [tsv.from | [TrimmedSourceVideo.abs_path(tsv) | cmd]]]
    end)
    |> Enum.reverse()
  end

  @doc """
  Returns the command needed to preview the given video(s)
  """
  def preview(%__MODULE__{} = tsv_seq) do
    concat(tsv_seq) ++
      [
        "|",
        "mpv",
        "--pause",
        "--no-resume-playback",
        "--speed=0.5",
        "--framedrop=no",
        "--demuxer-max-bytes=500M",
        "-"
      ]
  end

  @doc """
  Returns the command needed to render the given video(s) in streamable resolutions
  """
  def render(%__MODULE__{} = tsv_seq) do
    concat(tsv_seq) ++
      ["|", "./tools/video_convert_streamable.rb", target_dir_abs(tsv_seq)]
  end

  defp target_dir_abs(%__MODULE__{hash: hash}),
    do: Path.join(Settings.video_target_dir_abs(), hash)
end
