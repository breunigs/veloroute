defmodule Video.Track do
  @known_params [
    :from,
    :to,
    :text,
    :parent_text,
    :videos,
    :group,
    :direction,
    :rendered_ref
  ]

  @type plain :: [{binary(), Video.Timestamp.t() | :start, Video.Timestamp.t() | :end}]

  @type t :: %__MODULE__{
          from: binary(),
          to: binary(),
          group: binary(),
          direction: :forward | :backward,
          text: binary(),
          parent_text: binary(),
          videos: plain(),
          rendered_ref: module() | nil
        }

  @enforce_keys List.delete(@known_params, :rendered_ref)
  defstruct @known_params

  @doc """
  Calculates the hash for this track and references the appropriate module for
  that. It does not ensure if the module exists or if the video was actually
  rendered.
  """
  def with_rendered_ref(%__MODULE__{rendered_ref: nil} = track) do
    tsv = Video.TrimmedSourceSequence.new_from_track(track)
    %{track | rendered_ref: Video.Rendered.module_name(tsv)}
  end

  def with_rendered_ref(%__MODULE__{} = track), do: track
end
