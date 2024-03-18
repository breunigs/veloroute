defmodule Basemap.MapMatcher do
  @type matched_point :: %{
          optional(atom()) => any(),
          lat: float(),
          lon: float(),
          match_name: binary(),
          match_lat: float() | nil,
          match_lon: float() | nil,
          match_distance: float() | :infinity
        }

  @callback match([Geo.Point.like()]) :: {:ok, [matched_point()]} | {:error, binary()}

  @spec empty_match() :: matched_point()
  def empty_match(),
    do: %{
      match_name: "",
      match_lat: nil,
      match_lon: nil,
      match_distance: :infinity
    }
end

defmodule Basemap.MapMatcher.NoOp do
  @behaviour Basemap.MapMatcher
  @impl Basemap.MapMatcher
  def match(points) do
    {:ok, Enum.map(points, &Map.merge(&1, Basemap.MapMatcher.empty_match()))}
  end
end

defmodule Basemap.MapMatcher.OSRM do
  use Basemap.Renderable
  use GenServer
  use Tesla
  require Logger
  @behaviour Basemap.MapMatcher

  plug Tesla.Middleware.JSON

  plug Tesla.Middleware.Retry,
    delay: 10_000,
    max_retries: 3,
    max_delay: 30_000

  @osrm_timeout_ms 5 * 60 * 1_000
  plug Tesla.Middleware.Timeout, timeout: @osrm_timeout_ms
  adapter(Tesla.Adapter.Hackney, recv_timeout: @osrm_timeout_ms)

  @osrm_image_ref {:remote, "ghcr.io/project-osrm/osrm-backend", "v5.27.1"}
  @profile "mapmatching"
  @profile_lua Path.join(__DIR__, "#{@profile}.lua")
  @mounts %{@profile_lua => "/opt/#{@profile}.lua"}

  @health_check_seconds 1
  @osrm_port "5000"

  @radius 10

  @working_basename "osmextract"

  defp osm_source, do: Basemap.OpenStreetMap.target_extract(:cache)
  defp container_base, do: Path.join(target(:container), @working_basename)

  @impl Basemap.Renderable
  def stale?() do
    Path.join(target(:cache), "*.osrm.*") |> Path.wildcard() |> length() < 10 ||
      Util.IO.stale?(target(:cache), [osm_source(), @profile_lua])
  end

  @impl Basemap.Renderable
  def render() do
    File.rm_rf!(target(:cache))
    File.mkdir_p!(target(:cache))

    # create a symlink to original file. This is needed because OSRM always
    # extracts to the same directory as the source.
    target = Path.join(target(:cache), @working_basename <> ".osm.pbf")
    source = Path.join([".." | osm_source() |> Path.split() |> Enum.take(-2)])
    File.ln_s(source, target)

    with :ok <-
           Util.Docker.run(
             "mapmatching prepare step 1",
             @osrm_image_ref,
             %{
               command_args: [
                 "osrm-extract",
                 "-p",
                 "/opt/#{@profile}.lua",
                 "#{container_base()}.osm.pbf"
               ],
               mounts: @mounts
             },
             []
           ),
         :ok <-
           Util.Docker.run(
             "mapmatching prepare step 2",
             @osrm_image_ref,
             %{command_args: ["osrm-partition", "#{container_base()}.osrm"]},
             []
           ),
         :ok <-
           Util.Docker.run(
             "mapmatching prepare step 3",
             @osrm_image_ref,
             %{command_args: ["osrm-customize", "#{container_base()}.osrm"]},
             []
           ) do
      :ok
    end
  end

  @doc """
  Takes the given coordinates and matches them to the street network. Only
  considers paths that have a street name. If none can be found, a point will
  have no name.
  """
  @impl Basemap.MapMatcher
  def match(points) do
    start_link()

    coords = Enum.map_join(points, ";", fn %{lat: lat, lon: lon} -> "#{lon},#{lat}" end)

    params = [
      overview: false,
      steps: false,
      geometries: :geojson,
      overview: false,
      annotations: false,
      generate_hints: false,
      radiuses: "#{@radius};" |> String.duplicate(length(points)) |> String.slice(0..-2//1)
    ]

    with {:ok, matches} <-
           GenServer.call(__MODULE__, {:query, coords, params}, :infinity) do
      merged =
        [points, matches]
        |> List.zip()
        |> Enum.map(fn {p, m} -> Map.merge(p, m) end)

      {:ok, merged}
    else
      {:error, reason} -> {:error, reason}
      other -> {:error, inspect(other)}
    end
  end

  @doc """
  Generates a debug OSM file that renders the given coordinates and which street
  name was found for the segment. Additionally renders the matched points on the
  street network, to see which part of the GPX track was matched onto which OSM
  street. The used "OSM tags" are meaningless and just used for coloring using
  JOSM's default style.
  """
  @spec debug([Geo.Point.like()], binary()) :: :ok | {:error, any()}
  def debug(points, save_to \\ "map_matcher_osrm.debug.osm") do
    {:ok, merged} = match(points)

    osm = ~s|<?xml version='1.0' encoding='UTF-8'?> <osm version='0.6' upload='never'>|

    acc =
      Enum.reduce(merged, %{id: -1, name: nil, oWay: [], mWay: [], osm: osm}, fn
        m, acc ->
          oId = acc.id
          mId = if m.match_lat && m.match_lon, do: acc.id - 1, else: nil
          acc = %{acc | id: acc.id - 2}

          # original node
          osm =
            acc.osm <>
              """
              <node id='#{oId}' lat='#{m.lat}' lon='#{m.lon}'/>
              """

          # matched node and way connector
          osm =
            osm <>
              if mId,
                do: """
                <node id='#{mId}' lat='#{m.match_lat}' lon='#{m.match_lon}'/>
                <way id='#{mId}'>
                  <nd ref='#{oId}' />
                  <nd ref='#{mId}' />
                  <tag k='highway' v='path' />
                </way>
                """,
                else: ""

          acc = %{acc | osm: osm}

          if acc.name != m.match_name do
            # finish current way
            acc = debug_create_ways(acc)

            # start new way
            prevOWay = Enum.at(acc.oWay, 0)
            prevMWay = Enum.at(acc.mWay, 0)
            oWay = ["<nd ref='#{oId}' />", prevOWay]
            mWay = if mId, do: ["<nd ref='#{mId}' />", prevMWay], else: []
            %{acc | oWay: oWay, mWay: mWay, name: m.match_name}
          else
            # continue old way
            oWay = ["<nd ref='#{oId}' />" | acc.oWay]
            mWay = if mId, do: ["<nd ref='#{mId}' />" | acc.mWay], else: acc.mWay

            %{acc | oWay: oWay, mWay: mWay, name: m.match_name}
          end
      end)

    # finish current way
    acc = debug_create_ways(acc)

    File.write(save_to, acc.osm <> "</osm>")
  end

  defp debug_create_ways(acc) do
    safe_name = String.replace(acc.name || "", "'", "")

    osm =
      acc.osm <>
        if acc.oWay != [],
          do: """
          <way id='#{acc.id - 1}'>
            #{Enum.join(Enum.reverse(acc.oWay), "")}
            <tag k='name' v='#{safe_name}' />
            <tag k='highway' v='#{if safe_name == "", do: :tertiary, else: :primary}' />
          </way>
          """,
          else: ""

    osm =
      osm <>
        if acc.mWay != [],
          do: """
          <way id='#{acc.id - 2}'>
            #{Enum.join(Enum.reverse(acc.mWay), "")}
            <tag k='name' v='#{safe_name}' />
            <tag k='highway' v='#{if safe_name == "", do: :cycleway, else: :pedestrian}' />
          </way>
          """,
          else: ""

    %{acc | osm: osm, id: acc.id - 3}
  end

  def stop() do
    try do
      GenServer.stop(__MODULE__)
    catch
      :exit, _ -> :ok
    end
  end

  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @typep state :: %{
           started: boolean(),
           healthy: boolean(),
           port: non_neg_integer() | nil,
           container: Util.Docker.full_ref() | nil,
           pid: pid()
         }
  @spec init(any) :: {:ok, state()}
  @impl GenServer
  def init(_args \\ []) do
    Process.flag(:trap_exit, true)
    {:ok, %{started: false, healthy: false, port: nil, container: nil, pid: self()}}
  end

  @spec handle_call(
          {:query, binary(), Keyword.t()},
          GenServer.from(),
          state()
        ) :: {:noreply, state()}
  @impl GenServer
  def handle_call({:query, path, params}, from, %{healthy: true} = state) do
    match_with_osrm(from, path, params, state)
    {:noreply, state}
  end

  def handle_call({:query, path, params}, from, state) do
    Process.send_after(self(), :start, 0)
    Process.send_after(self(), {:query, from, path, params}, 0)

    {:noreply, state}
  end

  @spec handle_info(atom() | {:query, GenServer.from(), binary(), Keyword.t()}, state()) ::
          {:noreply, state()}

  @impl GenServer
  def handle_info(:start, state) do
    case ensure() do
      :ok ->
        Process.send_after(self(), :health_check, @health_check_seconds * 1000)
        {:noreply, ensure_started(state)}

      {:error, reason} ->
        Logger.error("failed to build OSRM: #{reason}")
        {:noreply, state}
    end
  end

  def handle_info(:health_check, %{started: false} = state) do
    {:noreply, state}
  end

  def handle_info(:health_check, %{started: true} = state) do
    Process.send_after(self(), :health_check, @health_check_seconds * 1000)

    {:noreply,
     state
     |> set_port()
     |> set_health()}
  end

  def handle_info({:query, from, path, params}, %{healthy: true} = state) do
    match_with_osrm(from, path, params, state)
    {:noreply, state}
  end

  def handle_info({:query, from, path, params}, state) do
    Process.send_after(self(), {:query, from, path, params}, @health_check_seconds * 1000)
    {:noreply, state}
  end

  # handle own exit
  def handle_info({:EXIT, pid, reason}, %{pid: pid} = state) do
    stop(state)
    {:stop, reason, state}
  end

  # ignore messages from Task.async
  def handle_info({ref, :ok}, state) when is_reference(ref), do: {:noreply, state}
  def handle_info({:DOWN, _ref, :process, _pid, _reason}, state), do: {:noreply, state}
  def handle_info({:EXIT, _pid, _reason}, state), do: {:noreply, state}

  @impl GenServer
  def terminate(_reason, state) do
    stop(state)
  end

  @spec set_port(state()) :: state()
  defp set_port(%{started: true, port: nil, container: full_ref} = state) do
    name = Util.Docker.names(full_ref).container

    with %{result: :ok, stdout: stdout} <-
           Util.Cmd2.exec(["docker", "port", name, @osrm_port], stdout: "", stderr: ""),
         [_, port_str] <- Regex.run(~r/^[0-9.]+:(\d+)$/m, stdout),
         {port, ""} <- Integer.parse(port_str) do
      %{state | port: port}
    else
      %{stderr: stderr} when stderr != "" ->
        Logger.debug("docker port: #{stderr}")
        %{state | port: nil}

      _ ->
        %{state | port: nil}
    end
  end

  defp set_port(state), do: state

  @spec set_health(state()) :: state()
  defp set_health(%{started: true, port: port} = state) when is_integer(port) do
    with {:ok, _response} <- get(url(state), query: []) do
      %{state | healthy: true}
    else
      _err ->
        %{state | healthy: false}
    end
  end

  defp set_health(state), do: %{state | healthy: false}

  @spec ensure_started(state()) :: state()
  defp ensure_started(%{started: true} = state), do: state

  defp ensure_started(state) do
    container_ref = {"OSRM map matching server", @osrm_image_ref}

    Task.async(fn -> start(container_ref) end)
    Process.sleep(500)

    %{state | started: true, container: container_ref}
    |> set_port()
    |> set_health()
  end

  defp start(container_ref) do
    Util.Docker.run(
      container_ref,
      %{
        command_args: [
          "osrm-routed",
          "--algorithm",
          "mld",
          "#{container_base()}.osrm",
          "--max-matching-size",
          "-1"
        ],
        docker_args: ["-p", @osrm_port],
        mounts: @mounts
      },
      stdout: "",
      stderr: "",
      slow_warn_message: false,
      raise: true
    )
  end

  @spec stop(state()) :: state()
  defp stop(%{container: full_ref} = state) do
    if full_ref, do: Util.Docker.stop(full_ref)
    %{state | healthy: false, port: nil, started: false}
  end

  defp match_with_osrm(from, path, params, state) do
    Task.async(fn ->
      full_url = url(state) <> path

      result =
        with {:ok, response} <- get(full_url, query: params) do
          matches = Enum.map(response.body["tracepoints"] || [], &format_match/1)
          {:ok, matches}
        else
          err ->
            {:error,
             "Failed to query OSRM: #{inspect(err)}\n  URL: #{full_url}?#{URI.encode_query(params)}"}
        end

      GenServer.reply(from, result)
    end)
  end

  defp format_match(nil), do: Basemap.MapMatcher.empty_match()

  defp format_match(match) do
    [mlon, mlat] = match["location"]

    %{
      match_name: match["name"],
      match_lat: mlat,
      match_lon: mlon,
      match_distance: match["distance"]
    }
  end

  defp url(%{port: port}), do: "http://localhost:#{port}/match/v1/#{@profile}/"
end
