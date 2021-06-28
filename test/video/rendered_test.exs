defmodule Video.RenderedTest do
  use ExUnit.Case, async: true
  doctest Video.Rendered

  test "produces correct video trim commands" do
    [_exe_path, _video1, start1, end1, _video2, start2, end2] =
      Video.Rendered.concat(Video.RenderedTest.Example)

    assert %{
             start1: start1,
             end1: end1,
             start2: start2,
             end2: end2
           } == %{
             start1: "0:00:01.337",
             end1: "0:00:01.737",
             start2: "0:00:00.000",
             end2: "0:00:00.123"
           }
  end

  test "produces correct video preview commands" do
    cmds =
      Video.RenderedTest.Example
      |> Video.Rendered.preview(123)
      |> Enum.map(fn preview ->
        # remove player part and join as string
        preview |> Enum.take_while(fn x -> x != "|" end) |> Enum.join(" ")
      end)

    assert [
             "./tools/video_concat.rb videos/source/1.mp4 0:00:01.337 0:00:01.737 videos/source/2.mp4 0:00:00.000 0:00:00.123",
             "./tools/video_concat.rb videos/source/1.mp4 0:00:01.614 0:00:01.737 videos/source/2.mp4 0:00:00.000 0:00:00.123"
           ] == cmds
  end

  defmodule Example do
    @behaviour Video.Rendered

    @impl Video.Rendered
    def name(), do: "example"
    @impl Video.Rendered
    def created(), do: "definitely today"
    @impl Video.Rendered
    def hash(), do: "badc0ffeebadc0ffeebadc0ffeebadc0"
    @impl Video.Rendered
    def length_ms(), do: 400
    @impl Video.Rendered
    def sources(),
      do: [
        {"1.mp4", "0:00:01.337", "0:00:01.737"},
        {"2.mp4", "0:00:00.000", "0:00:00.123"}
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
  end
end
