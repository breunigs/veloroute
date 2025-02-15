defmodule Joiner.Preview do
  require Logger

  @type handle :: {binary(), binary()}

  def prepare() do
    if System.get_env("VELO_HOST_FFMPEG") != "1" do
      full_ref = {"preview video", Video.Renderer.ffmpeg_image()}
      :ok = Util.Docker.build(full_ref)
    end

    children = [{Task.Supervisor, name: __MODULE__}]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @spec start_render!([Joiner.Segment.t()], Joiner.Options.t()) :: handle()
  def start_render!(segments, opts) do
    dir = Temp.mkdir!(%{prefix: "veloroute_join_preview"})
    fade_s = Joiner.Options.fade_duration_s(opts)

    {out_file, cmds} =
      Enum.map(segments, fn seg ->
        {Joiner.Segment.video_path(seg, :from), Joiner.Segment.video_path(seg, :to),
         Joiner.Segment.stop_ms(seg, :from), Joiner.Segment.start_ms(seg, :to)}
      end)
      |> Video.Renderer.join_preview_cmds(fade_s, dir, opts.preview_blur)
      |> create_fifos!()

    Task.Supervisor.start_child(
      __MODULE__,
      fn -> start_render_tasks(cmds, dir, opts.preview_use_host_ffmpeg) end,
      restart: :transient
    )

    {out_file, dir}
  end

  @spec start_player!(handle(), binary(), binary()) :: any()
  def start_player!({out_file, _dir}, title, custom_player) do
    Logger.info("video preview – starting – #{title}")

    Task.Supervisor.start_child(
      __MODULE__,
      fn ->
        if custom_player do
          "cat #{out_file} | #{custom_player}" |> String.to_charlist() |> :os.cmd() |> IO.puts()
        else
          Util.default_player_cmd(title, out_file)
          |> Util.Cmd2.exec(stdout: "", stderr: "", slow_warn_message: false)
          |> Util.Cmd2.result_to_error()
          |> case do
            :ok -> :ok
            {:error, reason} -> Logger.error("video player failed: #{reason}")
          end
        end

        Logger.info("video preview – stopped – #{title}")
      end,
      restart: :transient
    )
  end

  @spec stop(handle()) :: :ok
  def stop({_out_file, dir}) do
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

  defp create_fifos!({out_file, tmp_fifos, cmds}) do
    Enum.each(tmp_fifos, fn fifo ->
      {_, 0} = System.cmd("mkfifo", [fifo])
    end)

    {out_file, cmds}
  end

  defp start_render_tasks(cmds, dir, host_ffmpeg) do
    Enum.each(cmds, fn cmd ->
      Task.Supervisor.start_child(
        __MODULE__,
        fn ->
          case run_ffmpeg(cmd, dir, host_ffmpeg) do
            :ok -> :ok
            {:error, reason} -> Logger.error(reason)
          end
        end,
        restart: :transient
      )
    end)
  end

  defp run_ffmpeg(cmd, dir, use_host_ffmpeg)

  defp run_ffmpeg(cmd, _dir, true) do
    Util.Cmd2.exec(cmd, stdout: "", stderr: "", slow_warn_message: false)
    |> Util.Cmd2.result_to_error()
  end

  defp run_ffmpeg(cmd, dir, false) do
    full_ref = {List.last(cmd), Video.Renderer.ffmpeg_image()}

    Util.Docker.run(
      full_ref,
      %{mount_videos_in_dir: "/workdir", command_args: cmd, mounts: %{dir => dir}},
      slow_warn_message: false
    )
  end
end
