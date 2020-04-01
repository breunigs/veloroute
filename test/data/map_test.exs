defmodule Data.MapTest do
  use ExUnit.Case

  test "ways are tagged decently" do
    Data.map().ways
    |> Enum.each(fn {_id, w} ->
      isArticle = w.tags[:type] == "article"
      isTaggedWay = Enum.all?(Data.Map.Way.grade_tags(), &Map.has_key?(w.tags, &1))

      assert isArticle || isTaggedWay, "Neither article nor quality tags: #{inspect(w)}"
    end)
  end

  test "articles are a closed ring" do
    Data.map()
    |> Data.Map.article_ways()
    |> Enum.each(fn w ->
      first = List.first(w.nodes).id
      last = List.last(w.nodes).id
      assert first == last, "article id=#{w.id} name=#{w.tags[:name]} be a closed area"
    end)
  end

  test "can be converted to GeoJSON" do
    Data.map()
    |> Data.Map.to_feature_lists(%{})
    |> Enum.each(fn {_name, geojson} ->
      Jason.encode!(geojson)
    end)
  end
end
