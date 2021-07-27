defmodule Data.GeoJSONTest do
  use ExUnit.Case, async: true

  @example_map %Map.Parsed{
    nodes: %{},
    relations: %{
      "1" => %Map.Relation{
        id: "1",
        tags: %{
          ref: "Route1"
        },
        members: [
          %{role: "", ref: %Map.Way{nodes: [], id: "4", tags: %{}}},
          %{role: "", ref: %Map.Way{nodes: [], id: "5", tags: %{color: "#000000"}}}
        ]
      }
    },
    ways: %{
      "1" => %Map.Way{
        nodes: [],
        tags: %{name: "art1", type: "article"}
      },
      "2" => %Map.Way{
        nodes: [],
        tags: %{name: "art2", type: "article"}
      }
    }
  }

  @example_articles [
    %Article{name: "art1", type: "issue", title: "hi!"},
    %Article{name: "art2", type: "issue", title: "hi!", icon: "icon"}
  ]

  test "sets appropriate tags on route-ways" do
    assert %{
             routes: %{
               features: [
                 [
                   %{properties: %{color: "#7d8b2f", route_id: "1"}},
                   %{properties: %{color: "#000000", route_id: "1"}}
                 ]
               ]
             }
           } = enrich(@example_articles)
  end

  test "article uses type as fallback" do
    assert %{
             articles: %{
               features: [
                 %{properties: %{name: "art1", icon: "issue"}},
                 %{properties: %{name: "art2", icon: "icon"}}
               ]
             }
           } = enrich(@example_articles)
  end

  test "article gets correct title" do
    assert %{
             articles: %{
               features: [
                 %{properties: %{name: "art1", title: "hi!"}},
                 %{properties: %{name: "art2", title: "hi!"}}
               ]
             }
           } = enrich(@example_articles)
  end

  defp enrich(articles) do
    articles = Enum.into(articles, %{}, fn art -> {art.name, art} end)

    @example_map
    |> Map.Enrich.with_articles(articles)
    |> Data.GeoJSON.to_feature_lists()
  end
end
