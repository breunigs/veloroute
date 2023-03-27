defmodule Basemap.OpenStreetMap do
  use Basemap.Renderable

  @dockerfile Path.join(__DIR__, "Dockerfile.openstreetmap")
  @dockerfile_statistics Path.join(__DIR__, "Dockerfile.geostats")

  @impl Basemap.Renderable
  def target(where), do: path(where, target_name())

  @impl Basemap.Renderable
  def stale?() do
    stale_osm_source?() || stale_bbox_extract?() || stale_extra_shapes?() || stale_tiles?()
  end

  defp stale_osm_source?() do
    Util.IO.age_in_days(path(:cache, osm_source_name())) > Settings.osm_data_source_max_age_days()
  end

  defp stale_bbox_extract?() do
    Util.IO.stale?(path(:cache, bbox_extract_name()), [path(:cache, osm_source_name())])
  end

  defp stale_extra_shapes?(), do: missing_extra_shapes() != []

  defp stale_tiles?() do
    # if tilemaker fails, it'll output an empty sqlite file. So rerender if the
    # file is very small. If our extract is extremely tiny, rerendering should be
    # so fast that it doesn't matter if it was fast anyway.
    stale =
      with {:ok, %{size: size}} <- File.stat(path(:cache, target_name())) do
        size <= 100_000
      else
        _ -> true
      end

    stale ||
      Util.IO.stale?(path(:cache, target_name()), [
        Path.join(__DIR__, "config.json"),
        Path.join(__DIR__, "process.lua"),
        __ENV__.file
      ])
  end

  def target_name(), do: "osm.mbtiles"
  defp osm_source_name, do: "osm_source_#{Util.md5(Settings.osm_data_source())}.osm.pbf"
  defp bbox_extract_name, do: "osm_data_source.#{Enum.join(Settings.bounds(), ",")}.osm.pbf"

  @max_zoom Path.join(__DIR__, "config.json")
            |> File.read!()
            |> Jason.decode!()
            |> get_in(["settings", "maxzoom"])

  def max_zoom, do: @max_zoom

  def statistics do
    ensure()

    %{result: :ok, stdout: json} =
      Docker.build_and_run(
        @dockerfile_statistics,
        [path(:container, target_name())],
        name: "generating statistics for basemap",
        stdout: ""
      )

    Jason.decode!(json)
  end

  @impl Basemap.Renderable
  def render do
    if stale_osm_source?(), do: download_osm_source()
    download_missing_shapes()
    if stale_bbox_extract?(), do: extract_bbox()
    if stale_tiles?(), do: render_tiles()
    :ok
  end

  defp download_osm_source do
    IO.puts(:stderr, "Downloading #{Settings.osm_data_source()}")
    path = path(:cache, osm_source_name())
    :ok = remove_if_exists(path <> ".bak")
    :ok = rename_if_exists(path, path <> ".bak")
    :ok = File.mkdir_p(Path.dirname(path))
    :ok = Util.Download.to_file(Settings.osm_data_source(), path)
  end

  defp missing_extra_shapes do
    Enum.filter(Settings.osm_data_source_extra_shapes(), fn shape ->
      # since we expect to extract the zip, check the folder instead
      dir = path(:cache, Path.basename(Path.rootname(shape)))

      with {:ok, files} when length(files) >= 2 <- File.ls(dir) do
        false
      else
        _ -> true
      end
    end)
  end

  defp download_missing_shapes() do
    Enum.each(missing_extra_shapes(), fn shape ->
      name = Path.rootname(Path.basename(shape))
      dir = path(:cache, name)
      zip = dir <> ".zip"
      dir_c = path(:container, name)
      zip_c = dir_c <> ".zip"

      if !File.exists?(zip) do
        IO.puts("downloading extra shapes #{shape}")
        :ok = Util.Download.to_file(shape, zip)
      end

      File.mkdir_p!(dir)

      %{result: :ok} =
        Docker.build_and_run(
          @dockerfile,
          ["unzip", "-d", dir_c, "-j", "#{zip_c}"],
          name: "unzipping extra shapes #{zip}"
        )
    end)
  end

  defp extract_bbox() do
    args = [
      "nice",
      "-n10",
      "osmconvert",
      "--complete-ways",
      "--complete-multipolygons",
      "--drop-version",
      "--drop-author",
      "-t=/tmp/osmconvert_tempfile",
      "-b=#{Enum.join(Settings.bounds(), ",")}",
      "-o=#{path(:container, bbox_extract_name())}",
      "#{path(:container, osm_source_name())}"
    ]

    %{result: :ok} =
      Docker.build_and_run(
        @dockerfile,
        args,
        name: "extracting bounding box with osmconvert"
      )

    stats = File.stat!(path(:cache, bbox_extract_name()))
    if stats.size == 0, do: raise("osmconvert seemingly failed, output size is 0")

    :ok
  end

  defp render_tiles() do
    args = [
      "nice",
      "-n10",
      "tilemaker",
      "--input",
      path(:container, bbox_extract_name()),
      "--output",
      path(:container, target_name()),
      "--bbox",
      Enum.join(Settings.bounds(), ","),
      "--config",
      path(:container, "config.json"),
      "--process",
      path(:container, "process.lua")
    ]

    lua =
      Path.join(__DIR__, "process.lua")
      |> File.read!()
      |> String.replace("\"%%REPLACE_WITH_ICONS%%\"", Basemap.Sprites.list_for_lua())
      |> String.replace("%%REPLACE_WITH_ICONS%%", Basemap.Sprites.list_for_lua())

    File.write!(path(:cache, "process.lua"), lua)

    File.cp!(Path.join(__DIR__, "config.json"), path(:cache, "config.json"))

    %{result: :ok} =
      Docker.build_and_run(
        @dockerfile,
        args,
        name: "creating map tiles"
      )
  end

  defp remove_if_exists(file) do
    if File.exists?(file), do: File.rm(file), else: :ok
  end

  defp rename_if_exists(from, to) do
    if File.exists?(from), do: File.rename(from, to), else: :ok
  end
end