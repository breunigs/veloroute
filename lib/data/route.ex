defmodule Data.Route do
  @type t :: any()
  @callback index() :: %{required(binary()) => %{required(Data.Sequence.name()) => integer()}}
  @callback parsed() :: %{required(Data.Sequence.name()) => [Data.Image.img_non_nil(), ...]}

  import Mapillary, only: [is_ref: 1]

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      @behaviour Data.Route

      @parsed Data.Route.load(opts[:yaml], __MODULE__)
      @index Data.Route.index(@parsed, __MODULE__)

      @impl Data.Route
      def parsed, do: @parsed
      @impl Data.Route
      def index, do: @index

      defoverridable parsed: 0
      defoverridable index: 0
    end
  end

  def load(yaml, module) do
    Benchmark.measure("#{module}: parsing yaml #{}", fn ->
      {:ok, parsed} = YamlElixir.read_from_string(yaml)

      parsed
      |> Enum.map(fn {name, seqs} ->
        imgs =
          seqs
          |> Enum.with_index()
          |> Enum.flat_map(fn {seq, idx} ->
            seq
            |> Mapillary.resolve()
            |> Enum.map(&Map.put(&1, :seq_idx, idx))
          end)

        name = String.split(name, " ", parts: 2) |> List.to_tuple()
        {name, imgs}
      end)
      |> Enum.into(%{})
    end)
  end

  def index(route, module) do
    Benchmark.measure("#{module}: building index", fn ->
      idx =
        Enum.reduce(route, %{}, fn {name, imgs}, index ->
          imgs
          |> Enum.with_index()
          |> Enum.reduce(index, fn {%{img: img}, pos}, index ->
            Map.update(index, img, %{name => pos}, &Map.put(&1, name, pos))
          end)
        end)

      if Map.has_key?(route, Settings.sequence()),
        do: Map.put_new(idx, Settings.image(), %{Settings.sequence() => 0}),
        else: idx
    end)
  end

  @spec sequences_with_img(t(), Mapillary.ref()) :: list(Data.Sequence.t())
  def sequences_with_img(route, img) when is_ref(img) do
    with map when is_map(map) <- route.index[img] do
      Enum.map(map, fn {route_name, _pos} ->
        Data.Sequence.new(
          group: elem(route_name, 0),
          description: elem(route_name, 1),
          route: route
        )
      end)
    end || []
  end

  @spec sequences_with_group(t(), binary()) :: list(Data.Sequence.t())
  def sequences_with_group(route, group) do
    route.parsed
    |> Enum.map(fn
      {{^group, description}, _imgs} ->
        Data.Sequence.new(
          group: group,
          description: description,
          route: route
        )

      {_route_name, _imgs} ->
        nil
    end)
    |> Enum.reject(&is_nil/1)
  end

  @spec sequences(t()) :: list(Data.Sequence.t())
  def sequences(route) do
    route.parsed
    |> Enum.map(fn {{group, description}, _imgs} ->
      Data.Sequence.new(
        group: group,
        description: description,
        route: route
      )
    end)
  end

  @spec has_group?(t(), Data.Sequence.group()) :: boolean()
  def has_group?(route, group) do
    Enum.any?(route.parsed, fn
      {{^group, _description}, _imgs} -> true
      _ -> false
    end)
  end

  @spec find_image(t(), Mapillary.ref()) :: {Data.Sequence.t(), Data.Image.img_non_nil()} | nil
  def find_image(route, img) when is_ref(img) do
    with map when is_map(map) <- route.index[img],
         {sequence_name, img_position} <- Util.map_first(map),
         img when not is_nil(img) <- route.parsed[sequence_name] |> Enum.at(img_position) do
      {
        Data.Sequence.new(
          group: elem(sequence_name, 0),
          description: elem(sequence_name, 1),
          route: route
        ),
        img
      }
    end
  end

  @spec find_reverse(t(), Mapillary.ref()) :: {Data.Sequence.t(), Mapillary.ref()} | nil
  def find_reverse(route, img) when is_ref(img) do
    with {sequence, full_img} <- find_image(route, img) do
      route
      |> sequences()
      |> List.delete(sequence)
      |> Enum.map(fn seq ->
        {dist, img} = Data.Sequence.closest(seq, full_img)
        {seq, dist, img}
      end)
      |> Enum.sort_by(&elem(&1, 1))
      |> List.first()
      |> case do
        nil -> nil
        {seq, _dist, img} -> {seq, img}
      end
    end
  end

  @spec by_tag(binary()) :: module() | nil
  @deprecated "this should search by sequence group maybe"
  def by_tag(tag) when is_binary(tag) do
    ["Route#{tag}", String.capitalize(tag)]
    |> Enum.map(&Module.concat(Data.Route, &1))
    |> Enum.find(fn mod ->
      case Code.ensure_compiled(mod) do
        {:module, ^mod} -> true
        _ -> false
      end
    end)
  end

  @spec mapillary_sequence_refs(t()) :: list(Mapillary.ref())
  def mapillary_sequence_refs(sequence) do
    sequence.parsed
    |> Map.values()
    |> List.flatten()
    |> Enum.map(&Map.get(&1, :seq))
    |> Enum.uniq()
    |> Enum.filter(&is_ref/1)
    |> Enum.sort()
  end

  @spec images(t()) :: Enumerable.t()
  def images(sequence) do
    sequence.parsed
    |> Stream.flat_map(fn {_name, imgs} -> imgs end)
  end
end
