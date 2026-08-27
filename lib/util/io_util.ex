defmodule Util.IO do
  @doc """
  Returns true if the user answered the acknowledged the given question. Pass
  `false` as the 2nd parameter to make the input check default to "no" if no
  specific letter is typed.
  """
  @spec yes?(binary(), boolean()) :: boolean()
  def yes?(question, yes_is_default \\ true) do
    opts = if yes_is_default, do: "[Y/n]", else: "[y/N]"
    answer = String.trim(IO.gets("#{question} #{opts} "))

    cond do
      answer == "" -> yes_is_default
      answer in ["y", "Y"] -> true
      answer in ["n", "N"] -> false
      true -> yes?(question, yes_is_default)
    end
  end

  @doc """
  Takes a path and recursively list all files, returning the list with paths
  including the given path as a prefix. Symlinks, devices, etc. are not being
  followed.

  May pass a descent_folder/1 which receives the path of a folder, and must
  return true if the folder should be scanned.
  """
  @type descent_folder :: (binary() -> boolean()) | nil
  @spec tree(binary(), descent_folder) :: [binary()]
  def tree(path, descent_folder_fn \\ nil) do
    path
    |> recurse_files(descent_folder_fn)
    |> case do
      list when is_list(list) -> list
      mapset -> MapSet.to_list(mapset)
    end
  end

  @doc """
  Calculates size of directory and all its containing files. Unreadable files
  are ignored (= considered as if they were 0 bytes).
  """
  @spec dir_size(binary()) :: non_neg_integer()
  def dir_size(path) do
    path
    |> tree()
    |> Parallel.map(fn file ->
      case File.stat(file) do
        {:ok, %{size: size}} -> size
        {:error, _reason} -> 0
      end
    end)
    |> Enum.sum()
  end

  @doc """
  Takes a list of files and returns just the directories.
  """
  def filter_dirs(file_list) when is_list(file_list) do
    file_list
    |> Enum.map(&Path.dirname/1)
    |> Enum.map(&Path.split/1)
    |> Enum.uniq()
    |> Enum.flat_map(fn segments ->
      Enum.reduce(segments, [], fn segment, acc ->
        [Path.join(acc ++ [segment]), acc]
      end)
    end)
    |> List.flatten()
    |> Enum.uniq()
  end

  @spec age_in_days(binary()) :: non_neg_integer() | :infinity
  def age_in_days(file) do
    current = :os.system_time(:second)

    with {:ok, %{mtime: date}} <- File.stat(file, time: :posix) do
      round((current - date) / (24 * 60 * 60))
    else
      _any -> :infinity
    end
  end

  @doc """
  returns true if first file/dor is newer than the second one
  """
  @spec newer?(binary(), binary()) :: bool() | :unknown
  def newer?(file_a, file_b) do
    with {:ok, %{mtime: date_a}} <- File.stat(file_a, time: :posix),
         {:ok, %{mtime: date_b}} <- File.stat(file_b, time: :posix) do
      date_a >= date_b
    else
      _ -> :unknown
    end
  end

  @doc """
  Returns true if the file is missing or has zero bytes
  """
  @spec absent?(binary() | Path.t()) :: boolean()
  def absent?(path) do
    with {:ok, %File.Stat{size: size}} when size > 0 <- File.stat(path) do
      false
    else
      _ -> true
    end
  end

  @typep path_like :: binary() | Path.t()
  @typep path_likes :: path_like() | [path_like()]

  @doc """
  Returns a reason if the target is older than the dependencies. Reason will be
  nil if the target is newer.
  """
  @spec stale_reason(path_likes(), path_likes()) :: binary() | nil
  def stale_reason(target, dependencies) do
    case staleness(target, dependencies) do
      {true, reason} -> reason
      {false, _reason} -> nil
    end
  end

  @doc """
  Returns true when the target is older than any of its dependencies. It also returns
  an explanation as to why.
  """
  @spec staleness(path_likes(), path_likes()) :: {stale? :: boolean(), reason :: binary()}
  def staleness(target, dependencies) do
    target_mod = modification_times(target)
    dep_mod = modification_times(dependencies)

    tgt = if target_mod.oldest, do: Path.relative_to_cwd(target_mod.oldest.path)
    dep = if dep_mod.newest, do: Path.relative_to_cwd(dep_mod.newest.path)

    cond do
      target_mod.oldest == nil ->
        {true, "target #{Path.relative_to_cwd(target)} doesn't exist"}

      dep_mod.newest == nil ->
        deps = Enum.map_join(dependencies, ", ", &Path.relative_to_cwd/1)
        {false, "none of the dependencies (#{deps}) exist"}

      target_mod.oldest.mtime < dep_mod.newest.mtime ->
        {true, "target #{tgt} is older than newest dependency #{dep}"}

      true ->
        {false, "targets are newer than newest dependency (#{dep})"}
    end
  end

  @typep file_time :: %{path: binary(), mtime: integer()} | nil
  @spec modification_times(binary() | [binary()]) :: %{oldest: file_time(), newest: file_time()}
  def modification_times(paths) do
    paths
    |> List.wrap()
    |> Parallel.flat_map(&include_descendants/1)
    |> Enum.map(fn path ->
      with {:ok, %{mtime: mtime}} <- File.lstat(path, time: :posix) do
        %{mtime: mtime, path: path}
      else
        _ -> nil
      end
    end)
    |> Enum.reduce(%{oldest: nil, newest: nil}, fn file, %{oldest: oldest, newest: newest} ->
      %{
        oldest: if(oldest && file.mtime < oldest.mtime, do: file) || oldest || file,
        newest: if(newest && file.mtime > newest.mtime, do: file) || newest || file
      }
    end)
  end

  defp include_descendants(path) do
    if File.dir?(path),
      do: [path | Path.wildcard("#{path}/**/*")],
      else: [path]
  end

  defp recurse_files(path, descent_folder_fn) do
    case File.stat(path) do
      {:ok, %{type: :directory}} ->
        with true <- !descent_folder_fn || descent_folder_fn.(path),
             {:ok, list} <- File.ls(path) do
          list
          |> Enum.map(&Path.join(path, &1))
          |> Enum.reduce(MapSet.new(), fn item, files ->
            merge(files, recurse_files(item, descent_folder_fn))
          end)
        else
          false ->
            []

          {:error, reason} ->
            IO.warn("Failed to read #{path}: #{reason}")
            []
        end

      {:ok, %{type: :regular}} ->
        [path]

      {:ok, _stat} ->
        # symlinks, devices, etc.
        []

      {:error, reason} ->
        IO.warn("Failed to read #{path}: #{reason}")
        []
    end
  end

  defp merge(mapset, elem)
  defp merge(mapset, []), do: mapset
  defp merge(mapset, [x]), do: MapSet.put(mapset, x)
  defp merge(mapset, list) when is_list(list), do: list |> MapSet.new() |> MapSet.union(mapset)
  defp merge(mapset, other), do: MapSet.union(mapset, other)

  def capture(func) do
    org_stdout = Process.group_leader()
    {:ok, capture_stdout} = StringIO.open("", capture_prompt: true)
    {:ok, capture_stderr} = StringIO.open("", capture_prompt: true)
    caller = self()
    proxy = ensure_stderr_proxy()
    send(proxy, {:register, caller, capture_stderr})

    try do
      Process.group_leader(self(), capture_stdout)
      result = func.()
      {:ok, {_, stdout}} = StringIO.close(capture_stdout)

      send(proxy, {:unregister, caller, self()})
      receive do: ({:captured, ^caller} -> :ok)

      {_, stderr} = StringIO.contents(capture_stderr)
      StringIO.close(capture_stderr)
      {result, stdout, stderr}
    after
      Process.group_leader(self(), org_stdout)
    end
  end

  defp ensure_stderr_proxy do
    case :persistent_term.get(:stderr_capture_proxy, nil) do
      pid when is_pid(pid) ->
        pid

      nil ->
        # Use a dedicated process as a global lock to ensure exactly-once setup.
        # We spawn a named lock process — only one caller can register it.
        self_ref = self()

        lock_fn = fn ->
          receive do
            {:do_setup, caller} ->
              original = Process.whereis(:standard_error)

              proxy =
                spawn(fn ->
                  # First, take over the :standard_error name before entering the loop.
                  # This must happen in the proxy process itself so it can hold both
                  # the name and run the loop.
                  receive do
                    {:become_standard_error, from} ->
                      Process.unregister(:standard_error)
                      Process.register(self(), :standard_error)
                      send(from, {:setup_done, self()})
                      stderr_proxy_loop(original, %{})
                  end
                end)

              send(proxy, {:become_standard_error, self()})

              receive do
                {:setup_done, ^proxy} ->
                  :persistent_term.put(:stderr_capture_proxy, proxy)
                  send(caller, {:proxy_ready, proxy})
              end

              # Keep the lock process alive so the name stays registered
              Process.sleep(:infinity)
          end
        end

        try do
          lock = spawn(lock_fn)
          Process.register(lock, :stderr_capture_proxy_lock)
          send(lock, {:do_setup, self_ref})

          receive do
            {:proxy_ready, proxy} -> proxy
          end
        rescue
          ArgumentError ->
            # Lost the race — another process is setting up. Wait for it.
            Process.sleep(1)
            ensure_stderr_proxy()
        end
    end
  end

  defp stderr_proxy_loop(original, captures) do
    receive do
      {:register, pid, device} ->
        stderr_proxy_loop(original, Map.put(captures, pid, device))

      {:unregister, pid, reply_to} ->
        send(reply_to, {:captured, pid})
        stderr_proxy_loop(original, Map.delete(captures, pid))

      {:io_request, from, reply_as, request} ->
        target = Map.get(captures, from, original)
        send(target, {:io_request, from, reply_as, request})
        stderr_proxy_loop(original, captures)

      other ->
        send(original, other)
        stderr_proxy_loop(original, captures)
    end
  end
end
