defmodule Mix.Tasks.Velo.Videos do
  # XXX: path needs to be absolute for JOSM to find it
  @working_dir File.cwd!()
  @out_anonymized @working_dir <> "/data/cache/videos_anonymized.gpx"
  @out_pending @working_dir <> "/data/cache/videos_pending.gpx"

  def ensure_source_dir_exists(fun) when is_function(fun) do
    case video_dir_present?() do
      {:error, msg} ->
        IO.warn(msg, [])
        :error
        exit(:no_video_dir)

      :ok ->
        fun.()
    end
  end

  def out_anonymized, do: @out_anonymized
  def out_pending, do: @out_pending

  defp video_dir_present? do
    Settings.video_source_dir_abs()
    |> File.stat()
    |> case do
      {:ok, %{type: :directory}} ->
        :ok

      {:ok, %{type: :symlink}} ->
        :ok

      any ->
        {:error,
         "#{Settings.video_source_dir_abs()} should point to video data, but it's not accessible: #{inspect(any)}"}
    end
  end
end

defmodule Mix.Tasks.Velo.Videos.Render do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Finds videos from the map and renders them"
  def run(_) do
    ensure_source_dir_exists(&real_run/0)
  end

  defp real_run do
    # TODO: stale cache after edit map?

    Data.MapCache.full_map()
    |> TrimmedSourceVideoSequence.list_from_map()
    |> Enum.reject(&TrimmedSourceVideoSequence.already_rendered?(&1))
    |> Enum.each(fn tsv_seq ->
      preview = tsv_seq |> TrimmedSourceVideoSequence.preview() |> Enum.join(" ")
      render = tsv_seq |> TrimmedSourceVideoSequence.render() |> Enum.join(" ")

      IO.puts("\nneed to convert #{tsv_seq.hash}:\n    #{preview}\n    #{render}")
    end)
  end
end

defmodule Mix.Tasks.Velo.Videos.Index do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Indexes videos and their anonymization status"
  def run(_) do
    ensure_source_dir_exists(&real_run/0)
  end

  defp real_run() do
    IO.puts("Indexing videos…")

    {anon, pending} =
      Settings.video_source_dir_abs()
      |> tree()
      |> group()
      |> Enum.reduce({"", ""}, fn video, {anon, pending} ->
        case video do
          %{available_gpx: false} ->
            {anon, pending}

          %{available_anonymized: true} ->
            {anon <> "\n\n" <> named_track_segments(video), pending}

          %{available_anonymized: false} ->
            {anon, pending <> "\n\n" <> named_track_segments(video)}
        end
      end)

    :ok = File.write(out_anonymized(), wrap(anon))
    IO.puts("Wrote #{out_anonymized()}")
    :ok = File.write(out_pending(), wrap(pending))
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

  defp named_track_segments(%{path_gpx: path}) do
    name = Path.relative_to(path, Settings.video_source_dir_abs())
    {:ok, content} = File.read(path)

    Regex.scan(~r/<trkseg>.*?<\/trkseg>/s, content)
    |> Enum.map(fn seg -> "<trk><name>" <> name <> "</name>" <> hd(seg) <> "</trk>" end)
    |> Enum.join("\n")
  end

  defp group(files) do
    files
    |> Enum.map(fn file -> SourceVideo.new_from_path(file, files) end)
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
