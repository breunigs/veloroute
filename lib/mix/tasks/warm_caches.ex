defmodule Mix.Tasks.WarmCaches do
  use Mix.Task
  alias VelorouteWeb.FrameLive

  @shortdoc "Ensures that all caches are warmed"
  def run(_) do
    Mix.Task.run("app.start")

    Cache.Articles.get()
    |> Map.keys()
    |> Enum.each(&VelorouteWeb.ArticleView.render(&1, FrameLive.initial_state()))

    :ok
  end
end
