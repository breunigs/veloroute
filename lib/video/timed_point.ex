defmodule Video.TimedPoint do
  @params [:lon, :lat, :time_offset_ms, :gpx_time, :gpx_ele]
  @enforce_keys @params -- [:gpx_time, :gpx_ele]
  defstruct @params

  @type t :: %__MODULE__{
          lat: float(),
          lon: float(),
          time_offset_ms: non_neg_integer(),
          gpx_time: NaiveDateTime.t() | nil,
          gpx_ele: float() | nil
        }

  @spec interpolate(t(), t(), float()) :: t()
  def interpolate(a, b, t) when t >= 0 and t <= 1, do: polate(a, b, t)

  @spec extrapolate(t(), t(), float()) :: t()
  def extrapolate(a, b, t) when t >= 1, do: polate(a, b, t)

  @spec polate(t(), t(), float()) :: t()
  defp polate(a, b, t) do
    lon = a.lon + (b.lon - a.lon) * t
    lat = a.lat + (b.lat - a.lat) * t
    time = a.time_offset_ms + (b.time_offset_ms - a.time_offset_ms) * t
    ele = if a.gpx_ele != nil && b.gpx_ele != nil, do: a.gpx_ele + (b.gpx_ele - a.gpx_ele) * t

    gpx_time =
      if a.gpx_time != nil && b.gpx_time != nil do
        diff = NaiveDateTime.diff(b.gpx_time, a.gpx_time, :millisecond)
        NaiveDateTime.add(a.gpx_time, round(diff * t), :millisecond)
      end

    %__MODULE__{
      lat: lat,
      lon: lon,
      time_offset_ms: round(time),
      gpx_time: gpx_time,
      gpx_ele: ele
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
    time = if coord.gpx_time, do: NaiveDateTime.to_iso8601(coord.gpx_time) <> "Z"

    """
      <node id='#{id}' lat='#{coord.lat}' lon='#{coord.lon}'>
        <tag k='gpx:video_time' v='#{Video.Timestamp.from_milliseconds(coord.time_offset_ms)}' />
        <tag k='gpx:ele' v='#{coord.gpx_ele}' />
        <tag k='gpx:time' v='#{time}' />
      </node>
    """
  end
end

defimpl Geo.Interpolate, for: Video.TimedPoint do
  def point(a, b, t), do: Video.TimedPoint.interpolate(a, b, t)
end
