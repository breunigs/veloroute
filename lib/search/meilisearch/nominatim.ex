defmodule Search.Meilisearch.Nominatim do
  require Logger
  @behaviour Search.Meilisearch.Behaviour

  @impl true
  def id(), do: :nominatim

  @impl true
  def documents() do
    Basemap.Nominatim.ensure()
    source = Basemap.Nominatim.export(:search)
    {"application/x-ndjson", File.read!(source)}
  end

  @impl true
  def params(query, lat, lon) do
    %{
      q: query,
      limit: 10,
      sort: ["_geoPoint(#{lat}, #{lon}):asc"]
    }
  end

  @impl true

  # provide more sensible bounding box for suburbs just tagged as a node
  def format(%{"class" => "place", "type" => "suburb", "id" => "N" <> rest} = result) do
    bbox = result["bbox"] |> Geo.BoundingBox.parse() |> Geo.CheapRuler.buffer_bbox(1_000)
    format(%{result | "bbox" => bbox, "id" => "fixed#{rest}"})
  end

  # export bug, bbox shouldn't be empty string.
  def format(%{"bbox" => ""} = result) do
    case Application.get_env(:veloroute, :env) do
      :prod -> nil
      _other -> raise "invalid search result without bbox: #{inspect(result)}"
    end
  end

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
      |> Kernel.++([f.("extratags")["operator"]])
      |> dedupe()

    street = "#{addr["street"]} #{addr["housenumber"]}"
    name = if name == "", do: street, else: name

    subtext =
      dedupe(
        [
          f.("extratags")["name:prefix"],
          human,
          f.("extratags")["operator"],
          "#{addr["street"]} #{addr["housenumber"]}",
          addr["suburb"],
          addr["postcode"] || f.("parents_postcode"),
          f.("parents_name"),
          addr["city"]
        ] -- [name]
      )

    {name, subtext} = if name == "", do: {subtext, nil}, else: {name, subtext}

    %Search.Result{
      bounds: bbox,
      center: Geo.CheapRuler.center(bbox),
      name: name,
      relevance: f.("_rankingScore") + (30 - f.("rank_boosted_areas")) / 1000,
      type: if(f.("class") in ["place"], do: "poi", else: ""),
      subtext: subtext
    }
  end

  @impl true
  def maybe_merge(list) do
    list
    |> Enum.group_by(fn
      %{"extratags" => %{"wikidata" => "" <> wikidata}} ->
        wikidata

      %{"name" => %{"name" => "" <> name}, "parents_name" => pns, "class" => class} = item ->
        housenum = get_in(item, ["address", "housenumber"])
        {name, Enum.slice(pns, -2..-1), class, housenum}

      _ ->
        nil
    end)
    |> Enum.flat_map(fn
      {nil, items} -> items
      {_, [item]} -> [item]
      {_, items} -> [merge_items(items)]
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
            "type" => merge_types(item["type"], acc["type"])
        }
      end)

    %{
      merged
      | "_rankingScore" => merged["_rankingScore"] / length(items),
        "bbox" => Geo.BoundingBox.to_string_bounds(merged["bbox"]),
        "address" => into(merged["address"]),
        "extratags" => into(merged["extratags"]),
        "name" => into(merged["name"]),
        "parents_postcode" => into([], merged["parents_postcode"])
    }
  end

  @multiple_type "multiple"
  defp merge_types(a, a), do: a
  defp merge_types(@multiple_type, _b), do: @multiple_type
  defp merge_types(_a, @multiple_type), do: @multiple_type

  defp merge_types(a, b) do
    with [named | _rest] <- Data.OsmTagToHuman.map()[a],
         [^named | _rest] <- Data.OsmTagToHuman.map()[b] do
      a
    else
      _ -> @multiple_type
    end
  end

  defp to_mapset(item, key) do
    case item[key] do
      nil -> nil
      val when is_list(val) or is_map(val) -> MapSet.new(val)
      val -> MapSet.new([val])
    end
  end

  defp intersect(l1, l2) when is_list(l1) and is_list(l2) do
    Enum.filter(l1, &Enum.member?(l2, &1))
  end

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
        ~w(id class type name address parents_name parents_postcode extratags bbox boost rank_boosted_areas rank_search rank_address importance),
      # order is from most important to least important
      searchableAttributes: ~w(name boost address type parents_name type extratags),
      sortableAttributes:
        ~w(importance rank_search rank_address rank_boosted_areas _geo admin_level),
      synonyms: synonyms,
      proximityPrecision: "byAttribute",
      rankingRules: ~w(words
        typo
        attribute
        rank_boosted_areas:asc
        rank_search:asc
        rank_address:asc
        importance:desc
        proximity
        admin_level:asc
        sort
        exactness
      )
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
