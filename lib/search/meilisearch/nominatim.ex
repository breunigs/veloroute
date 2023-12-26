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

  def format(result) do
    f = fn arg -> Map.fetch!(result, arg) end

    human = lookup(result, ["type", ["extratags", "border_type"]])
    bbox = Geo.BoundingBox.parse(f.("bbox"))
    addr = f.("address")
    names = f.("name")

    name =
      ~w[name:de name alt_name old_name addr:housename official_name brand]
      |> Enum.map(&names[&1])
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

  defp lookup(result, [key | rest]) do
    val = get_in(result, List.wrap(key))

    case Data.OsmTagToHuman.map()[val] do
      [x | _rest] -> x
      _ -> lookup(result, rest)
    end
  end

  defp lookup(_result, []), do: nil
end

# TODO: grab postcodes from parent's address fields instead of the top-level postcode?
