defmodule Search.Meilisearch.Nominatim do
  require Logger
  @behaviour Search.Meilisearch.Behaviour

  @impl true
  def id(), do: :nominatim

  @impl true
  def documents() do
    Basemap.Nominatim.ensure()
    source = Basemap.Nominatim.export()
    {"application/x-ndjson", File.read!(source)}
  end

  @impl true
  def params(query, lat, lon) do
    %{
      q: query,
      limit: 10,
      sort: [
        "importance:desc",
        "rank_search:asc",
        "rank_address:asc",
        "_geoPoint(#{lat}, #{lon}):asc",
        "admin_level:asc"
      ]
    }
  end

  @impl true
  # hide suburbs just tagged as a node
  def format(%{"class" => "place", "type" => "suburb", "id" => "N" <> _rest}), do: nil

  def format(result) when is_map(result) do
    f = fn arg -> Map.fetch!(result, arg) end

    human = lookup(result, [["extratags", "building"], "type", ["extratags", "border_type"]])
    bbox = Geo.BoundingBox.parse(f.("bbox"))
    addr = f.("address")
    names = f.("name")

    name =
      ~w[name:de name alt_name old_name addr:housename official_name brand]
      |> Enum.map(&names[&1])
      |> Kernel.++([f.("extratags")["branch"]])
      |> dedupe()

    subtext =
      dedupe([
        human,
        f.("extratags")["operator"],
        "#{addr["street"]} #{addr["housenumber"]}",
        addr["suburb"],
        addr["postcode"] || f.("parents_postcode"),
        addr["city"],
        f.("parents_name")
      ])

    {name, subtext} = if name == "", do: {subtext, ""}, else: {name, subtext}

    %Search.Result{
      bounds: bbox,
      center: Geo.CheapRuler.center(bbox),
      name: name,
      relevance: f.("_rankingScore"),
      type: if(f.("class") in ["place"], do: "poi", else: ""),
      subtext: subtext
    }
  end

  @impl true
  def maybe_merge(list) do
    list
    |> Enum.group_by(&get_in(&1, ["extratags", "wikidata"]))
    |> Enum.flat_map(fn
      {nil, items} -> items
      {"" <> _wd, [_item] = items} -> items
      {"" <> _wd, items} -> [merge_items(items)]
    end)
  end

  @typep item :: %{
           required(binary()) =>
             float()
             | binary()
             | nil
             | %{optional(binary()) => binary()}
             | [binary()]
         }

  @spec merge_items([item]) :: item
  defp merge_items(items) do
    merged =
      items
      |> Enum.map(fn item ->
        %{
          item
          | "address" => to_mapset(item, "address"),
            "bbox" => Geo.BoundingBox.parse(item["bbox"]),
            "extratags" => to_mapset(item, "extratags"),
            "name" => to_mapset(item, "name"),
            "parents_name" => to_mapset(item, "parents_name"),
            "parents_postcode" => to_mapset(item, "parents_postcode")
        }
      end)
      |> Enum.reduce(fn item, acc ->
        %{
          item
          | "_rankingScore" => item["_rankingScore"] + acc["_rankingScore"],
            "address" => intersect(item["address"], acc["address"]),
            "bbox" => Geo.CheapRuler.union(item["bbox"], acc["bbox"]),
            "extratags" => intersect(item["extratags"], acc["extratags"]),
            "name" => intersect(item["name"], acc["name"]),
            "parents_name" => intersect(item["parents_name"], acc["parents_name"]),
            "parents_postcode" => intersect(item["parents_postcode"], acc["parents_postcode"]),
            "id" => item["id"] <> ", " <> acc["id"],
            "class" => if(item["class"] == acc["class"], do: item["class"], else: "multiple"),
            "type" => if(item["type"] == acc["type"], do: item["type"], else: "multiple")
        }
      end)

    %{
      merged
      | "_rankingScore" => merged["_rankingScore"] / length(items),
        "bbox" => Geo.BoundingBox.to_string_bounds(merged["bbox"]),
        "address" => into(merged["address"]),
        "extratags" => into(merged["extratags"]),
        "name" => into(merged["name"]),
        "parents_name" => into([], merged["parents_name"]),
        "parents_postcode" => into([], merged["parents_postcode"])
    }
  end

  defp to_mapset(item, key), do: if(item[key], do: MapSet.new(item[key]))
  defp intersect(ms1, nil), do: ms1
  defp intersect(nil, ms2), do: ms2
  defp intersect(ms1, ms2), do: MapSet.intersection(ms1, ms2)
  defp into(into \\ %{}, ms)
  defp into(_into, nil), do: nil
  defp into(into, ms), do: Enum.into(ms, into)

  def dedupe(list) do
    list
    |> List.flatten()
    |> Enum.reject(fn e -> e == nil || String.trim(e) == "" end)
    |> Enum.map(&String.trim/1)
    |> Enum.uniq()
    |> Enum.join(", ")
  end

  @impl true
  def config() do
    # i.e. invert the map
    synonyms =
      Enum.reduce(Data.OsmTagToHuman.map(), %{}, fn {tag, humans}, acc ->
        Enum.reduce(humans, acc, fn human, acc ->
          Map.update(acc, human, [tag], &[tag | &1])
        end)
      end)

    %{
      displayedAttributes:
        ~w(id class type name address parents_name parents_postcode extratags bbox),
      # order is from most important to least important
      searchableAttributes: ~w(name address type parents_name type extratags),
      sortableAttributes: ~w(importance rank_search rank_address _geo admin_level),
      synonyms: synonyms
    }
  end

  @spec lookup(%{binary() => term()}, [binary() | [binary()]]) :: binary() | nil
  defp lookup(result, [key | rest]) when is_map(result) do
    val = get_in(result, List.wrap(key))

    case Data.OsmTagToHuman.map()[val] do
      [x | _rest] -> x
      _ -> lookup(result, rest)
    end
  end

  defp lookup(_result, []), do: nil
end