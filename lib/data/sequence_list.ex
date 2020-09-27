defmodule Data.SequenceList do
  @type t() :: list(Data.Sequence.t())

  require Logger

  @typep seq_with_img() :: {Data.Sequence.t(), Data.Image.img_non_nil()}
  @spec images_around_point(t(), CheapRuler.point(), max_dist: float()) :: [seq_with_img()]
  @doc ~S"""
    Returns the closest image for each of the given sequence, provided it is within the
    maximum distance. The results are ordered by distance, closest image first.
  """
  def images_around_point(sequences, pt, max_dist: max_dist) when is_float(max_dist) do
    sequences
    |> Enum.map(fn seq -> Tuple.insert_at(Data.Sequence.closest(seq, pt), 0, seq) end)
    |> Enum.reject(fn {_seq, dist, _img} -> dist > max_dist end)
    |> Enum.sort_by(&elem(&1, 1))
    |> Enum.map(&Tuple.delete_at(&1, 1))
  end
end
