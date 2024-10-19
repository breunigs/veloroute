defmodule Basemap.Nominatim do
  use Basemap.Renderable
  require Benchmark
  require Logger

  @full_ref {"Nominatim", {:remote, "mediagis/nominatim", "4.4"}}
  @queries [:prepare, :search, :area]
  @queries_blocking [:prepare]

  def export(query, where \\ :cache) when query in @queries,
    do: path(where, "export_#{query}.json.gz")

  defp source(where), do: Basemap.OpenStreetMap.target_extract(where)
  defp debug_path(where), do: path(where, "ENABLE_DEBUG")
  defp query_path(query, where) when query in @queries, do: path(where, "export_#{query}.sql")
  defp script_path(where), do: path(where, "export.bash")

  defp source_updated_at() do
    case File.stat(source(:cache), time: :posix) do
      {:ok, %{mtime: posix}} -> posix
      _ -> nil
    end
  end

  @impl Basemap.Renderable
  def staleness() do
    depends = [source(:cache), __ENV__.file]
    paths = Enum.map(@queries, &export(&1, :cache))

    if Enum.any?(paths, &Util.IO.absent?/1) do
      {true, "some artifacts were 0 bytes, indicating an aborted previous run"}
    else
      Util.IO.staleness(paths, depends)
    end
  end

  @doc """
  Returns list of areas that are useful to describe a route path taken. The
  bounding boxes might overlap, and are an approximation only anyway. Most
  specific result is on top.
  """
  @type area :: %{
          name: binary(),
          class: binary(),
          type: binary(),
          bbox: Geo.BoundingBox.t(),
          geometry: [[Geo.Point.t()]]
        }
  @spec areas() :: [area()]
  def areas() do
    ensure()

    export(:area)
    |> File.read!()
    |> Util.Compress.gunzip()
    |> Jason.decode!(keys: :atoms)
    |> Enum.map(fn a ->
      name =
        a.name
        # remove everything in brackets (...)
        |> String.replace(~r/\s*\(.*?\)/, "")
        # remove e.V. and variants, including preceding numbers
        |> String.replace(~r/(von )?[0-9 -]*\s*e\.\s?V\./, "")
        # remove quotes, but not their contents
        |> String.replace(~r/[„“"]/u, "")
        # remove spaced dashes
        |> String.replace(~r/ [–-] /u, " ")
        # expand Klgv.
        |> String.replace("Klgv.", "Kleingartenverein")
        # remove numbers from "Kleingartenverein 1234"
        |> String.replace(~r/Kleingartenverein \d+/, "Kleingartenverein")
        # remove superfluous whitespace
        |> String.replace(~r/\s+/, " ")
        |> String.trim()

      bbox = Geo.BoundingBox.parse(a.bbox)
      geometry = remap_geojson(a.geometry)
      %{a | name: name, bbox: bbox, geometry: geometry}
    end)
  end

  defp remap_geojson(%{type: "Polygon", coordinates: polygon}) do
    # a polygon is a list of multiple rings, with the first one being the
    # "outer" ring, and the subsequent ones the "holes"
    Enum.map(polygon, &Enum.map(&1, fn [lon, lat] -> %Geo.Point{lat: lat, lon: lon} end))
  end

  defp remap_geojson(%{type: "MultiPolygon", coordinates: multi}) do
    # a multi polygon is a list of polygons
    Enum.flat_map(multi, &remap_geojson(%{type: "Polygon", coordinates: &1}))
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

    File.mkdir_p!(path(:cache, ""))
    Enum.each(@queries, fn query -> File.write!(query_path(query, :cache), query_sql(query)) end)
    File.write!(script_path(:cache), export_script())

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
        command_args: args ++ ["bash", script_path(:container)],
        run_as_local_user: false
      },
      stdout: IO.stream(:stdio, :line),
      name: elem(@full_ref, 0)
    )
  end

  defp export_script() do
    sudo = "sudo --preserve-env --user=nominatim"

    queries =
      Enum.map_join(@queries, "\n\n", fn query ->
        """
        #{sudo} -- \
          psql \
            --dbname=nominatim \
            --no-align \
            --tuples-only \
            --variable=ON_ERROR_STOP=1 \
            --file=#{query_path(query, :container)} \
          | gzip --fast \
          | #{sudo} -- tee #{export(query, :container)} > /dev/null \
          #{if !(query in @queries_blocking), do: "&"}
        """
      end)

    """
    set -euo pipefail

    # similar to upstream start.sh but with our user id
    if [ ! -f "/finished" ]; then
      useradd --create-home nominatim --uid #{Util.user_id()}
      /app/config.sh
      /app/init.sh
    else
      echo "already ran Nominatim import, just rerunning queries"
    fi
    touch /finished

    # export
    service postgresql start
    #{queries}

    # maybe keep shell open if we want to debug
    if [ -f "#{debug_path(:container)}" ]; then
      rm "#{debug_path(:container)}"
      echo "Container is live for debugging. Exec into it like so:"
      echo "    docker exec -unominatim -it #{Util.Docker.names(@full_ref).container} psql"
      echo "and export from the REPL like so:"
      echo "   \\pset tuples_only"
      echo "   \\pset format unaligned"
      echo "   \\o #{path(:container, "export_*.json")}"
      echo "followed by the full query."
      echo "Exit by CTRL+\\\\"
      echo ""
      echo "The original queries are in #{path(:container, "export_*.sql")}"
      echo "They are being executed in the background."
      wait
      echo "Original queries have finished execution."
      sleep 1d
      exit $?
    fi

    wait
    """
  end

  # using PostgreSQL functions would be nicer, but they are considerably slower.
  # Not sure why that is, they should be inline-able and executable without
  # performance penalty.
  defp to_meili_geo(name) do
    """
    JSONB_BUILD_OBJECT(
    'lng', ST_X(ST_CENTROID(#{name})),
    'lat', ST_Y(ST_CENTROID(#{name}))
    )
    """
    |> String.replace("\n", " ")
  end

  defp to_elixir_bbox(name) do
    """
    CONCAT_WS(',',
      ST_XMin(#{name}),
      ST_YMin(#{name}),
      ST_XMax(#{name}),
      ST_YMax(#{name})
    )
    """
    |> String.replace("\n", " ")
  end

  defp to_boost_search_result(name) do
    """
    CASE
      WHEN '#{Settings.boost_search_results_within()}' = ANY(#{name}) THEN 1
      ELSE 30
    END
    """
    |> String.replace("\n", " ")
  end

  defp query_sql(:prepare) do
    bbox = Geo.BoundingBox.to_string_bounds(Settings.bounds(), ",")

    """
    -- combo is basically "placex", joined with extra information from linked
    -- tables. Some columns are already condensed to avoid code repetition.
    --
    -- It needs to be materialized, because otherwise the geometry index isn't
    -- used, not sure why.
    CREATE MATERIALIZED VIEW IF NOT EXISTS combo AS (
      SELECT
        CONCAT(main1.osm_type, main1.osm_id) AS id,
        main1.osm_type,
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
        SLICE(
          main1.extratags,
          ARRAY['border_type', 'branch', 'name:prefix', 'vending', 'wikidata']
        ) || (
          -- remove likely addresses from operator field (Foobar GmbH, Bazstreet 123)
          HSTORE('operator', REGEXP_REPLACE(main1.extratags->'operator', 'mbH, .*', 'mbH'))
          -- but do not include NULL values
          - 'operator=>null'::HSTORE
        ) AS extratags,
        COALESCE(main1.extratags->'layer', '0') AS layer,
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
            (main1.name->'name' IS NOT NULL OR main1.type IN ('compressed_air') OR main1.housenumber IS NOT NULL)
        AND (main1.name->'name' IS NOT NULL OR main1.extratags IS NULL OR main1.extratags->'vending' IS NULL OR main1.extratags->'vending' IN ('bicycle_tube'))
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
    );
    CREATE INDEX IF NOT EXISTS combo_geo ON combo USING gist (geometry);
    CREATE INDEX IF NOT EXISTS combo_streets ON combo USING btree (osm_type, class) WHERE class='highway' AND osm_type='W';
    VACUUM ANALYZE combo;
    """
  end

  # extracts all objects that should be searchable
  defp query_sql(:search) do
    """
    WITH
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
      ),

      -- convenience for "intersections" later on
      streets AS NOT MATERIALIZED (
        SELECT * FROM combo
        WHERE class = 'highway'
        AND osm_type = 'W'
      )

    -- convert to JSON and fix incorrect escaping of backslashes
    SELECT
      regexp_replace(row_to_json(reduced)::TEXT, '\\\\', '\\', 'g')
    FROM (
      -- this converts the raw "combo" into a suitable format for export
      SELECT
        -- limit max length of ID column for Meilisearch
        SUBSTRING(STRING_AGG(combo.id, '-'), 0, 500) AS id,
        AVG(combo.importance) AS importance,
        ROUND(AVG(combo.rank_address)) AS rank_address,
        ROUND(AVG(combo.rank_search)) AS rank_search,
        combo.class,
        combo.type,
        combo.admin_level,
        combo.name,
        combo.address,
        HSTORE(STRING_AGG(NULLIF(combo.extratags::TEXT, ''), ',')) AS extratags,
        -- repeat name in boost for certain important objects
        (CASE WHEN
          (
            combo.class = 'place'
            AND combo.type IN ('borough', 'city', 'county', 'hamlet', 'island', 'islet', 'municipality', 'neighbourhood', 'plot', 'quarter', 'region', 'suburb', 'town', 'village')
          ) OR (
            combo.class = 'boundary'
            AND combo.type = 'administrative'
          ) OR (
            combo.class = 'highway'
          )
          THEN combo.name->'name'
          ELSE combo.housenumber
        END) AS boost,
        #{to_meili_geo("ST_UNION(combo.centroid)")} AS _geo,
        #{to_elixir_bbox("ST_UNION(combo.geometry)")} AS bbox,
        combo.parents_name,
        combo.parents_postcode,
        #{to_boost_search_result("combo.parents_name")} AS rank_boosted_areas
      FROM combo
      GROUP BY
        combo.class,
        combo.type,
        combo.admin_level,
        combo.name,
        combo.address,
        combo.housenumber,
        combo.parents_name,
        combo.parents_postcode


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
        #{to_meili_geo("interpol.centroid")} AS _geo,
        #{to_elixir_bbox("interpol.centroid")} AS bbox,
        combo.parents_name,
        combo.parents_postcode,
        #{to_boost_search_result("combo.parents_name")}
      FROM combo
      INNER JOIN interpol ON interpol.parent_place_id = combo.place_id
      WHERE
        combo.name->'name' IS NOT NULL
        AND combo.class='highway'
        AND combo.osm_type='W'
      GROUP BY
        combo.id,
        combo.admin_level,
        combo.name,
        combo.parents_name,
        combo.parents_postcode,
        interpol.hn,
        interpol.centroid


      UNION


      -- artificial POIs for intersections
      SELECT
        -- limit max length of ID column for Meilisearch
        SUBSTRING(STRING_AGG(intersections.id, '_'), 0, 500) AS id,
        MIN(intersections.importance) AS importance,
        MIN(intersections.rank_address) AS rank_address,
        MIN(intersections.rank_search) AS rank_search,
        'intersection' AS class,
        'intersection' AS type,
        MIN(intersections.admin_level) AS admin_level,
        intersections.name,
        NULL AS address,
        ''::hstore AS extratags,
        NULL AS boost,
        #{to_meili_geo("ST_UNION(intersections.geometry)")} AS _geo,
        #{to_elixir_bbox("ST_UNION(intersections.geometry)")} AS bbox,
        intersections.parents_name,
        MIN(intersections.parents_postcode) AS parents_postcode,
        #{to_boost_search_result("intersections.parents_name")}
      FROM (
        SELECT
          CONCAT(one.id, '_', two.id) AS id,
          HSTORE(
            'name',
            CONCAT(one.name->'name', ' & ', two.name->'name')
          ) AS name,
          LEAST(one.parents_postcode, two.parents_postcode) AS parents_postcode,
          ARRAY(
            SELECT *
            FROM UNNEST(one.parents_name)
            WHERE UNNEST = ANY(two.parents_name)
          ) AS parents_name,
          (one.importance+two.importance)/2 AS importance,
          (one.rank_address+two.rank_address)/2 AS rank_address,
          (one.rank_search+two.rank_search)/2 AS rank_search,
          (one.admin_level+two.admin_level)/2 AS admin_level,
          ST_ClusterDBSCAN(
            ST_Intersection(one.geometry, two.geometry),
            eps := 0.0001,
            minpoints := 2)
            OVER () AS cluster,
          ST_Intersection(one.geometry, two.geometry) AS geometry
        FROM streets AS one
        INNER JOIN streets AS two
        ON ST_Intersects(one.geometry, two.geometry)
        -- perf optimization. Bounding box checks are also done by ST_Intersects,
        -- but the query planner doesn't pick the geo index for looping without it.
        AND one.geometry && two.geometry
        AND one.layer = two.layer
        WHERE one.name->'name' < two.name->'name'
      ) AS intersections
      GROUP BY name, parents_name, cluster
      HAVING St_Area(ST_Envelope(ST_Union(intersections.geometry))) < 0.00001
    ) reduced;
    """
  end

  # extracts all areas which might be useful for matching GPS coords to names
  defp query_sql(:area) do
    bbox = Geo.BoundingBox.to_string_bounds(Settings.bounds(), ",")

    """
    -- expand areas slightly to still be able to name paths alongside it
    \\set expand_in_meter 10

    SELECT
      -- convert to JSON and fix incorrect escaping of backslashes
      regexp_replace(array_to_json(array_agg(areas))::TEXT, '\\\\', '\\', 'g')
    FROM (
      SELECT
        name->'name' AS name,
        class,
        type,
        #{to_elixir_bbox("geometry")} AS bbox,
        ST_AsGeoJSON (
          ST_Buffer(geometry::geography, :expand_in_meter)::geometry
        )::jsonb AS geometry
      FROM placex
      WHERE
        importance >= 0.15
        AND name->'name' IS NOT NULL
        AND ST_Area(geometry, true) >= 5000
        AND geometry && ST_MakeEnvelope(#{bbox}, 4326)
        AND class IN ('landuse', 'leisure', 'natural')
        AND type IN ('allotments', 'farmland', 'forest', 'meadow', 'garden', 'nature_reserve', 'park', 'wood')
      -- put most specific items on top
      ORDER BY importance ASC, ST_Area(geometry, true) ASC
    ) areas;
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
