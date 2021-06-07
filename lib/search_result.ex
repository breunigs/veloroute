defmodule SearchResult do
  alias __MODULE__

  @type t() :: %SearchResult{
          name: binary(),
          bounds: %Geo.BoundingBox{},
          relevance: float(),
          type: binary(),
          url: binary() | nil,
          subtext: binary() | nil
        }

  @enforce_keys [:name, :bounds, :relevance, :type]

  defstruct @enforce_keys ++ [:url, :subtext]

  @spec sort_merge([t()], [t()]) :: [t()]
  def sort_merge(a, b) do
    Enum.sort(a ++ b, &order/2)
  end

  defp order(%__MODULE__{type: a, relevance: x}, %__MODULE__{type: b, relevance: x}) do
    type_to_num(a) >= type_to_num(b)
  end

  defp order(%__MODULE__{relevance: x}, %__MODULE__{relevance: y}), do: x >= y

  defp type_to_num(type) do
    case type do
      "article" -> 2
      "poi" -> 1
      _ -> 0
    end
  end
end
