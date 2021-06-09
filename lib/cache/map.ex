defmodule Cache.Map do
  @external_resource Map.Parser.default_map_path()
  @data Benchmark.measure("#{__MODULE__}: loading", &Map.Parser.load_default/0)

  def nodes, do: @data.nodes
  def ways, do: @data.ways
  def relations, do: @data.relations
  def full_map, do: @data
end
