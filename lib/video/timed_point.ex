defmodule Video.TimedPoint do
  @params [:lon, :lat, :time_offset_ms]
  @enforce_keys @params
  defstruct @params

  @type t :: %__MODULE__{
          lat: float(),
          lon: float(),
          time_offset_ms: integer()
        }

  @spec interpolate(t(), t(), float()) :: t()
  def interpolate(a, b, t) when t >= 0 and t <= 1 do
    lon = a.lon + (b.lon - a.lon) * t
    lat = a.lat + (b.lat - a.lat) * t
    time = a.time_offset_ms + (b.time_offset_ms - a.time_offset_ms) * t

    %__MODULE__{
      lat: lat,
      lon: lon,
      time_offset_ms: round(time)
    }
  end

  @spec to_gpx_trkpt(t()) :: binary()
  def to_gpx_trkpt(coord) do
    """
      <trkpt lat="#{coord.lat}" lon="#{coord.lon}"></trkpt>
    """
  end

  @spec to_osm_node(t(), neg_integer()) :: binary()
  def to_osm_node(coord, id) do
    """
      <node id='#{id}' lat='#{coord.lat}' lon='#{coord.lon}'>
        <tag k='video_time' v='#{Video.Timestamp.from_milliseconds(coord.time_offset_ms)}' />
      </node>
    """
  end
end

defimpl Geo.Interpolate, for: Video.TimedPoint do
  def point(a, b, t), do: Video.TimedPoint.interpolate(a, b, t)
end
