defmodule Mix.Tasks.Velo.Map.Image.FromQgis do
  use Mix.Task
  require Logger

  @requirements ["app.start"]

  @output_dir "./videos/rendered/map_images"

  @shortdoc "Reads overlays from QGIS Project file and converts them to PMTiles"
  def run(args) do
    with {:ok, given, name} <- parse_args(args),
         {:ok, proj} <- find_project_file(given),
         out_path = out_path(name),
         true <- !File.exists?(out_path) || confirm_overwrite(out_path),
         {:ok, data} <- read_project_file(proj),
         {:ok, tifs} <- find_tifs(data, Path.dirname(proj)),
         tifs = Enum.reverse(tifs),
         :ok <- to_pmtiles(tifs, name) do
      maybe_add_map_entry(name, tifs)

      has_name = Article.List.find_exact(name)
      if !has_name, do: Logger.warning("no article with the name #{name} found")
      name_ref = if has_name, do: "name()", else: "#{name}"

      Logger.info("""

      output written to\n#{out_path}

      def map_image do
        {#{name_ref}, [{"<attrib name>", "<url>"}]}
      end

      <.h4_planning ref={@ref} checked={@show_map_image}/>

      """)
    else
      {:error, reason} -> IO.puts("failed to convert:\n#{reason}")
    end
  end

  defp confirm_overwrite(path) do
    if Cli.confirm("Output at #{path} already exists. Overwrite?") do
      true
    else
      {:error, "not overwriting existing files"}
    end
  end

  @spec parse_args([binary()]) ::
          {:ok, proj_qgz :: binary(), article_name :: binary()} | {:error, binary()}
  defp parse_args([proj, input]) when is_binary(input) and is_binary(proj) do
    name =
      case Article.List.resolve(input) do
        nil -> Path.basename(input, ".ex")
        mod -> mod.name()
      end

    {:ok, proj, name}
  end

  defp parse_args(other),
    do:
      {:error,
       """
       Usage:
         mix velo.map.image.from_qgis <qgis_project.qgz> <article name>
       got these arguments: #{inspect(other)})
       """}

  # Accept any file of an export, e.g. a TIF, and look for the project beside
  # it. The project name is a prefix of the exported file names.
  @spec find_project_file(binary()) :: {:ok, binary()} | {:error, binary()}
  defp find_project_file(path) do
    if ending?(path, ".qgz") || ending?(path, ".qgs") do
      {:ok, path}
    else
      case project_candidates(path) do
        [] -> {:error, "found no .qgz/.qgs project matching #{path}"}
        [found | _rest] -> {:ok, log_project(found)}
      end
    end
  end

  defp project_candidates(path) do
    rootname = Path.rootname(path)

    Path.wildcard(Path.dirname(path) <> "/*.{qgz,qgs,QGZ,QGS}")
    |> Enum.filter(&String.starts_with?(rootname, Path.rootname(&1)))
    |> Enum.sort_by(&(-String.length(&1)))
  end

  defp log_project(path) do
    Logger.info("using project file #{path}")
    path
  end

  @spec read_project_file(binary()) :: {:ok, binary()} | {:error, binary() | File.posix()}
  defp read_project_file(path) do
    with {:ok, data} <- File.read(path) do
      if ending?(path, ".qgz") do
        with {:ok, files} <- Util.Compress.unzip(data) do
          Enum.find_value(files, fn {name, data} ->
            if ending?(name, ".qgs"), do: {:ok, data}
          end) || {:error, "ZIP file doesn't contain any qgs files"}
        end
      else
        {:ok, data}
      end
    else
      error -> {:error, "failed to read project file at #{path}: #{inspect(error)}"}
    end
  end

  @spec find_tifs(binary(), binary()) :: {:ok, [binary()]} | {:error, binary()}
  defp find_tifs(data, relative_to) do
    with {:ok, {"qgis", _attrs, elems}} <- Saxy.SimpleForm.parse_string(data) do
      elems
      |> find_tags("layer-tree-layer")
      |> Enum.filter(&qt_checked?/1)
      |> Enum.map(&attr(&1, "source"))
      |> Enum.filter(&ending?(&1, ".tif"))
      |> Enum.map(fn f -> f |> Path.absname(relative_to) |> Path.expand() end)
      |> case do
        [] -> {:error, "no visible layers found"}
        list -> {:ok, Enum.uniq(list)}
      end
    else
      {:error, %Saxy.ParseError{} = err} -> {:error, "XML parse failed: #{inspect(err)}"}
    end
  end

  @image_ref {:dockerfile, "tools/pmtiles/Dockerfile.pmtiles"}
  @spec to_pmtiles([binary()], binary()) :: :ok | {:error, binary()}
  defp to_pmtiles(imgs_out, name) do
    dirs_out = imgs_out |> Enum.map(&Path.dirname/1) |> Enum.uniq()

    imgs_in = Enum.map(imgs_out, &Path.join("/inputs", &1))
    dirs_in = Enum.map(dirs_out, &Path.join("/inputs", &1))

    mounts = Enum.zip(dirs_out, dirs_in) |> Enum.into(%{})
    mounts = Map.put(mounts, @output_dir, "/output")

    Util.Docker.build_and_run(
      "converting TIFs into PMTiles",
      @image_ref,
      %{
        docker_args: ["-t"],
        command_args: skip_footprint(imgs_out) ++ [out_name(name) | imgs_in],
        mounts: mounts
      },
      slow_warn_message: false
    )
  end

  # gdal_footprint reads the whole raster, which takes minutes. The export
  # already answered the question, so do not ask it again.
  defp skip_footprint(tifs) do
    if export_footprints?(tifs), do: ["--no-footprint"], else: []
  end

  defp out_name(name), do: "#{name}.pmtiles"

  defp out_path(name) do
    Path.join(@output_dir, out_name(name)) |> Path.expand()
  end

  defp find_tags(xml, tag_name) do
    Enum.flat_map(xml, fn
      {^tag_name, _attrs, _children} = elm ->
        [elm]

      {_tag_name, _attrs, children} ->
        find_tags(children, tag_name)

      _other ->
        []
    end)
    |> Util.compact()
  end

  defp maybe_add_map_entry(name, tifs) do
    {paths, from_export} = footprint_paths(name, tifs)

    jsons =
      Enum.flat_map(paths, fn path ->
        case File.read(path) do
          {:ok, json} -> [json]
          {:error, _} -> []
        end
      end)

    # gdal_footprint writes this file. The task does not need it later.
    File.rm(Path.join(@output_dir, "#{name}.geojson") |> Path.expand())

    cond do
      jsons == [] ->
        Logger.warning("no footprint found, skipping map.osm entry")

      has_map_entry?(name) ->
        Logger.info("map.osm already has an entry for '#{name}', skipping")

      true ->
        # Legends cover ground outside the map.
        if !from_export,
          do: Logger.warning("no footprint from the export. The area can be too large.")

        case extract_polygon(jsons) do
          {:ok, coords} ->
            add_to_map_osm(name, coords)
            Logger.info("added article polygon with #{length(coords)} points to map.osm")

          {:error, reason} ->
            Logger.warning("failed to extract polygon: #{reason}")
        end
    end
  end

  # The export writes a footprint beside each TIF. It covers the map only.
  # gdal_footprint writes the fallback. It cannot tell a legend from the map.
  defp footprint_paths(name, tifs) do
    if export_footprints?(tifs),
      do: {export_footprints(tifs), true},
      else: {[Path.join(@output_dir, "#{name}.geojson") |> Path.expand()], false}
  end

  defp export_footprints(tifs), do: Enum.map(tifs, &(Path.rootname(&1) <> ".geojson"))

  # All of them, or none. One missing file leaves a hole in the area.
  defp export_footprints?(tifs) do
    paths = export_footprints(tifs)
    paths != [] and Enum.all?(paths, &File.exists?/1)
  end

  # An article has one closed way. Keep a single ring as it is. Join several
  # rings into their hull, because one way cannot hold a hole or a gap.
  defp extract_polygon(jsons) do
    case Enum.flat_map(jsons, &outer_rings/1) do
      [] -> {:error, "GeoJSON contains no polygons"}
      [ring] -> {:ok, ring}
      rings -> {:ok, rings |> Enum.concat() |> convex_hull()}
    end
  end

  defp outer_rings(json) do
    case Jason.decode(json) do
      {:ok, %{"features" => features}} when is_list(features) ->
        Enum.flat_map(features, fn
          %{"geometry" => %{"type" => "Polygon", "coordinates" => [outer | _]}} ->
            [outer]

          %{"geometry" => %{"type" => "MultiPolygon", "coordinates" => polygons}} ->
            Enum.flat_map(polygons, fn
              [outer | _] -> [outer]
              _empty -> []
            end)

          _other ->
            []
        end)

      _other ->
        []
    end
  end

  # Andrew monotone chain.
  defp convex_hull(points) do
    sorted = points |> Enum.uniq() |> Enum.sort()
    Enum.drop(half_hull(sorted), -1) ++ Enum.drop(half_hull(Enum.reverse(sorted)), -1)
  end

  defp half_hull(points) do
    points |> Enum.reduce([], &add_to_hull/2) |> Enum.reverse()
  end

  defp add_to_hull(point, [second, first | rest]) do
    if cross(first, second, point) <= 0,
      do: add_to_hull(point, [first | rest]),
      else: [point, second, first | rest]
  end

  defp add_to_hull(point, hull), do: [point | hull]

  defp cross([ox, oy], [ax, ay], [bx, by]),
    do: (ax - ox) * (by - oy) - (ay - oy) * (bx - ox)

  defp has_map_entry?(name) do
    osm = File.read!(Map.Parser.default_map_path())
    String.contains?(osm, "v='#{name}'")
  end

  defp add_to_map_osm(name, coordinates) do
    osm_path = Map.Parser.default_map_path()
    raw = File.read!(osm_path)

    # Find minimum existing ID
    min_id =
      Regex.scan(~r/id='(-?\d+)'/, raw)
      |> Enum.map(fn [_, id] -> String.to_integer(id) end)
      |> Enum.min()

    # Remove duplicate closing coordinate (GeoJSON closes the ring)
    coords =
      if List.first(coordinates) == List.last(coordinates),
        do: Enum.drop(coordinates, -1),
        else: coordinates

    first_node_id = min_id - 1
    node_ids = Enum.to_list(first_node_id..(first_node_id - length(coords) + 1)//-1)
    nodes_and_ids = Enum.zip(coords, node_ids)

    nodes_xml =
      Enum.map_join(nodes_and_ids, fn {[lon, lat], id} ->
        lat_s = :erlang.float_to_binary(lat / 1, decimals: 7)
        lon_s = :erlang.float_to_binary(lon / 1, decimals: 7)
        "  <node id='#{id}' lat='#{lat_s}' lon='#{lon_s}' />\n"
      end)

    # Close the ring by referencing first node again
    nd_refs =
      Enum.map_join(node_ids ++ [first_node_id], fn id ->
        "    <nd ref='#{id}' />\n"
      end)

    way_id = List.last(node_ids) - 1

    way_xml =
      "  <way id='#{way_id}'>\n#{nd_refs}" <>
        "    <tag k='name' v='#{name}' />\n" <>
        "    <tag k='type' v='article' />\n" <>
        "  </way>\n"

    new_raw = String.replace(raw, "</osm>", "#{nodes_xml}#{way_xml}</osm>")
    File.write!(osm_path, new_raw)
  end

  defp ending?(path, ending) do
    path |> String.downcase() |> String.ends_with?(ending)
  end

  defp qt_checked?({_tag_name, attrs, _children}) do
    Enum.member?(attrs, {"checked", "Qt::Checked"})
  end

  defp attr({_tag_name, attrs, _children}, attr) do
    Enum.find_value(attrs, fn
      {^attr, val} -> val
      _other -> false
    end)
  end
end
