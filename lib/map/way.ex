defmodule Map.Way do
  @enforce_keys [:nodes]
  defstruct [:id, :tags, :nodes, :bbox]

  @type t :: %__MODULE__{
          id: binary(),
          tags: %{optional(atom()) => binary()},
          nodes: [Map.Node.t()],
          bbox: Geo.BoundingBox.t() | nil
        }

  def style_tags, do: [:oneway, :color]

  def to_polyline(%__MODULE__{nodes: nodes}) do
    nodes |> Enum.map(&{&1.lon, &1.lat}) |> Geo.StreetPolyline.encode()
  end

  @spec reverse(t()) :: t()
  def reverse(%__MODULE__{nodes: nodes} = w), do: %{w | nodes: Enum.reverse(nodes)}

  @doc ~S"""
  Splits the way on every node that has any tag

  ## Examples

      iex> Map.Way.split_on_tagged_nodes(
      ...>   %Map.Way{id: "wid", tags: %{k: "v"}, nodes: [
      ...>     %Map.Node{id: "nid1", lat: 1, lon: 1},
      ...>     %Map.Node{id: "nid2", lat: 2, lon: 2, tags: %{key: "val"}},
      ...>     %Map.Node{id: "nid3", lat: 3, lon: 3},
      ...>   ]}
      ...> )
      [
        %Map.Way{id: "wid-split0", tags: %{k: "v"}, nodes: [
          %Map.Node{id: "nid1", lat: 1, lon: 1, tags: nil},
          %Map.Node{id: "nid2", lat: 2, lon: 2, tags: %{key: "val"}}
        ]},
        %Map.Way{id: "wid-split1", tags: %{k: "v"}, nodes: [
          %Map.Node{id: "nid2", lat: 2, lon: 2, tags: %{key: "val"}},
          %Map.Node{id: "nid3", lat: 3, lon: 3, tags: nil}
        ]}
      ]
  """
  @spec split_on_tagged_nodes(t()) :: [t()]
  def split_on_tagged_nodes(%__MODULE__{} = w) do
    w.nodes
    |> Enum.reduce([[]], fn node, [seg | rest] ->
      acc = [[node | seg] | rest]

      if is_nil(node.tags) || map_size(node.tags) == 0 do
        acc
      else
        [[node] | acc]
      end
    end)
    |> Enum.reverse()
    |> Enum.reject(fn seg -> length(seg) == 1 end)
    |> Enum.map(fn seg -> %{w | nodes: Enum.reverse(seg)} end)
    |> maybe_adjust_ids()
  end

  defp maybe_adjust_ids([w]), do: [w]

  defp maybe_adjust_ids(ways) do
    ways
    |> Enum.with_index()
    |> Enum.map(fn {w, idx} ->
      %{w | id: "#{w.id}-split#{idx}"}
    end)
  end
end
