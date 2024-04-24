defmodule Search.Meilisearch.NominatimTest do
  require Guards
  use ExUnit.Case, async: true

  test "merged results by wikidata number" do
    results = [
      %{
        "_rankingScore" => 0.7,
        "address" => nil,
        "bbox" => "1.1-5.3-1.2-5.4",
        "boost" => "SomeNameHere",
        "class" => "SomeClass",
        "extratags" => %{"wikidata" => "Q123456789"},
        "id" => "W1",
        "name" => %{"name" => "SomeNameHere"},
        "parents_name" => ["P1", "P2"],
        "parents_postcode" => "post2",
        "type" => "tertiary"
      },
      %{
        "_rankingScore" => 0.3,
        "address" => nil,
        "bbox" => "1.2-5.4-1.0-5.6",
        "boost" => "SomeNameHere",
        "class" => "SomeClass",
        "extratags" => %{"wikidata" => "Q123456789"},
        "id" => "W2",
        "name" => %{"name" => "SomeNameHere"},
        "parents_name" => ["P1", "P2"],
        "parents_postcode" => "post1",
        "type" => "tertiary"
      },
      %{
        "_rankingScore" => 0.0,
        "address" => nil,
        "bbox" => "1.0-5.3-1.2-5.4",
        "boost" => "SomeNameHere",
        "class" => "SomeClass",
        "extratags" => %{"wikidata" => "Q123456789"},
        "id" => "W3",
        "name" => %{"name" => "SomeNameHere"},
        "parents_name" => ["P3", "P2"],
        "parents_postcode" => "post1",
        "type" => "tertiary"
      }
    ]

    merged = [
      %{
        "_rankingScore" => 0.3333333333333333,
        "address" => nil,
        "bbox" => "1.0-5.3-1.2-5.6",
        "boost" => "SomeNameHere",
        "class" => "SomeClass",
        "extratags" => %{"wikidata" => "Q123456789"},
        "id" => "W3, W2, W1",
        "name" => %{"name" => "SomeNameHere"},
        "parents_name" => ["P2"],
        "parents_postcode" => [],
        "type" => "tertiary"
      }
    ]

    assert merged == Search.Meilisearch.Nominatim.maybe_merge(results)
  end
end
