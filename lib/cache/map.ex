defmodule Cache.Map do
  require Benchmark

  @source Map.Parser.default_map_path()
  @external_resource @source
  @data Benchmark.measure("#{__MODULE__}: loading", &Map.Parser.load_default/0)

  def source, do: @source

  def nodes, do: full_map().nodes
  def ways, do: full_map().ways
  def relations, do: full_map().relations
  @spec full_map :: Map.Parsed.t()
  def full_map, do: @data

  @bbox_ways Map.Element.bbox_by_tag(@data.ways, :name)
  def way_bbox_by_name(name) when is_binary(name), do: @bbox_ways[name]

  @bbox_relations Map.Element.bbox_by_tag(@data.relations, :name)
  def relation_bbox_by_name(name) when is_binary(name), do: @bbox_relations[name]
end
