defmodule Video.TrimmedSource do
  @known_params [
    :anonymized_path_rel,
    :source_path_rel,
    :from,
    :to,
    :coords
  ]

  @type t :: %__MODULE__{
          anonymized_path_rel: binary(),
          from: binary(),
          to: binary(),
          coords: [Video.TimedPoint.t()]
        }

  @enforce_keys @known_params
  defstruct @known_params

  @spec new_from_way(Map.Way.t(), atom()) :: t()
  def new_from_way(%Map.Way{tags: tags = %{video_forward: name}, nodes: [hd | tail]}, :forward) do
    from = Video.Timestamp.valid_or_nil(tags[:video_forward_start], tags) || hd
    to = Video.Timestamp.valid_or_nil(tags[:video_forward_end], tags) || List.last(tail)
    new(name, from, to)
  end

  def new_from_way(%Map.Way{tags: tags = %{video_backward: name}, nodes: [hd | tail]}, :backward) do
    from = Video.Timestamp.valid_or_nil(tags[:video_backward_start], tags) || List.last(tail)

    to = Video.Timestamp.valid_or_nil(tags[:video_backward_end], tags) || hd
    new(name, from, to)
  end

  @spec new(
          binary(),
          Geo.CheapRuler.point() | Video.Timestamp.t(),
          Geo.CheapRuler.point() | Video.Timestamp.t()
        ) :: t()
  def new(video_name, from, to) do
    video = Video.Source.new_from_path(video_name)
    coords = Video.Source.time_range(video, from, to)

    %__MODULE__{
      anonymized_path_rel: video.path_anonymized,
      source_path_rel: video.path_source,
      coords: coords,
      from: coords |> hd() |> Video.Timestamp.from_timed_point(),
      to: coords |> List.last() |> Video.Timestamp.from_timed_point()
    }
  end

  def to_str(%__MODULE__{anonymized_path_rel: p, from: f, to: t}), do: "#{p} #{f} #{t}"

  def abs_path(%__MODULE__{anonymized_path_rel: r}),
    do:
      Settings.video_source_dir_abs()
      |> Path.join(r)


  def abs_source_path(%__MODULE__{source_path_rel: r}),
    do:
      Settings.video_source_dir_abs()
      |> Path.join(r)
end
