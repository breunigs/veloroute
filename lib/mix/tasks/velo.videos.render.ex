defmodule Mix.Tasks.Velo.Videos.Render do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Renders videos that are still missing. Provide arguments to filter (e.g. hashes to render)"
  def run(filters) do
    Video.Dir.must_exist!(fn ->
      filters |> find() |> Enum.sort_by(& &1.name) |> info() |> render()
    end)
  end

  defp info(videos) do
    IO.puts(:stderr, "Rendering #{length(videos)} videos:")
    Enum.each(videos, fn vid -> IO.puts(:stderr, "* #{vid.hash()} #{vid.name()}") end)
    IO.puts(:stderr, "")
    videos
  end

  @spec find(nil | [binary()]) :: any()
  defp find(nil), do: Video.Generator.pending()
  defp find([]), do: Video.Generator.pending()

  defp find(filters) when is_list(filters) and length(filters) >= 1 do
    filters = filters |> Enum.flat_map(&clean/1) |> MapSet.new()

    Video.Generator.pending()
    |> Enum.reject(fn video ->
      ident = [video.name(), video.hash()] |> Enum.flat_map(&clean/1) |> MapSet.new()
      MapSet.disjoint?(ident, filters)
    end)
  end

  @spec clean(binary()) :: [binary()]
  defp clean(string) do
    string
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9\s-]+/, " ")
    |> String.trim()
    |> String.split(~r/\s+/)
  end

  defp render(videos) do
    Enum.each(videos, fn rendered ->
      banner = """

      ###########################################################
      # Name: #{rendered.name}
      # Hash: #{rendered.hash}
      ##########################################################
      """

      case Video.Renderer.render(rendered) do
        :ok ->
          :ok

        {:error, reason} ->
          IO.puts(banner)
          IO.puts("failed: #{reason}")
      end
    end)
  end
end
