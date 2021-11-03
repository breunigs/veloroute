# defmodule ArticleTest do
#   use ExUnit.Case, async: true
#   doctest Article

#   def example_article(extra_keys \\ []) do
#     %Article{
#       date: ~D[2018-07-19],
#       end: %Data.RoughDate{month: nil, quarter: nil, year: nil},
#       name: "2018-07-19-example-article",
#       range: nil,
#       start: %Data.RoughDate{month: nil, quarter: nil, year: nil},
#       tags: ["7"],
#       text: "text_here",
#       title: "Example Article",
#       type: "issue"
#     }
#     |> Map.merge(Enum.into(extra_keys, %{}))
#   end
# end
