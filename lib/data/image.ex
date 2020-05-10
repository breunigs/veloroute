defmodule Data.Image do
  require Logger
  # XXX: otherwise it fails on compile, as if the dependency detection is broken?
  require Mapillary

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

  def load_all(path) do
    IO.write("Resolving Images: ")

    all =
      File.ls!(path)
      |> Task.async_stream(
        fn filename ->
          load(Path.join([path, filename]))
        end,
        ordered: false
      )
      |> Stream.map(fn {:ok, map} -> map end)
      |> Enum.reduce(%{}, &Map.merge(&1, &2))

    IO.puts(" ✓")
    all |> with_index
  end

  def find_reverse(all, img, route: {id, _rest} = route) when is_binary(img) do
    Logger.debug("Finding reverse for #{img} from #{inspect(route)}")
    index = all[:index][img][route]
    curImg = all[route] |> Enum.at(index)

    all
    |> Map.delete(route)
    |> find_all_by_id(id)
    |> Map.values()
    |> List.flatten()
    |> Enum.min_by(fn img ->
      CheapRuler.dist(img, curImg)
    end)
  end

  def sequences(all) do
    all |> Map.values() |> List.flatten() |> Enum.map(&Map.get(&1, :seq)) |> Enum.uniq()
  end

  def find_surrounding(all, img, route: route) do
    case find_by_img(all, img, route: route) do
      {:not_found, _} ->
        Logger.debug("No image found for img=#{img} with route=#{inspect(route)}")
        %{prev: nil, curr: nil, next: nil}

      {name, imgs} ->
        cur_pos = all[:index][img][name]

        Logger.debug("Found #{img} in #{inspect(name)} at position #{cur_pos}")

        if cur_pos == 0 do
          [curr, next] = Enum.slice(imgs, 0, 2)
          %{route: name, prev: nil, curr: curr, next: next}
        else
          Enum.slice(imgs, (cur_pos - 1)..(cur_pos + 1))
          |> case do
            [prev, curr, next] ->
              %{route: name, prev: prev, curr: curr, next: next}

            [prev, curr] ->
              %{route: name, prev: prev, curr: curr, next: nil}
          end
        end
    end
  end

  def find_next(all, img, route: route) do
    case find_by_img(all, img, route: route) do
      {:not_found, _} ->
        Logger.debug("No image found for img=#{img} with route=#{inspect(route)}")
        nil

      {name, imgs} ->
        cur_pos = all[:index][img][name]
        Enum.at(imgs, cur_pos + 1)
    end
  end

  def find_by_img(all, img), do: find_by_img(all, img, route: {nil, nil})

  def find_by_img(all, img, route: {id, _rest} = route) do
    all = find_all_by_img(all, img)

    cond do
      # exact match
      x = Map.get(all, route, nil) ->
        {route, x}

      # id match
      x = find_all_by_id(all, id) |> Enum.to_list() |> List.first() ->
        x

      # whatever we can find
      x = all |> Enum.to_list() |> List.first() ->
        x

      # :(
      true ->
        {:not_found, []}
    end
  end

  def find_all_by_img(all, img) do
    case get_in(all, [:index, img]) do
      nil ->
        Logger.warn("Searching for image '#{img}', which is not in index")
        %{}

      list ->
        Map.take(all, Map.keys(list))
    end
  end

  def find_all_by_id(all, given_id) when is_binary(given_id) do
    keys =
      all
      |> Map.keys()
      |> Enum.filter(fn
        {id, _rest} -> id == given_id
        :index -> false
      end)

    Map.take(all, keys)
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

    Map.put(all, :index, index)
  end

  defp sequence_to_osm({seq, imgs}, name) do
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
        <tag k='name' v='#{name}' />
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

defmodule Data.ImageCache do
  @image_path "data/images/"
  @glob_path @image_path <> "*.yaml"

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  def __phoenix_recompile__?() do
    Path.wildcard(@glob_path) |> :erlang.md5() != unquote(paths_hash)
  end

  if Mix.env() == :prod do
    @images Benchmark.measure("loading images", fn -> Data.Image.load_all(@image_path) end)
    def images, do: @images

    @sequences Benchmark.measure("loading sequences", fn -> Data.Image.sequences(@images) end)
    def sequences, do: @sequences
  else
    use Memoize

    defmemo(images(),
      do: Benchmark.measure("loading images", fn -> Data.Image.load_all(@image_path) end)
    )

    defmemo(sequences(),
      do: Benchmark.measure("loading sequences", fn -> Data.Image.sequences(images()) end)
    )
  end
end
