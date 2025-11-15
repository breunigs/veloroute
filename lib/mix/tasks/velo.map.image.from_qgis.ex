defmodule Mix.Tasks.Velo.Map.Image.FromQgis do
  use Mix.Task
  require Logger

  @requirements ["app.start"]

  @output_dir "./videos/rendered/map_images"

  @shortdoc "Reads overlays from QGIS Project file and converts them to PMTiles"
  def run(args) do
    with {:ok, proj, name} <- parse_args(args),
         out_path = out_path(name),
         true <- !File.exists?(out_path) || confirm_overwrite(out_path),
         {:ok, data} <- read_project_file(proj),
         {:ok, tifs} <- find_tifs(data, Path.dirname(proj)),
         true <- maybe_modify_tifs(tifs),
         tifs = Enum.reverse(tifs),
         :ok <- to_pmtiles(tifs, name) do
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

  defp maybe_modify_tifs(tifs) do
    IO.puts("There are #{length(tifs)} usable images – please remove any unneccessary borders")
    Enum.each(tifs, fn tif -> IO.puts("  gimp '#{tif}'") end)

    Cli.confirm("Continue?")
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
  defp parse_args([proj, name]) when is_binary(name) and is_binary(proj) do
    name = String.replace_suffix(name, ".ex", "")
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
        command_args: [out_name(name) | imgs_in],
        mounts: mounts
      },
      slow_warn_message: false
    )
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
