defmodule Point do
  @params [:lon, :lat]
  @enforce_keys @params
  defstruct @params
end
