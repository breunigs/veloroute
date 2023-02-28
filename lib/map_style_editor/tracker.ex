defmodule MapStyleEditor.Tracker do
  @moduledoc """
  Syncs file contents for WebSocket and Server, to avoid files being updated
  from Server are immediately pushed to the editor through the websocket.

  It also stores the selected map style we're editing.
  """
  use Agent

  @spec start_link(binary) :: {:error, any} | {:ok, pid}
  def start_link(map_style) when is_binary(map_style) do
    Agent.start_link(fn -> %{style: map_style} end, name: __MODULE__)
  end

  @spec style :: binary()
  def style() do
    Agent.get(__MODULE__, &Map.get(&1, :style))
  end

  @spec update(binary(), binary()) :: :ok
  def update(path, value) do
    path = Path.absname(path)
    Agent.update(__MODULE__, &Map.put(&1, path, value))
  end

  @spec different?(binary(), binary()) :: boolean()
  def different?(path, value) do
    path = Path.absname(path)
    Agent.get(__MODULE__, &(Map.get(&1, path) != value))
  end
end
