defmodule Mix.Tasks.ListPotentiallyOutdated do
  use Mix.Task

  @shortdoc "List articles where “type” doesn't fit start/end construction times"
  def run(_) do
    Mix.Task.run("app.start")

    today = Date.utc_today() |> Date.to_string() |> Data.RoughDate.parse()

    Article.List.all()
    |> Enum.each(fn art ->
      started_already = Data.RoughDate.compare(today, art.start()) == :gt
      ended_already = Data.RoughDate.compare(today, art.stop()) == :gt

      cond do
        started_already && art.type() == :planned ->
          IO.puts("#{art.name}: maybe started already, but is still “planned“")

        ended_already && art.type() == :construction ->
          IO.puts("#{art.name}: maybe ended already, but is still “construction”")

        true ->
          nil
      end
    end)
  end
end
