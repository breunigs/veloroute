defmodule Data.MapTest do
  use ExUnit.Case

  test "ways are tagged decently" do
    Data.map().ways
    |> Enum.each(fn {_id, w} ->
      isArticle = w.tags[:type] == "article"
      isTaggedWay = Enum.all?(Data.Map.Ways.grade_tags(), &Map.has_key?(w.tags, &1))

      assert isArticle || isTaggedWay, "Neither article nor quality tags: #{inspect(w)}"
    end)
  end

  test "can be converted to GeoJSON" do
    Data.map()
    |> Data.Map.to_feature_list()
    |> Jason.encode!()
  end
end
