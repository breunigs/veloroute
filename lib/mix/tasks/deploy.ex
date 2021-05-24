defmodule Mix.Tasks.Deploy do
  use Mix.Task
  @cwd File.cwd!()

  @shortdoc "Builds the site using docker, then uploads it"
  def run(["skip-build"]) do
    deploy_tar_gz()
  end

  def run([]) do
    build_tar_gz()
    deploy_tar_gz()
  end

  defp build_tar_gz() do
    make_build_env()
    test()
    make_release()
  end

  defp deploy_tar_gz() do
    make_release_image()
    ensure_container_runs()

    IO.puts("Image: #{Docker.image_name_release()}")
    upload()

    if Cli.confirm(
         "\n\nReady. Do you want to restart the service now? This takes about 3 minutes."
       ) do
      rename_on_remote()
      update_mapbox()
      restart()
    end
  end

  defp make_build_env() do
    Util.banner("Creating Build Environment")
    Docker.build_devel_image()
  end

  defp test() do
    Util.banner("Unit tests")
    Docker.mix("test --color")
    Util.banner("Dialyzer")
    Docker.mix("dialyzer")
  end

  defp make_release() do
    [
      ["mix", "deps.get"],
      ["mix", "deps.compile"],
      ["npm", "--prefix", "./assets", "ci", "--progress=false", "--no-audit", "--loglevel=error"],
      ["npm", "run", "--prefix", "./assets", "deploy"],
      [Path.join(@cwd, "tools/update_favicons.sh")],
      ["mix", "phx.digest"],
      ["mix", "compile"],
      ["mix", "warm_caches"],
      ["mix", "update_gpx"],
      ["mix", "release", "--overwrite", "--quiet"]
    ]
    |> Stream.each(fn cmd -> Util.banner("Release: #{Enum.join(cmd, " ")}") end)
    |> Stream.each(fn
      ["mix" | cmd] -> Docker.mix(cmd, "prod")
      other -> Util.cmd(other)
    end)
    |> Enum.to_list()
  end

  defp make_release_image() do
    Util.banner("Building Release Image")
    Docker.build_release_image()
  end

  defp ensure_container_runs() do
    Util.banner("Testing the image can boot")
    Docker.stop_release()

    container = Task.async(&Docker.boot_release/0)

    try do
      true = Enum.find_value(0..10, &try_to_query_release_container/1)
    after
      Docker.stop_release()
    end

    Task.await(container, :infinity)
  end

  defp try_to_query_release_container(_try) do
    try do
      {output, 0} = System.cmd("docker", ["port", Docker.container_name_release()])
      port = output |> String.split(":") |> List.last() |> String.trim()
      {:ok, response} = Tesla.get("http://localhost:#{port}")

      if response.status == 200 do
        IO.puts("✓ Image boots fine and replies with 200")
        true
      else
        IO.puts("not yet (code=#{response.status})…")
        Process.sleep(1_000)
        false
      end
    rescue
      _ ->
        Process.sleep(1_000)
        false
    end
  end

  defp upload() do
    Util.banner("copying to image to #{Settings.deploy_ssh_name()}")

    Util.cmd([
      "sh",
      "-c",
      "docker save '#{Docker.image_name_release()}' | bzip2 | ssh #{Settings.deploy_ssh_name()} 'bunzip2 | docker load'"
    ])
  end

  defp rename_on_remote() do
    Util.banner("Renaming")

    Util.cmd([
      "ssh",
      Settings.deploy_ssh_name(),
      "docker",
      "tag",
      Docker.image_name_release(),
      "veloroute.hamburg/v1:latest"
    ])
  end

  defp update_mapbox() do
    Util.banner("Updating Mapbox")
    # TODO: need to make tippecanoe available in container
    # Docker.mix("update_mapbox")
    Mix.Tasks.UpdateMapbox.run(nil)
  end

  defp restart() do
    Util.banner("Restarting")

    System.cmd(
      "ssh",
      [
        Settings.deploy_ssh_name(),
        "sudo",
        "/bin/systemctl",
        "restart",
        "veloroute2.service"
      ],
      into: IO.stream(:stdio, :line)
    )
  end
end
