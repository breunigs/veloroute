defmodule Map.Relation do
  defstruct [:id, :tags, :members, :bbox]

  @type t :: %__MODULE__{
          id: binary(),
          tags: %{atom() => binary()},
          members: Map.Element.collection(),
          bbox: Geo.BoundingBox.t() | nil
        }

  @spec purge_member_bbox(t()) :: t()
  def purge_member_bbox(%__MODULE__{members: mem} = r) do
    mem =
      Enum.map(mem, fn
        x = %{ref: %Map.Way{} = w} -> %{x | ref: Map.delete(w, :bbox)}
        any -> any
      end)

    %{r | members: mem}
  end

  def osm_url(%__MODULE__{tags: %{osm_relation_ref: url}}), do: url

  def osm_url(%__MODULE__{tags: %{osm_relation_id: rel_id}}),
    do: "https://www.openstreetmap.org/relation/#{rel_id}"

  def osm_url(_), do: nil

  def osm_relation_id(%__MODULE__{tags: %{osm_relation_id: rel_id}}) do
    {rel_id, ""} = Integer.parse(rel_id)
    rel_id
  end

  def osm_relation_id(%__MODULE__{tags: %{osm_relation_ref: url}}) do
    String.split(url, "/")
    |> List.last()
    |> Integer.parse()
    |> case do
      {rel_id, ""} ->
        rel_id

      _ ->
        IO.warn(
          "Relation has osm_relation_ref=#{url} but cannot find the OSM relation ID in that"
        )

        nil
    end
  end

  def osm_relation_id(_), do: nil

  def name(%__MODULE__{} = rel),
    do: rel.tags[:name] || rel.tags[:id]

  def gpx_name(%__MODULE__{} = rel) do
    # return GPX name only if relation can be detected
    if osm_relation_id(rel) != nil, do: Map.get(rel.tags, :gpx_name, rel.tags[:id])
  end

  def ways(%__MODULE__{} = r),
    do:
      Enum.filter(r.members, &match?(%{ref: %Map.Way{}}, &1))
      |> Enum.map(&Map.get(&1, :ref))

  def nodes(%__MODULE__{} = r) do
    r
    |> ways()
    |> Enum.flat_map(fn %Map.Way{nodes: nodes} -> nodes end)
  end

  def way_ids(%__MODULE__{} = r) do
    ways(r)
    |> Enum.map(fn %Map.Way{id: wid} -> wid end)
  end
end
