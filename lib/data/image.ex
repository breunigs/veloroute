defmodule Data.Image do
  require Logger
  # XXX: otherwise it fails on compile, as if the dependency detection is broken?
  require Mapillary
  import Mapillary, only: [is_ref: 1]

  @type route() :: {binary(), binary() | nil} | nil
  @typep img_non_nil() :: %{
           img: Mapillary.ref(),
           lat: float(),
           lon: float(),
           bearing: float(),
           seq: Mapillary.ref()
         }
  @type img() :: img_non_nil() | nil
  @typep ref_or_nil() :: Mapillary.ref() | nil
  @type vanilla_images() :: %{required(route()) => [img_non_nil(), ...]}
  @type indexed_images() :: %{
          :index => %{required(binary()) => %{required(route()) => integer()}},
          required(route()) => [img_non_nil(), ...]
        }

  def load(path) do
    {:ok, parsed} = YamlElixir.read_from_file(path)

    parsed
    |> Enum.map(fn {name, seqs} ->
      IO.write("|")
      imgs = Enum.flat_map(seqs, &Mapillary.resolve(&1))
      name = String.split(name, " ", parts: 2) |> List.to_tuple()
      {name, imgs}
    end)
    |> Enum.into(%{})
  end

  @spec load_all(binary()) :: indexed_images()
  def load_all(path) do
    IO.write("Resolving Images: ")

    all =
      path
      |> Path.join("*.yaml")
      |> Path.wildcard()
      |> Task.async_stream(&load(&1), ordered: false, timeout: 15 * 60 * 1000)
      |> Stream.map(fn {:ok, map} -> map end)
      |> Enum.reduce(%{}, &Map.merge(&1, &2))

    IO.puts(" ✓")
    all |> with_index
  end

  @spec associated_route(indexed_images(), [Mapillary.ref()], Mapillary.ref()) ::
          {route(), Mapillary.ref()} | nil
  def associated_route(all, sequences, img) when is_ref(img) and is_list(sequences) do
    if all[:index][img] do
      all[:index][img]
    else
      Mapillary.close_to(img, sequences)
      |> Enum.find_value(fn %{img: close} ->
        # TODO: reject matches which are not in all (which may be filtered by
        # tags on the article)
        all[:index][close]
      end)
    end
    |> Kernel.||(%{})
    |> Enum.find_value(fn {route, pos} ->
      if Map.has_key?(all, route) do
        replacement_img = all[route] |> Enum.at(pos) |> Map.get(:img)
        {route, replacement_img}
      end
    end)
  end

  def find_reverse(all, img, route: {id, _rest} = route) when is_ref(img) do
    Logger.debug("Finding reverse for #{img} from #{inspect(route)}")
    index = all[:index][img][route]
    curImg = all[route] |> Enum.at(index)

    all
    |> Map.delete(route)
    |> find_all_by_id(id)
    |> Map.values()
    |> List.flatten()
    |> Enum.min_by(&CheapRuler.dist(&1, curImg), fn -> nil end)
  end

  @spec find_close(indexed_images(), map(), route: route()) :: img()
  def find_close(all, %{minLon: _} = bbox, route: {id, _rest}) do
    find_all_routes(all, id)
    |> Enum.flat_map(fn name -> all[name] end)
    |> Enum.find(&CheapRuler.inside_bbox?(&1, bbox))
  end

  @spec find_close([img_non_nil(), ...] | fun(), map()) :: img()
  def find_close(imgs, %{minLon: _} = bbox) do
    Enum.find(imgs, &CheapRuler.inside_bbox?(&1, bbox))
  end

  @spec find_around_point(indexed_images(), map(), route: route(), max_dist: float()) :: [
          {route(), float(), img()}
        ]
  def find_around_point(all, %{lon: _, lat: _} = pt, route: {id, _rest}, max_dist: max_dist) do
    find_all_routes(all, id)
    |> Enum.reduce([], fn name, list ->
      {dist, img} = closest_img_from(all[name], pt)

      if dist <= max_dist,
        do: [{name, dist, img} | list],
        else: list
    end)
    |> Enum.sort_by(&elem(&1, 1))
  end

  defp closest_img_from(images, pt) do
    Enum.reduce(images, {nil, nil}, fn next, {dist, prev} ->
      next_dist = CheapRuler.dist(next, pt)

      if dist == nil || next_dist < dist,
        do: {next_dist, next},
        else: {dist, prev}
    end)
  end

  @spec sequences(indexed_images()) :: [binary()]
  def sequences(all) do
    all
    |> Map.values()
    |> List.flatten()
    |> Enum.map(&Map.get(&1, :seq))
    |> Enum.uniq()
    |> Enum.filter(&is_binary/1)
  end

  def as_ids(all) do
    all
    |> Map.keys()
    |> Enum.reject(fn x -> x == :index end)
    |> Enum.map(fn {id, _rest} -> id end)
    |> Enum.uniq()
  end

  @no_surrounding_images %{route: nil, prev: nil, curr: nil, next: nil}

  @type surrounding() :: %{route: route(), curr: img(), prev: img(), next: img()}
  @spec find_surrounding(indexed_images(), [ref_or_nil(), ...], route: route()) ::
          surrounding()
  def find_surrounding(all, imgs, route: route) when is_list(imgs) do
    imgs
    |> Enum.reject(&is_nil/1)
    |> Enum.find_value(fn img ->
      case find_surrounding(all, img, route: route) do
        %{curr: nil} -> nil
        any -> any
      end
    end)
    |> Kernel.||(@no_surrounding_images)
  end

  @spec find_surrounding(indexed_images(), Mapillary.ref(), route: route()) :: surrounding()
  def find_surrounding(all, img, route: route) do
    case find_by_img(all, img, route: route) do
      {:not_found, _} ->
        Logger.debug("No image found for img=#{img} with route=#{inspect(route)} (surrounding)")
        @no_surrounding_images

      {name, imgs} ->
        cur_pos = all[:index][img][name]

        Logger.debug("Found #{img} in #{inspect(name)} at position #{cur_pos}")

        if cur_pos == 0 && length(imgs) >= 2 do
          [curr, next] = Enum.slice(imgs, 0, 2)
          %{route: name, prev: nil, curr: curr, next: next}
        else
          Enum.slice(imgs, (cur_pos - 1)..(cur_pos + 1))
          |> case do
            [prev, curr, next] ->
              %{route: name, prev: prev, curr: curr, next: next}

            [prev, curr] ->
              %{route: name, prev: prev, curr: curr, next: nil}

            [curr] ->
              %{route: name, prev: nil, curr: curr, next: nil}
          end
        end
    end
  end

  def find_next(all, img, route: route) do
    case find_by_img(all, img, route: route) do
      {:not_found, _} ->
        Logger.debug("No image found for img=#{img} with route=#{inspect(route)} (next)")
        nil

      {name, imgs} ->
        cur_pos = all[:index][img][name]
        Enum.at(imgs, cur_pos + 1)
    end
  end

  @spec filter_by_img(indexed_images(), Mapillary.ref()) :: vanilla_images() | %{}
  defp filter_by_img(all, img) when is_ref(img) do
    routes_with_img =
      all
      |> get_in([:index, img])
      # i.e. image is not indexed
      |> Kernel.||(%{})
      |> Map.keys()

    Map.take(all, routes_with_img)
  end

  @spec find_by_img(indexed_images(), Mapillary.ref(), [{:route, route()}]) ::
          {route(), [img(), ...]} | {:not_found, []}
  def find_by_img(all, img, route: route) when is_ref(img) do
    route_id = if is_tuple(route), do: elem(route, 0)
    filtered = filter_by_img(all, img)

    cond do
      # exact match
      x = Map.get(filtered, route) -> {route, x}
      # id match
      x = find_all_by_id(filtered, route_id) |> Map.to_list() |> List.first() -> x
      # no route, use whatever we can find
      x = filtered |> Map.to_list() |> List.first() -> x
      # :(
      true -> {:not_found, []}
    end
  end

  def find_by_img(all, img, route) do
    raise "Invalid call to find_by_img. Received:\n2. img: #{inspect(img)}\n3. route: #{
            inspect(route)
          }\n1. all: #{inspect(all)}"
  end

  def find_all_by_id(_all, nil), do: %{}

  def find_all_by_id(all, given_id) when is_binary(given_id) do
    Map.take(all, find_all_routes(all, given_id))
  end

  def find_all_routes(_all, nil), do: []

  def find_all_routes(all, given_id) when is_binary(given_id) do
    all
    |> Map.keys()
    |> Enum.filter(fn
      {id, _rest} -> id == given_id
      :index -> false
    end)
  end

  def as_osm(all) do
    osm =
      all
      |> Enum.reject(fn {name, _imgs} -> name == :index end)
      |> Enum.flat_map(fn {name, imgs} ->
        imgs
        |> Enum.group_by(fn %{seq: seq} -> seq end)
        |> Enum.map(&sequence_to_osm(&1, name))
      end)
      |> Enum.join("\n\n")

    String.trim("""
      <?xml version='1.0' encoding='UTF-8'?>
      <osm version='0.6' upload='never' generator='JOSM'>
        #{osm}
      </osm>
    """)
  end

  defp with_index(all) do
    index =
      Enum.reduce(all, %{}, fn {name, imgs}, index ->
        imgs
        |> Enum.with_index()
        |> Enum.reduce(index, fn {%{img: img}, pos}, index ->
          Map.update(index, img, %{name => pos}, &Map.put(&1, name, pos))
        end)
      end)
      |> Map.put_new_lazy(Settings.image(), fn -> %{Settings.route() => 0} end)

    Map.put(all, :index, index)
  end

  defp sequence_to_osm({seq, imgs}, {id, rest}) do
    collect =
      imgs
      |> Enum.map(fn img ->
        id = osm_id(img)

        node = """
          <node id='#{id}' version='1' lat='#{img.lat}' lon='#{img.lon}'>
            <tag k='img' v='#{img.img}' />
            <tag k='bearing' v='#{img.bearing}' />
          </node>
        """

        ref = "<nd ref='#{id}' />"

        {node, ref}
      end)

    nodes = collect |> Enum.map(&elem(&1, 0))
    refs = collect |> Enum.map(&elem(&1, 1))

    """
      #{Enum.join(nodes, "\n")}
      <way id='#{Enum.random(1..1_000_000_000)}' version='1'>
        #{Enum.join(refs, "\n")}
        <tag k='type' v='mapillary-sequence' />
        <tag k='name' v='#{id} #{rest}' />
        <tag k='seq' v='#{seq}' />
      </way>
    """
  end

  defp osm_id(%{lat: lat, lon: lon}) do
    [lat, lon]
    |> Enum.map(&Float.round(&1, 7))
    |> Enum.map(&Float.to_string/1)
    |> Enum.map(&String.replace(&1, ".", ""))
    |> Enum.map(&String.pad_trailing(&1, 9, "0"))
    |> Enum.join("")
  end
end
