defmodule Search.Behaviour do
  @callback query(binary(), Geo.BoundingBox.like()) :: [Search.Result.t()]
end
