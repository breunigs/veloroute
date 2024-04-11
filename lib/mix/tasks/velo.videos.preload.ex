defmodule Mix.Tasks.Velo.Videos.Preload do
  use Mix.Task
  require Logger

  # Dialyzer ignores the spec for deploy_video_copy_cmd and thus complains about the "dead" code path
  @dialyzer {:nowarn_function, run: 1}
  @dialyzer {:nowarn_function, copy: 2}

  @shortdoc "Run command that copies rendered videos onto server"
  def run(_) do
    case Settings.deploy_video_copy_cmd() do
      nil -> IO.puts("No video copy/preload command configured, skipping")
      [exe | cmd] -> copy(exe, cmd)
      cmd -> IO.puts("video copy command was not understood: #{inspect(cmd)}")
    end
  end

  defp copy(exe, cmd) do
    try do
      System.cmd(exe, cmd)
      |> case do
        {_msgs, 0} ->
          IO.puts("✓ video sync")

        {msgs, exit_code} ->
          Logger.error("FAILED video sync with exit code #{exit_code}:\n#{msgs}\n\n")
      end
    rescue
      error ->
        Logger.error("FAILED video sync:\n#{inspect(error)}\n\n")
    end
  end
end
