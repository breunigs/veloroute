defmodule MapStyleEditor.WebSocket do
  @moduledoc """
  Listen to file changes for any of the mapstyles and push them to the editor
  for updates
  """
  require Logger

  @behaviour :cowboy_websocket

  @idle_timeout_ms 10 * 60 * 1000

  @impl :cowboy_websocket
  def init(request, state) do
    url = "#{request.scheme}://#{request.host}:#{request.port}"
    state = Map.put(state, :url, url)
    {:cowboy_websocket, request, state, %{idle_timeout: @idle_timeout_ms}}
  end

  @impl :cowboy_websocket
  def websocket_init(state) do
    {:ok, watcher_pid} = FileSystem.start_link(dirs: [MapStyleEditor.Tracker.style()])
    FileSystem.subscribe(watcher_pid)
    {:ok, Map.put(state, :watcher_pid, watcher_pid)}
  end

  @impl :cowboy_websocket

  def websocket_handle({:ping, _any}, state), do: {:reply, {:pong, "PONG"}, state}
  def websocket_handle(:ping, state), do: {:reply, :pong, state}

  def websocket_handle(any, state) do
    Logger.warning("received unknown websocket text message: #{inspect(any)}")
    {:ok, state}
  end

  @impl :cowboy_websocket
  # i.e. file updated
  def websocket_info(
        {:file_event, pid, {path, [:modified, :closed]}},
        %{watcher_pid: pid, url: url} = state
      ) do
    content = File.read!(path) |> Basemap.RelativePath.hardcode(url)

    if MapStyleEditor.Tracker.different?(path, content) do
      Logger.info("#{path} was updated, pushing to web editor")
      MapStyleEditor.Tracker.update(path, content)
      {:reply, {:text, content}, state}
    else
      {:ok, state}
    end
  end

  # i.e other file events
  def websocket_info({:file_event, pid, {_path, _reason}}, %{watcher_pid: pid} = state),
    do: {:ok, state}

  def websocket_info(info, state) do
    Logger.warning("Unknown message received: #{inspect(info)}")
    {:ok, state}
  end
end
