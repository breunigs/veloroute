defmodule Joiner.Mpv do
  @moduledoc """
  Runs interactive mpv players and reads back the position the user seeked to.

  Unlike `Joiner.Preview`, which streams a pre-rendered preview into a player,
  this opens the raw source videos so the user can scrub freely. The players run
  under their own supervisor, because `Joiner.Preview.stop/0` terminates all
  children of the preview supervisor and must not take these windows with it.
  """

  require Logger

  @type handle :: %{pid: pid(), socket: binary(), dir: binary(), title: binary()}

  # mpv creates the socket asynchronously after startup, so give it some time
  @connect_attempts 50
  @connect_sleep_ms 100

  def prepare() do
    children = [{Task.Supervisor, name: __MODULE__}]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  Opens a paused mpv window for the given video and returns a handle to query
  its playback position.
  """
  @spec open!(binary(), keyword()) :: handle()
  def open!(path, opts) do
    title = Keyword.fetch!(opts, :title)
    dir = Temp.mkdir!(%{prefix: "veloroute_join_mpv"})
    socket = Path.join(dir, "ipc.sock")

    Logger.info("mpv – starting – #{title}")

    {:ok, pid} =
      Task.Supervisor.start_child(
        __MODULE__,
        fn ->
          cmd(path, socket, title, opts)
          |> Util.Cmd2.exec(stdout: "", stderr: "", slow_warn_message: false)
          |> Util.Cmd2.result_to_error()
          |> case do
            :ok -> :ok
            {:error, reason} -> Logger.error("mpv failed: #{reason}")
          end
        end,
        restart: :transient
      )

    %{pid: pid, socket: socket, dir: dir, title: title}
  end

  # Note: deliberately not using `Util.default_player_cmd/2`, which is tuned for
  # playing a FIFO (`--force-seekable=no` plus huge demuxer caches) and thus
  # prevents the seeking we need here.
  defp cmd(path, socket, title, opts) do
    [
      "mpv",
      "--input-ipc-server=#{socket}",
      "--pause",
      "--no-resume-playback",
      "--force-window=immediate",
      "--framedrop=no",
      "--audio=no",
      "--keep-open=yes",
      "--osd-level=3",
      "--title=#{title}",
      if(opts[:start_s], do: "--start=#{opts[:start_s]}"),
      if(opts[:geometry], do: "--geometry=#{opts[:geometry]}"),
      path
    ]
    |> Util.compact()
  end

  @doc """
  Returns the position the player is currently showing, in milliseconds.
  """
  @spec time_pos_ms(handle(), pos_integer()) :: {:ok, non_neg_integer()} | {:error, binary()}
  def time_pos_ms(handle, attempt \\ 1) do
    if !Process.alive?(handle.pid) do
      {:error, "the mpv window for #{handle.title} was closed before a position was picked"}
    else
      read_time_pos(handle, attempt)
    end
  end

  defp read_time_pos(handle, attempt) do
    case get_property(handle, "time-pos") do
      {:ok, seconds} when is_number(seconds) ->
        {:ok, round(seconds * 1000)}

      {:ok, other} ->
        {:error, "mpv returned a non-numeric time-pos: #{inspect(other)}"}

      # mpv answers on the socket before it has loaded the file
      {:error, :unavailable} when attempt < @connect_attempts ->
        Process.sleep(@connect_sleep_ms)
        time_pos_ms(handle, attempt + 1)

      {:error, :unavailable} ->
        {:error, "mpv never reported a playback position for #{handle.title}"}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @spec get_property(handle(), binary()) :: {:ok, any()} | {:error, binary() | :unavailable}
  defp get_property(handle, property) do
    with {:ok, sock} <- connect(handle),
         cmd = Jason.encode!(%{command: ["get_property", property]}) <> "\n",
         :ok <- :gen_tcp.send(sock, cmd),
         {:ok, line} <- recv_reply(sock) do
      :gen_tcp.close(sock)

      case Jason.decode(line) do
        {:ok, %{"error" => "success", "data" => data}} ->
          {:ok, data}

        {:ok, %{"error" => "property unavailable"}} ->
          {:error, :unavailable}

        {:ok, %{"error" => err}} ->
          {:error, "mpv rejected get_property #{property}: #{err}"}

        other ->
          {:error, "unexpected mpv reply for #{property}: #{inspect(other)}"}
      end
    else
      {:error, reason} -> {:error, "mpv IPC failed for #{property}: #{inspect(reason)}"}
    end
  end

  defp connect(handle, attempt \\ 1) do
    opts = [:binary, :local, active: false, packet: :line]

    case :gen_tcp.connect({:local, handle.socket}, 0, opts, @connect_sleep_ms) do
      {:ok, sock} ->
        {:ok, sock}

      {:error, _reason} when attempt < @connect_attempts ->
        Process.sleep(@connect_sleep_ms)
        connect(handle, attempt + 1)

      {:error, reason} ->
        {:error, "could not connect to #{handle.socket}: #{inspect(reason)}"}
    end
  end

  # mpv may emit asynchronous events on the same socket, skip those
  defp recv_reply(sock) do
    with {:ok, line} <- :gen_tcp.recv(sock, 0, 5_000) do
      if String.contains?(line, ~s|"event"|), do: recv_reply(sock), else: {:ok, line}
    end
  end

  @spec close(handle()) :: :ok
  def close(handle) do
    Process.send(handle.pid, {:silent_termination, "manual join selection done"}, [])
    File.rm_rf(handle.dir)
    Logger.info("mpv – stopped – #{handle.title}")
    :ok
  end
end
