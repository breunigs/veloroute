defmodule Data.GeoJSON do
  def to_feature_lists(%Map.Parsed{} = map) do
    %{
      routes: as_feat_collection(routes(map) ++ detours(map)),
      articles: as_feat_collection(articles(map)),
      markers: as_feat_collection(markers(map))
    }
  end

  defp markers(map) do
    map.nodes()
    |> Map.Element.filter_by_tag(:type, "marker")
    |> Enum.map(&as_geojson(&1))
  end

  defp articles(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, "article")
    |> Enum.map(&as_geojson(&1))
  end

  defp detours(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, "detour")
    |> Enum.map(&as_geojson(&1))
  end

  defp routes(map) do
    map.relations()
    |> Map.values()
    |> add_overlap_info()
    |> Enum.map(&as_geojson(&1))
  end

  # renders for nodes
  defp as_geojson(%Map.Node{} = n) do
    props = Map.merge(%{id: n.id}, n.tags)

    %{
      type: "Feature",
      properties: props,
      geometry: %{
        type: "Point",
        coordinates: as_geojson_coord(n)
      }
    }
  end

  # renders for ways
  defp as_geojson(
         w = %Map.Way{
           tags: %{
             type: "article",
             name: name,
             article_title: title,
             article_type: type
           }
         }
       ) do
    coords = Enum.map(w.nodes, &as_geojson_coord(&1))

    props =
      %{
        type: "article",
        name: name,
        title: title,
        icon: Map.get(w.tags, :article_icon) || type
      }
      |> maybe_add_video(w, :forward)
      |> maybe_add_video(w, :backward)

    %{
      type: "Feature",
      properties: props,
      geometry: %{
        type: "Polygon",
        coordinates: [coords]
      }
    }
  end

  defp as_geojson(w = %Map.Way{tags: %{type: "article"}}) do
    raise "A way tagged as an article is missing some required fields. Normally these are auto-inserted from the article's yaml. Does the article exist? \n #{inspect(w.tags)}"
  end

  defp as_geojson(%Map.Way{} = w) do
    coords = Enum.map(w.nodes, &as_geojson_coord(&1))

    props =
      w.tags
      |> Map.take([:name, :type, :offset, :route_id | Map.Way.style_tags()])
      |> maybe_add_video(w, :forward)
      |> maybe_add_video(w, :backward)

    %{
      type: "Feature",
      properties: props,
      geometry: %{
        type: "LineString",
        coordinates: coords
      }
    }
  end

  # renders for relations
  defp as_geojson(%Map.Relation{} = r) do
    extra_rel_tags = %{
      color: r.tags[:color],
      route_id: r.tags.id
    }

    r
    |> Map.Relation.ways()
    |> Enum.map(
      &Map.Element.keep_only_tags(&1, [:oneway, :video_forward, :video_backward, :offset, :color])
    )
    |> Enum.map(&Map.Element.add_new_tags(&1, extra_rel_tags))
    |> Enum.map(&as_geojson/1)
  end

  defp as_geojson_coord(%{lon: lon, lat: lat}) do
    [lon, lat]
  end

  defp as_feat_collection(feats) do
    %{
      type: "FeatureCollection",
      features: feats
    }
  end

  defp add_overlap_info(relations) do
    # create map from way IDs to relation IDs that include that way
    ways_to_rels =
      relations
      |> Enum.sort_by(fn %Map.Relation{id: id} -> id end)
      |> Enum.reduce(%{}, fn rel, acc ->
        rel
        |> Map.Relation.way_ids()
        |> Enum.reduce(acc, fn wid, acc ->
          Map.update(acc, wid, [rel.id], &[rel.id | &1])
        end)
      end)

    # handle offsets for exactly two routes overlapping
    offsets =
      ways_to_rels
      |> Enum.filter(fn {_wid, rels} -> length(rels) == 2 end)
      |> Enum.flat_map(fn
        {way_id, [a_id, b_id]} ->
          [
            {{way_id, a_id}, 1},
            {{way_id, b_id}, -1}
          ]

        _ ->
          []
      end)
      |> Enum.into(%{})

    # add offset to tags of ways
    Enum.map(relations, fn rel ->
      modify_ways(rel, fn way ->
        offset = %{offset: Map.get(offsets, {way.id, rel.id}, 0)}
        Map.Element.add_new_tags(way, offset)
      end)
    end)
  end

  defp modify_ways(%Map.Relation{} = r, fun) do
    members =
      Enum.map(r.members, fn %{ref: ref} = member ->
        updated = if is_struct(ref, Map.Way), do: fun.(ref), else: ref
        %{member | ref: updated}
      end)

    %{r | members: members}
  end

  defp maybe_add_video(props, %Map.Way{} = way, direction)
       when direction == :forward or direction == :backward do
    tsv_seq = Video.TrimmedSourceSequence.maybe_from_way(way, direction)

    if tsv_seq,
      do: Map.put(props, :"video_#{direction}", tsv_seq.hash),
      else: props
  end
end
