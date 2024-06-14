defmodule Guards do
  defguard is_module(mod) when is_atom(mod) and not is_nil(mod)
  defguard valid_timestamp(str) when is_binary(str) and byte_size(str) == 12

  defguard valid_hash(str) when is_binary(str) and byte_size(str) == 32
  # initial value from Video.Rendered
  @min_vanity_id_len 5
  defguard valid_hash_or_vanity(str)
           when valid_hash(str) or byte_size(str) >= @min_vanity_id_len + 2
end
