defmodule Map.Way do
  defstruct [:id, :tags, :nodes, :bbox]

  @type t :: %__MODULE__{}

  def style_tags, do: [:oneway, :color]
end
