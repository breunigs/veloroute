defmodule OSMWriter do
  import Mapillary, only: [is_ref: 1]

  @spec as_osm(list(Data.Sequence.t())) :: binary()
  def as_osm(sequences) do
    osm =
      sequences
      |> Enum.flat_map(fn seq ->
        Data.Sequence.images(seq)
        |> Enum.group_by(fn %{seq: seq} -> seq end)
        |> Enum.map(&sequence_to_osm(&1, seq.name))
      end)
      |> Enum.join("\n\n")

    String.trim("""
      <?xml version='1.0' encoding='UTF-8'?>
      <osm version='0.6' upload='never' generator='JOSM'>
        #{osm}
      </osm>
    """)
  end

  defp sequence_to_osm({seq, imgs}, {id, rest}) when is_ref(seq) do
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
