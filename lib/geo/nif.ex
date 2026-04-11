defmodule Geo.Nif do
  use Rustler, otp_app: :veloroute, crate: "geo"

  def nif_equi_time_interval_encode(_coords, _interval_in_ms, _precision),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_polyline_encode_timed(_coords, _precision),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_polyline_decode_timed(_encoded, _precision),
    do: :erlang.nif_error(:nif_not_loaded)

  # CheapRuler NIFs
  def nif_bbox(_coords),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_line_distance(_coords, _kx, _ky),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_closest_point_on_line(_line, _point_lon, _point_lat, _epsilon, _kx, _ky),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_inside_polygon_euclid(_point_lon, _point_lat, _polygon),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_max_segment_length(_coords, _max_dist, _kx, _ky),
    do: :erlang.nif_error(:nif_not_loaded)

  # Timed polyline NIFs — operate directly on encoded timed polyline strings
  def nif_timed_line_distance(_encoded, _precision, _kx, _ky),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_timed_start_end_coords(_encoded, _precision, _kx, _ky),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_timed_coord_at_time(_encoded, _precision, _time, _length_ms, _kx, _ky),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_timed_closest_point(_encoded, _precision, _point_lon, _point_lat, _epsilon, _kx, _ky),
    do: :erlang.nif_error(:nif_not_loaded)

  def nif_timed_smoother_polyline(
        _encoded,
        _precision,
        _interval_ms,
        _output_precision,
        _kx,
        _ky
      ),
      do: :erlang.nif_error(:nif_not_loaded)
end
