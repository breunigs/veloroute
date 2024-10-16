defmodule Util.Cmd2 do
  require Logger

  @type exec_opts :: Keyword.t()

  @type exec_result :: %{
          status: non_neg_integer(),
          stdout: any(),
          stderr: any(),
          user_abort: boolean(),
          result: :ok | {:error, binary()}
        }

  @spec result_to_error(exec_result()) :: :ok | {:error, binary()}
  def result_to_error(%{result: :ok}), do: :ok
  def result_to_error(%{result: {:error, reason}}), do: {:error, reason}

  @doc """
  Uses ports to be able to pass on signals to the child process. Since the
  VM eats SIGINT, it can only pass SIGINT and SIGTERM.
  """
  @spec exec([any()], keyword()) :: exec_result()
  def exec(cli, opts) do
    {env, opts} = Keyword.pop(opts, :env, [])
    {do_raise, opts} = Keyword.pop(opts, :raise, false)
    {slow_warn, opts} = Keyword.pop(opts, :slow_warn_message, true)

    {stdout, opts} =
      Keyword.pop_lazy(opts, :stdout, fn ->
        :io.setopts(:standard_io, encoding: :latin1)
        IO.binstream(:stdio, :line)
      end)

    {stderr, opts} = Keyword.pop(opts, :stderr, IO.stream(:stderr, :line))
    {stdin, opts} = Keyword.pop(opts, :stdin, nil)
    {kill, opts} = Keyword.pop(opts, :kill, nil)
    {name, opts} = Keyword.pop(opts, :name, hd(cli))
    if length(opts) > 0, do: raise("Unknown arguments: #{inspect(opts)}")

    cli = Util.low_priority_cmd_prefix() ++ Enum.map(cli, &to_string/1)
    # run in extra thread because since Erlang/OTP 26 we receive messages from a
    # GenServer, which is odd. It looks like a bug, but test case reduction
    # exceeded a timebox, so workaround it is.
    task = Task.async(fn -> exec_cmd2(cli, name, env, stdout, stderr, stdin, kill, slow_warn) end)
    status = Task.await(task, :infinity)
    :io.setopts(:standard_io, encoding: :unicode)

    cond do
      status[:status] == 0 ->
        Map.put(status, :result, :ok)

      status[:user_abort] ->
        Logger.info("User aborted, exiting")
        Logger.flush()
        System.halt(0)

      !do_raise ->
        Map.put(status, :result, error_result(name, cli, env, status))

      true ->
        {:error, reason} = error_result(name, cli, env, status)
        raise(reason)
    end
  end

  defp error_result(name, cli, env, status) do
    {:error,
     """
     FAILED #{name} with status=#{status[:status]}
     CLI: #{Util.cli_printer(cli)}
     ENV: #{Util.cli_printer(Enum.map(env, fn {k, v} -> "#{k}=#{v}" end))}
     STDOUT: #{to_string_or_inspect(status[:stdout])}
     STDERR: #{to_string_or_inspect(status[:stderr])}
     """}
  end

  @spec exec_cmd2(
          [binary()],
          binary(),
          Enum.t(),
          Collectable.t(),
          Collectable.t(),
          binary() | nil,
          binary() | nil,
          boolean()
        ) :: %{
          status: non_neg_integer(),
          stdout: any(),
          stderr: any(),
          user_abort: boolean()
        }
  defp exec_cmd2([exe | params], name, env, stdout, stderr, stdin, kill, slow_warn) do
    {stdoutacc, stdout} = Collectable.into(stdout)
    {stderracc, stderr} = Collectable.into(stderr)
    exe = System.find_executable(exe) || exe
    args = Enum.map([exe | params], &String.to_charlist/1)
    opts = [:stdout, :stderr, :monitor, {:env, validate_env(env)}]
    opts = if kill, do: [{:kill, kill}, {:kill_timeout, 3} | opts], else: opts
    opts = if stdin, do: [:stdin | opts], else: opts

    :ok = Application.ensure_started(:erlexec)

    with {:ok, pid, monitor} <- :exec.run(args, opts) do
      untrap1 = stop_on_signal(:sigterm)
      untrap2 = stop_on_signal(:sigquit)
      warner = if slow_warn, do: Process.send_after(self(), {:slow_warn, name}, 5_000)

      if stdin do
        :exec.send(pid, stdin)
        :exec.send(pid, :eof)
      end

      try do
        status = receive_cmd2(pid, monitor, stdout, stdoutacc, stderr, stderracc)
        # only untrap if there were no signals, since we block the received
        # signal to prevent VM shutdown and would wait until the timeout,
        # essentially deadlocking.
        if !status[:user_abort] do
          untrap1.()
          untrap2.()
        end

        status
      after
        if slow_warn, do: Process.cancel_timer(warner)
      end
    else
      err -> %{status: 128, stdout: nil, stderr: "failed to exec: #{inspect(err)}"}
    end
  end

  defp receive_cmd2(pid, monitor, stdout, stdoutacc, stderr, stderracc) do
    receive do
      {:stdout, ^monitor, data} ->
        stdoutacc = stdout.(stdoutacc, {:cont, data})
        receive_cmd2(pid, monitor, stdout, stdoutacc, stderr, stderracc)

      {:stderr, ^monitor, data} ->
        stderracc = stderr.(stderracc, {:cont, data})
        receive_cmd2(pid, monitor, stdout, stdoutacc, stderr, stderracc)

      {:DOWN, ^monitor, :process, ^pid, :normal} ->
        stdoutacc = stdout.(stdoutacc, :done)
        stderracc = stderr.(stderracc, :done)
        %{status: 0, stdout: stdoutacc, stderr: stderracc, user_abort: false}

      {:DOWN, ^monitor, :process, ^pid, {:exit_status, status}} ->
        reason =
          case :exec.status(status) do
            {:status, status} ->
              status

            {:signal, signal, _core} when is_integer(signal) ->
              128 + signal

            {:signal, signal, core} ->
              Logger.error("Child received #{signal} signal and died (core: #{core})")
              137
          end

        stdout.(stdoutacc, :halt)
        stderr.(stderracc, :halt)

        %{status: reason, stdout: stdoutacc, stderr: stderracc, user_abort: false}

      {:slow_warn, cmd} ->
        Logger.info("#{cmd} is slow. Press CTRL+\\ to attempt graceful termination")
        receive_cmd2(pid, monitor, stdout, stdoutacc, stderr, stderracc)

      {:kill, _signal} ->
        :exec.stop_and_wait(monitor, 4_000)
        %{status: 142, stdout: stdoutacc, stderr: stderracc, user_abort: true}

      other ->
        raise("Received unexpected message while executing command: #{inspect(other)}")
    end
  end

  @spec to_string_or_inspect(any()) :: binary()
  defp to_string_or_inspect(term) when term == [], do: ""
  defp to_string_or_inspect(nil), do: ""
  defp to_string_or_inspect(atom) when is_atom(atom), do: ":#{atom}"

  defp to_string_or_inspect([term | rest]) do
    to_string_or_inspect(term) <> to_string_or_inspect(rest)
  end

  defp to_string_or_inspect(term) when is_binary(term) or is_list(term) do
    s = IO.chardata_to_string(term)
    if String.valid?(s), do: s, else: hd(String.chunk(term, :valid))
  end

  defp to_string_or_inspect(term), do: to_string(term)

  defp stop_on_signal(signal) do
    us = self()
    trap_ref = make_ref()
    untrap = fn -> System.untrap_signal(signal, trap_ref) end

    {:ok, _trap} =
      System.trap_signal(signal, trap_ref, fn ->
        Logger.info("received #{signal}, aborting...")
        :ok = Process.send(us, {:kill, signal}, [])
        Process.sleep(5_000)
        :ok
      end)

    untrap
  end

  defp validate_env(enum) do
    Enum.map(enum, fn
      {k, nil} ->
        {String.to_charlist(k), false}

      {k, v} ->
        {String.to_charlist(k), String.to_charlist(v)}

      other ->
        raise ArgumentError, "invalid environment key-value #{inspect(other)}"
    end)
  end
end
