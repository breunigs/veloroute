defmodule Map.Node do
  @type t :: %__MODULE__{
          id: binary(),
          lon: float(),
          lat: float(),
          tags: %{optional(atom()) => binary()}
        }

  @enforce_keys [:lon, :lat]
  defstruct [:id, :lon, :lat, :tags]
end

defimpl Geo.Interpolate, for: Map.Node do
  def point(a, b, t) do
    %Map.Node{
      id: nil,
      lon: a.lon + (b.lon - a.lon) * t,
      lat: a.lat + (b.lat - a.lat) * t,
      tags: Map.merge(a.tags || %{}, b.tags || %{})
    }
  end
end
