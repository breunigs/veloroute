defmodule Geo.Point do
  @params [:lon, :lat]
  @enforce_keys @params
  defstruct @params

  @type t :: %__MODULE__{lat: float(), lon: float()}
  @type like :: %{optional(atom()) => any(), lat: float(), lon: float()} | Geo.Point.t()

  def from_params(%{"lon" => lon, "lat" => lat}) when is_number(lon) and is_number(lat) do
    %__MODULE__{lon: lon * 1.0, lat: lat * 1.0}
  end

  def from_params(%{lon: lon, lat: lat}) when is_number(lon) and is_number(lat) do
    %__MODULE__{lon: lon * 1.0, lat: lat * 1.0}
  end

  def from_params(%{"lon" => lon, "lat" => lat}) when is_binary(lon) and is_binary(lat) do
    with {lon, _rest} <- Float.parse(lon),
         {lat, _rest} <- Float.parse(lat) do
      %__MODULE__{lon: lon, lat: lat}
    end
  end

  def from_params(_params), do: nil

  def osm_url(%{lon: lon, lat: lat}) do
    "https://www.openstreetmap.org/?mlat=#{lat}&mlon=#{lon}#map=19/#{lat}/#{lon}"
  end
end

defimpl Geo.Interpolate, for: Geo.Point do
  def point(%Geo.Point{lon: lon1, lat: lat1}, %Geo.Point{lon: lon2, lat: lat2}, t) do
    dx = lon2 - lon1
    dy = lat2 - lat1
    %Geo.Point{lon: lon1 + dx * t, lat: lat1 + dy * t}
  end
end
