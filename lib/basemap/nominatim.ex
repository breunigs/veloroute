defmodule Basemap.Nominatim do
  use Basemap.Renderable
  require Logger

  @full_ref {"Nominatim", {:remote, "mediagis/nominatim", "4.3"}}

  def export(where \\ :cache), do: path(where, "nominatim.json")
  defp source(where), do: Basemap.OpenStreetMap.target_extract(where)
  defp debug_path(where), do: path(where, "ENABLE_DEBUG")
  defp query_path(where), do: path(where, "export.sql")

  defp source_updated_at() do
    case File.stat(source(:cache), time: :posix) do
      {:ok, %{mtime: posix}} -> posix
      _ -> nil
    end
  end

  @impl Basemap.Renderable
  def stale?() do
    Benchmark.measure("Basemap.Nominatim.stale?", fn ->
      Util.IO.stale?(export(:cache), [source(:cache), __ENV__.file])
    end)
  end

  def debug() do
    File.mkdir_p!(Path.dirname(debug_path(:cache)))
    File.write!(debug_path(:cache), "container will not automatically exit while file exists")
    render()
    File.rm(debug_path(:cache))
  end

  @doc """
  Render imports the .osm.pbf file and runs our export SQL query to generate the
  JSON export. The container is kept around to avoid having to re-run the
  Nominatim import if merely the query changes. It checks the source's modified
  timestamp to automatically re-create the container as needed.
  """
  @impl Basemap.Renderable
  def render() do
    File.mkdir_p!(Path.dirname(query_path(:cache)))
    File.write!(query_path(:cache), query_sql())

    source = source_updated_at()

    case Util.Docker.container_created_at(@full_ref) do
      {:error, _} ->
        Logger.info("Creating new Nominatim container (doesn't exist yet)")
        container_create_new()

      {:ok, container} when container < source ->
        Logger.info("Creating new Nominatim container (.osm.pbf is newer)")
        Util.Docker.stop_and_remove(@full_ref)
        container_create_new()

      {:ok, container} when container >= source ->
        Logger.info("(Re)starting existing Nominatim container")
        Util.Docker.start(@full_ref)
    end
  end

  defp container_create_new() do
    mem_bytes = available_memory()

    environment = %{
      "PBF_PATH" => source(:container),
      "FREEZE" => "true",
      "IMPORT_WIKIPEDIA" => "true",
      "IMPORT_STYLE" => "extratags",
      "POSTGRES_WORK_MEM" => "#{round_to_multiple_of_two(mem_bytes / 15)}B"
    }

    Util.Docker.run(
      @full_ref,
      %{
        mounts: %{
          source(:cache) => source(:container),
          target(:cache) => target(:container)
        },
        environment: environment,
        docker_args: [
          "--shm-size",
          round_to_multiple_of_two(mem_bytes / 4),
          "--entrypoint",
          "/usr/bin/chrt",

          # keep container around so we can re-run our SQL query without having
          # to re-import Nominatim
          "--rm=false",
          "-v",
          "nominatim-data:/var/lib/postgresql/14/main"
        ],
        command_args: [
          "--idle",
          "0",
          "/usr/bin/nice",
          "-n19",
          "/usr/bin/ionice",
          "--class",
          "idle",
          "bash",
          "-c",
          container_start_script()
        ],
        run_as_local_user: false
      },
      stdout: IO.stream(:stdio, :line)
    )
  end

  defp container_start_script() do
    """
    set -euo pipefail

    # similar to upstream start.sh but with our user id
    if [ ! -f "/finished" ]; then
      useradd --create-home nominatim --uid #{Util.user_id()}
      /app/config.sh
      /app/init.sh
    else
      echo "already ran Nominatim import, just rerunning query"
    fi
    touch /finished

    # export
    service postgresql start
    sudo --preserve-env --user=nominatim -- \
      psql \
      --dbname=nominatim \
      --no-align \
      --tuples-only \
      --output=#{export(:container)} \
      --file=#{query_path(:container)}

    # maybe keep shell open if we want to debug
    if [ -f "#{debug_path(:container)}" ]; then
      echo "Keeping container alive for debugging. Exec into it like so:"
      echo "    docker exec -unominatim -it #{Util.Docker.names(@full_ref).container} psql"
      echo "and export from the REPL like so:"
      echo "   \\pset tuples_only"
      echo "   \\pset format unaligned"
      echo "   \\o #{export(:container)}"
      echo "followed by the full query."
      sleep 1d
      exit $?
    fi
    """
  end

  defp query_sql() do
    bbox = Geo.BoundingBox.to_string_bounds(Settings.bounds())

    """
    SELECT
      regexp_replace(row_to_json(reduced)::TEXT, '\\\\', '\\', 'g')
    FROM (
      SELECT
        CONCAT(main1.osm_type, main1.osm_id) AS id,
        main1.importance,
        main1.rank_address,
        main1.rank_search,
        main1.class,
        main1.type,
        main1.admin_level,
        main1.name,
        main1.address,
        main1.extratags,
        -- generate Meilisearch format
        JSON_BUILD_OBJECT(
          'lng', ST_X(ST_Centroid(main1.centroid)),
          'lat', ST_Y(ST_Centroid(main1.centroid))
        ) AS _geo,
        -- generate as string because we need to create an Elixir struct anyway
        CONCAT_WS(',',
          ST_X(ST_StartPoint(ST_BoundingDiagonal(main1.geometry))),
          ST_Y(ST_StartPoint(ST_BoundingDiagonal(main1.geometry))),
          ST_X(ST_EndPoint(ST_BoundingDiagonal(main1.geometry))),
          ST_Y(ST_EndPoint(ST_BoundingDiagonal(main1.geometry)))
        ) AS bbox,
        -- merge joined names for addresses
        ARRAY_REMOVE(
          ARRAY_AGG(
            main2.name->'name'
            ORDER BY help1.cached_rank_address DESC, help2.cached_rank_address DESC
          ),
          NULL
        ) AS parents_name,
        -- for debugging because of wrong postcode on main1 object
        ARRAY_REMOVE(
          ARRAY_AGG(
            main2.address->'postcode'
            ORDER BY help1.cached_rank_address DESC, help2.cached_rank_address DESC
          ),
          NULL
        ) AS parents_postcode
      FROM placex AS main1

      -- join self via helper table place_addressline to resolve addresses
      -- * parent_place_id is a fallback, since some low-rank POIs don't have
      --   direct entries
      -- * isaddress is a tie breaker when there's competing addresses
      LEFT JOIN place_addressline AS help1
      ON help1.isaddress = TRUE AND help1.place_id = main1.place_id
      LEFT JOIN place_addressline AS help2
      ON help2.isaddress = TRUE AND help2.place_id = main1.parent_place_id AND help1.place_id IS NULL
      LEFT JOIN placex AS main2
      ON COALESCE(help1.address_place_id, help2.address_place_id) = main2.place_id

      WHERE
        -- filter which results to keep for searching
        (main1.name IS NOT NULL OR main1.type IN ('compressed_air'))
        -- auto-merged by Nominatim, so ignore
        -- see https://nominatim.org/release-docs/develop/develop/Database-Layout/#search-tables
        AND main1.linked_place_id IS NULL
        AND main2.linked_place_id IS NULL
        -- if we import Wikipedia, there will be entries for the entire world. So
        -- we filter it down to our area of interest again.
        AND main1.geometry && ST_MakeEnvelope(#{bbox}, 4326)

      GROUP BY
        main1.osm_type,
        main1.osm_id,
        main1.importance,
        main1.rank_address,
        main1.rank_search,
        main1.class,
        main1.type,
        main1.admin_level,
        main1.name,
        main1.address,
        main1.extratags,
        main1.postcode,
        main1.centroid,
        main1.geometry
    ) reduced;
    """
  end

  @spec available_memory(non_neg_integer()) :: pos_integer()
  @gigabyte 1024 * 1024 * 1024
  defp available_memory(minimum_bytes \\ 1 * @gigabyte) do
    {:ok, pid} = GenServer.start_link(:memsup, [], name: :memsup)
    data = :memsup.get_system_memory_data()
    GenServer.stop(pid)

    available =
      Keyword.get(
        data,
        :available_memory,
        # approximation in case available memory is not present
        Keyword.get(data, :cached_memory, 0) +
          Keyword.get(data, :buffered_memory, 0) +
          Keyword.get(data, :free_memory, 0)
      )

    max(available, minimum_bytes)
  end

  @spec round_to_multiple_of_two(number()) :: pos_integer()
  defp round_to_multiple_of_two(bytes) do
    bytes = max(bytes, 2)
    exp = round(:math.log(bytes) / :math.log(2))
    round(:math.pow(2, exp))
  end
end
