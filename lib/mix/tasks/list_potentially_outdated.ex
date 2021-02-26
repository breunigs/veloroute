defmodule Mix.Tasks.ListPotentiallyOutdated do
  use Mix.Task

  @shortdoc "List articles where “type” doesn't fit start/end construction times"
  def run(_) do
    Mix.Task.run("app.start")

    today = Date.utc_today() |> Date.to_string() |> Data.RoughDate.parse()

    Data.ArticleCache.get()
    |> Map.values()
    |> Enum.each(fn art ->
      start_after_today = Data.RoughDate.compare(art.start, today)
      end_after_today = Data.RoughDate.compare(art.end, today)

      cond do
        start_after_today && art.type == "planned-constuction" ->
          IO.puts("#{art.name}: maybe started already, but is still “planned-construction”")

        end_after_today && art.type == "construction" ->
          IO.puts("#{art.name}: maybe ended already, but is still “construction”")

        true ->
          nil
      end
    end)
  end
end
