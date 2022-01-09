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
    def fade(), do: 50
    @impl Video.Rendered
    def length_ms(), do: 579
    @impl Video.Rendered
    def sources(),
      do: [
        {"1.mp4", "00:00:00.000", "00:00:00.456"},
        {"2.mp4", "00:00:00.000", "00:00:00.123"}
      ]

    @impl Video.Rendered
    def coords(),
      do: [
        %Video.TimedPoint{lat: 53.507, lon: 10.044, time_offset_ms: 0},
        %Video.TimedPoint{lat: 53.508, lon: 10.042, time_offset_ms: 100},
        %Video.TimedPoint{lat: 53.509, lon: 10.040, time_offset_ms: 200},
        %Video.TimedPoint{lat: 53.510, lon: 10.038, time_offset_ms: 300},
        %Video.TimedPoint{lat: 53.511, lon: 10.036, time_offset_ms: 400}
      ]

    @impl Video.Rendered
    def rendered?(), do: true

    @impl Video.Rendered
    def bbox(), do: Geo.CheapRuler.bbox(coords())
  end
end
