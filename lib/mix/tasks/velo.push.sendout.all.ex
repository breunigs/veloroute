defmodule Mix.Tasks.Velo.Push.Sendout.All do
  use Mix.Task
  require Logger

  @shortdoc "send push notifications to subscribers for new articles"
  def run(["--run"]) do
    Mix.Task.run("app.start")
    sendout(false)
  end

  def run(_) do
    Mix.Task.run("app.start")
    sendout(true)

    Logger.info("""
    Dry Run finished. To start an actual sendout, rerun this command:

      mix velo.push.sendout.all --run

    Alternatively, you can also run the command from the release image:

      /app/bin/prod rpc "Mix.Tasks.Velo.Push.Sendout.All.sendout(false)"
    """)
  end

  def sendout(dry_run) when is_boolean(dry_run) do
    Push.Sendout.send_all(recent_articles(), dry_run)
  end

  defp recent_articles do
    Article.List.category("Blog")
    |> Article.List.sort(:asc)
    |> Enum.take(-10)
  end
end
