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
        "ELIXIR_VERSION=#{ToolVersions.get(:elixir)}",
        "--build-arg",
        "ERLANG_VERSION=#{ToolVersions.get(:erlang)}",
        "--build-arg",
        "DEBIAN_VERSION=#{ToolVersions.get(:debian)}",
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
        "DEBIAN_VERSION=#{ToolVersions.get(:debian)}",
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

  @spec build(binary()) :: Util.Cmd2.exec_result()
  def build(dockerfile) do
    "." <> name = Path.extname(dockerfile)
    img_name = "veloroute.hamburg/docker:#{name}"
    work_dir = Path.dirname(dockerfile)

    Util.Cmd2.exec(
      [
        "docker",
        "build",
        "-f",
        dockerfile,
        work_dir,
        "--network",
        "host",
        "--build-arg",
        "UID=#{Util.user_id()}",
        "--build-arg",
        "GID=#{Util.group_id()}",
        "--build-arg",
        "RENDER_GID=#{Util.group_id("render")}",
        "--build-arg",
        "DEBIAN_VERSION=#{ToolVersions.get(:debian)}",
        "-t",
        img_name
      ],
      env: [{"DOCKER_BUILDKIT", "1"}],
      raise: true,
      stdout: "",
      stderr: "",
      name: "Building “#{name}”"
    )
  end

  @spec run(binary(), list(binary()), keyword()) :: Util.Cmd2.exec_result()
  def run(dockerfile, extra_args \\ [], opts \\ [env: []]) do
    "." <> name = Path.extname(dockerfile)
    img_name = "veloroute.hamburg/docker:#{name}"
    container_name = clean_name("veloroute2#{name}", opts[:name])
    cache_dir = Path.join([File.cwd!(), "data", "cache"])

    args = [
      "docker",
      "run",
      "--user",
      "#{Util.user_id()}:#{Util.group_id()}",
      "--rm",
      "--name",
      container_name,
      "--mount",
      "type=bind,source=#{cache_dir},target=/workdir"
    ]

    extra_mounts =
      Enum.flat_map(Keyword.get(opts, :mounts, %{}), fn {from, to} ->
        from = Path.expand(from)
        to = Path.expand(to)
        ["--mount", "type=bind,source=#{from},target=#{to}"]
      end)

    args = args ++ extra_mounts
    opts = Keyword.delete(opts, :mounts)

    args = if File.exists?("/dev/dri"), do: args ++ ["--device", "/dev/dri:/dev/dri"], else: args
    args = if docker_supports_gpu(), do: args ++ ["--gpus", "all"], else: args
    args = args ++ extra_video_mount("/workdir") ++ [img_name] ++ extra_args

    try do
      Util.Cmd2.exec(
        args,
        opts ++ [raise: true, kill: "docker stop --time 2 #{container_name}"]
      )
    rescue
      exp ->
        case exp do
          %RuntimeError{message: msg} ->
            %{result: {:error, msg}}

          exp ->
            %{result: {:error, inspect(exp)}}
        end
    after
      # Docker creates an empty dir when mounting the `extra_video_mount`. Since
      # the outer folder is also mounted, the empty folder shows up on the host.
      # If it's deleted on the host, it disappears from the container as well,
      # breaking the container. Hence we can only delete this folder safely if
      # there are no other containers running that use it. This would need a
      # `flock` mechanism or similar, which is effort, so we just ignore this.
      # File.rmdir(Path.join(cache_dir, "videos"))
    end
  end

  defp clean_name(str, extra \\ "") do
    "#{str} #{extra}"
    |> String.trim()
    |> String.replace(~r/[^a-zA-Z0-9]/, "")
  end

  @spec build_and_run(binary(), list(binary()), keyword()) :: Util.Cmd2.exec_result()
  def build_and_run(dockerfile, extra_args \\ [], opts \\ [env: []]) do
    with %{result: :ok} <- build(dockerfile) do
      run(dockerfile, extra_args, opts)
    end
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

  use Memoize
  @spec docker_supports_gpu() :: bool()
  defmemop docker_supports_gpu do
    {out, status} =
      System.cmd("docker", ["run", "--rm", "--gpus", "all", "hello-world"], stderr_to_stdout: true)

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

    Util.Cmd2.exec(docker ++ extra_video_mount("/") ++ [@image_name_detector], raise: true)
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
