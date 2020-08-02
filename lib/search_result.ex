defmodule SearchResult do
  alias __MODULE__

  @type t() :: %SearchResult{
          name: binary(),
          lat: float(),
          lon: float(),
          relevance: float(),
          type: binary()
        }

  @enforce_keys [:name, :lat, :lon, :relevance, :type]

  defstruct @enforce_keys

  @spec sort_merge([t()], [t()]) :: [t()]
  def sort_merge(a, b) do
    Enum.sort(a ++ b, &order/2)
  end

  def zoom(%__MODULE__{type: type}) do
    case type do
      "poi" -> 18
      _ -> 16
    end
  end

  defp order(%__MODULE__{type: a, relevance: x}, %__MODULE__{type: b, relevance: x}) do
    # IO.warn("TYPE COMPARE")
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
