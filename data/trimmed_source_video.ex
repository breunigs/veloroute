defmodule TrimmedSourceVideo do
  @known_params [
    :anonymized_path_rel,
    :from,
    :to
  ]

  @type t :: %__MODULE__{}

  @enforce_keys @known_params
  defstruct @known_params

  def new_from_way(%Data.Map.Way{tags: %{video: video_name}, nodes: [first | tail]}) do
    video = SourceVideo.new_from_path(video_name)

    trimmed =
      video
      |> SourceVideo.time_range(first, List.last(tail))
      |> Map.put(:anonymized_path_rel, video.path_anonymized)

    struct(__MODULE__, trimmed)
  end

  def to_str(%__MODULE__{anonymized_path_rel: p, from: f, to: t}), do: "#{p} #{f} #{t}"

  def abs_path(%__MODULE__{anonymized_path_rel: r}),
    do:
      Settings.video_target_dir_abs()
      |> Path.join(r)
end
