defmodule Mix.Tasks.Velo.Videos.Adhoc do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Print commands to generate a nearly lossless ad-hoc video for further processing"
  def run(args) do
    Video.Dir.must_exist!()
    if args == [], do: help(), else: generate(args)
  end

  defp help do
    IO.puts("""
    Specify which videos and desired parts like this:application
    mix velo.videos.adhoc \\
      <video> <start> <end> \\
      <video> <start> <end> \\
      …

    e.g.
    mix velo.videos.adhoc \\
      2022-01-01/GX00001 start        00:00:16.683 \\
      2022-01-01/GX00002 00:00:01.123 end
    """)
  end

  defp generate(args) do
    sources =
      args
      |> Enum.chunk_every(3)
      |> Enum.map(fn [filename, start, stop] ->
        start =
          case start do
            "start" -> :start
            "steamless" -> :seamless
            o -> o
          end

        stop = if stop == "end", do: :end, else: stop
        {filename, start, stop}
      end)

    sources
    |> Video.Renderer.adhoc_cmd()
    |> Util.cli_printer()
    |> IO.puts()
  end
end
