defmodule Geo.Polyline do
  @precision 6

  @doc """
  Encodes a list of `Video.TimedPoint` structs into a polyline string
  that includes lat, lon, and time_offset_ms.

  ## Examples

      iex> coords = [
      ...>   %Video.TimedPoint{lat: 53.507, lon: 10.044, time_offset_ms: 0},
      ...>   %Video.TimedPoint{lat: 53.508, lon: 10.042, time_offset_ms: 100},
      ...>   %Video.TimedPoint{lat: 53.509, lon: 10.040, time_offset_ms: 200}
      ...> ]
      iex> encoded = Geo.Polyline.encode_timed(coords)
      iex> Geo.Polyline.decode_timed(encoded)
      coords
  """
  def encode_timed(coords, precision \\ @precision) do
    Geo.Nif.nif_polyline_encode_timed(coords, precision)
  end

  def decode_timed(encoded, precision \\ @precision) do
    Geo.Nif.nif_polyline_decode_timed(encoded, precision)
  end
end
