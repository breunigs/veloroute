# defmodule Route do
#   @type t :: module()

#   @doc """
#   Finds the matching route to the given relation. Uses the "ref" tag.
#   """
#   @spec from_relation(Map.Relation.t()) :: module() | nil
#   def from_relation(%Map.Relation{tags: %{ref: ref}}) when is_binary(ref) and ref != "",
#     do: Module.safe_concat(["Data", "Route", ref])

#   def from_relation(_r), do: nil

#   @doc """
#   Finds the matching route where the ID matches the given one.
#   """
#   @spec from_id(binary() | nil) :: module() | nil
#   def from_id(nil), do: nil

#   def from_id(id) when is_binary(id) do
#     Enum.find(all(), fn route -> route.id() == id end)
#   end

#   @spec all() :: [t()]
#   def all() do
#     :code.all_available()
#     |> Enum.map(&elem(&1, 0))
#     |> Enum.filter(&List.starts_with?(&1, 'Elixir.Data.Route.'))
#     |> Enum.map(&List.to_atom/1)
#     |> Enum.sort()
#   end

#   @spec has_group?(t(), [binary()] | binary()) :: boolean()
#   @doc """
#   Check if the route belongs to any of the given groups
#   """
#   def has_group?(route, groups) when is_list(groups) do
#     Enum.any?(groups, &has_group?(route, &1))
#   end

#   def has_group?(route, group) do
#     route.id() == group || Enum.any?(route.tracks(), fn track -> track.group == group end)
#   end
# end
