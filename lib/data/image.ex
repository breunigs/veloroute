defmodule Data.Image do
  @type img_non_nil() :: %{
          img: Mapillary.Types.ref(),
          lat: float(),
          lon: float(),
          bearing: float(),
          seq: Mapillary.Types.ref(),
          seq_idx: non_neg_integer()
        }
  @type img() :: img_non_nil() | nil
end
