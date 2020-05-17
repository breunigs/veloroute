defmodule Data.MapCache do
  @external_resource Data.MapParser.map_path()

  data =
    Benchmark.measure("loading map relations", fn ->
      Data.MapParser.load(Data.MapParser.map_path())
    end)

  @relations data.relations
  def relations, do: @relations

  @bboxes Data.Map.article_bboxes(data)
  def bboxes, do: @bboxes

  def full_map,
    do:
      Benchmark.measure("loading full map", fn ->
        Data.MapParser.load(Data.MapParser.map_path())
      end)
end
