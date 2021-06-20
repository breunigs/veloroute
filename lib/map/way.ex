defmodule Map.Way do
  @enforce_keys [:nodes]
  defstruct [:id, :tags, :nodes, :bbox]

  @type t :: %__MODULE__{}

  def style_tags, do: [:oneway, :color]
end
