defmodule Basemap.OSMNames do
  use Basemap.Renderable
  require Logger

  @postgis_full_ref {"OSMNames PostGIS", {:remote, "postgis/postgis", "15-3.3"}}
  @postgis_tune_script Path.join(__DIR__, "osm_names_postgis_tuning.bash")

  @osmnames_full_ref {"OSMNames main",
                      {:git, "https://github.com/OSMNames/OSMNames.git",
                       "ef9b6aaf0c165d2c4059283216e09e118c969e27"}}
  @osmnames_mapping_path Path.join(__DIR__, "osm_names_mapping.yml")

  @docker_network_name "veloroute2-basemap-osmnames"
  @docker_network ["--network", @docker_network_name]

  @impl Basemap.Renderable
  def stale?() do
    Benchmark.measure("Basemap.OSMNames.stale?", fn ->
      Util.IO.stale?(target_tsv(), [
        Basemap.OpenStreetMap.target_extract(:cache),
        @osmnames_mapping_path
      ])
    end)
  end

  @impl Basemap.Renderable
  def render() do
    # TODO: with/error checking
    {:ok, network_id} = Util.Docker.network_create(@docker_network_name)
    {:ok, postgis_task} = postgis_start()

    try do
      osmnames_run()
    after
      postgis_stop(postgis_task)
      Util.Docker.network_delete(network_id)
    end
  end

  def target_tsv(), do: path(:cache, "export/osm_source_geonames.tsv")
  def target_tsv_house_numbers(), do: path(:cache, "export/osm_source_housenumbers.tsv")

  @spec osmnames_run() :: :ok | {:error, binary()}
  defp osmnames_run() do
    File.mkdir_p(path(:cache, "import"))
    File.mkdir_p(path(:cache, "export"))

    osm_source = Basemap.OpenStreetMap.target_extract(:cache)
    source_file = "osm_source.osm.pbf"

    environment =
      %{
        "DATA_DIR" => target(:container),
        "PBF_FILE" => source_file,
        # XXX: needs to be Python True string, i.e. capital T
        "SKIP_WIKIPEDIA" => "False"
      }
      |> Map.merge(postgis_credentials_as_env())

    Util.Docker.build_and_run(
      @osmnames_full_ref,
      %{
        environment: environment,
        docker_args:
          [
            "--init",
            # otherwise it psql won't print?
            "--tty",
            "--tmpfs",
            "/osmnames/data/logs/:uid=#{Util.user_id()}"
          ] ++ @docker_network,
        mounts: %{
          path(:cache, "import") => "/osmnames/data/import",
          path(:cache, "export") => "/osmnames/data/export",
          osm_source => "/osmnames/data/import/#{source_file}",
          @osmnames_mapping_path => "/osmnames/osmnames/import_osm/mapping.yml"
        }
      },
      stdout: IO.stream(:stdio, :line)
    )
  end

  @spec postgis_start() :: {:ok, Task.t()}
  defp postgis_start() do
    db_dir = path(:cache, "postgres-db")
    File.mkdir_p(db_dir)

    {:ok,
     Task.async(fn ->
       Util.Docker.run(
         @postgis_full_ref,
         %{
           environment: %{"POSTGRES_HOST_AUTH_METHOD" => "trust"},
           docker_args:
             [
               # OSMNames container expects this name
               "--network-alias",
               "postgres",
               "--shm-size",
               "16g",
               #  "--tmpfs",
               #  "/var/lib/postgresql/data",
               "--entrypoint",
               "/usr/bin/chrt"
             ] ++ @docker_network,
           command_args: [
             "--idle",
             "0",
             "/usr/bin/nice",
             "-n19",
             "/usr/bin/ionice",
             "--class",
             "idle",
             "/usr/local/bin/docker-entrypoint.sh",
             "postgres"
           ],
           mounts: %{
             @postgis_tune_script => "/docker-entrypoint-initdb.d/postgres_config.sh",
             db_dir => "/var/lib/postgresql/data"
           }
         },
         stdout: "",
         stderr: "",
         slow_warn_message: false
       )
     end)}
  end

  defp postgis_stop(task) do
    if Util.Docker.stop(@postgis_full_ref) != :ok do
      # ensure there's a minimum runtime, due to weird race conditions around
      # start and shutdown
      Process.sleep(500)
      Util.Docker.stop(@postgis_full_ref)
    end

    Task.yield(task) || Task.shutdown(task)
  end

  defp postgis_credentials_as_env() do
    %{"PGHOST" => "postgres", "PGUSER" => "osm", "PGPASSWORD" => "osm"}
  end
end
