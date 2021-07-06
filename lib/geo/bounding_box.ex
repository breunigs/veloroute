defmodule Geo.BoundingBox do
  @params [:minLon, :minLat, :maxLon, :maxLat]
  @enforce_keys @params

  @type t() :: %__MODULE__{
          minLon: number(),
          maxLon: number(),
          minLat: number(),
          maxLat: number()
        }
  @type like() ::
          %{
            minLon: number(),
            maxLon: number(),
            minLat: number(),
            maxLat: number()
          }

  defstruct @params
end
