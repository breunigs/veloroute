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
    {image_ref, image_name} = make_release_image(skip)
    ensure_container_runs(skip, image_ref)

    IO.puts("Image: #{image_name}")
    upload(skip, image_name)

    if !skip[:skip_deploy] && Cli.confirm(@confirm_msg) do
      rename_on_remote(skip, image_name)
      restart(skip)
      true
    else
      false
    end
  end

  defp make_build_env(_skip) do
    Util.banner("Creating Build Environment")
    Util.Docker.build_devel_image()
  end

  defp test(%{skip_test: true}), do: nil

  defp test(_skip) do
    Util.banner("Unit tests")
    :ok = Util.Docker.mix("test --color")
    Util.banner("Dialyzer")
    :ok = Util.Docker.mix("dialyzer")
    Util.banner("Format Check")
    :ok = Util.Docker.mix("format --check-formatted")
  end

  defp make_release(_skip) do
    Util.banner("Generating Assets")
    Mix.Tasks.Velo.Assets.Prepare.run([])
    Mix.Tasks.Velo.Search.Index.run([])

    [
      ~w(mix setup),
      ~w(mix compile),
      ~w(mix phx.digest),
      ~w(mix release --overwrite --quiet),
      ~w(mix phx.digest.clean --all),
      # until https://github.com/phoenixframework/phoenix/pull/5318
      ~w(find priv/static -name "*.br" -not -wholename "*/assets/basemap/*" -delete)
    ]
    |> Stream.each(fn cmd -> Util.banner("Release: #{Enum.join(cmd, " ")}") end)
    |> Stream.each(fn
      ["MIX_ENV=" <> env, "mix" | cmd] -> :ok = Util.Docker.mix(cmd, env)
      ["mix" | cmd] -> :ok = Util.Docker.mix(cmd, "prod")
      other -> Util.Cmd2.exec(other, raise: true)
    end)
    |> Enum.to_list()
  end

  defp make_release_image(_skip) do
    Util.banner("Building Release Image")
    image_ref = {:dockerfile, "Dockerfile.release"}
    :ok = Util.Docker.build(image_ref)

    image_name = Util.Docker.image_name("release-#{:os.system_time(:millisecond)}")
    :ok = Util.Docker.retag(image_ref, image_name)

    image_ref = [:remote | String.split(image_name, ":")] |> List.to_tuple()
    {image_ref, image_name}
  end

  defp ensure_container_runs(_skip, release_image) do
    Util.banner("Testing the image can boot")
    container_ref = {"release image test", release_image}
    Util.Docker.stop(container_ref)

    container =
      Task.async(fn ->
        Util.Docker.run(
          container_ref,
          %{docker_args: ["--pull", "never", "-p", "4000:4000"], mount_videos_in_dir: "/app"},
          stdout: IO.stream(:stdio, :line),
          slow_warn_message: false
        )
      end)

    try do
      Process.sleep(500)
      true = Enum.find_value(0..20, &wait_until_up/1)

      true =
        Enum.all?(
          ~w(
            /alltagsroute-1
            /map/___static/9.988434,53.548873,9/720x493
            /updates.atom
            /images/rss.svg
            /assets/basemap/tiles/9/270/165.pbf.gz
            /assets/basemap/styles/standard.json
            /assets/app.js
            /assets/app.css
          ),
          &report_status_200?/1
        )
    after
      Util.Docker.stop(container_ref)
    end

    Task.await(container, :infinity)
  end

  def wait_until_up(trail) do
    try do
      {:ok, response} = Tesla.get(get_docker_url("/"))

      if response.status == 200 do
        IO.puts("✓ Image booted")
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

  defp report_status_200?(path) do
    case Tesla.get(get_docker_url(path)) do
      {:ok, %{status: 200}} ->
        IO.puts("✓ 200 from #{path}")
        true

      {:ok, response} ->
        IO.puts("! unexpected status #{response.status} from #{path}")
        false

      other ->
        IO.puts("! unexpected reponse for #{path}: #{inspect(other)}")
        false
    end
  end

  defp get_docker_url("/" <> path) do
    "http://localhost:4000/#{path}"
  end

  defp upload(%{skip_deploy: true}, _image_name), do: nil

  defp upload(_skip, image_name) do
    Util.banner("copying image to #{Settings.deploy_ssh_name()}")

    {_out, 0} =
      System.cmd("sh", [
        "-c",
        "docker save '#{image_name}' | zstd -12 -T0 | ssh #{Settings.deploy_ssh_name()} 'unzstd | docker load'"
      ])
  end

  defp rename_on_remote(%{skip_deploy: true}, _image_name), do: nil

  defp rename_on_remote(_skip, image_name) do
    Util.banner("Renaming")

    {_out, 0} =
      System.cmd("ssh", [
        Settings.deploy_ssh_name(),
        "docker",
        "tag",
        image_name,
        "veloroute.hamburg/v1:latest"
      ])
  end

  defp restart(%{skip_deploy: true}), do: nil

  defp restart(_skip) do
    Util.banner("Restarting")
    restart_service("veloroute-phoenix1.service")
    restart_service("veloroute-phoenix2.service")
  end

  defp restart_service(name) do
    {_, 0} =
      System.cmd(
        "ssh",
        [
          Settings.deploy_ssh_name(),
          "sudo",
          "/bin/systemctl",
          "restart",
          name
        ],
        into: IO.stream(:stdio, :line)
      )

    # sleep 15s
    Process.sleep(15_000)

    {_, exit_status} =
      System.cmd(
        "ssh",
        [
          Settings.deploy_ssh_name(),
          "sudo",
          "/bin/systemctl",
          "is-active",
          name
        ],
        into: IO.stream(:stdio, :line)
      )

    0 = exit_status
  end

  defp preload_videos(%{skip_deploy: true}), do: nil
  defp preload_videos(%{skip_preload: true}), do: nil

  defp preload_videos(_skip) do
    Util.banner("Release: Preload Videos")
    Mix.Tasks.Velo.Videos.Preload.run(nil)
  end

  defp mirror_links(%{skip_mirror: true}), do: nil

  defp mirror_links(_skip) do
    Util.banner("Release: Mirroring External Links")
    Mix.Tasks.Velo.Links.Mirror.run(nil)
  end
end
