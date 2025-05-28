defmodule Appointments.CriticalMassUpdater do
  use GenServer
  @interval :timer.hours(24)

  @cache_key :critical_mass_cache

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    Process.send_after(self(), :update, 0)
    schedule()
    {:ok, []}
  end

  def cached() do
    with {:ok, list} when is_list(list) <- Cachex.get(@cache_key, :events) do
      list
    else
      _ -> []
    end
  end

  def handle_info(:update, state) do
    Cachex.put(@cache_key, :events, Appointments.CriticalMassAPI.appointments())

    schedule()
    {:noreply, state}
  end

  def cache_child_spec() do
    {Cachex, name: @cache_key}
  end

  defp schedule do
    Process.send_after(self(), :update, @interval)
  end
end
