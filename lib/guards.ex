defmodule Guards do
  defguard is_module(mod) when is_atom(mod) and not is_nil(mod)
  defguard valid_hash(str) when is_binary(str) and byte_size(str) == 32
end
