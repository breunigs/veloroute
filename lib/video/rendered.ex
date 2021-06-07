defmodule Video.Rendered do
  @known_params [
    :hash,
    :coords,
    :length_ms
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{}

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
end
