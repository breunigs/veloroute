defmodule Util.IO do
  @doc """
  Takes a path and recursively list all files, returning the list with paths
  including the given path as a prefix. Symlinks, devices, etc. are not being
  followed.
  """
  @spec tree(binary()) :: [binary()]
  def tree(path) do
    path
    |> recurse_files()
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

    tgt = Path.relative_to_cwd(target_mod.oldest.path)
    dep = Path.relative_to_cwd(dep_mod.newest.path)

    cond do
      target_mod.oldest == nil ->
        {true, "target #{Path.relative_to_cwd(target)} doesn't exist"}

      dep_mod.newest == nil ->
        deps = dependencies |> Enum.map(&Path.relative_to_cwd/1) |> Enum.join(", ")
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

  defp recurse_files(path) do
    case File.stat(path) do
      {:ok, %{type: :directory}} ->
        case File.ls(path) do
          {:ok, list} ->
            list
            |> Enum.map(&Path.join(path, &1))
            |> Enum.reduce(MapSet.new(), fn item, files ->
              merge(files, recurse_files(item))
            end)

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
end
