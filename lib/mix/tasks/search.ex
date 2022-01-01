defmodule Mix.Tasks.Velo.Search.GeneratePolylines do
  use Mix.Task
  @cache_dir "data/cache/"
  @source "street_polyline_source.pbf"

  # @street_polyline_cache_source "data/cache/street_polyline_source.pbf"
  # @street_polyline_cache_source "data/cache/street_polyline_source.pbf"
  @requirements ["app.start"]

  @shortdoc "Downloads and prepares the polylines used to visualize search results on the map"
  def run(_params) do
    maybe_download_pbf()
    maybe_pbf_trim_to_bbox()
    maybe_create_polylines()

    Geo.StreetPolyline.generate_from_file(polyline_host())
  end

  defp maybe_download_pbf() do
    if File.exists?(source_host()) do
      :ok
    else
      url = Settings.street_polyline_source()
      IO.puts("Downloading #{url}")

      # delete dependent files
      File.rm(bbox_host())
      File.rm(polyline_host())

      Util.download(url, source_host())
    end
  end

  defp maybe_pbf_trim_to_bbox() do
    if File.exists?(bbox_host()) do
      :ok
    else
      IO.puts("Trimming PBF to configured bounds…")

      # delete dependent files
      File.rm(polyline_host())

      Docker.build_and_run("tools/polylines/Dockerfile.osmconvert", [
        "--complete-ways",
        "--complete-multipolygons",
        "--drop-version",
        "--drop-author",
        "-b=#{bbox()}",
        "-o=#{bbox_docker()}",
        source_docker()
      ])
    end
  end

  defp maybe_create_polylines() do
    if File.exists?(polyline_host()) do
      :ok
    else
      Docker.build_and_run("tools/polylines/Dockerfile.valhalla", [
        polyline_docker(),
        bbox_docker()
      ])
    end
  end

  defp source_host(), do: Path.join(@cache_dir, @source)
  defp source_docker(), do: Path.join("/workdir", @source)

  defp bbox_host(), do: Path.join(@cache_dir, bbox_name())
  defp bbox_docker(), do: Path.join("/workdir", bbox_name())
  defp bbox_name(), do: "street_polyline_bbox_#{bbox()}.pbf"

  defp polyline_host(), do: Path.join(@cache_dir, polyline_name())
  defp polyline_docker(), do: Path.join("/workdir", polyline_name())
  defp polyline_name(), do: "street_polyline_bbox_#{bbox()}.0sv"

  defp bbox(), do: Enum.join(Settings.bounds(), ",")
end