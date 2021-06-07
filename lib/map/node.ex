defmodule Map.Node do
  @type t :: %__MODULE__{
          id: binary(),
          lon: float(),
          lat: float(),
          tags: %{optional(atom()) => binary()}
        }

  defstruct [:id, :lon, :lat, :tags]
end
