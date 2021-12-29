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
  def cmd2(cli, opts \\ [env: []])

  def cmd2([cmd | args], env: env) do
    port_opts = [env: validate_env(env)]

    port =
      Port.open(
        {:spawn_executable, System.find_executable(cmd)},
        port_opts ++
          [
            :stream,
            :binary,
            {:args, args},
            :nouse_stdio,
            :exit_status,
            {:parallelism, true}
          ]
      )

    {:os_pid, ospid} = Port.info(port, :os_pid)

    pass_forward_once(:sigterm, ospid)
    pass_forward_once(:sigquit, ospid)

    IO.puts(:stderr, "running #{cmd}. Press CTRL+\\ to attempt graceful termination")

    receive do
      {^port, {:exit_status, 0}} ->
        :ok

      {^port, {:exit_status, status}} ->
        raise("FAILED (exit code #{status})")
    end
  end

  defp pass_forward_once(signal, pid) do
    trap_ref = make_ref()

    {:ok, _trap} =
      System.trap_signal(signal, trap_ref, fn ->
        name = signal |> to_string() |> String.upcase()
        IO.puts(:stderr, "\n\ntrying to #{name} child with pid=#{pid}…")
        System.cmd("kill", ["-#{signal}", to_string(pid)])
        System.untrap_signal(signal, trap_ref)
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
        with {:ok, handle} <- File.open(file, [:write, :binary, :exclusive, :delayed_write]),
             :ok <- stream_body(ref, handle),
             :ok <- File.close(handle) do
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
end
