defmodule Cache.Map do
  @external_resource Map.Parser.default_map_path()
  @data Map.Parser.load_default()

  def nodes, do: @data.nodes
  def ways, do: @data.ways
  def relations, do: @data.relations
  def full_map, do: @data
end
