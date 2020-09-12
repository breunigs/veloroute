defmodule Mix.Tasks.Deploy do
  use Mix.Task

  @name_prefix "veloroute.hamburg/v1"
  @shortdoc "Builds the site using docker, then uploads it"
  def run(_) do
    Mix.Task.run("app.start")
    build_and_push()

    if Cli.confirm(
         "\n\nReady. Do you want to restart the service now? This takes about 3 minutes."
       ) do
      IO.puts("Deploying…")
      Mix.Tasks.UpdateMapbox.run(nil)
      # add this line to /etc/sudoers.d/veloroute2-restart
      # someuser ALL=(ALL) NOPASSWD: /bin/systemctl restart veloroute2.service
      {_, 0} =
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

      IO.puts("Done")
    else
      IO.puts("Aborted :(")
    end
  end

  defp build_and_push do
    ts = :os.system_time(:millisecond)
    name = "#{@name_prefix}:#{ts}"

    {_, 0} =
      System.cmd(
        "docker",
        [
          "build",
          ".",
          "--network",
          "host",
          "-t",
          name,
          "--build-arg",
          "GIT_COMMIT=#{Git.revision()}"
        ],
        env: [{"DOCKER_BUILDKIT", "1"}]
      )

    ensure_container_runs(name)

    IO.puts("copying to image to #{Settings.deploy_ssh_name()}")

    {_, 0} =
      System.cmd("sh", [
        "-c",
        "docker save '#{name}' | bzip2 | ssh #{Settings.deploy_ssh_name()} 'bunzip2 | docker load'"
      ])

    IO.puts("retagging to :latest on #{Settings.deploy_ssh_name()}")

    {_, 0} =
      System.cmd("ssh", [
        Settings.deploy_ssh_name(),
        "docker",
        "tag",
        name,
        "#{@name_prefix}:latest"
      ])
  end

  defp ensure_container_runs(name) do
    IO.puts("Testing the image can boot")
    container_name = Regex.replace(~r/[^a-z0-9_.-]/i, name, "")

    container =
      Task.async(fn ->
        {_, 0} =
          System.cmd("docker", ["run", "-p", "4000", "--rm", "--name", container_name, name])
      end)

    try do
      Process.sleep(5_000)
      {output, 0} = System.cmd("docker", ["port", container_name])
      port = output |> String.split(":") |> List.last() |> String.trim()
      {:ok, response} = Tesla.get("http://localhost:#{port}")
      200 = response.status
      IO.puts("✓ Image boots fine and replies with 200")
    after
      {_, 0} = System.cmd("docker", ["stop", container_name])
    end

    Task.await(container, :infinity)
  end
end
