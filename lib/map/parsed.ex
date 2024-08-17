defmodule Map.Parsed do
  @known_params [:ways, :nodes, :relations]
  @enforce_keys @known_params
  defstruct @known_params

  @type indexed_nodes :: %{optional(binary()) => Map.Node.t()}
  @type indexed_ways :: %{optional(binary()) => [Map.Way.t()]}
  @type indexed_relations :: %{optional(binary()) => Map.Relation.t()}

  @type t :: %__MODULE__{
          ways: indexed_ways(),
          relations: indexed_relations(),
          nodes: indexed_nodes()
        }
end
