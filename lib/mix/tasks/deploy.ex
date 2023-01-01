defmodule Mix.Tasks.Deploy do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Builds the site using docker, then uploads it"
  def run(skip) do
    skip = parse_cli_args(skip)
    build_tar_gz(skip)
    mirror_links(skip)
    preload_videos(skip)
    deploy_tar_gz(skip)
  end

  defp parse_cli_args(skip) when is_list(skip) do
    Enum.into(skip, %{}, fn s ->
      try do
        {String.to_existing_atom(s), true}
      rescue
        ArgumentError ->
          raise "Unknown build argument #{s}"
      end
    end)
  end

  defp build_tar_gz(%{skip_build: true}), do: nil

  defp build_tar_gz(skip) do
    make_build_env(skip)
    test(skip)
    with_free_port(fn -> make_release(skip) end)
  end

  @required_free_port 4000
  defp with_free_port(block, prev_reason \\ nil) do
    case :gen_tcp.listen(@required_free_port, []) do
      {:ok, port} ->
        try do
          block.()
        after
          Port.close(port)
        end

      {:error, ^prev_reason} ->
        Process.sleep(1000)
        IO.write(".")
        with_free_port(block, prev_reason)

      {:error, reason} ->
        Util.banner("Waiting for devel server shutdown")

        IO.puts(
          "Waiting for port #{@required_free_port} to be free (#{reason}).\nOtherwise the development asset watcher might overwrite the production ones, since the same directories are used for building."
        )

        with_free_port(block, reason)
    end
  end

  @confirm_msg "\n\nReady. Do you want to restart the service now? This takes about 3 minutes."
  defp deploy_tar_gz(skip) do
    make_release_image(skip)
    ensure_container_runs(skip)

    IO.puts("Image: #{Docker.image_name_release()}")
    upload(skip)

    if !skip[:skip_deploy] && Cli.confirm(@confirm_msg) do
      rename_on_remote(skip)
      update_mapbox(skip)
      restart(skip)
      true
    else
      false
    end
  end

  defp make_build_env(_skip) do
    Util.banner("Creating Build Environment")
    Docker.build_devel_image()
  end

  defp test(%{skip_test: true}), do: nil

  defp test(_skip) do
    Util.banner("Unit tests")
    Docker.mix("test --color")
    Util.banner("Dialyzer")
    Docker.mix("dialyzer")
  end

  defp make_release(_skip) do
    [
      ~w(mix setup),
      ~w(mix esbuild default --minify),
      ~w(mix sass default --no-source-map --style=compressed),
      ~w(cp -r data/images/ priv/static/),
      # reuse "test" environment so we don't have to compile "dev" for the container
      ~w(MIX_ENV=test mix velo.favicon.raster),
      ~w(mix deps.compile),
      ~w(mix compile),
      ~w(mix velo.gpx.generate),
      ["rm", "priv/static/#{Settings.video_serve_path()}"],
      ~w(mix phx.digest),
      ~w(mix release --overwrite --quiet),
      ~w(rm -rf priv/static/assets/)
    ]
    |> Stream.each(fn cmd -> Util.banner("Release: #{Enum.join(cmd, " ")}") end)
    |> Stream.each(fn
      ["MIX_ENV=" <> env, "mix" | cmd] -> Docker.mix(cmd, env)
      ["mix" | cmd] -> Docker.mix(cmd, "prod")
      other -> Util.cmd(other)
    end)
    |> Enum.to_list()
  end

  defp make_release_image(_skip) do
    Util.banner("Building Release Image")
    Docker.build_release_image()
  end

  defp ensure_container_runs(_skip) do
    Util.banner("Testing the image can boot")
    Docker.stop_release()

    container = Task.async(&Docker.boot_release/0)

    try do
      Process.sleep(500)
      true = Enum.find_value(0..20, &try_to_query_release_container/1)
    after
      Docker.stop_release()
    end

    Task.await(container, :infinity)
  end

  def try_to_query_release_container(trail) do
    try do
      {output, 0} = System.cmd("docker", ["port", Docker.container_name_release()])
      port = output |> String.split(":") |> List.last() |> String.trim()

      {:ok, response} = Tesla.get("http://localhost:#{port}/alltagsroute-1")

      if response.status == 200 do
        IO.puts("✓ Image boots fine and replies with 200")
        true
      else
        IO.puts("not yet (try=#{trail} code=#{response.status})…")
        Process.sleep(1_000)
        false
      end
    rescue
      e ->
        IO.puts("not yet (try=#{trail} err=#{inspect(e)})…")
        Process.sleep(1_000)
        false
    end
  end

  defp upload(%{skip_deploy: true}), do: nil

  defp upload(_skip) do
    Util.banner("copying to image to #{Settings.deploy_ssh_name()}")

    Util.cmd([
      "sh",
      "-c",
      "docker save '#{Docker.image_name_release()}' | bzip2 | ssh #{Settings.deploy_ssh_name()} 'bunzip2 | docker load'"
    ])
  end

  defp rename_on_remote(%{skip_deploy: true}), do: nil

  defp rename_on_remote(_skip) do
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

  defp update_mapbox(%{skip_mapbox: true}), do: nil

  defp update_mapbox(_skip) do
    Util.banner("Updating Mapbox")
    # TODO: need to make tippecanoe available in container
    # Docker.mix("update_mapbox")
    Mix.Tasks.Velo.Mapbox.Update.run(nil)
  end

  defp restart(%{skip_deploy: true}), do: nil

  defp restart(_skip) do
    Util.banner("Restarting")

    {_, 0} =
      System.cmd(
        "ssh",
        [
          Settings.deploy_ssh_name(),
          "sudo",
          "/bin/systemctl",
          "restart",
          "veloroute-phoenix1.service"
        ],
        into: IO.stream(:stdio, :line)
      )

    # sleep 15s
    Process.sleep(15_000)

    {_, 0} =
      System.cmd(
        "ssh",
        [
          Settings.deploy_ssh_name(),
          "sudo",
          "/bin/systemctl",
          "restart",
          "veloroute-phoenix2.service"
        ],
        into: IO.stream(:stdio, :line)
      )
  end

  defp preload_videos(%{skip_deploy: true}), do: nil
  defp preload_videos(%{skip_preload: true}), do: nil

  defp preload_videos(_skip) do
    Util.banner("Release: Preload Videos")
    Mix.Tasks.Velo.Videos.Preload.run(nil)
  end

  defp mirror_links(_skip) do
    Util.banner("Release: Mirroring External Links")
    Mix.Tasks.Velo.Links.Mirror.run(nil)
  end
end
