defmodule Geo.Point do
  @params [:lon, :lat]
  @enforce_keys @params
  defstruct @params

  @type t :: %__MODULE__{lat: float(), lon: float()}
  @type like :: %{lat: float(), lon: float()}

  def from_params(%{"lon" => lon, "lat" => lat}) when is_number(lon) and is_number(lat) do
    %__MODULE__{lon: lon * 1.0, lat: lat * 1.0}
  end

  def from_params(_params), do: nil
end
