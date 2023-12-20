defmodule Video.Rendered do
  @type polyline() :: %{polyline: binary(), interval: float(), precision: pos_integer()}

  @callback name() :: binary()
  @callback hash() :: binary()
  @callback length_ms() :: integer()
  @callback sources() :: Video.Track.plain()
  @callback coords() :: [Video.TimedPoint.t()]
  @callback polyline() :: polyline()
  @callback recording_dates() :: Video.Track.timed_info()
  @callback street_names() :: Video.Track.timed_info()
  @callback rendered?() :: boolean()
  @callback renderer() :: pos_integer()
  @callback bbox() :: Geo.BoundingBox.t()
end
