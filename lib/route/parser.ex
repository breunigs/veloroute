defmodule Route.Parser do
  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      @behaviour Route
      @behhaviour Route.Behaviour

      @parsed Route.Parser.load(opts, __MODULE__)
      @index Route.Parser.index(@parsed, __MODULE__)

      @impl Route
      def parsed, do: @parsed
      @impl Route
      def index, do: @index

      defoverridable parsed: 0
      defoverridable index: 0

      def id(), do: ""
      def color(), do: "#ff00ee"
      def name(), do: ""
      def osm_relation_ref(), do: ""
      def tracks(), do: []
    end
  end

  defp yaml_from_map(nil), do: nil

  defp yaml_from_map(route_id) do
    Cache.Map.relations()
    |> Map.Element.find_by_tag(:id, route_id)
    |> TrackFinder.ordered()
    |> TrackFinder.with_image_sequences()
    |> Enum.reduce(%{}, fn %{id: id, direction: dir, image_sequence: img_seq}, acc ->
      Map.put(acc, "#{id} (#{dir})", img_seq)
    end)
  end

  defp yaml_from_string(yaml) do
    {:ok, parsed} = YamlElixir.read_from_string(yaml)
    parsed
  end

  def load(opts, module) do
    Benchmark.measure("#{module}: parsing", fn ->
      load_plain(opts)
    end)
  end

  defp load_plain(opts) do
    parsed = yaml_from_map(opts[:id]) || yaml_from_string(opts[:yaml])

    parsed
    |> Enum.reduce(%{}, fn {name, seqs}, acc ->
      imgs =
        seqs
        |> Enum.with_index()
        |> Enum.flat_map(fn {seq, idx} ->
          seq
          |> Mapillary.Resolver.resolve()
          |> Enum.map(&Map.put(&1, :seq_idx, idx))
        end)

      name = String.split(name, " ", parts: 2) |> List.to_tuple()
      Map.put(acc, name, imgs)
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
end
