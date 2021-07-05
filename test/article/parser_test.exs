defmodule Article.ParserTest do
  use ExUnit.Case, async: true

  @fixtures_dir Path.join([__DIR__, "..", "fixtures"])

  @example_map %Map.Parsed{
    nodes: %{},
    relations: %{},
    ways: %{
      "1" => %Map.Way{
        nodes: [%{lat: 53, lon: 9}, %{lat: 54, lon: 10}],
        tags: %{name: "2020-03-29-dummy-article", type: "article"}
      }
    }
  }

  test "parses decently" do
    file_path = Path.join(@fixtures_dir, "2020-03-29-dummy-article.yaml")
    article_ways = Article.article_ways(@example_map)

    art =
      file_path
      |> Article.Parser.load(@fixtures_dir)
      |> Article.enrich_with_map(article_ways, %{})

    assert %Article{
             bbox: %Geo.BoundingBox{
               maxLat: 54,
               maxLon: 10,
               minLat: 53,
               minLon: 9
             },
             date: ~D[2020-03-29],
             end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
             images: 123,
             start_image: nil,
             name: "2020-03-29-dummy-article",
             start: %Data.RoughDate{month: nil, quarter: 4, year: 2019},
             tags: ["tag", "4"],
             text: "<a>text</a>",
             title: "title",
             tracks: [
               %Video.Track{
                 direction: :forward,
                 from: "",
                 group: "detour",
                 text: "blub",
                 to: "",
                 videos: [{"somefile", "0:00:13.000", "0:00:48.000"}]
               }
             ],
             full_title: "Baustelle: title",
             type: "construction"
           } == art
  end
end
