defmodule Data.GeoJSON do
  def to_feature_lists(%Map.Parsed{} = map) do
    %{
      routes: as_feat_collection(routes(map) ++ routeless_ways(map)),
      articles: as_feat_collection(articles(map)),
      markers: as_feat_collection(markers(map))
    }
  end

  defp markers(map) do
    map.nodes()
    |> Map.Element.filter_by_tag(:type, ["marker", "warning"])
    |> Enum.map(&as_geojson(&1))
  end

  defp articles(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, "article")
    |> Enum.map(&as_geojson(&1))
    |> Enum.reject(&is_nil/1)
  end

  defp routeless_ways(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, ["detour", "planned"])
    |> Enum.map(&as_geojson(&1))
  end

  defp routes(map) do
    map.relations()
    |> Map.values()
    |> add_overlap_info(:alltag)
    |> add_overlap_info(:freizeit)
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
  defp as_geojson(%Map.Way{tags: %{type: "article", hide_from_map: true}}), do: nil

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

    props = %{
      type: "article",
      name: name,
      title: title,
      icon: Map.get(w.tags, :article_icon) || type
    }

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
    raise "A way tagged as an article is missing some required fields. Normally these are auto-inserted from the article's definition. Does the article exist? \n #{inspect(w.tags)}"
  end

  defp as_geojson(%Map.Way{} = w) do
    coords = Enum.map(w.nodes, &as_geojson_coord(&1))

    props =
      w.tags
      |> Map.take([
        :name,
        :text,
        :bridge,
        :type,
        :route_group,
        :offset,
        :overlap_index,
        :route_id | Map.Way.style_tags()
      ])
      |> Map.put_new(:type, w.tags[:route_group])

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
  defp as_geojson(%Map.Relation{tags: %{name: "" <> _rest}} = r) do
    art = Article.List.find_exact(r.tags.name)

    if !art,
      do:
        raise("""
          Expected to find an article with name '#{r.tags.name}', but it doesn't exist.
          You need to change either the relation's or the article's name.
        """)

    extra_rel_tags = %{
      color: art.color(),
      route_id: art.id(),
      route_group: art.route_group()
    }

    r
    |> Map.Relation.ways()
    |> Enum.map(&Map.Element.keep_only_tags(&1, [:oneway, :offset, :overlap_index, :color]))
    |> Enum.map(&Map.Element.add_new_tags(&1, extra_rel_tags))
    |> Enum.map(&as_geojson/1)
  end

  defp as_geojson(%Map.Relation{} = r) do
    IO.puts(:stderr, "skipping unsupported relation: #{r.id}")
    nil
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

  # hash from {length_of_rels, index_of_current_rel} → desired_offset_in_geojson
  @offsets %{
    {2, 0} => 1,
    {2, 1} => -1
  }

  defp add_overlap_info(relations, route_group) do
    {rels_to_modify, rels_to_keep} =
      Enum.split_with(relations, fn rel ->
        route = Article.List.find_exact(rel.tags.name)
        route && route.route_group() == route_group
      end)

    # create map from way IDs to relation IDs that include that way,
    # additionally collecting their roles
    ways_to_rels =
      rels_to_modify
      |> Enum.sort_by(fn %Map.Relation{id: id} -> id end)
      |> Enum.reduce(%{}, fn rel, acc ->
        rel
        |> Map.Relation.way_members()
        |> Enum.reduce(acc, fn %{role: role, ref: %Map.Way{id: wid}}, acc ->
          %{rels: rels, roles: roles} = acc[wid] || %{rels: [], roles: []}
          Map.put(acc, wid, %{rels: [rel.id | rels], roles: [role | roles]})
        end)
      end)

    # add offset/oneway to tags of ways
    Enum.map(rels_to_modify, fn rel ->
      modify_ways(rel, fn way ->
        rels = ways_to_rels[way.id][:rels]
        roles = Enum.uniq(ways_to_rels[way.id][:roles])
        index = Enum.find_index(rels, fn rel_id -> rel_id == rel.id end)

        oneway = length(roles) == 1 && hd(roles) in ["forward", "backward"]
        offset = @offsets[{length(rels), index}] || 0

        tags = %{offset: offset}
        tags = if length(rels) >= 2, do: Map.put(tags, :overlap_index, index), else: tags
        tags = if oneway, do: Map.put(tags, :oneway, true), else: tags

        Map.Element.add_new_tags(way, tags)
      end)
    end) ++ rels_to_keep
  end

  defp modify_ways(%Map.Relation{} = r, fun) do
    members =
      Enum.map(r.members, fn %{ref: ref} = member ->
        updated = if is_struct(ref, Map.Way), do: fun.(ref), else: ref
        %{member | ref: updated}
      end)

    %{r | members: members}
  end
end
