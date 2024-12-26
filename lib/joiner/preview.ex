defmodule Joiner.Preview do
  require Logger

  def prepare() do
    if System.get_env("VELO_HOST_FFMPEG") != "1" do
      full_ref = {"preview video", Video.Renderer.ffmpeg_image()}
      :ok = Util.Docker.build(full_ref)
    end

    children = [{Task.Supervisor, name: __MODULE__}]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def start_render!(segments, opts) do
    dir = Temp.mkdir!(%{prefix: "veloroute_join_preview"})
    fade_s = Joiner.Options.fade_duration_s(opts)

    {out_fifo, cmds} =
      Enum.map(segments, fn seg ->
        {Joiner.Segment.video_path(seg, :from), Joiner.Segment.video_path(seg, :to),
         Joiner.Segment.stop_ms(seg, :from), Joiner.Segment.start_ms(seg, :to)}
      end)
      |> Video.Renderer.join_preview_cmds(fade_s, dir)
      |> create_fifos!()

    Task.Supervisor.start_child(
      __MODULE__,
      fn -> start_render_tasks(cmds, dir) end,
      restart: :transient
    )

    {out_fifo, dir}
  end

  def start_player!({out_fifo, dir}, title) do
    Logger.info("starting video preview #{title}")

    if System.get_env("VELO_PREVIEW_TOOL") != nil do
      Logger.warning("join previews doesn't support custom players set via VELO_PREVIEW_TOOL")
    end

    cmd = Util.default_player_cmd(title, out_fifo)

    Task.Supervisor.start_child(
      __MODULE__,
      fn ->
        cmd
        |> Util.Cmd2.exec(stdout: "", stderr: "", slow_warn_message: false)
        |> Util.Cmd2.result_to_error()
        |> case do
          :ok -> :ok
          {:error, reason} -> Logger.error("video player failed: #{reason}")
        end

        stop({out_fifo, dir})
      end,
      restart: :transient
    )
  end

  def stop({_out_fifo, dir}) do
    File.rm_rf(dir)
    stop()
  end

  def stop() do
    __MODULE__
    |> Task.Supervisor.children()
    |> Enum.each(fn pid ->
      Process.send(pid, {:silent_termination, "preview stop"}, [])
    end)
  end

  defp create_fifos!({out_fifo, tmp_fifos, cmds}) do
    Enum.each([out_fifo | tmp_fifos], fn fifo ->
      {_, 0} = System.cmd("mkfifo", [fifo])
    end)

    {out_fifo, cmds}
  end

  defp start_render_tasks(cmds, dir) do
    Enum.each(cmds, fn cmd ->
      Task.Supervisor.start_child(
        __MODULE__,
        fn ->
          case run_ffmpeg(cmd, dir) do
            :ok -> :ok
            {:error, reason} -> Logger.error(reason)
          end
        end,
        restart: :transient
      )
    end)
  end

  defp run_ffmpeg(cmd, dir) do
    if System.get_env("VELO_HOST_FFMPEG") == "1" do
      Util.Cmd2.exec(cmd, stdout: "", stderr: "", slow_warn_message: false)
      |> Util.Cmd2.result_to_error()
    else
      full_ref = {List.last(cmd), Video.Renderer.ffmpeg_image()}

      Util.Docker.run(
        full_ref,
        %{mount_videos_in_dir: "/workdir", command_args: cmd, mounts: %{dir => dir}},
        slow_warn_message: false
      )
    end
  end
end
