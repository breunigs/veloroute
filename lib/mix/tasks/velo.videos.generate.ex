defmodule Mix.Tasks.Velo.Videos.Generate do
  use Mix.Task
  import Guards

  @shortdoc "Finds videos in routes and articles and generates their metadata"
  def run(["all"]) do
    generate(fn _track -> true end)
    |> list_unused()
  end

  def run(["new"]) do
    existing =
      Video.Generator.all()
      |> Enum.filter(& &1.rendered?)
      |> Enum.map(&{{&1.renderer(), &1.sources()}, true})
      |> Enum.into(%{})

    generate(fn track -> !Map.has_key?(existing, {track.renderer, track.videos}) end)
  end

  def run([<<y::binary-size(4)>> <> "-" <> <<m::binary-size(2)>> <> "-" <> <<d::binary-size(2)>>]) do
    generate(fn track -> Video.Track.newer?(track, "#{y}-#{m}-#{d}") end)
  end

  def run([num]) do
    with {renderer_version, ""} <- Integer.parse(num) do
      generate(fn track -> track.renderer == renderer_version end)
    else
      _ -> run([])
    end
  end

  def run(_args) do
    IO.puts(
      :stderr,
      """
      Please specify which video renders to generate:
      * 'all'  = create new from tracks and update all existing ones
      * 'new'  = only for un-rendered tracks (as matched by the sources)
      * <date> = e.g. 2020-11-23, where any source video recorded on or after date
      * <n>    = where n is an integer for the corresponding renderer version
      """
    )
  end

  @spec generate((Video.Track.t() -> boolean())) :: [Video.Generator.t() | nil]
  defp generate(filter) do
    Article.List.all()
    |> Stream.flat_map(& &1.tracks())
    |> Stream.filter(filter)
    |> Stream.uniq()
    |> Tqdm.tqdm(description: "generating")
    |> Parallel.map(fn track ->
      banner = """

      ###########################################################
      # #{track.text} / #{track.direction}
      # from #{track.parent_ref}
      ###########################################################
      """

      Video.Generator.save_from_track(track)
      |> case do
        rendered when is_module(rendered) ->
          rendered

        {:error, reason} ->
          IO.puts(:stderr, banner)
          IO.puts(:stderr, "Failed to generate:\n#{reason}")
          nil

        other ->
          IO.puts(:stderr, banner)
          IO.puts(:stderr, "Failed to generate, got unexpected output:\n#{inspect(other)}")
          nil
      end
    end)
    |> tap(fn _ -> Mix.Tasks.Compile.Elixir.run(["--ignore-module-conflict"]) end)
  end

  defp list_unused(rendered) do
    keep = rendered |> MapSet.new()
    all = Video.Generator.all() |> MapSet.new()
    unused = MapSet.difference(all, keep)

    if MapSet.size(unused) > 0 do
      IO.puts(:stderr, "unused/unreferenced rendered videos:")
      Enum.each(unused, &IO.puts(:stderr, "#{Video.Generator.path(&1)}: #{&1.name()}"))
      IO.puts(:stderr, "\n")
    end
  end
end
