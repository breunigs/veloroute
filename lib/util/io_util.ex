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
  Returns true when the target is older than any of its dependencies
  """
  @spec stale?(binary() | Path.t(), [binary() | Path.t()]) :: boolean()
  def stale?(target, dependencies) when is_binary(target) and is_list(dependencies) do
    {oldest_target, _} = modification_times(target)

    {_, newest_dep} =
      dependencies
      |> Enum.map(&modification_times/1)
      |> Enum.reduce(fn {dmin, dmax}, {amin, amax} ->
        {min(dmin, amin), max(dmax, amax)}
      end)

    newest_dep > oldest_target || oldest_target == :unknown
  end

  defp modification_times(path) do
    if !File.exists?(path) do
      {:unknown, :unknown}
    else
      [path | Path.wildcard("#{path}/**/*")]
      |> Enum.map(fn path ->
        with {:ok, %{mtime: date}} <- File.lstat(path, time: :posix) do
          date
        else
          _ -> :unknown
        end
      end)
      |> Enum.min_max()
    end
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
