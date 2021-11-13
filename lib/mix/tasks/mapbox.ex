defmodule Mix.Tasks.Velo.Mapbox do
  def data_as_geojson do
    Cache.Map.full_map()
    |> Map.Enrich.with_articles(Article.List.all())
    |> Data.GeoJSON.to_feature_lists()
  end

  def save_geojson(dir) do
    Enum.map(data_as_geojson(), fn {name, geojson} ->
      geojson_path = Path.join(dir, "#{name}.geojson")
      File.write!(geojson_path, Jason.encode!(geojson))
      %{name: name, geojson: geojson, geojson_path: geojson_path}
    end)
  end
end

defmodule Mix.Tasks.Velo.Mapbox.Debug do
  use Mix.Task
  @requirements ["app.start"]

  @path "data/cache/mapbox_geojson_debug/"
  @shortdoc "Dump the GeoJSON files that would be uploaded"
  def run(_opts) do
    File.mkdir_p!(@path)

    Mix.Tasks.Velo.Mapbox.save_geojson(@path)
    |> Enum.each(fn %{name: name, geojson: geojson} ->
      path = Path.join(@path, "#{name}_no_coords.geojson")
      File.write!(path, Jason.encode!(remove_coords(geojson), pretty: true))
    end)

    IO.puts("Debug GeoJSON has been put in #{@path}")
  end

  defp remove_coords(obj) when is_list(obj) do
    Enum.map(obj, &remove_coords/1)
  end

  defp remove_coords(obj) when is_map(obj) do
    obj = Map.replace(obj, :coordinates, [])
    Enum.into(obj, %{}, &remove_coords/1)
  end

  defp remove_coords({key, val}) when is_atom(key) and is_list(val) do
    {key, Enum.map(val, &remove_coords/1)}
  end

  defp remove_coords({key, val}) when is_atom(key) and is_map(val) do
    {key, remove_coords(val)}
  end

  defp remove_coords({key, _val} = elem) when is_atom(key), do: elem
end

defmodule Mix.Tasks.Velo.Mapbox.Update do
  use Mix.Task
  @requirements ["app.start"]
  @prefix "veloroute-ex-"
  @seen_path "data/cache/mapbox_previous_uploads.json"

  @shortdoc "Updates data on Mapbox from local state."
  def run(_opts) do
    {:ok, dir_path} = Temp.mkdir("veloroutehamburgtippecanoe")

    seen = load_seen()

    try do
      Mix.Tasks.Velo.Mapbox.save_geojson(dir_path)
      |> Stream.map(&convert_to_mbtiles/1)
      |> Stream.reject(&uploaded_already?(&1, seen))
      |> Stream.each(&IO.puts("Updating tileset #{&1.name}"))
      |> Stream.each(&Mapbox.upload_file(&1.mbtiles_path))
      |> Enum.each(&update_seen(&1))
    after
      File.rm_rf!(dir_path)
    end
  end

  defp determine_opts(geojson) do
    types =
      geojson[:features]
      |> Enum.reduce(MapSet.new(), fn feat, acc -> MapSet.put(acc, feat[:geometry][:type]) end)
      |> MapSet.to_list()

    if types == ["Point"],
      do: ["-d18", "-D18", "-m18", "-B0", "-z8", "-Z8"],
      else: ["-Z6", "-z13", "--drop-densest-as-needed", "--extend-zooms-if-still-dropping"]
  end

  defp convert_to_mbtiles(%{name: name, geojson: geojson, geojson_path: geojson_path} = all) do
    dir_path = Path.dirname(geojson_path)

    out_name = "#{@prefix}#{name}.mbtiles"
    opts = determine_opts(geojson)
    opts = opts ++ ["--no-progress-indicator", "-o", out_name, geojson_path, "-f"]
    {_out, 0} = System.cmd("tippecanoe", opts, cd: dir_path, stderr_to_stdout: true)

    Map.merge(all, %{
      mbtiles_path: Path.join(dir_path, out_name),
      geojson_md5: Util.md5_file(geojson_path)
    })
  end

  defp uploaded_already?(%{name: name, geojson_md5: md5}, seen) do
    already_uploaded = seen[to_string(name)] == md5
    if already_uploaded, do: IO.puts("Skipping tileset #{name} (same as previous upload)")
    already_uploaded
  end

  defp load_seen() do
    case File.read(@seen_path) do
      {:ok, file} -> Jason.decode!(file)
      _other -> %{}
    end
  end

  defp update_seen(%{name: name, geojson_md5: md5}) do
    seen_json =
      load_seen()
      |> Map.put(name, md5)
      |> Jason.encode!()

    File.write!(@seen_path, seen_json)
  end
end
