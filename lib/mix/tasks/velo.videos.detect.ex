defmodule Mix.Tasks.Velo.Videos.Detect do
  use Mix.Task
  @requirements ["app.start"]
  @container_ref {"detecting blurs", {:dockerfile, "tools/detection/Dockerfile.pytorch"}}

  @shortdoc "Detects regions to anonymize and stores the results alongside the videos"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run() do
    with :ok <-
           Util.Docker.build_and_run(
             @container_ref,
             %{docker_args: ["--tty"], mount_videos_in_dir: "/", run_as_local_user: false},
             []
           ) do
      :ok
    else
      {:error, reason} ->
        IO.puts(:stderr, reason)
        exit(:failure)
    end
  end
end
