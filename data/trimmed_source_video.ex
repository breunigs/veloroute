defmodule TrimmedSourceVideo do
  @known_params [
    :video_dir,
    :rel_path,
    :from,
    :to
  ]

  @enforce_keys @known_params
  defstruct @known_params

  def new_from_way(%Data.Map.Way{tags: %{video: path}, nodes: [first | tail]}, video_dir) do
    video = Path.join(video_dir, path) |> SourceVideo.new_from_path()

    trimmed =
      SourceVideo.time_range(video, first, List.last(tail))
      |> Map.take([:from, :to])
      |> Map.put(:rel_path, Path.relative_to(video.path_anonymized, video_dir))
      |> Map.put(:video_dir, video_dir)

    struct(__MODULE__, trimmed)
  end

  @doc """
  Returns the command to concatenate the given video(s) and output them to stdout.
  """
  def concat(tsv_or_tsv_list)
  def concat(%__MODULE__{} = tsv), do: concat([tsv])

  def concat(list) when is_list(list) do
    list
    |> Enum.reduce(["./tools/video_concat.rb"], fn tsv, cmd ->
      [tsv.to | [tsv.from | [abs_path(tsv) | cmd]]]
    end)
    |> Enum.reverse()
  end

  @doc """
  Returns the command needed to preview the given video(s)
  """
  def preview(tsv_or_tsv_list) do
    concat(tsv_or_tsv_list) ++
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
  def render(tsv_or_tsv_list, video_out_dir) do
    concat(tsv_or_tsv_list) ++
      ["|", "./tools/video_convert_streamable.rb", video_out_dir]
  end

  def to_str(%__MODULE__{rel_path: p, from: f, to: t}), do: "#{p} #{f} #{t}"

  def abs_path(%__MODULE__{video_dir: v, rel_path: r}), do: Path.join(v, r)

  @doc """
  Returns a hash of the given video(s) that depends on the relative path and
  where the video(s) are trimmed.
  """
  def hash(tsv_or_tsv_list)
  def hash(%__MODULE__{} = tsv), do: hash([tsv])

  def hash(list) when is_list(list) do
    list
    |> Enum.map(&to_str(&1))
    |> Enum.reduce(:crypto.hash_init(:md5), fn str, hsh ->
      :crypto.hash_update(hsh, str)
    end)
    |> :crypto.hash_final()
    |> Base.encode16(case: :lower)
  end
end
