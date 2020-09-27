defmodule Data.Image do
  @type img_non_nil() :: %{
          img: Mapillary.ref(),
          lat: float(),
          lon: float(),
          bearing: float(),
          seq: Mapillary.ref(),
          seq_idx: non_neg_integer()
        }
  @type img() :: img_non_nil() | nil
end
