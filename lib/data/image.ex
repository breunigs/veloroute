defmodule Data.Image do
  require Logger

  def load(path) do
    {:ok, parsed} = YamlElixir.read_from_file(path)

    parsed
    |> Enum.into(%{}, fn {k, v} -> {String.to_atom(k), v} end)
    |> Enum.map(fn {name, seqs} ->
      IO.write("|")
      imgs = Enum.flat_map(seqs, &Mapillary.resolve(&1))
      {name, imgs}
    end)
    |> Enum.into(%{})
  end

  def load_all(path) do
    IO.write("Resolving Images: ")

    all =
      File.ls!(path)
      |> Enum.map(fn filename ->
        load(Path.join([path, filename]))
      end)
      |> Enum.reduce(%{}, &Map.merge(&1, &2))

    IO.puts("")
    all
  end

  def find_by_img(all, img) do
    Enum.find(all, fn {_name, imgs} ->
      Enum.any?(imgs, fn %{img: x} -> x == img end)
    end)
  end

  def as_osm(all) do
    osm =
      all
      |> Enum.flat_map(fn {name, imgs} ->
        imgs
        |> Enum.group_by(fn %{seq: seq} -> seq end)
        |> Enum.map(&seqToOsm(&1, name))
      end)
      |> Enum.join("\n\n")

    String.trim("""
      <?xml version='1.0' encoding='UTF-8'?>
      <osm version='0.6' upload='never' generator='JOSM'>
        #{osm}
      </osm>
    """)
  end

  defp seqToOsm({seq, imgs}, name) do
    collect =
      imgs
      |> Enum.map(fn img ->
        id = osmId(img)

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

  defp osmId(%{lat: lat, lon: lon}) do
    [lat, lon]
    |> Enum.map(&Float.round(&1, 7))
    |> Enum.map(&Float.to_string/1)
    |> Enum.map(&String.replace(&1, ".", ""))
    |> Enum.map(&String.pad_trailing(&1, 9, "0"))
    |> Enum.join("")
  end
end
