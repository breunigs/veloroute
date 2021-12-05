defmodule Cache.Map do
  @external_resource Map.Parser.default_map_path()
  @data Benchmark.measure("#{__MODULE__}: loading", &Map.Parser.load_default/0)

  def nodes, do: full_map().nodes
  def ways, do: full_map().ways
  def relations, do: full_map().relations
  def full_map, do: @data
end
