defmodule Mix.Tasks.Velo.Map.Kreuzungsskizzen do
  use Mix.Task
  require Logger

  @requirements ["app.start"]

  @wfs_base "https://geodienste.hamburg.de/wfs_kreuzungsskizzen"
  @layer_name "de.hh.up:poldata_lines"

  @cache_dir "data/cache/kreuzungsskizzen"
  @geojson_gz_path Path.join(@cache_dir, "poldata_lines.geojson.gz")
  @output_dir "priv/static/assets/basemap/kreuzungsskizzen"
  @output_filename "kreuzungsskizzen.pmtiles"

  @tippecanoe_ref {:dockerfile, "lib/basemap/Dockerfile.tippecanoe"}

  @cleaned_gz_path Path.join(@cache_dir, "poldata_lines_cleaned.geojson.gz")
  @nif_source Path.expand("native/geo/src/kreuzungsskizzen.rs")
  @pmtiles_path Path.join(@output_dir, @output_filename)

  @shortdoc "Downloads Kreuzungsskizzen WFS data and converts to PMTiles"
  def run(_args) do
    File.mkdir_p!(@cache_dir)
    File.mkdir_p!(@output_dir)

    with :ok <- download_wfs(),
         :ok <- cleanup_overlaps(),
         :ok <- convert_to_pmtiles() do
      target = Path.join(@output_dir, @output_filename)
      Logger.info("Kreuzungsskizzen PMTiles written to #{target}")
    else
      {:error, reason} -> Logger.error("Failed: #{reason}")
    end
  end

  @max_age_days 90

  defp download_wfs do
    if fresh?(@geojson_gz_path) do
      Logger.info("Using cached #{@geojson_gz_path}")
      :ok
    else
      do_download_wfs()
    end
  end

  defp fresh?(path) do
    with {:ok, %{mtime: mtime}} <- File.stat(path, time: :posix) do
      age_days = (System.os_time(:second) - mtime) / 86_400
      age_days < @max_age_days
    else
      _ -> false
    end
  end

  defp do_download_wfs do
    query =
      URI.encode_query(%{
        "Service" => "WFS",
        "REQUEST" => "GetFeature",
        "VERSION" => "2.0.0",
        "TYPENAMES" => @layer_name,
        "outputFormat" => "application/geo+json",
        "SRSNAME" => "EPSG:4326"
      })

    url = "#{@wfs_base}?#{query}"
    Logger.info("Downloading WFS layer #{@layer_name}...")

    cmd =
      ~s(curl -fsSL --retry 3 --retry-delay 5 --max-time 1200 --compressed '#{url}' | gzip -8 > '#{@geojson_gz_path}')

    case System.cmd("sh", ["-c", cmd], stderr_to_stdout: true) do
      {_, 0} ->
        Logger.info("Saved compressed GeoJSON to #{@geojson_gz_path}")
        :ok

      {output, code} ->
        {:error, "download failed (exit #{code}): #{output}"}
    end
  end

  defp cleanup_overlaps do
    source = Path.expand(@geojson_gz_path)
    target = Path.expand(@cleaned_gz_path)

    if Enum.all?([source, @nif_source], &(Util.IO.newer?(target, &1) == true)) do
      Logger.info("Using cached cleaned Kreuzungsskizzen")
      :ok
    else
      Logger.info("Cleaning up overlapping Kreuzungsskizzen...")

      result = Geo.Nif.nif_cleanup_kreuzungsskizzen(source, target)
      Logger.info("Cleanup: #{result}")
      :ok
    end
  rescue
    e -> {:error, "cleanup failed: #{Exception.message(e)}"}
  end

  defp convert_to_pmtiles do
    if Util.IO.newer?(@pmtiles_path, @cleaned_gz_path) == true do
      Logger.info("Using cached #{@pmtiles_path}")
      :ok
    else
      do_convert_to_pmtiles()
    end
  end

  defp do_convert_to_pmtiles do
    container_gz = "/workdir/kreuzungsskizzen/poldata_lines_cleaned.geojson.gz"
    container_output = "/output/#{@output_filename}"

    low_prio = Enum.join(Util.low_priority_cmd_prefix(), " ")

    Util.Docker.build_and_run(
      "converting kreuzungsskizzen to PMTiles",
      @tippecanoe_ref,
      %{
        docker_args: ["--entrypoint", "sh"],
        mounts: %{@output_dir => "/output"},
        command_args: [
          "-c",
          low_prio <>
            " gunzip --stdout #{container_gz} | " <>
            low_prio <>
            " /usr/bin/tippecanoe" <>
            " --coalesce-densest-as-needed" <>
            " --force --no-progress-indicator" <>
            " --minimum-zoom=17 --maximum-zoom=18" <>
            " --simplify-only-low-zooms" <>
            " --reorder --coalesce" <>
            " --layer=kreuzungsskizzen" <>
            " --output=#{container_output}" <>
            " /dev/stdin"
        ]
      },
      []
    )
  end
end
