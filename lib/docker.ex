defmodule Docker do
  @cwd File.cwd!()
  @image_name_devel "veloroute.hamburg/docker:devel"
  @image_name_release "veloroute.hamburg/docker:release-#{:os.system_time(:millisecond)}"
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

    extra_video_mount =
      with {:ok, real} <- File.read_link("data/videos") do
        ["--mount", ~s|type=bind,source=#{real},target=/build/data/videos|]
      else
        _ -> []
      end

    Util.cmd(
      docker ++ extra_video_mount ++ [@image_name_devel] ++ args,
      into: line_stream()
    )
  end

  def container_name_release, do: @container_name_release
  def image_name_release, do: @image_name_release

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

    extra_video_mount =
      with {:ok, real} <- File.read_link("data/videos") do
        ["--mount", ~s|type=bind,source=#{real},target=/app/data/videos|]
      else
        _ -> []
      end

    cli = docker ++ extra_video_mount ++ [@image_name_release]
    # IO.puts(Enum.join(cli, " "))

    Util.cmd(cli, into: line_stream())
  end

  def stop_release() do
    try do
      Util.cmd(["docker", "stop", container_name_release()])
    rescue _ ->
    end
  end
end
