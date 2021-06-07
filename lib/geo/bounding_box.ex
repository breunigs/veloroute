defmodule Geo.BoundingBox do
  @params [:minLon, :minLat, :maxLon, :maxLat]
  @enforce_keys @params

  @type t() :: %__MODULE__{}

  defstruct @params
end
