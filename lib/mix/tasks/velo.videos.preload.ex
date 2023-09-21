defmodule Mix.Tasks.Velo.Videos.Preload do
  use Mix.Task

  @shortdoc "Run command that copies rendered videos onto server"
  def run(_) do
    [exe | cmd] = Settings.deploy_video_copy_cmd()

    try do
      System.cmd(exe, cmd)
      |> case do
        {_msgs, 0} ->
          IO.puts("✓ video sync")

        {msgs, exit_code} ->
          IO.puts(:stderr, "FAILED video sync with exit code #{exit_code}:\n#{msgs}\n\n")
      end
    rescue
      error ->
        IO.puts(:stderr, "FAILED video sync:\n#{inspect(error)}\n\n")
    end
  end
end
