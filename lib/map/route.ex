defmodule Map.Route do
  require Logger
  @enforce_keys [:name, :group_title, :route_title, :nodes]
  defstruct [:name, :group_title, :route_title, :nodes]

  @type t :: %__MODULE__{
          name: binary(),
          group_title: binary(),
          route_title: binary(),
          nodes: [Map.Node.t()]
        }

  @spec from_relation(Map.Relation.t()) :: {:ok, [t()]} | {:error, binary()}
  def from_relation(%Map.Relation{tags: tags} = r) do
    art = Article.List.find_exact(tags[:name])

    cond do
      art ->
        {:ok, find(r, art)}

      tags[:name] in ["", nil] ->
        {:error, "Relation id=#{r.id} has no name tag (other tags: #{inspect(tags)})"}

      true ->
        {:error, "Relation name=#{tags[:name]} has no article with id=#{tags[:name]}"}
    end
  end

  @spec find(Map.Relation.t(), Article.t()) :: [t()]
  defp find(%Map.Relation{} = r, art) do
    ways = normalize(r)
    indexed = Enum.group_by(ways, & &1.id)
    graph = Graph.add_edges(Graph.new(), edges(ways))

    tracks(r, art)
    |> Enum.map(fn track ->
      try do
        find_single(track, graph, indexed, art)
      catch
        error ->
          Logger.warning(error)
          nil
      end
    end)
    |> Util.compact()
  end

  # filter by group to silence bogus warnings about missing tracks when the
  # relation is split up
  @spec tracks(Map.Relation.t(), Article.t()) :: [Video.Track.t()]
  defp tracks(relation, article)

  defp tracks(%{tags: %{group: group}}, art),
    do: Enum.filter(art.tracks(), fn %{group: grp} -> grp == group end)

  defp tracks(_rel, art), do: art.tracks()

  @spec find_single(
          Video.Track.t(),
          Graph.t(),
          %{optional(binary()) => [Map.Way.t()]},
          Article.t()
        ) :: t()
  defp find_single(track, graph, indexed, art) do
    legs =
      [track.from, track.via, track.to]
      |> List.flatten()
      |> Util.compact()
      |> Enum.chunk_every(2, 1, :discard)

    {ways, nodes} =
      Enum.reduce(legs, {[], []}, fn [from, to], {ways, nodes} ->
        leg = Graph.Pathfinding.dijkstra(graph, from, to) |> warn_on_nil_leg(track, to, from, art)
        # this conveniently skips all named "targets" and only returns the actual ways
        next_ways = Enum.flat_map(leg, fn wid -> indexed[wid] || [] end) |> Util.compact()
        next_nodes = Enum.flat_map(next_ways, fn w -> Enum.slice(w.nodes, 1..-1//1) end)

        {[next_ways | ways], [next_nodes | nodes]}
      end)

    ways = ways |> Enum.reverse() |> List.flatten()
    nodes = nodes |> Enum.reverse() |> List.flatten()

    # the first way had its starting node cut off, too, so add it back
    nodes = [hd(hd(ways).nodes) | nodes]

    %__MODULE__{
      name: art.name(),
      group_title: art.title(),
      route_title: Video.Track.name(track),
      nodes: nodes
    }
  end

  defp warn_on_nil_leg(leg, track, to, from, article)

  defp warn_on_nil_leg(nil, track, to, from, article) do
    throw("""
    WARNING on #{article}:
        No leg for '#{track.text}' from '#{from}' to '#{to}'.
        Ensure the relation with 'name=#{track.parent_ref.id()}' contains a way where one of the nodes is tagged as 'target=#{from}' and/or 'target=#{to}' respectively.
        This particular route will be skipped and missing from the GPX file.
    """)
  end

  defp warn_on_nil_leg(leg, _, _, _, _), do: leg

  defp normalize(r) do
    for %{role: r, ref: %Map.Way{} = way} <- r.members do
      case r do
        "forward" -> way
        "backward" -> reverse(way)
        "" -> [way, reverse(way)]
      end
    end
    |> List.flatten()
    |> Enum.flat_map(&Map.Way.split_on_tagged_nodes/1)
  end

  defp reverse(%Map.Way{id: id} = way), do: %{Map.Way.reverse(way) | id: id <> "_reversed"}

  @spec edges([Map.Way.t()]) :: [{binary(), binary()}]
  defp edges(ways) do
    first_node_index = Enum.group_by(ways, &hd(&1.nodes).id, & &1.id)

    Enum.reduce(ways, [], fn way, edges ->
      last = List.last(way.nodes)

      from = hd(way.nodes).tags[:target]
      to = last.tags[:target]

      edges = if from, do: [{from, way.id} | edges], else: edges
      edges = if to, do: [{way.id, to} | edges], else: edges

      unnamed_connections = if(!to, do: first_node_index[last.id]) || []
      edges = Enum.reduce(unnamed_connections, edges, &[{way.id, &1} | &2])

      edges
    end)
  end
end
