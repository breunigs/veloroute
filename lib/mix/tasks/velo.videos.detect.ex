defmodule Mix.Tasks.Velo.Videos.Detect do
  use Mix.Task
  require Logger
  @requirements ["app.start"]
  @container_ref {"detecting blurs", {:dockerfile, "tools/detection/Dockerfile.pytorch"}}

  @shortdoc "Detects regions to anonymize and stores the results alongside the videos. Set device via --device <device>. Optimized GPU weights only work for 16:9 aspect ratio videos. Disable optimized weights via --no-optimized-gpu-weights"
  @moduledoc @shortdoc
  def run(args, opts \\ %{})

  def run(["--device", device | rest], opts) do
    opts = Map.put(opts, :device, device)
    run(rest, opts)
  end

  def run(["--no-optimized-gpu-weights" | rest], opts) do
    opts = Map.put_new(opts, :env, %{})
    opts = Map.update!(opts, :env, &Map.put(&1, "NO_OPTIMIZED_GPU_WEIGHTS", "1"))
    run(rest, opts)
  end

  def run(args, opts) when args == [] do
    Video.Dir.must_exist!(fn -> real_run(opts[:device], opts[:env] || %{}) end)
  end

  defp real_run(device, env) do
    with :ok <-
           Util.Docker.build_and_run(
             @container_ref,
             %{
               docker_args: ["--tty"],
               mount_videos_in_dir: "/",
               run_as_local_user: false,
               environment: env,
               command_args:
                 Util.compact([
                   "/videos/detect_latest.pt",
                   "/videos/source/",
                   device
                 ])
             },
             []
           ) do
      :ok
    else
      {:error, reason} ->
        Logger.error(reason)
        exit(:failure)
    end
  end
end
