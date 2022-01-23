defmodule Util do
  @spec map_first(map()) :: {any(), any()} | nil
  def map_first(map) when is_map(map) do
    map |> Enum.find(& &1)
  end

  def banner(text) do
    IO.puts("")
    IO.puts("###########################################")
    IO.puts(text)
    IO.puts("###########################################")
    IO.puts("")
  end

  def user_id(), do: cmd(["id", "-u"]) |> String.trim()
  def group_id(), do: cmd(["id", "-g"]) |> String.trim()

  def cmd([cmd | args], opts \\ []) do
    System.cmd(cmd, args, opts)
    |> case do
      {out, 0} ->
        out

      {_, code} ->
        env =
          Keyword.get(opts, :env)
          |> List.wrap()
          |> Enum.map(fn {k, v} -> "export #{k}=\"#{v}\"" end)
          |> Enum.join("\n")

        args = args |> Enum.map(fn arg -> "\"#{arg}\"" end) |> Enum.join(" ")

        raise("FAILED (exit code #{code}):\n#{env}\n#{cmd} #{args}")
    end
  end

  @doc """
  cmd2 uses ports to be able to pass on signals to the child process. Since the
  VM eats SIGINT, it can only pass SIGINT and SIGTERM.
  """
  @type exec_result :: %{
          status: non_neg_integer(),
          stdout: any(),
          stderr: any(),
          user_abort: boolean(),
          result: :ok | {:error, binary()}
        }
  @spec cmd2([any()], keyword()) :: exec_result()
  def cmd2(cli, opts) do
    {env, opts} = Keyword.pop(opts, :env, [])
    {do_raise, opts} = Keyword.pop(opts, :raise, false)
    {stdout, opts} = Keyword.pop(opts, :stdout, IO.stream(:stdio, :line))
    {stderr, opts} = Keyword.pop(opts, :stderr, IO.stream(:stderr, :line))
    {kill, opts} = Keyword.pop(opts, :kill, nil)
    {name, opts} = Keyword.pop(opts, :name, hd(cli))
    if length(opts) > 0, do: raise("Unknown arguments: #{inspect(opts)}")

    cli = Enum.map(cli, &to_string/1)
    status = exec_cmd2(cli, name, env, stdout, stderr, kill)

    result =
      if status[:status] == 0 do
        :ok
      else
        {:error,
         """
         FAILED #{name} with status=#{status[:status]}
         CLI: #{Util.cli_printer(cli)}
         STDOUT: #{to_string_or_inspect(status[:stdout])}
         STDERR: #{to_string_or_inspect(status[:stderr])}
         """}
      end

    if do_raise && result != :ok && status[:user_abort], do: raise("User aborted")

    if do_raise && result != :ok,
      do: raise(elem(result, 1))

    Map.put(status, :result, result)
  end

  defp to_string_or_inspect(term) do
    if String.Chars.impl_for(term),
      do: to_string(term),
      else: inspect(term)
  end

  @spec exec_cmd2(
          [binary()],
          binary(),
          Enum.t(),
          Collectable.t(),
          Collectable.t(),
          binary() | nil
        ) :: %{
          status: non_neg_integer(),
          stdout: any(),
          stderr: any(),
          user_abort: boolean()
        }
  defp exec_cmd2([exe | params], name, env, stdout, stderr, kill) do
    {stdoutacc, stdout} = Collectable.into(stdout)
    {stderracc, stderr} = Collectable.into(stderr)
    exe = System.find_executable(exe) || exe
    args = Enum.map([exe | params], &String.to_charlist/1)
    opts = [:stdout, :stderr, :monitor, {:env, validate_env(env)}]
    opts = if kill, do: [{:kill, kill}, {:kill_timeout, 3} | opts], else: opts

    with {:ok, pid, monitor} <- :exec.run(args, opts) do
      stop_on_signal(:sigterm)
      stop_on_signal(:sigquit)

      warner = Process.send_after(self(), {:slow_warn, name}, 1000)

      try do
        receive_cmd2(pid, monitor, stdout, stdoutacc, stderr, stderracc)
      after
        Process.cancel_timer(warner)
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
              IO.puts(:stderr, "\nChild received #{signal} signal and died (core: #{core})")
              137
          end

        stdout.(stdoutacc, :halt)
        stderr.(stderracc, :halt)

        %{status: reason, stdout: stdoutacc, stderr: stderracc, user_abort: false}

      {:slow_warn, cmd} ->
        IO.puts(:stderr, "\n#{cmd} is slow. Press CTRL+\\ to attempt graceful termination")
        receive_cmd2(pid, monitor, stdout, stdoutacc, stderr, stderracc)

      {:kill, _signal} ->
        :exec.stop_and_wait(monitor, 4_000)
        %{status: 142, stdout: stdoutacc, stderr: stderracc, user_abort: true}
    end
  end

  defp stop_on_signal(signal) do
    us = self()

    {:ok, _trap} =
      System.trap_signal(signal, fn ->
        IO.puts(:stderr, "\n\nreceived #{signal}, aborting…")
        :ok = Process.send(us, {:kill, signal}, [])
        Process.sleep(5_000)
        :ok
      end)
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

  @spec overlap?(Enumerable.t(), Enumerable.t()) :: bool()
  @doc """
  Returns true if enum1 and enum2 have at least one element in common
  """
  def overlap?(enum1, enum2) do
    Enum.any?(enum1, fn el1 ->
      Enum.member?(enum2, el1)
    end)
  end

  @spec compact(Enumerable.t() | map()) :: Enumerable.t()
  def compact(%{} = map) do
    Enum.reject(map, fn {_k, v} -> is_nil(v) end)
    |> Enum.into(%{})
  end

  def compact(list) do
    Enum.reject(list, &is_nil(&1))
  end

  @doc """
  Works like Enum.group_by, but keeps the group order the same as the elements come in. For this
  to work the elements need to already be sorted by the key being grouped by.

  ## Examples

      iex> Util.ordered_group_by([{1, "a"}, {1, "b"}, {2, "c"}], &elem(&1, 1))
      [{"a", [{1, "a"}]}, {"b", [{1, "b"}]}, {"c", [{2, "c"}]}]
  """
  @spec ordered_group_by(Enumerable.t(), (Enum.element() -> any())) :: [{any(), [any()]}]
  def ordered_group_by(enum, key_fun) do
    enum
    |> Enum.reverse()
    |> Enum.reduce([], fn
      art, [] ->
        [{key_fun.(art), [art]}]

      art, [{prev_key, prev_list} | rest] = all ->
        key = key_fun.(art)

        if prev_key == key,
          do: [{key, [art | prev_list]} | rest],
          else: [{key, [art]} | all]
    end)
  end

  @spec modules_with_prefix(binary()) :: [module()]
  def modules_with_prefix("Elixir." <> _rest = namespace) do
    ns = to_string(namespace)
    {:ok, list} = :application.get_key(:veloroute, :modules)
    Enum.filter(list, &(&1 |> Atom.to_string() |> String.starts_with?(ns)))
  end

  def md5(input) do
    :crypto.hash(:md5, input) |> Base.encode16(case: :lower)
  end

  def md5_file(path) do
    path |> File.read!() |> md5()
  end

  @doc """
  Finds <a href="x"> in an HTML document. It ignores base tags even if present.

  ## Examples

      iex> Util.extract_href_from_html(~s|<a href="hi">I'm a link</a>|)
      ["hi"]
  """
  @spec extract_href_from_html(binary()) :: [binary()]
  def extract_href_from_html(html) when is_binary(html) do
    {:ok, document} = Floki.parse_document(html)

    Floki.find(document, "a")
    |> Enum.map(fn {_tag, attrs, _body} ->
      Enum.find_value(attrs, fn
        {"href", val} -> val
        _other -> nil
      end)
    end)
    |> compact()
    |> Enum.uniq()
  end

  def render_heex(heex) do
    heex |> Phoenix.HTML.Safe.to_iodata() |> IO.iodata_to_binary()
  end

  @doc """
  Writes auto generated source code to disk and ensures it can be compiled. It
  silences the warning about redefining the module while doing so.
  """
  @spec write_autogenerated_file(binary, iodata) :: :ok | {:error, any} | {:error, any, any}
  def write_autogenerated_file(path, content) do
    try do
      with :ok <- File.write(path, content),
           Code.compiler_options(ignore_module_conflict: true),
           {:ok, _modules, _warnings} <- Kernel.ParallelCompiler.compile([path], []) do
        :ok
      end
    after
      # re-enabling this causes warning still to be shown :(
      # Code.compiler_options(ignore_module_conflict: false)
    end
  end

  @doc """
  Downloads from the URL to the given path. The target path's partent
  directories must be present, but the file itself may not.
  """
  def download(url, file, allowed_redirects \\ 3) do
    {:ok, code, headers, ref} = :hackney.request(url)

    case code do
      x when x in [301, 302] and allowed_redirects > 0 ->
        {_, url} = Enum.find(headers, fn {key, _val} -> String.downcase(key) == "location" end)
        download(url, file, allowed_redirects - 1)

      200 ->
        with {:ok, handle} <-
               File.open(file <> "_tmp", [:write, :binary, :exclusive, :delayed_write]),
             :ok <- stream_body(ref, handle),
             :ok <- File.close(handle),
             :ok <- File.rename(file <> "_tmp", file) do
          :ok
        end

      code ->
        {:error, "unexpected status code: #{code}\nheaders: #{inspect(headers)}"}
    end
  end

  defp stream_body(ref, handle) do
    case :hackney.stream_body(ref) do
      {:ok, data} ->
        IO.binwrite(handle, data)
        |> case do
          :ok ->
            stream_body(ref, handle)

          {:error, reason} ->
            {:error, "writing to file stream failed: #{reason}"}
        end

      :done ->
        :ok

      {:error, reason} ->
        {:error, "hackney stream_body failed: #{reason}"}
    end
  end

  @doc """
  Takes a command as a list and applies some heuristics for shell copy&paste
  """
  @spec cli_printer(Enum.t()) :: binary
  def cli_printer(cmd) do
    cmd
    |> Enum.map(fn arg ->
      arg = to_string(arg)
      if String.match?(arg, ~r/^[a-zA-Z0-9_=.-]+$/) || arg == "|", do: arg, else: "'#{arg}'"
    end)
    |> Enum.join(" ")
  end
end
