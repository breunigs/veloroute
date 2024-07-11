defmodule Video.RenderedTest do
  use ExUnit.Case, async: true
  doctest Video.Rendered

  defmodule Example do
    @behaviour Video.Rendered

    @impl Video.Rendered
    def name(), do: "example"
    @impl Video.Rendered
    def hash(), do: "badc0ffeebadc0ffeebadc0ffeebadc0"
    @impl Video.Rendered
    def length_ms(), do: 579
    @impl Video.Rendered
    def renderer(), do: 2
    @impl Video.Rendered
    def sources(),
      do: [
        {"1.mp4", "00:00:00.000", "00:00:00.456"},
        {"2.mp4", "00:00:00.000", "00:00:00.123"}
      ]

    @impl Video.Rendered
    def recording_dates(),
      do: [%{timestamp: 0, text: "at start"}, %{timestamp: 10, text: "after ten ms"}]

    @impl Video.Rendered
    def street_names(), do: recording_dates()

    @impl Video.Rendered
    def coords(),
      do: [
        %Video.TimedPoint{lat: 53.507, lon: 10.044, time_offset_ms: 0},
        %Video.TimedPoint{lat: 53.508, lon: 10.042, time_offset_ms: 100},
        %Video.TimedPoint{lat: 53.509, lon: 10.040, time_offset_ms: 200},
        %Video.TimedPoint{lat: 53.510, lon: 10.038, time_offset_ms: 300},
        %Video.TimedPoint{lat: 53.511, lon: 10.036, time_offset_ms: 400}
      ]

    @precision 6
    @impl Video.Rendered
    def polyline,
      do: %{
        polyline: Polyline.encode(coords(), @precision),
        precision: @precision,
        # as per the time_offset_ms diffs from coords()
        interval: 100.0
      }

    @impl Video.Rendered
    def rendered?(), do: true

    @impl Video.Rendered
    def bbox(), do: Geo.CheapRuler.bbox(coords())
  end

  test "all vanity names are unique" do
    duplicated_vanities =
      Video.Generator.all()
      |> Enum.map(&Video.Rendered.vanity/1)
      |> Enum.reduce(%{}, fn vanity, acc -> Map.update(acc, vanity, 1, &(&1 + 1)) end)
      |> Map.filter(fn {_vanity, count} -> count > 1 end)
      |> Map.keys()

    assert [] == duplicated_vanities
  end

  test "all street names contain only sensible characters" do
    uncommon_street_names =
      Enum.reduce(Video.Generator.all(), %{}, fn rendered, acc ->
        uncommon_names =
          Enum.reduce(rendered.street_names(), [], fn %{text: text}, acc ->
            ok = Regex.match?(~r/^[a-z0-9äöüßé()\s'.+\/-]*$/ui, text)
            if ok, do: acc, else: [text | acc]
          end)

        if uncommon_names != [], do: Map.put(acc, rendered, uncommon_names), else: acc
      end)

    assert %{} == uncommon_street_names
  end
end
