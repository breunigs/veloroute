defmodule Map.Parsed do
  @known_params [:ways, :nodes, :relations]
  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{
          ways: %{optional(binary()) => Map.Way.t()},
          relations: %{optional(binary()) => Map.Relation.t()},
          nodes: %{optional(binary()) => Map.Node.t()}
        }
end
