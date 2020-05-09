defmodule Data.DataTest do
  use ExUnit.Case, async: true

  test "all images have an associated route" do
    Data.images()
    |> Map.keys()
    |> Enum.each(fn
      :index ->
        nil

      {id, name} ->
        rel = Data.Map.find_relation_by_tag(Data.map(), :id, id)

        assert rel != nil, """
        The images reference a route '#{id}' (#{name}) which has no matching
        counterpart in the map. Ensure there's a relation tagged with id=#{id}
        or remove the image lists.
        """
    end)
  end
end
