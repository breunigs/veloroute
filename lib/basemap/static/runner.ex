defmodule Basemap.Static.Runner do
  use GenServer
  require Logger

  # keep in sync with map.js for route highlighting
  @highlight_layer "route-highlight"
  @highlight_property "route_id"

  # how many render processes to spawn
  @parallelism if Application.compile_env(:veloroute, :env) == :prod, do: 2, else: 1
  # maximum time in seconds to wait to try to restart a broken renderer process
  @max_backoff 5 * 60

  @type render_task :: %{
          lon: float(),
          lat: float(),
          zoom: float(),
          width: pos_integer(),
          height: pos_integer(),
          pixelRatio: pos_integer(),
          highlightRoute: binary()
        }

  defp asset_dir(), do: Path.join(to_string(:code.priv_dir(:veloroute)), "static/")

  defp style_path() do
    "priv/" <> path = Basemap.Styles.assets_path("standard.json.local")
    Path.join(to_string(:code.priv_dir(:veloroute)), path)
  end

  @doc """
  Generate a static map rendering in PNG format for the given bounds, dimensions
  and pixelRatio.
  """
  @spec render(render_task(), non_neg_integer()) ::
          {:ok, content_type :: binary(), image :: binary()} | {:error, reason :: binary()}
  def render(task, timeout \\ 5000) do
    line =
      Enum.join(
        [
          task.lon,
          task.lat,
          task.zoom,
          task.pixelRatio,
          task.width,
          task.height,
          @highlight_layer,
          @highlight_property,
          String.slice(task.highlightRoute, 0..100)
        ],
        " "
      )

    deadline = :os.system_time(:millisecond) + timeout
    GenServer.call(__MODULE__, {:render, line <> "\n", deadline}, timeout)
  catch
    :exit, reason -> {:error, inspect(reason)}
  end

  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @typep item :: {GenServer.from(), binary(), non_neg_integer()}
  @typep state :: %{
           ports: [port()],
           processing: %{port() => item()},
           queue: [item()],
           backoff: pos_integer()
         }

  @spec init(any) :: {:ok, state()}
  def init(_args \\ []) do
    ports =
      if enable?() do
        :ok = Basemap.Static.Exe.ensure(stale: :ok)
        Enum.map(0..(@parallelism - 1), fn _x -> open_port() end) |> Util.compact()
      else
        []
      end

    {:ok, %{ports: ports, processing: %{}, queue: [], backoff: 1}}
  end

  defp enable?() do
    Application.get_env(:phoenix, :serve_endpoints) ||
      Application.get_env(:veloroute, :env) == :prod
  end

  def handle_call({:render, line, deadline}, from, state) do
    state =
      state
      |> append({from, line, deadline})
      |> maybe_start_render()

    {:noreply, state}
  end

  def handle_info({port, {:data, "ERROR: " <> msg}}, state)
      when not is_map_key(state.processing, port) do
    Logger.error("#{inspect(port)}: #{msg}")
    {:noreply, state}
  end

  def handle_info({port, {:data, "WARNING: " <> msg}}, state)
      when not is_map_key(state.processing, port) do
    Logger.warning("#{inspect(port)}: #{msg}")
    {:noreply, state}
  end

  def handle_info({port, {:data, "INFO: " <> msg}}, state)
      when not is_map_key(state.processing, port) do
    Logger.info("#{inspect(port)}: #{msg}")
    {:noreply, state}
  end

  def handle_info({port, {:data, "DEBUG: " <> msg}}, state)
      when not is_map_key(state.processing, port) do
    Logger.debug("#{inspect(port)}: #{msg}")
    {:noreply, state}
  end

  def handle_info({port, {:data, data}}, state) when not is_map_key(state.processing, port) do
    Logger.warning(
      "#{inspect(port)} send unexpected data; state #{inspect(state)}; #{inspect(data)}"
    )

    {:noreply, state}
  end

  @png_header <<137, 80, 78, 71, 13, 10, 26, 10>>
  def handle_info({port, {:data, @png_header <> data}}, state)
      when is_map_key(state.processing, port) do
    %{^port => {from, _line, deadline}} = state.processing

    if !expired?(deadline), do: GenServer.reply(from, {:ok, "image/png", @png_header <> data})
    {:noreply, state |> free_port(port) |> maybe_start_render()}
  end

  @riff <<82, 73, 70, 70>>
  @webp <<87, 69, 66, 80>>
  def handle_info(
        {port, {:data, @riff <> <<_size::binary-size(4)>> <> @webp <> _rest = data}},
        state
      )
      when is_map_key(state.processing, port) do
    %{^port => {from, _line, deadline}} = state.processing

    if !expired?(deadline), do: GenServer.reply(from, {:ok, "image/webp", data})
    {:noreply, state |> free_port(port) |> maybe_start_render()}
  end

  def handle_info({port, {:data, "error" <> msg}}, state)
      when is_map_key(state.processing, port) do
    %{^port => {from, _line, deadline}} = state.processing

    if expired?(deadline), do: Logger.warning(msg), else: GenServer.reply(from, {:error, msg})
    {:noreply, state |> free_port(port) |> maybe_start_render()}
  end

  def handle_info({port, {:data, data}}, state) when is_map_key(state.processing, port) do
    %{^port => {from, _line, deadline}} = state.processing

    msg = "Received data from mbgl-render that was not understood: #{inspect(data)}"
    if expired?(deadline), do: Logger.warning(msg), else: GenServer.reply(from, {:error, msg})
    {:noreply, state |> free_port(port) |> maybe_start_render()}
  end

  def handle_info({port, {:exit_status, status}}, state) do
    Logger.warning("#{inspect(port)}: exit_status #{inspect(status)}")
    {:noreply, replace_port(state, port)}
  end

  def handle_info({:DOWN, _ref, :port, port, :normal}, state) do
    Logger.warning("#{inspect(port)}: received DOWN message")
    {:noreply, replace_port(state, port)}
  end

  def handle_info(:add_port, %{ports: ports} = state) do
    ports = if length(ports) < @parallelism, do: [open_port() | ports], else: ports
    {:noreply, %{state | ports: ports}}
  end

  def handle_info(msg, state) do
    Logger.warning("Unhandled message: #{inspect(msg)}\nstate: #{inspect(state)}")
    {:noreply, maybe_start_render(state)}
  end

  @spec append(state(), item()) :: state()
  defp append(state, item), do: %{state | queue: state.queue ++ [item]}

  @spec maybe_start_render(state()) :: state()
  defp maybe_start_render(%{ports: [port | ports], queue: [item | queue]} = state) do
    {_from, line, deadline} = item

    if expired?(deadline) do
      maybe_start_render(%{state | queue: queue})
    else
      true = Port.command(port, line)
      %{state | processing: Map.put(state.processing, port, item), ports: ports, queue: queue}
    end
  end

  defp maybe_start_render(state), do: state

  @spec free_port(state(), port()) :: state()
  defp free_port(state, port) when is_map_key(state.processing, port) do
    %{
      state
      | processing: Map.delete(state.processing, port),
        ports: [port | state.ports]
    }
  end

  @spec replace_port(state(), port()) :: state()
  defp replace_port(%{processing: processing, ports: ports, backoff: backoff} = state, port) do
    # clean up if needed
    processing =
      if is_map_key(processing, port) do
        {from, _line, deadline} = processing[port]
        if !expired?(deadline), do: GenServer.reply(from, {:error, "static renderer crashed"})
        Map.delete(processing, port)
      else
        processing
      end

    ports = List.delete(ports, port)

    # create new port, if needed (we might receive more than one message for shut down ports)
    if length(ports) < @parallelism do
      seconds = round(:math.pow(2, backoff))
      seconds = min(seconds, @max_backoff)
      Logger.warning("restarting fail ##{backoff} static map renderer in #{seconds}s")
      Process.send_after(self(), :add_port, seconds * 1000)
    end

    %{state | processing: processing, ports: ports, backoff: backoff + 1}
  end

  defp expired?(deadline), do: :os.system_time(:millisecond) > deadline

  defp open_port() do
    [exe | args] = Basemap.Static.Exe.command_line()

    if File.exists?(exe) do
      args =
        args ++
          [
            "--style",
            style_path(),
            "--assets",
            asset_dir(),
            "--max-zoom",
            to_string(Basemap.Constants.bounds_fitting_max_zoom())
          ]

      port =
        Port.open(
          {:spawn_executable, exe},
          [
            :binary,
            :exit_status,
            {:packet, 4},
            {:args, args},
            {:env, [Basemap.Static.Exe.ld_preload()]},
            {:parallelism, false}
          ]
        )

      Port.monitor(port)
      port
    else
      if Application.get_env(:veloroute, :env) != :test,
        do:
          Logger.warning(
            "#{exe} not found for static map renderer. Are all dependencies installed? #{Mix.env()}"
          )

      nil
    end
  end
end
