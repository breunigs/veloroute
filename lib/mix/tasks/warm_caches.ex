defmodule Mix.Tasks.WarmCaches do
  use Mix.Task

  @shortdoc "Ensures that all caches are warmed"
  def run(_) do
    Mix.Task.run("app.start")

    articles =
      Task.async(fn ->
        Data.ArticleCache.get()
        |> Map.keys()
        |> Enum.each(&VelorouteWeb.ArticleView.render(&1, []))
      end)

    images = Task.async(fn -> Mix.Tasks.UpdateImages.run(nil) end)

    Task.await(articles, :infinity)
    Task.await(images, :infinity)
    :ok
  end
end
