defmodule Cache.Map do
  @source Map.Parser.default_map_path()
  @external_resource @source
  @data Benchmark.measure("#{__MODULE__}: loading", &Map.Parser.load_default/0)

  def source, do: @source

  def nodes, do: full_map().nodes
  def ways, do: full_map().ways
  def relations, do: full_map().relations
  @spec full_map :: Map.Parsed.t()
  def full_map, do: @data
end
