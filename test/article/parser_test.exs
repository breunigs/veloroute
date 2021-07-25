defmodule Article.ParserTest do
  # can't be async since we're changing into the fixtures dir, which leads
  # to confusing errors like this:
  # ** (MatchError) no match of right hand side value: {:error, :enoent}
  #  (elixir 1.12.0) lib/kernel/parallel_compiler.ex:428: Kernel.ParallelCompiler.require_file/2
  use ExUnit.Case, async: false

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
    file_path = "data/articles/2020-03-29-dummy-article.yaml"
    article_ways = Article.article_ways(@example_map)

    cwd = File.cwd!()

    art =
      try do
        File.cd!(@fixtures_dir)

        file_path
        |> Article.Parser.load()
        |> Article.enrich_with_map(article_ways, %{})
      after
        File.cd!(cwd)
      end

    assert %Article{
             bbox: %Geo.BoundingBox{
               maxLat: 54,
               maxLon: 10,
               minLat: 53,
               minLon: 9
             },
             date: ~D[2020-03-29],
             end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
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
                 parent_ref: "title",
                 to: "",
                 videos: [{"somefile", "00:00:00.000", "00:00:00.123"}]
               }
             ],
             full_title: "Baustelle: title",
             type: "construction"
           } == art
  end
end
