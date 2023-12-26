#!/bin/bash

set -euo pipefail

echo "tuning Postgres"
echo "adjust in 'osm_names_postgis_tuning.bash' as needed"
echo "you can use a PGTune webinterface like https://pgtune.leopard.in.ua/"
PGUSER="$POSTGRES_USER" psql --dbname="$POSTGRES_DB" <<-SQL
  alter system set checkpoint_completion_target = '0.9';
  alter system set checkpoint_timeout = '20min';
  alter system set datestyle = 'iso, mdy';
  alter system set default_statistics_target = '100';
  alter system set default_text_search_config = 'pg_catalog.english';
  alter system set effective_cache_size = '5gb';
  alter system set effective_io_concurrency = '200';
  alter system set fsync = 'off';
  alter system set huge_pages = 'off';
  alter system set lc_messages = 'en_US.utf8';
  alter system set lc_monetary = 'en_US.utf8';
  alter system set lc_numeric = 'en_US.utf8';
  alter system set lc_time = 'en_US.utf8';
  alter system set listen_addresses = '*';
  alter system set log_checkpoints = 'on';
  alter system set log_statement = 'all';
  alter system set log_temp_files = '1MB';
  alter system set log_timezone = 'UTC';
  alter system set maintenance_work_mem = '1280mb';
  alter system set max_connections = '14';
  alter system set max_parallel_maintenance_workers = '4';
  alter system set max_parallel_workers = '7';
  alter system set max_parallel_workers_per_gather = '4';
  alter system set max_wal_size = '2gb';
  alter system set max_worker_processes = '8';
  alter system set min_wal_size = '100mb';
  alter system set random_page_cost = '1.1';
  alter system set shared_buffers = '1280mb';
  alter system set synchronous_commit = 'off';
  alter system set temp_buffers = '120MB';
  alter system set timezone = 'UTC';
  alter system set track_counts = 'on';
  alter system set wal_buffers = '16MB';
  alter system set work_mem = '13653kb';
SQL
