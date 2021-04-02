defmodule Mapillary.Sequence do
  @moduledoc """
  A Mapillary.Sequence holds a reference to a sequence on Mapillary, including
  to and from image keys to denote where to cut the source sequence.
  """

  @enforce_keys [:seq, :from, :to]
  defstruct [:seq, :from, :to]
end
