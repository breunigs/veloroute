defmodule Basemap.Nominatim do
  use Basemap.Renderable
  require Benchmark
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
    render(true)
    File.rm(debug_path(:cache))
  end

  @doc """
  Render imports the .osm.pbf file and runs our export SQL query to generate the
  JSON export. The container is kept around to avoid having to re-run the
  Nominatim import if merely the query changes. It checks the source's modified
  timestamp to automatically re-create the container as needed.
  """
  @impl Basemap.Renderable
  def render(debug \\ false) do
    # avoid unclean debug exits from hanging normal renders
    if !debug && File.exists?(debug_path(:cache)), do: File.rm(debug_path(:cache))

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

    [exe | args] = Util.low_priority_cmd_prefix()

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
          exe,

          # keep container around so we can re-run our SQL query without having
          # to re-import Nominatim
          "--rm=false",
          "-v",
          "nominatim-data:/var/lib/postgresql/14/main"
        ],
        command_args: args ++ ["bash", "-c", container_start_script()],
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
      --variable=ON_ERROR_STOP=1 \
      --output=#{export(:container)} \
      --file=#{query_path(:container)}

    # maybe keep shell open if we want to debug
    if [ -f "#{debug_path(:container)}" ]; then
      rm "#{debug_path(:container)}"
      echo "Keeping container alive for debugging. Exec into it like so:"
      echo "    docker exec -unominatim -it #{Util.Docker.names(@full_ref).container} psql"
      echo "and export from the REPL like so:"
      echo "   \\pset tuples_only"
      echo "   \\pset format unaligned"
      echo "   \\o #{export(:container)}"
      echo "followed by the full query."
      echo "The original query is in #{query_path(:container)}"
      sleep 1d
      exit $?
    fi
    """
  end

  defp query_sql() do
    bbox = Geo.BoundingBox.to_string_bounds(Settings.bounds())

    """
    WITH
      -- combo is basically "placex", joined with extra information from linked
      -- tables. Some columns are already condensed to avoid code repetition.
      combo AS (
        SELECT
          CONCAT(main1.osm_type, main1.osm_id) AS id,
          main1.place_id,
          main1.importance,
          main1.rank_address,
          main1.rank_search,
          main1.class,
          main1.type,
          main1.admin_level,
          main1.name,
          main1.housenumber,
          main1.address,
          main1.extratags,
          main1.centroid,
          main1.geometry,
          -- merge joined names for addresses
          ARRAY_REMOVE(ARRAY_AGG(
            main2.name->'name'
            ORDER BY help1.cached_rank_address DESC, help2.cached_rank_address DESC
          ), NULL) AS parents_name,
          -- grab from parents because of wrong postcode on main1 object itself
          (SELECT (ARRAY_REMOVE(
            ARRAY_AGG(
              main2.address->'postcode'
              ORDER BY help1.cached_rank_address DESC, help2.cached_rank_address DESC
            ),
            NULL
          ))[1]) AS parents_postcode
        FROM placex AS main1
        LEFT JOIN place_addressline AS help1
        ON help1.isaddress = TRUE AND help1.place_id = main1.place_id
        LEFT JOIN place_addressline AS help2
        ON help2.isaddress = TRUE AND help2.place_id = main1.parent_place_id AND help1.place_id IS NULL
        LEFT JOIN placex AS main2
        ON COALESCE(help1.address_place_id, help2.address_place_id) = main2.place_id
        WHERE
          -- filter which results to keep for searching
          (main1.name IS NOT NULL OR main1.type IN ('compressed_air') OR main1.housenumber IS NOT NULL)
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
          main1.place_id,
          main1.importance,
          main1.rank_address,
          main1.rank_search,
          main1.class,
          main1.type,
          main1.admin_level,
          main1.name,
          main1.housenumber,
          main1.address,
          main1.extratags,
          main1.centroid,
          main1.geometry
      ),
      -- interpol is an expanded version of "location_property_osmline", which
      -- contains house number interpolation ways.
      interpol AS (
        SELECT
          parent_place_id,
          hn::text,
          CASE
            WHEN geometrytype(linegeo) = 'POINT' THEN linegeo
            ELSE ST_LineInterpolatePoint(linegeo, (hn - startnumber) / (endnumber - startnumber))
          END AS centroid
        FROM (
          SELECT
            parent_place_id,
            startnumber,
            endnumber::float,
            linegeo,
            generate_series(startnumber, endnumber, step) AS hn
          FROM location_property_osmline
        ) AS tmp
      )

    -- convert to JSON and fix incorrect escaping of backslashes
    SELECT
      regexp_replace(row_to_json(reduced)::TEXT, '\\\\', '\\', 'g')
    FROM (
      -- this converts the raw "combo" into a suitable format for export
      SELECT
        combo.id,
        combo.importance,
        combo.rank_address,
        combo.rank_search,
        combo.class,
        combo.type,
        combo.admin_level,
        combo.name,
        combo.address,
        slice(
          combo.extratags,
          ARRAY['border_type', 'branch', 'name:prefix', 'operator', 'wikidata']
        ) AS extratags,
        -- repeat name in boost for certain important objects
        (CASE WHEN
          (
            combo.class = 'place'
            AND combo.type IN ('borough', 'city', 'county', 'hamlet', 'island', 'islet', 'municipality', 'neighbourhood', 'plot', 'quarter', 'region', 'suburb', 'town', 'village')
          ) OR (
            combo.class = 'boundary'
            AND combo.type = 'administrative'
          )
          THEN combo.name->'name'
          ELSE combo.housenumber
        END) AS boost,
        -- generate Meilisearch format
        JSONB_BUILD_OBJECT(
          'lng', ROUND((ST_X(ST_Centroid(combo.centroid)))::numeric, 6),
          'lat', ROUND((ST_Y(ST_Centroid(combo.centroid)))::numeric, 6)
        ) AS _geo,
        -- generate as string because we need to create an Elixir struct anyway
        CONCAT_WS(',',
          ROUND((ST_X(ST_StartPoint(ST_BoundingDiagonal(combo.geometry))))::numeric, 6),
          ROUND((ST_Y(ST_StartPoint(ST_BoundingDiagonal(combo.geometry))))::numeric, 6),
          ROUND((ST_X(ST_EndPoint(ST_BoundingDiagonal(combo.geometry))))::numeric, 6),
          ROUND((ST_Y(ST_EndPoint(ST_BoundingDiagonal(combo.geometry))))::numeric, 6)
        ) AS bbox,
        combo.parents_name,
        combo.parents_postcode
      FROM combo


      UNION


      -- this builds "placex" style house number results from interpolated housenumbers
      SELECT
        CONCAT(combo.id, '-interpol', interpol.hn) AS id,
        -- same importance/ranks as other house numbers
        0.00000999999999995449 AS importance,
        30 AS rank_address,
        30 AS rank_search,
        -- the parent is always a street, so won't have more detailed tags
        'building' AS class,
        'house' AS type,
        combo.admin_level,
        NULL AS name,
        hstore(ARRAY[
          'street', combo.name->'name',
          'housenumber', interpol.hn
        ]) AS address,
        ''::hstore AS extratags,
        interpol.hn AS boost,
        -- generate Meilisearch format
        JSONB_BUILD_OBJECT(
          'lng', ROUND(ST_X(interpol.centroid)::numeric, 6),
          'lat', ROUND(ST_Y(interpol.centroid)::numeric, 6)
        ) AS _geo,
        -- generate as string because we need to create an Elixir struct anyway
        CONCAT_WS(',',
            ROUND((ST_X(interpol.centroid))::numeric, 6),
            ROUND((ST_Y(interpol.centroid))::numeric, 6),
            ROUND((ST_X(interpol.centroid))::numeric, 6),
            ROUND((ST_Y(interpol.centroid))::numeric, 6)
          ) AS bbox,
        combo.parents_name,
        combo.parents_postcode
      FROM combo
      INNER JOIN interpol ON interpol.parent_place_id = combo.place_id
      WHERE combo.name->'name' IS NOT NULL
      GROUP BY
        combo.id,
        combo.admin_level,
        combo.name,
        combo.parents_name,
        combo.parents_postcode,
        interpol.hn,
        interpol.centroid
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
