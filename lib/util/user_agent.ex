defmodule Util.UserAgent do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> UAParser.Storage.list() end, name: __MODULE__)
  end

  def device_os(nil), do: nil

  def device_os(user_agent_header) do
    Agent.get(__MODULE__, fn list ->
      user_agent_header
      |> UAParser.parse(list)
      |> case do
        %{os: %{family: x}} -> x
        _ -> nil
      end
    end)
  end
end
