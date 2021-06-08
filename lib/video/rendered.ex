defmodule Video.Rendered do
  @known_params [
    :hash,
    :coords,
    :length_ms
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{
          hash: binary(),
          coords: [Video.TimedPoint.t()],
          length_ms: integer()
        }

  def all_from_map(%Map.Parsed{} = map) do
    map
    |> Video.TrimmedSourceSequence.list_from_map()
    |> Enum.filter(&Video.TrimmedSourceSequence.already_rendered?/1)
    |> Enum.map(&new_from_tsv_seq/1)
    |> Enum.into(%{}, fn rendered -> {rendered.hash, rendered} end)
  end

  def new_from_tsv_seq(tsv_seq) do
    coords = Video.TrimmedSourceSequence.coords(tsv_seq)
    length_ms = coords |> List.last() |> Map.fetch!(:time_offset_ms)

    %__MODULE__{
      hash: tsv_seq.hash,
      coords: coords,
      length_ms: length_ms
    }
  end

  @spec start_time_ms_from(t(), Geo.Point.like() | nil) :: float()
  @doc """
  Find a timestamp for the video that roughly corresponds to the given point.
  If the point is not valid, it returns the start of the video.
  """
  def start_time_ms_from(rendered_video, point)
  def start_time_ms_from(%__MODULE__{}, nil), do: 0.0

  def start_time_ms_from(%__MODULE__{coords: coords}, point) do
    %{index: idx} = Geo.CheapRuler.closest_point_on_line(coords, point)

    coords
    |> Enum.at(idx)
    |> Map.get(:time_offset_ms)
  end
end
