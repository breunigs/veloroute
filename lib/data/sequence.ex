defmodule Data.Sequence do
  @enforce_keys [:route, :name, :group, :description]
  defstruct @enforce_keys

  import Mapillary.Types, only: [is_ref: 1]

  @type group() :: binary()
  @type description() :: binary()
  @type name() :: {group(), description()}

  @type t() :: %__MODULE__{
          name: name(),
          route: Route.t(),
          group: group(),
          description: description()
        }

  def new(group: group, description: desc, route: route)
      when is_binary(group) and is_binary(desc) and not is_nil(route) do
    name = {group, desc}

    if route.parsed[name] == nil,
      do:
        raise(
          "Invalid sequence created: #{inspect(route)} does not have a sequence named #{inspect(name)}"
        )

    %__MODULE__{
      name: name,
      route: route,
      group: group,
      description: desc
    }
  end

  @spec sort_by_relatedness(list(t()), group(), description()) :: list(t())
  def sort_by_relatedness(seqs, group, desc) do
    Enum.sort_by(seqs, fn
      %{group: ^group, description: ^desc} -> 0
      %{group: ^group} -> 1
      _ -> 2
    end)
  end

  @spec images(t()) :: list(Mapillary.Types.ref())
  def images(seq), do: seq.route.parsed[seq.name]

  @spec closest(t(), Geo.CheapRuler.point()) :: {float(), Data.Image.img_non_nil()}
  def closest(%__MODULE__{} = seq, pt = %{lon: lon, lat: lat})
      when is_float(lon) and is_float(lat) do
    seq
    |> images()
    |> Enum.reduce({nil, nil}, fn next, {dist, prev} ->
      next_dist = Geo.CheapRuler.dist(next, pt)

      if dist == nil || next_dist < dist,
        do: {next_dist, next},
        else: {dist, prev}
    end)
  end

  @type surrounding() :: %{
          seq: t() | nil,
          curr: Data.Image.img_non_nil(),
          prev: Data.Image.img(),
          next: Data.Image.img()
        }
  @spec find_surrounding(t(), Mapillary.Types.ref()) :: surrounding() | nil
  def find_surrounding(seq, img) when is_ref(img) do
    with img_pos when is_integer(img_pos) <- get_in(seq.route.index, [img, seq.name]) do
      imgs = images(seq)

      if img_pos == 0 && length(imgs) >= 2 do
        [curr, next] = Enum.slice(imgs, 0, 2)
        %{seq: seq, prev: nil, curr: curr, next: next}
      else
        Enum.slice(imgs, (img_pos - 1)..(img_pos + 1))
        |> case do
          [prev, curr, next] ->
            %{seq: seq, prev: prev, curr: curr, next: next}

          [prev, curr] ->
            %{seq: seq, prev: prev, curr: curr, next: nil}

          [curr] ->
            %{seq: seq, prev: nil, curr: curr, next: nil}
        end
      end
    end
  end

  @type mapillary_sequence() :: %{
          from: Mapillary.Types.ref(),
          to: Mapillary.Types.ref(),
          seq: Mapillary.Types.ref(),
          seq_idx: integer()
        }
  @spec mapillary_sequence_from(t(), Mapillary.Types.ref()) :: list(mapillary_sequence()) | nil
  def mapillary_sequence_from(seq, img) when is_ref(img) do
    with img_pos when not is_nil(img_pos) <- get_in(seq.route.index, [img, seq.name]) do
      seq
      |> images()
      |> Enum.slice(img_pos..-1)
      |> Enum.reduce([], fn
        %{seq_idx: idx, img: img}, [%{seq_idx: idx} = last | prevs] ->
          [%{last | to: img} | prevs]

        %{seq_idx: idx, img: img, seq: seq}, seqs ->
          [%{to: img, from: img, seq: seq, seq_idx: idx} | seqs]
      end)
      |> Enum.reverse()
    end
  end
end
