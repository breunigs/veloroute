defmodule TrackFinder do
  @moduledoc """
  TrackFinder takes a raw relation and tries to find shortest path trips (called a
  track) within that relation.
  """
  alias Data.Map.Node
  alias Data.Map.Way

  @doc """
  ordered takes a Data.Map.Relation and finds the shortest connections between
  start and end, along the ways and their oneway/role restrictions from the
  relation. It returns a list of TrackFinder.Track.
  """
  def ordered(r = %Data.Map.Relation{}) do
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
    |> Enum.map(fn track ->
      ways = Graph.Pathfinding.dijkstra(g, track.start, track.stop)

      track =
        track
        |> Map.drop([:start, :stop])
        |> Map.put(:ways, ways)

      struct!(Track, track)
    end)
  end

  @doc """
  with_nodes takes an existing track list and generates a consecutive list of nodes
  for each track, eliminating any duplicates. It returns the tracks, but with the
  nodes keys filled.
  """
  def with_nodes(track_list), do: Enum.map(track_list, &Track.with_nodes/1)

  @doc """
  with_image_sequence takes an existing track list and generates a sequence of
  Mapillary.Sequence from the tags of the ways, duplicating references as
  needed. It returns the tracks, but with the image_sequence keys filled.
  """
  def with_image_sequences(track_list), do: Enum.map(track_list, &Track.with_image_sequence/1)

  defp resolve_to_start_end_ways(name, members, normalized_ways) do
    text = fn kind ->
      "#{name}: The #{kind} nodes must be part of one of the ways of the relation, and it must be at the start or end of that way."
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
    id = r.tags[:id]
    # TODO: old style fallback, should go away once everything is migrated to map.osm
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
        fw_target = hd(e_as_start.nodes).tags[:target]
        bw_target = hd(s_as_start.nodes).tags[:target]

        # TODO: once everything is migrated to map.osm, this should not need to be checked anymore
        fw_text = if bw_target, do: r.tags[:"#{bw_target}→#{fw_target}"], else: fw_text
        bw_text = if bw_target, do: r.tags[:"#{fw_target}→#{bw_target}"], else: bw_text

        fw_text = fw_text || "von #{bw_target} nach #{fw_target}"
        bw_text = bw_text || "von #{fw_target} nach #{bw_target}"

        [
          %{
            type: :forward,
            id: id,
            name: name,
            direction: fw_text,
            full_name: "#{name} #{fw_text}",
            start: s_as_start,
            stop: e_as_end
          },
          %{
            type: :backward,
            id: id,
            name: name,
            direction: bw_text,
            full_name: "#{name} #{bw_text}",
            start: e_as_start,
            stop: s_as_end
          }
        ]
      end)
    end)
  end

  # reverse turns around the order of nodes in a way and adjust tags so that
  # their direction is kept the same
  defp reverse(%Way{nodes: nodes, tags: tags} = w) do
    reversed_tags = Enum.map(tags, fn {key, val} -> {reverse_key(key), val} end)

    w
    |> Map.put(:nodes, Enum.reverse(nodes))
    |> Map.put(:tags, reversed_tags)
  end

  # reverse_key swaps "forward" and "backward" in the key itself
  defp reverse_key(key) when is_atom(key) do
    key = key |> Atom.to_string()

    cond do
      String.contains?(key, "forward") -> String.replace(key, "forward", "backward")
      String.contains?(key, "backward") -> String.replace(key, "backward", "forward")
      true -> key
    end
    |> String.to_existing_atom()
  end

  defp normalize_ways(r) do
    for %{role: r, ref: %Way{} = way} <- r.members do
      case r do
        "forward" -> way
        "backward" -> reverse(way)
        "" -> [way, reverse(way)]
      end
    end
    |> List.flatten()
  end

  defp last([]), do: raise("list is empty")
  defp last(list), do: List.last(list)
end
