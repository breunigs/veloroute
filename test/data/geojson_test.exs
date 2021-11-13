defmodule Data.GeoJSONTest do
  use ExUnit.Case, async: true
  use Phoenix.Component

  defmodule Article1 do
    use Article.Default
    def created_at, do: ~D[2021-11-11]
    def name, do: "art1"
    def type, do: :construction
    def title, do: "hi!"
    def tags, do: []
    def text(assigns), do: ~H""
  end

  defmodule Article2 do
    use Article.Default
    def created_at, do: ~D[2021-11-11]
    def name, do: "art2"
    def type, do: :issue
    def title, do: "hi!"
    def icon, do: :stau
    def tags, do: []
    def text(assigns), do: ~H""
  end

  @example_articles [Article1, Article2]

  @example_map %Map.Parsed{
    nodes: %{},
    relations: %{
      "1" => %Map.Relation{
        id: "1",
        tags: %{
          name: "alltagsroute-1"
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
      },
      "3" => %Map.Way{
        nodes: [],
        tags: %{name: "art2", type: "detour"}
      }
    }
  }

  test "sets appropriate tags on route-ways" do
    assert %{
             routes: %{
               features: [
                 %{
                   properties: %{
                     type: :alltag,
                     route_group: :alltag,
                     color: "#7d8b2f",
                     route_id: "1",
                     title: "Alltagsroute 1"
                   }
                 },
                 %{
                   properties: %{
                     type: :alltag,
                     route_group: :alltag,
                     color: "#000000",
                     route_id: "1",
                     title: "Alltagsroute 1"
                   }
                 },
                 %{properties: %{name: "art2", title: "hi!", type: "detour"}}
               ]
             }
           } = enrich(@example_articles)
  end

  test "article uses type as fallback" do
    assert %{
             articles: %{
               features: [
                 %{properties: %{name: "art1", icon: :construction}},
                 %{properties: %{name: "art2", icon: :stau}}
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
    @example_map
    |> Map.Enrich.with_articles(articles)
    |> Data.GeoJSON.to_feature_lists()
  end
end
