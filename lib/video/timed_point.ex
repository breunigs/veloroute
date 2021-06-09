defmodule Video.TimedPoint do
  @params [:lon, :lat, :time_offset_ms]
  @enforce_keys @params
  defstruct @params

  @type t :: %__MODULE__{
          lat: float(),
          lon: float(),
          time_offset_ms: integer()
        }

end
