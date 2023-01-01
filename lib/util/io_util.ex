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
