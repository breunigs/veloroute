defmodule GPX do
  alias Data.Map.Node
  alias Data.Map.Way
  alias Data.Map.Relation

  require Logger

  def ordered_nodes(r) do
    ways = normalize_ways(r)
    first_node_index = Enum.group_by(ways, fn w -> hd(w.nodes) end)

    edges =
      Enum.flat_map(ways, fn w ->
        first_node_index[List.last(w.nodes)]
        |> Kernel.||([])
        |> Enum.map(fn
          ^w -> nil
          next -> {w, next}
        end)
        |> Enum.reject(&is_nil/1)
      end)

    g =
      Graph.new()
      |> Graph.add_vertices(ways)
      |> Graph.add_edges(edges)

    track_matrix(r, ways)
    |> Enum.map(fn {name, start, stop} ->
      nodes = Graph.Pathfinding.dijkstra(g, start, stop) |> concatenate()
      {name, nodes}
    end)
  end

  defp concatenate(ways) do
    first_node = ways |> hd |> Map.get(:nodes) |> hd
    rest = Enum.flat_map(ways, fn %Way{nodes: [_f | rest]} -> rest end)
    [first_node | rest]
  end

  defp resolve_to_start_end_ways(name, members, normalized_ways) do
    text = fn kind ->
      "#{name}: The #{kind} nodes must be part of one of the ways of the relation."
    end

    Enum.map(members, fn %{ref: node} ->
      # todo: iterate once with reduce
      as_start = Enum.find(normalized_ways, fn %Way{nodes: nodes} -> hd(nodes) == node end)
      as_end = Enum.find(normalized_ways, fn %Way{nodes: nodes} -> last(nodes) == node end)

      if is_nil(as_start), do: raise(text.("gpx_start"))
      if is_nil(as_end), do: raise(text.("gpx_end"))

      {as_start, as_end}
    end)
  end

  defp track_matrix(r, normalized_ways) do
    name = r.tags[:name]
    fw_text = r.tags[:gpx_forward] || "stadtauswärts"
    bw_text = r.tags[:gpx_backward] || "stadteinwärts"

    {start_members, end_members} =
      Enum.group_by(r.members, fn
        %{ref: %Node{}, role: "gpx_" <> role} -> role
        _ -> nil
      end)
      |> case do
        %{"start" => start_members, "end" => end_members} -> {start_members, end_members}
        %{"start" => _} -> raise "Route #{name} specifies GPX start(s), but no end(s)."
        %{"end" => _} -> raise "Route #{name} specifies GPX end(s), but no start(s)."
        _ -> {[], []}
      end

    start_ways = resolve_to_start_end_ways(name, start_members, normalized_ways)
    end_ways = resolve_to_start_end_ways(name, end_members, normalized_ways)

    Enum.flat_map(start_ways, fn {s_as_start, s_as_end} ->
      Enum.flat_map(end_ways, fn {e_as_start, e_as_end} ->
        [
          {"#{name} #{fw_text}", s_as_start, e_as_end},
          {"#{name} #{bw_text}", e_as_start, s_as_end}
        ]
      end)
    end)
  end

  defp reverse_nodes(%Way{nodes: nodes} = w) do
    Map.put(w, :nodes, Enum.reverse(nodes))
  end

  defp normalize_ways(r) do
    for %{role: r, ref: %Way{} = way} <- r.members do
      case r do
        "forward" -> way
        "backward" -> reverse_nodes(way)
        "" -> [way, reverse_nodes(way)]
      end
    end
    |> List.flatten()
  end

  defp last([]), do: raise("list is empty")
  defp last(list), do: List.last(list)
end
