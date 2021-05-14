defmodule Mix.Tasks.IndexVideos do
  use Mix.Task

  # XXX: path needs to be absolute for JOSM to find it
  @out_anonymized File.cwd!() <> "/data/cache/videos_anonymized.gpx"
  @out_pending File.cwd!() <> "/data/cache/videos_pending.gpx"
  @videopath File.cwd!() <> "/videos"
  @source_ending ".MP4"
  @gpx_ending ".gpx"
  @anonymized_ending ".MP4.anonymized.mkv"

  @shortdoc "Indexes videos and their anonymization status"
  def run(_) do
    case video_dir_present?() do
      {:error, msg} ->
        IO.warn(msg, [])
        :error
        exit(:no_video_dir)

      :ok ->
        real_run()
    end
  end

  def out_anonymized, do: @out_anonymized
  def out_pending, do: @out_pending

  defp real_run() do
    IO.puts("Indexing videos…")

    {anon, pending} =
      @videopath
      |> tree()
      |> group()
      |> Enum.reduce({"", ""}, fn video, {anon, pending} ->
        case video do
          %{has_gpx: false} ->
            {anon, pending}

          %{is_anonymized: true} ->
            {anon <> "\n\n" <> named_track_segments(video), pending}

          %{is_anonymized: false} ->
            {anon, pending <> "\n\n" <> named_track_segments(video)}
        end
      end)

    :ok = File.write(out_anonymized(), wrap(anon))
    IO.puts("Wrote #{out_anonymized()}")
    :ok = File.write(out_pending(), wrap(pending))
    IO.puts("Wrote #{out_pending()}")
  end

  defp video_dir_present? do
    case File.stat(@videopath) do
      {:ok, %{type: :directory}} ->
        :ok

      {:ok, %{type: :symlink}} ->
        :ok

      any ->
        {:error,
         "#{@videopath} should point to video data, but it's not accessible: #{inspect(any)}"}
    end
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
    name = Path.relative_to(path, @videopath)
    {:ok, content} = File.read(path)

    Regex.scan(~r/<trkseg>.*?<\/trkseg>/s, content)
    |> Enum.map(fn seg -> "<trk><name>" <> name <> "</name>" <> hd(seg) <> "</trk>" end)
    |> Enum.join("\n")
  end

  defp group(files) do
    files
    |> Enum.filter(&is_source?/1)
    |> Enum.map(fn file ->
      base = String.replace_suffix(file, @source_ending, "")
      has_gpx = MapSet.member?(files, base <> @gpx_ending)
      unless has_gpx, do: IO.warn("#{file} has no associcated GPX, maybe try `gopro2gpx #{file}`")

      %{
        path_source: file,
        path_anonymized: base <> @anonymized_ending,
        path_gpx: base <> @gpx_ending,
        is_anonymized: MapSet.member?(files, base <> @anonymized_ending),
        has_gpx: has_gpx,
        date: date_from_path(file)
      }
    end)
  end

  defp date_from_path(file) do
    case Regex.run(~r/\b\d\d\d\d-\d\d-\d\d\b/, file) do
      nil -> "unknown"
      str -> str
    end
  end

  defp is_source?(path),
    do: String.ends_with?(path, @source_ending) && !String.ends_with?(path, @anonymized_ending)

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

  # defp
end
