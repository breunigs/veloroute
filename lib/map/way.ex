defmodule Map.Way do
  @enforce_keys [:nodes]
  defstruct [:id, :tags, :nodes, :bbox]

  @type t :: %__MODULE__{}

  def style_tags, do: [:oneway, :color]

  def to_polyline(%__MODULE__{nodes: nodes}) do
    nodes |> Enum.map(&{&1.lon, &1.lat}) |> Geo.StreetPolyline.encode()
  end
end
