defmodule Mix.Tasks.Velo.Videos do
  def osm_index_path(year), do: "data/cache/videos_#{year}.osm"
end

defmodule Mix.Tasks.Velo.Videos.Generate do
  use Mix.Task

  @shortdoc "Finds videos in routes and articles and generates their metadata"
  def run(["all"]) do
    generate(fn _track -> true end)
    |> list_unused()
  end

  def run(["new"]) do
    existing =
      Video.Rendered.all()
      |> Enum.filter(& &1.rendered?)
      |> Enum.map(&{&1.sources(), true})
      |> Enum.into(%{})

    generate(fn track -> !Map.has_key?(existing, track.videos) end)
  end

  def run(_args) do
    IO.puts(
      :stderr,
      "Please specifiy which video renders to generate:\n* all = create new from tracks and update all existing ones\n* new = only for un-rendered tracks (as matched by the sources)"
    )
  end

  @spec generate((Video.Track.t() -> boolean())) :: [Video.Rendered.t() | nil]
  defp generate(filter) do
    Article.List.all()
    |> Stream.flat_map(& &1.tracks())
    |> Stream.filter(filter)
    |> Stream.uniq()
    |> Tqdm.tqdm(description: "generating")
    |> Parallel.map(&Video.Rendered.save_from_track/1)
    |> Enum.map(fn
      rendered when is_atom(rendered) ->
        rendered

      broken ->
        IO.puts(:stderr, inspect(broken))
        nil
    end)
  end

  defp list_unused(rendered) do
    keep = rendered |> MapSet.new()
    all = Video.Rendered.all() |> MapSet.new()
    unused = MapSet.difference(all, keep)

    if MapSet.size(unused) > 0 do
      IO.puts(:stderr, "unused/unreferenced rendered videos:")
      Enum.each(unused, &IO.puts(:stderr, "#{Video.Rendered.path(&1)}: #{&1.name()}"))
      IO.puts(:stderr, "\n")
    end
  end
end

defmodule Mix.Tasks.Velo.Videos.Render do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Print commands to render videos that are still missing. Provide arguments to filter (e.g. hashes to render)"
  def run(filters) do
    Docker.build("tools/ffmpeg/Dockerfile.ffmpeg")

    Video.Dir.must_exist!(fn ->
      filters |> find() |> Enum.sort_by(& &1.name) |> info() |> render()
    end)
  end

  defp info(videos) do
    IO.puts(:stderr, "Rendering #{length(videos)} videos:")
    Enum.each(videos, fn vid -> IO.puts(:stderr, "* #{vid.hash()} #{vid.name()}") end)
    IO.puts(:stderr, "")
    videos
  end

  @spec find(nil | [binary()]) :: any()
  defp find(nil), do: Video.Rendered.pending()
  defp find([]), do: Video.Rendered.pending()

  defp find(filters) when is_list(filters) and length(filters) >= 1 do
    filters = filters |> Enum.flat_map(&clean/1) |> MapSet.new()

    Video.Rendered.pending()
    |> Enum.reject(fn video ->
      ident = [video.name(), video.hash()] |> Enum.flat_map(&clean/1) |> MapSet.new()
      MapSet.disjoint?(ident, filters)
    end)
  end

  @spec clean(binary()) :: [binary()]
  defp clean(string) do
    string
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9\s-]+/, " ")
    |> String.trim()
    |> String.split(~r/\s+/)
  end

  defp render(videos) do
    Enum.each(videos, fn rendered ->
      banner = """

      ###########################################################
      # Name: #{rendered.name}
      # Hash: #{rendered.hash}
      ##########################################################
      """

      case Video.Renderer.render(rendered) do
        :ok ->
          :ok

        {:error, reason} ->
          IO.puts(banner)
          IO.puts("failed: #{reason}")

        %{result: {:error, reason}} ->
          IO.puts(banner)
          IO.puts(reason)
      end
    end)
  end
end

defmodule Mix.Tasks.Velo.Videos.Preview do
  use Mix.Task
  @requirements ["app.start"]

  @video_player [
    "mpv",
    "--pause",
    "--no-resume-playback",
    "--framedrop=no",
    "--audio=no",
    "--keep-open=yes",
    "--demuxer-max-bytes=10G",
    "--force-seekable=no",
    "-"
  ]

  @shortdoc "Print commands to preview videos that are still missing. Set BLUR=1 to include blurs."
  def run(args) do
    Video.Dir.must_exist!()
    if args == [], do: list(), else: preview(hd(args))
  end

  defp list do
    Video.Rendered.pending()
    |> Enum.sort_by(& &1.name)
    |> Enum.each(fn rendered ->
      IO.puts("""

      #{rendered.name}
      BLUR=1 MIX_QUIET=1 mix velo.videos.preview #{rendered.hash} | #{Util.cli_printer(@video_player)}
      """)
    end)
  end

  defp preview(hash) do
    rendered = Video.Rendered.find_by_hash(hash)

    if rendered == nil do
      IO.puts(:stderr, "No video with ”#{hash}“ found. Maybe try “mix velo.videos.generate”?")
    else
      blur = System.get_env("BLUR", nil) == "1"
      cmd = Video.Renderer.preview_cmd(rendered, blur)
      Docker.build_and_run("tools/ffmpeg/Dockerfile.ffmpeg", cmd, name: "preview #{hash}")
    end
  end
end

defmodule Mix.Tasks.Velo.Videos.Preload do
  use Mix.Task
  import Mix.Tasks.Velo.Videos
  @seen_path "data/cache/video_previous_preloads.json"

  @shortdoc "Print command to preload the videos on the server"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    video_files =
      Settings.video_target_dir_abs()
      |> IOUtil.tree()
      |> Enum.map(&Path.relative_to(&1, Settings.video_target_dir_abs()))

    seen = load_seen()

    Video.Rendered.rendered()
    |> Enum.flat_map(fn rendered ->
      Enum.filter(video_files, &String.starts_with?(&1, rendered.hash))
    end)
    |> Enum.reject(&MapSet.member?(seen, &1))
    |> Parallel.map(4, fn path ->
      full_path = Path.join(Settings.deploy_video_mount_dir(), path)
      cmd = [Settings.deploy_ssh_name(), "--", "cat", full_path, ">/dev/null"]

      try do
        System.cmd("ssh", cmd)
        |> case do
          {_msgs, 0} ->
            IO.puts("✓ #{path}")
            path

          {msgs, exit_code} ->
            IO.puts(:stderr, "FAILED #{path} with exit code #{exit_code}:\n#{msgs}\n\n")
            nil
        end
      rescue
        error ->
          IO.puts(:stderr, "FAILED #{path}:\n#{inspect(error)}\n\n")
          nil
      end
    end)
    |> Util.compact()
    |> update_seen(seen)
  end

  defp load_seen() do
    case File.read(@seen_path) do
      {:ok, file} -> file |> Jason.decode!() |> MapSet.new()
      _other -> MapSet.new()
    end
  end

  @spec update_seen(list(binary()), MapSet.t()) :: :ok | {:error, binary()}
  defp update_seen(preloaded, previously_seen) when is_list(preloaded) do
    preloaded = MapSet.new(preloaded)
    seen_json = previously_seen |> MapSet.union(preloaded) |> MapSet.to_list() |> Jason.encode!()
    File.write(@seen_path, seen_json)
  end
end

defmodule Mix.Tasks.Velo.Videos.Index do
  use Mix.Task
  import Mix.Tasks.Velo.Videos

  @shortdoc "Indexes videos and their GPX tracks"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  @max_ids_per_single_track 10_000

  defp real_run() do
    IO.puts("Finding videos…")
    current_year = Date.utc_today().year

    Settings.video_source_dir_abs()
    |> Video.Source.new_from_folder()
    |> Enum.reduce({%{}, %{}, %{}}, fn video, {ids, tracks, exists} ->
      case video do
        %{available_gpx: false, name: source} ->
          IO.puts("skipping #{source} as it doesn't have a GPX file")
          {ids, tracks}

        %{date: %{year: year}} ->
          exists = Map.put_new_lazy(exists, year, fn -> File.exists?(osm_index_path(year)) end)

          if !exists[year] || year == current_year do
            ids = Map.update(ids, year, -1, fn prev -> prev - @max_ids_per_single_track end)
            task = named_track_segments_task(video, ids[year])
            tracks = Map.update(tracks, year, [task], fn list -> [task | list] end)

            {ids, tracks, exists}
          else
            {ids, tracks, exists}
          end
      end
    end)
    |> elem(1)
    |> Enum.each(fn {year, tasks} ->
      osm = tasks |> join_tasks() |> wrap()
      :ok = File.write(osm_index_path(year), osm)
      IO.puts("Wrote #{osm_index_path(year)}")
    end)
  end

  defp wrap(data) do
    """
      <?xml version='1.0' encoding='UTF-8'?>
      <osm version='0.6' upload='false'>
        #{data}
      </osm>
    """
    |> String.trim()
  end

  defp join_tasks(list) when is_list(list) do
    list |> Enum.map(&Task.await(&1, :infinity)) |> Enum.join("\n\n")
  end

  defp named_track_segments_task(x, base_osm_id) do
    Task.async(fn ->
      res = named_track_segments(x, base_osm_id)
      IO.write('.')
      res
    end)
  end

  defp named_track_segments(%Video.Source{} = source, base_osm_id) do
    source
    |> Video.Source.timed_points()
    |> case do
      {:error, msg} ->
        IO.warn(msg)
        ""

      points ->
        {osm_id, nodes, refs} =
          Enum.reduce(points, {base_osm_id, "", ""}, fn tp, {osm_id, nodes, refs} ->
            node = Video.TimedPoint.to_osm_node(tp, osm_id)
            ref = "<nd ref='#{osm_id}' />"
            # refs need to be in right order, but for the nodes itself it doesn't matter
            {osm_id - 1, node <> nodes, refs <> ref}
          end)

        """
          <way id='#{osm_id}'>
            #{refs}
            <tag k='gpx:name' v='#{source.source}' />
            <tag k='oneway' v='yes' />
          </way>
          #{nodes}
        """
    end
  end
end

defmodule Mix.Tasks.Velo.Videos.Detect do
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Detects regions to anonymize and stores the results alongside the videos"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run() do
    Docker.build_detector_image()
    Docker.boot_detector()
  end
end
