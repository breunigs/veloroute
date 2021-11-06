defmodule Cache.IntegrationTest do
  use ExUnit.Case, async: true

  test "ways are tagged decently" do
    Cache.Map.ways()
    |> Enum.each(fn {_id, w} ->
      hasName = is_binary(w.tags[:name]) && w.tags[:name] != ""
      isArticle = w.tags[:type] == "article"
      isDetour = w.tags[:type] == "detour"

      if isDetour || isArticle,
        do: assert(hasName, "Neither article nor quality tags: #{inspect(w)}")
    end)
  end

  test "articles are a closed ring" do
    Cache.Map.ways()
    |> Map.Element.filter_by_tag(:type, "article")
    |> Enum.each(fn w ->
      first = List.first(w.nodes).id
      last = List.last(w.nodes).id
      assert first == last, "article id=#{w.id} name=#{w.tags[:name]} be a closed area"
    end)
  end

  test "can be converted to GeoJSON" do
    Cache.Map.full_map()
    |> Map.Enrich.with_articles(Article.List.all())
    |> Data.GeoJSON.to_feature_lists()
    |> Enum.each(fn {_name, geojson} ->
      Jason.encode!(geojson)
    end)
  end
end
