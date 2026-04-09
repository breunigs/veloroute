defmodule MapStyleEditor.WebSocket do
  @moduledoc """
  Listen to file changes for any of the mapstyles and push them to the editor
  for updates
  """
  require Logger

  @behaviour WebSock

  @impl WebSock
  def init(state) do
    {:ok, watcher_pid} = FileSystem.start_link(dirs: [MapStyleEditor.Tracker.style()])
    FileSystem.subscribe(watcher_pid)
    {:ok, Map.put(state, :watcher_pid, watcher_pid)}
  end

  @impl WebSock
  def handle_in({msg, [opcode: opcode]}, state) do
    Logger.warning("received unknown websocket #{opcode} message: #{inspect(msg)}")
    {:ok, state}
  end

  @impl WebSock
  # i.e. file updated
  def handle_info(
        {:file_event, pid, {path, [:modified, :closed]}},
        %{watcher_pid: pid, url: url} = state
      ) do
    content = File.read!(path) |> Basemap.RelativePath.hardcode(url)

    if MapStyleEditor.Tracker.different?(path, content) do
      Logger.info("#{path} was updated, pushing to web editor")
      MapStyleEditor.Tracker.update(path, content)
      {:push, {:text, content}, state}
    else
      {:ok, state}
    end
  end

  # i.e other file events
  def handle_info({:file_event, pid, {_path, _reason}}, %{watcher_pid: pid} = state),
    do: {:ok, state}

  def handle_info(info, state) do
    Logger.warning("Unknown message received: #{inspect(info)}")
    {:ok, state}
  end
end
