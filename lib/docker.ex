defmodule Docker do
  @cwd File.cwd!()
  @image_name_devel "veloroute.hamburg/docker:devel"
  @image_name_detector "veloroute.hamburg/docker:detector"
  @image_name_release "veloroute.hamburg/docker:release-#{:os.system_time(:millisecond)}"
  @container_name_detect "veloroute2detect"
  @container_name_release "veloroute2release"

  def line_stream, do: IO.stream(:stdio, :line)

  def build_devel_image() do
    Util.cmd(
      [
        "docker",
        "build",
        "-f",
        "Dockerfile.devel",
        ".",
        "--network",
        "host",
        "--build-arg",
        "UID=#{Util.user_id()}",
        "--build-arg",
        "GID=#{Util.group_id()}",
        "-t",
        @image_name_devel
      ],
      env: [{"DOCKER_BUILDKIT", "1"}]
    )
  end

  def build_release_image() do
    Util.cmd(
      [
        "docker",
        "build",
        "-f",
        "Dockerfile.release",
        ".",
        "--network",
        "host",
        "--build-arg",
        "GIT_COMMIT=#{Git.revision()}",
        "-t",
        @image_name_release
      ],
      env: [{"DOCKER_BUILDKIT", "1"}]
    )

    @image_name_release
  end

  def build_detector_image() do
    Util.cmd(
      [
        "docker",
        "build",
        "-f",
        "tools/detection/Dockerfile.pytorch",
        "tools/detection/",
        "--network",
        "host",
        "-t",
        @image_name_detector
      ],
      env: [{"DOCKER_BUILDKIT", "1"}]
    )
  end

  def mix(args, mix_env \\ "test")
  def mix(args, mix_env) when is_binary(args), do: args |> String.split() |> mix(mix_env)

  def mix(args, mix_env) when is_list(args) do
    docker = [
      "docker",
      "run",
      "-e",
      "MIX_ENV=#{mix_env}",
      "--rm",
      "--name",
      "veloroute2devel",
      "--mount",
      ~s|type=bind,source=#{@cwd}/,target=/build/|
    ]

    Util.cmd(docker ++ extra_video_mount("/build") ++ [@image_name_devel] ++ args,
      into: line_stream()
    )
  end

  def container_name_release, do: @container_name_release
  def image_name_release, do: @image_name_release

  defp extra_video_mount(base_path) do
    with {:ok, real} <- File.read_link(Settings.video_dir_rel()) do
      target_path = Path.join(base_path, Settings.video_dir_rel())
      ["--mount", ~s|type=bind,source=#{real},target=#{target_path}|]
    else
      _ -> []
    end
  end

  defp docker_supports_gpu do
    {out, status} =
      System.cmd("docker", ["run", "--gpus", "all", "hello-world"], stderr_to_stdout: true)

    cond do
      status == 0 ->
        true

      status == 125 && String.contains?(out, "with capabilities: [[gpu]]") ->
        false

      true ->
        IO.puts(
          :stderr,
          "Looks like Docker cannot pass through a GPU. If nvidia-docker is not installed, this is to be expected, but the error message looks different this time: #{out}}"
        )

        false
    end
  end

  def boot_detector do
    docker = ["docker", "run", "--rm"]
    docker = if docker_supports_gpu(), do: docker ++ ["--gpus", "all"], else: docker
    docker = docker ++ ["--tty", "--name", @container_name_detect]

    Util.cmd2(docker ++ extra_video_mount("/") ++ [@image_name_detector])
  end

  def boot_release() do
    docker = [
      "docker",
      "run",
      "--rm",
      "--name",
      @container_name_release,
      "-p",
      "4000"
    ]

    cli = docker ++ extra_video_mount("/app") ++ [@image_name_release]

    try do
      Util.cmd(cli, into: line_stream())
    rescue
      # we don't care if the release fails on shut down
      _ -> nil
    end
  end

  def stop_release() do
    try do
      Util.cmd(["docker", "stop", container_name_release()])
    rescue
      _ -> nil
    end
  end
end
