defmodule Mapillary.Types do
  # 176 = 22*8
  @type ref() :: <<_::176>>
  defguard is_ref(x) when is_binary(x) and byte_size(x) == 22
  @type img() :: %{img: ref(), lat: float(), lon: float(), bearing: float(), seq: ref()} | nil
end
