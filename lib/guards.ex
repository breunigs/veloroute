defmodule Guards do
  defguard is_module(mod) when is_atom(mod) and not is_nil(mod)
end
