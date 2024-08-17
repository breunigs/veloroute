defmodule Map.Parser do
  @default_map_path "data/map.osm"

  def default_map_path, do: @default_map_path
  def load_default, do: load(default_map_path())

  @typep state :: %{
           nodes: Map.Parsed.indexed_nodes(),
           ways: Map.Parsed.indexed_ways(),
           relations: Map.Parsed.indexed_relations(),
           active:
             nil
             | {:nodes, Map.Node.t() | :deleted}
             | {:ways, Map.Way.t() | :deleted}
             | {:relations, Map.Relation.t() | :deleted}
         }

  def load(map_path) when is_binary(map_path) do
    state = %{
      nodes: %{},
      ways: %{},
      relations: %{},
      active: nil
    }

    raw = File.stream!(map_path)
    {:ok, parsed} = Saxy.parse_stream(raw, __MODULE__, state)

    parsed
  end

  @behaviour Saxy.Handler

  @impl Saxy.Handler
  @spec handle_event(atom(), any(), state()) :: {:ok, state()}
  def handle_event(:start_document, _prolog, state), do: {:ok, state}

  def handle_event(:end_document, _prolog, state) do
    {:ok,
     %Map.Parsed{
       nodes: filter_typed(state.nodes),
       ways: filter_typed(state.ways),
       relations: state.relations
     }}
  end

  def handle_event(:start_element, {"osm", _tags}, state), do: {:ok, state}
  def handle_event(:end_element, "osm", state), do: {:ok, state}

  ############################
  # node and specific children
  ############################

  def handle_event(:start_element, {"node", attrs}, %{active: nil} = state) do
    node =
      case attrs do
        # fast paths
        [{"id", id}, {"lat", lat}, {"lon", lon}] ->
          %Map.Node{id: id, lat: String.to_float(lat), lon: String.to_float(lon), tags: %{}}

        [{"id", id}, {"version", _version}, {"lat", lat}, {"lon", lon}] ->
          %Map.Node{id: id, lat: String.to_float(lat), lon: String.to_float(lon), tags: %{}}

        # slow path
        attrs ->
          Enum.reduce_while(attrs, struct(Map.Node, tags: %{}), fn {k, v}, node ->
            case k do
              "id" -> {:cont, %{node | id: v}}
              "lat" -> {:cont, %{node | lat: String.to_float(v)}}
              "lon" -> {:cont, %{node | lon: String.to_float(v)}}
              "action" -> if v == "delete", do: {:halt, :deleted}, else: {:cont, node}
              "version" -> {:cont, node}
            end
          end)
      end

    {:ok, %{state | active: {:nodes, node}}}
  end

  def handle_event(:end_element, "node", %{active: {:nodes, :deleted}} = state), do: {:ok, state}

  def handle_event(:end_element, "node", %{active: {:nodes, elem}} = state) do
    {:ok, %{state | nodes: Map.put(state.nodes, elem.id, elem), active: nil}}
  end

  ###########################
  # way and specific children
  ###########################

  def handle_event(:start_element, {"way", attrs}, %{active: nil} = state) do
    elem_with_id(state, :ways, %Map.Way{tags: %{}, bbox: nil, nodes: []}, attrs)
  end

  def handle_event(:start_element, {"nd", _attrs}, %{active: {:ways, :deleted}} = state),
    do: {:ok, state}

  def handle_event(:start_element, {"nd", attrs}, %{active: {:ways, way}} = state) do
    [{"ref", node_id}] = attrs

    node = state.nodes[node_id]
    if is_nil(node), do: raise("way=#{way.id}: referenced node=#{node_id} not (yet?) defined")

    way = %{way | nodes: [node | way.nodes], bbox: expand(way.bbox, node)}
    {:ok, %{state | active: {:ways, way}}}
  end

  def handle_event(:end_element, "nd", state), do: {:ok, state}

  def handle_event(:end_element, "way", %{active: {:ways, :deleted}} = state), do: {:ok, state}

  def handle_event(:end_element, "way", %{active: {:ways, way}} = state) do
    way = %{way | nodes: ensure_right_hand_winding(way.nodes)}
    {:ok, %{state | ways: Map.put(state.ways, way.id, way), active: nil}}
  end

  ################################
  # relation and specific children
  ################################

  def handle_event(:start_element, {"relation", attrs}, %{active: nil} = state) do
    elem_with_id(
      state,
      :relations,
      %Map.Relation{tags: %{}, bbox: nil, members: []},
      attrs
    )
  end

  def handle_event(:start_element, {"member", _attrs}, %{active: {:relations, :deleted}} = state),
    do: {:ok, state}

  def handle_event(:start_element, {"member", attrs}, %{active: {:relations, relation}} = state) do
    attrs =
      Enum.reduce(attrs, %{}, fn {k, v}, attrs when k in ["type", "ref", "role"] ->
        Map.put(attrs, k, v)
      end)

    elem =
      case attrs["type"] do
        "node" -> state.nodes[attrs["ref"]]
        "way" -> state.ways[attrs["ref"]]
      end

    if is_nil(elem) do
      id = relation.id
      raise("relation=#{id}: referenced #{attrs["type"]}=#{attrs["ref"]} not (yet?) defined")
    end

    member = %{ref: elem, role: attrs["role"] || ""}

    relation = %{
      relation
      | members: [member | relation.members],
        bbox: expand(relation.bbox, elem)
    }

    {:ok, %{state | active: {:relations, relation}}}
  end

  def handle_event(:end_element, "member", state), do: {:ok, state}

  def handle_event(:end_element, "relation", %{active: {:relations, :deleted}} = state),
    do: {:ok, state}

  def handle_event(:end_element, "relation", %{active: {:relations, rel}} = state) do
    rel =
      rel
      |> Map.update!(:members, &Enum.reverse/1)
      |> Map.Relation.purge_member_bbox()

    {:ok, %{state | relations: Map.put(state.relations, rel.id, rel), active: nil}}
  end

  ########
  # shared
  ########

  def handle_event(:start_element, {"tag", _attrs}, %{active: {_any, :deleted}} = state),
    do: {:ok, state}

  def handle_event(:start_element, {"tag", attrs}, %{active: {class, elem}} = state) do
    {k, v} =
      case attrs do
        # fast path
        [{"k", k}, {"v", v}] ->
          {String.to_atom(k), weak_bool(v)}

        # slow path
        attrs ->
          Enum.reduce(attrs, {nil, nil}, fn
            {"k", k}, {_, v} -> {String.to_atom(k), v}
            {"v", v}, {k, _} -> {k, weak_bool(v)}
            _other, acc -> acc
          end)
      end

    elem = %{elem | tags: Map.put(elem.tags, k, v)}
    {:ok, %{state | active: {class, elem}}}
  end

  def handle_event(:end_element, "tag", state), do: {:ok, state}

  def handle_event(:characters, _prolog, state), do: {:ok, state}

  #######
  # utils
  #######
  defp ensure_right_hand_winding([]), do: []

  defp ensure_right_hand_winding(nodes) do
    if hd(nodes) == List.last(nodes) do
      if area(nodes) < 0,
        do: Enum.reverse(nodes),
        else: nodes
    else
      # reverse regular way because nodes were appended in reverse
      Enum.reverse(nodes)
    end
  end

  defp area(nodes) do
    Enum.reduce(tl(nodes), {0.0, hd(nodes)}, fn curr, {area, prev} ->
      area = area + (curr.lon - prev.lon) * (prev.lat + curr.lat)
      {area, curr}
    end)
    |> elem(0)
  end

  @spec elem_with_id(state(), atom(), struct(), list()) :: {:ok, state()}
  defp elem_with_id(state, class, elem, attrs) do
    elem =
      case attrs do
        # fast paths
        [{"id", id}] ->
          %{elem | id: id}

        [{"id", id}, {"version", _version}] ->
          %{elem | id: id}

        # slow path
        attrs ->
          Enum.reduce_while(attrs, elem, fn {k, v}, elem ->
            case k do
              "id" -> {:cont, %{elem | id: v}}
              "action" -> if v == "delete", do: {:halt, :deleted}, else: {:cont, elem}
              "version" -> {:cont, elem}
              other -> raise("elem(#{class}) has unknown attribute #{other} (#{inspect(attrs)})")
            end
          end)
      end

    {:ok, %{state | active: {class, elem}}}
  end

  @spec expand(nil | Geo.BoundingBox.t(), Map.Node.t() | Map.Way.t()) :: nil | Geo.BoundingBox.t()
  defp expand(nil, %{bbox: bbox} = _way), do: bbox
  defp expand(nil, node), do: Geo.CheapRuler.bbox(node)
  defp expand(bbox1, %{bbox: bbox2} = _way), do: Geo.CheapRuler.union(bbox1, bbox2)

  defp expand(bbox, %{lat: lat, lon: lon} = _node) do
    minLon = min(bbox.minLon, lon)
    minLat = min(bbox.minLat, lat)
    maxLon = max(bbox.maxLon, lon)
    maxLat = max(bbox.maxLat, lat)
    %{bbox | minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  @spec filter_typed(%{optional(binary()) => Map.Way.t() | Map.Node.t()}) ::
          %{optional(binary()) => Map.Way.t() | Map.Node.t()}
  defp filter_typed(objs) do
    Enum.reduce(objs, %{}, fn
      {key, obj = %{tags: %{type: type}}}, acc when is_binary(type) -> Map.put(acc, key, obj)
      {_key, _obj}, acc -> acc
    end)
  end

  defp weak_bool("yes"), do: true
  defp weak_bool("no"), do: false
  defp weak_bool(x), do: x
end
