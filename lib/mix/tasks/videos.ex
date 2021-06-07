defmodule Mix.Tasks.Velo.Videos do
  # XXX: path needs to be absolute for JOSM to find it
  @working_dir File.cwd!()
  @out_anonymized @working_dir <> "/data/cache/videos_anonymized.gpx"
  @out_pending @working_dir <> "/data/cache/videos_pending.gpx"

  def out_anonymized, do: @out_anonymized
  def out_pending, do: @out_pending
end

defmodule Mix.Tasks.Velo.Videos.Render do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Finds videos from the map and renders them"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    Cache.Map.full_map()
    |> Video.TrimmedSourceSequence.list_from_map()
    |> Enum.reject(&Video.TrimmedSourceSequence.already_rendered?(&1))
    |> Enum.each(fn tsv_seq ->
      preview = tsv_seq |> Video.TrimmedSourceSequence.preview() |> Enum.join(" ")
      render = tsv_seq |> Video.TrimmedSourceSequence.render() |> Enum.join(" ")

      IO.puts("\nneed to convert #{tsv_seq.hash}:\n    #{preview}\n    #{render}")
    end)
  end
end

defmodule Mix.Tasks.Velo.Videos.Index do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Indexes videos and their anonymization status"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run() do
    IO.puts("Indexing videos…")

    {anon, pending} =
      Settings.video_source_dir_abs()
      |> tree()
      |> group()
      |> Enum.reduce({[], []}, fn video, {anon, pending} ->
        case video do
          %{available_gpx: false, path_source: source} ->
            IO.puts("skipping #{source} as it doesn't have a GPX file")
            {anon, pending}

          %{available_anonymized: true} ->
            {[named_track_segments_task(video) | anon], pending}

          %{available_anonymized: false} ->
            {anon, [named_track_segments_task(video) | pending]}
        end
      end)

    anon = anon |> join_tasks() |> wrap()
    pending = pending |> join_tasks() |> wrap()

    :ok = File.write(out_anonymized(), anon)
    IO.puts("Wrote #{out_anonymized()}")
    :ok = File.write(out_pending(), pending)
    IO.puts("Wrote #{out_pending()}")
  end

  defp wrap(tracks) do
    """
      <?xml version='1.0' encoding='UTF-8'?>
      <gpx version="1.1" creator="JOSM GPX export" xmlns="http://www.topografix.com/GPX/1/1"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
        #{tracks}
      </gpx>
    """
    |> String.trim()
  end

  defp join_tasks(list) do
    list |> Enum.map(&Task.await(&1, :infinity)) |> Enum.join("\n\n")
  end

  defp named_track_segments_task(x) do
    Task.async(fn -> named_track_segments(x) end)
  end

  defp named_track_segments(%{path_gpx: rel_path}) do
    abs_path = Path.join(Settings.video_source_dir_abs(), rel_path)
    {:ok, content} = File.read(abs_path)

    Regex.scan(~r/<trkseg>.*?<\/trkseg>/s, content)
    |> Enum.map(fn seg -> "<trk><name>" <> rel_path <> "</name>" <> hd(seg) <> "</trk>" end)
    |> Enum.join("\n")
  end

  defp group(files) do
    files
    |> Enum.map(fn file -> Video.Source.new_from_path(file, files) end)
    |> Enum.reject(fn
      {:error, _reason} -> true
      _video -> false
    end)
  end

  defp tree(path) do
    case File.stat(path) do
      {:ok, %{type: :directory}} ->
        case File.ls(path) do
          {:ok, list} ->
            list
            |> Enum.map(&Path.join(path, &1))
            |> Enum.reduce(MapSet.new(), fn item, files ->
              merge(files, tree(item))
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
