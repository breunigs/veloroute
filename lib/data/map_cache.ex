defmodule Data.MapCache do
  @external_resource Data.MapParser.map_path()

  data =
    Benchmark.measure("loading map relations", fn ->
      Data.MapParser.load(Data.MapParser.map_path())
    end)

  @relations data.relations
  def relations, do: @relations

  # @doc ~S"""
  # Filters the relations by the provided map of tags. Tag keys and values are strings.
  # """
  # def relations(filter_by_tags) when is_map(filter_by_tags) do
  #   filter_keys = Map.keys(filter_by_tags)

  #   Enum.reduce(@relations, %{}, fn
  #     {key, rel = %{tags: tags}}, acc ->
  #       if Map.take(tags, filter_keys) == filter_by_tags do
  #         Map.put(acc, key, rel)
  #       else
  #         acc
  #       end
  #   end)
  # end

  # tags = Map.get(rel, :tags, %{})
  #

  @bboxes Data.Map.article_bboxes(data)
  def bboxes, do: @bboxes

  def full_map,
    do:
      Benchmark.measure("loading full map", fn ->
        Data.MapParser.load(Data.MapParser.map_path())
      end)
end
