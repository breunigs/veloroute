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

  def build_and_run(dockerfile, extra_args \\ [], opts \\ [env: []]) do
    "." <> name = Path.extname(dockerfile)
    img_name = "veloroute.hamburg/docker:#{name}"
    container_name = "veloroute2#{name}"
    work_dir = Path.dirname(dockerfile)

    IO.puts(:stderr, "Building “#{name}”")

    Util.cmd2(
      [
        "docker",
        "build",
        "-f",
        dockerfile,
        work_dir,
        "--network",
        "host",
        "-t",
        img_name
      ],
      env: [{"DOCKER_BUILDKIT", "1"}],
      raise: true,
      stdout: "",
      stderr: ""
    )

    IO.puts(:stderr, "Running #{img_name}")

    cache_dir = Path.join([File.cwd!(), "data", "cache"])

    try do
      Util.cmd2(
        [
          "docker",
          "run",
          "-e",
          owner_group_fix(),
          "--rm",
          "--name",
          container_name,
          "--mount",
          ~s|type=bind,source=#{cache_dir},target=/workdir|
        ] ++ extra_video_mount("/workdir") ++ [img_name] ++ extra_args,
        opts ++ [raise: true]
      )
    rescue
      _exp ->
        Util.cmd2(["docker", "stop", "--time", "0", container_name],
          raise: false,
          stdout: "",
          stderr: ""
        )
    end
  end

  defp owner_group_fix() do
    {uid, 0} = System.cmd("id", ["-u"])
    {gid, 0} = System.cmd("id", ["-g"])

    "OWNER_GROUP_FIX=#{String.trim(uid)}:#{String.trim(gid)}"
  end

  def mix(args, mix_env \\ "test")
  def mix(args, mix_env) when is_binary(args), do: args |> String.split() |> mix(mix_env)

  def mix(args, mix_env) when is_list(args) do
    docker = [
      "docker",
      "run",
      "-e",
      "MIX_ENV=#{mix_env}",
      # erlexec needs a shell to be set, even though it's not used
      "-e",
      "SHELL=/bin/sh",
      "-e",
      "LDFLAGS=-static -static-libgcc -static-libstdc++",
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

    Util.cmd2(docker ++ extra_video_mount("/") ++ [@image_name_detector], raise: true)
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
