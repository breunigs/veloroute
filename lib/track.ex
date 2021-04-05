defmodule Track do
  @moduledoc """
  Track contains a shortest path track from a relation's start or end points.
  """
  @enforce_keys [:type, :id, :name, :direction, :full_name, :ways]
  defstruct [:type, :id, :name, :direction, :full_name, :ways, :nodes, :image_sequence]

  import Mapillary, only: [is_ref: 1]
  alias Mapillary.Sequence
  alias Data.Map.Way

  @doc """
  with_nodes takes an existing track and generates a consecutive list of nodes
  in the track, eliminating any duplicates. It returns the track, but with the
  nodes key filled.
  """
  def with_nodes(track)

  def with_nodes(track = %Track{nodes: nodes}) when is_list(nodes), do: track

  def with_nodes(track), do: concatenate_nodes(track)

  @doc """
  with_image_sequence takes an existing track and generates a sequence of
  Mapillary.Sequence from the tags of the ways, duplicating references as
  needed. It returns the track, but with the image_sequence key filled.
  """
  def with_image_sequence(track)

  def with_image_sequence(track = %Track{image_sequence: image_sequence})
      when is_list(image_sequence),
      do: track

  def with_image_sequence(track), do: concatenate_image_seq(track)

  defp concatenate_image_seq(track = %__MODULE__{full_name: full_name, type: type, ways: ways}) do
    img_seq =
      Enum.reduce(ways, [], fn way, img_seq ->
        prev = List.first(img_seq)
        cur = extract_img_tags(way)

        case {prev, cur} do
          # handle edge case where previous sequence is not finished
          {%{to: nil}, %{seq: s, from: f}}
          when is_ref(s) and is_ref(f) ->
            raise """
            Failed to find a continuation: could not find end image for previous sequence.
            Trying to find a #{type} route for #{full_name}.
            Note that the tags are auto-reversed, so do not correspond to the ones in JOSM.
            Prev: #{inspect(prev)}
            Curr: #{inspect(cur)}
            """

          # old one ends in same image as next one continues, join, and overwrite "to"
          {%{seq: s, from: f, to: x}, next = %{seq: s, from: x}} ->
            [%Sequence{seq: s, from: f, to: next[:to]} | tl(img_seq)]

          # new start image, create next entry
          {_, %{seq: s, from: f, to: b}}
          when is_ref(s) and is_ref(f) ->
            [%Sequence{seq: s, from: f, to: b} | img_seq]

          # sequence continues, and has end img, overwrite "to"
          {%{seq: s, from: f}, %{seq: s, to: b}}
          when is_ref(b) ->
            [%Sequence{seq: s, from: f, to: b} | tl(img_seq)]

          # sequence continues, but still has no end img
          {%{seq: s}, %{seq: s}} ->
            img_seq

          # generic error
          {prev, cur} ->
            raise """
            Failed to find a continuation. Trying to find a #{type} route for #{full_name}.
            Prev: #{inspect(prev)}
            Curr: #{inspect(cur)}
            Note that the tags are auto-reversed, so do not correspond to the ones in JOSM.
            """
        end
      end)
      |> Enum.reverse()

    Map.put(track, :image_sequence, img_seq)
  end

  # concatenate_nodes joins the nodes of the ways in order, removing any
  # duplicates. It adds them to the Map as "nodes".
  defp concatenate_nodes(obj = %{ways: ways}) do
    first_node = ways |> hd |> Map.get(:nodes) |> hd
    rest = Enum.flat_map(ways, fn %Way{nodes: [_f | rest]} -> rest end)
    Map.put(obj, :nodes, [first_node | rest])
  end

  # extract_img_tags retrieves the interesting Mapillary image ref tags from the
  # way, using an abbreviated tag format seq/from/to.
  defp extract_img_tags(way) do
    %{
      seq: get_mly_ref(way, :seq_forward),
      from: get_mly_ref(way, :img_forward_start),
      to: get_mly_ref(way, :img_forward_end)
    }
  end

  # get_mly_ref tries to extract a Mapillary reference from the way's tags. It
  # returns nil if the tag is not set, the ref if it is, or it raises if it is
  # invalid. Since it does not know if the way was originally like this or if
  # this is a normalized (=reversed) variant, it includes more than one
  # potential wrong key in the error message.
  defp get_mly_ref(%{id: id, tags: tags}, field) when is_atom(field) do
    case tags[field] do
      nil ->
        nil

      x when is_ref(x) ->
        tags[field]

      wrong ->
        rev_field = field |> Atom.to_string() |> String.replace("forward", "backward")
        raise("Way #{id} has incorrect mapillary ref '#{wrong}' in #{field} or #{rev_field}")
    end
  end
end
