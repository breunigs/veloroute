defmodule TrackFinder do
  @moduledoc """
  TrackFinder takes a raw relation and tries to find shortest path trips (called a
  track) within that relation.
  """
  alias Map.Node
  alias Map.Way

  @doc """
  ordered takes a Map.Relation and finds the shortest connections between
  start and end, along the ways and their oneway/role restrictions from the
  relation. It returns a list of TrackFinder.Track.
  """
  def ordered(r = %Map.Relation{}) do
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
      ways =
        [track.start, track.via, track.stop]
        |> List.flatten()
        |> Enum.chunk_every(2, 1, :discard)
        |> Enum.reduce([], fn [from, to], ways ->
          # if track.via != [] do
          #   require IEx
          #   IEx.pry()
          # end

          prev = Enum.slice(ways, 0..-2)
          next = Graph.Pathfinding.dijkstra(g, from, to)
          prev ++ next
        end)

      track
      |> Map.drop([:start, :stop, :via])
      |> Map.put(:ways, ways)
    end)
  end

  @doc """
  with_nodes takes an existing track list and generates a consecutive list of nodes
  for each track, eliminating any duplicates. It returns the tracks, but with the
  nodes keys filled.
  """
  def with_nodes(track_list), do: Enum.map(track_list, &concatenate_nodes/1) |> Util.compact()

  # concatenate_nodes joins the nodes of the ways in order, removing any
  # duplicates. It adds them to the Map as "nodes".
  defp concatenate_nodes(obj = %{ways: ways}) when is_list(ways) do
    try do
      first_node = ways |> hd |> Map.get(:nodes) |> hd
      rest = Enum.flat_map(ways, fn %Way{nodes: [_f | rest]} -> rest end)
      Map.put(obj, :nodes, [first_node | rest])
    rescue
      err ->
        raise "Track is invalid: #{inspect(err)}\n#{inspect(obj)}"
    end
  end

  defp concatenate_nodes(obj = %{ways: nil}) do
    IO.puts(:stderr, "#{obj.id}: no connection for '#{obj.direction}', not including in GPX")
    nil
  end

  defp resolve_to_start_end_ways(name, members, normalized_ways) do
    text = fn node ->
      "#{name}: The gpx_start/gpx_end nodes must be part of one of the ways of the relation, and it must be at the start or end of that way. Failed to find any way for: #{inspect(node)}"
    end

    Parallel.map(members, fn %{ref: node} ->
      # todo: iterate once with reduce
      as_start = Enum.find(normalized_ways, fn %Way{nodes: nodes} -> hd(nodes) == node end)
      as_end = Enum.find(normalized_ways, fn %Way{nodes: nodes} -> last(nodes) == node end)

      if is_nil(as_start) && is_nil(as_end), do: raise(text.(node))

      {as_start, as_end}
    end)
  end

  defp direction_text(art, from, to, direction) when is_binary(from) and is_binary(to) do
    Enum.find_value(art.tracks(), fn
      %{from: ^from, to: ^to, direction: ^direction, text: text} ->
        text

      _track ->
        nil
    end) || "von #{from} nach #{to}"
  end

  defp direction_text(art, nil, _to, _direction) do
    raise(
      "#{art} does not seem to have a named start. Ensure the first node of the first way has a target=X tag. Alternatively, include such a node manually and give it the role=gpx_start"
    )
  end

  defp direction_text(art, _from, nil, _direction) do
    raise(
      "#{art} does not seem to have a named end. Ensure the last node of the last way has a target=X tag. Alternatively, include such a node manually and give it the role=gpx_end"
    )
  end

  defp track_matrix(r, normalized_ways) do
    art = Article.List.find_exact(r.tags.name)

    if is_nil(art), do: raise("Failed to find matching article for relation: #{inspect(r.tags)}")

    {start_members, end_members} =
      Enum.group_by(r.members, fn
        %{ref: %Node{tags: %{target: "" <> _rest}}, role: "gpx_" <> role} -> role
        _ -> nil
      end)
      |> case do
        %{"start" => start_members, "end" => end_members} ->
          {start_members, end_members}

        %{"start" => _} ->
          raise "Route #{art.name()} specifies GPX start(s), but no end(s) that have a target"

        %{"end" => _} ->
          raise "Route #{art.name()} specifies GPX end(s), but no start(s) that have a target"

        %{nil => members} ->
          ways = for %{ref: %Map.Way{}} = o <- members, do: o.ref

          start_nodes =
            Enum.map(ways, &hd(&1.nodes))
            |> Enum.filter(&is_map_key(&1.tags, :target))
            |> Enum.map(&%{ref: &1, role: "gpx_start"})

          end_nodes =
            Enum.map(ways, &List.last(&1.nodes))
            |> Enum.filter(&is_map_key(&1.tags, :target))
            |> Enum.map(&%{ref: &1, role: "gpx_end"})

          {start_nodes, end_nodes}
      end

    start_ways = resolve_to_start_end_ways(art.name(), start_members, normalized_ways)
    end_ways = resolve_to_start_end_ways(art.name(), end_members, normalized_ways)
    {via_fw, via_bw} = find_vias(r)

    Enum.flat_map(start_ways, fn {s_as_start, s_as_end} ->
      Enum.flat_map(end_ways, fn {e_as_start, e_as_end} ->
        fw_track =
          if s_as_start && e_as_end do
            fw_target = List.last(e_as_end.nodes).tags[:target]
            bw_target = hd(s_as_start.nodes).tags[:target]
            fw_text = direction_text(art, bw_target, fw_target, :forward)

            %{
              type: :forward,
              id: art.id(),
              name: art.name(),
              direction: fw_text,
              full_name: "#{art.title()} #{fw_text}",
              start: s_as_start,
              stop: e_as_end,
              via: via_fw
            }
          end

        bw_track =
          if e_as_start && s_as_end do
            fw_target = hd(e_as_start.nodes).tags[:target]
            bw_target = List.last(s_as_end.nodes).tags[:target]
            bw_text = direction_text(art, fw_target, bw_target, :backward)

            %{
              type: :backward,
              id: art.id(),
              name: art.name(),
              direction: bw_text,
              full_name: "#{art.title()} #{bw_text}",
              start: e_as_start,
              stop: s_as_end,
              via: via_bw
            }
          end

        Util.compact([fw_track, bw_track])
      end)
    end)
  end

  @spec find_vias(Map.Relation.t()) :: {[Map.Way.t()], [Map.Way.t()]}
  defp find_vias(r) do
    grouped =
      Enum.group_by(r.members, fn
        %{ref: %Way{}, role: "gpx_via_" <> dir} -> dir
        _ -> nil
      end)

    fw = grouped["forward"] || []
    bw = grouped["backward"] || []

    {Enum.map(fw, &Map.get(&1, :ref)), Enum.map(bw, &Map.get(&1, :ref))}
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
        "gpx_via_forward" -> []
        "gpx_via_backward" -> []
      end
    end
    |> List.flatten()
  end

  defp last([]), do: raise("list is empty")
  defp last(list), do: List.last(list)
end
