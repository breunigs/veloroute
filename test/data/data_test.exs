defmodule Data.DataTest do
  use ExUnit.Case, async: true

  test "all images have an associated route" do
    Route.List.all()
    |> List.delete(Data.Route.Articles)
    |> Enum.flat_map(&Route.sequences/1)
    |> Enum.each(fn
      %Data.Sequence{name: {id, name}} ->
        rel = VelorouteWeb.VariousHelpers.relation_by_id(id)

        assert rel != nil, """
        The images reference a route '#{id}' (#{name}) which has no matching
        counterpart in the map. Ensure there's a relation tagged with id=#{id}
        or remove the image lists.
        """
    end)
  end
end
