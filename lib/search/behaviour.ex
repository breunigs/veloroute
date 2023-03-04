defmodule Search.Behaviour do
  @callback query(binary(), Geo.BoundingBox.like()) :: [SearchResult.t()]
end
