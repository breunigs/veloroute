defmodule Data.MapTest do
  use ExUnit.Case, async: true

  @map Data.MapCache.full_map()

  test "ways are tagged decently" do
    @map.ways
    |> Enum.each(fn {_id, w} ->
      isArticle = w.tags[:type] == "article"
      isTaggedWay = Enum.all?(Data.Map.Way.grade_tags(), &Map.has_key?(w.tags, &1))

      assert isArticle || isTaggedWay, "Neither article nor quality tags: #{inspect(w)}"
    end)
  end

  test "articles are a closed ring" do
    @map
    |> Data.Map.article_ways()
    |> Enum.each(fn w ->
      first = List.first(w.nodes).id
      last = List.last(w.nodes).id
      assert first == last, "article id=#{w.id} name=#{w.tags[:name]} be a closed area"
    end)
  end

  test "can be converted to GeoJSON" do
    @map
    |> Data.Map.to_feature_lists(Data.ArticleCache.get())
    |> Enum.each(fn {_name, geojson} ->
      Jason.encode!(geojson)
    end)
  end

  test "uses type as icon fallback" do
    name = "somename"
    no_icon_article = %Data.Article{name: name, type: "issue"}
    with_icon_article = %Data.Article{no_icon_article | icon: "icon"}
    way = %Data.Map.Way{tags: %{name: name}, nodes: []}

    assert %{properties: %{icon: "icon"}} =
             Data.Map.Way.as_article(way, %{name => with_icon_article})

    assert %{properties: %{icon: "issue"}} =
             Data.Map.Way.as_article(way, %{name => no_icon_article})
  end
end
