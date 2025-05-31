defmodule Appointments.Updater do
  use GenServer
  @interval :timer.hours(24)
  @sources [Appointments.CriticalMassAPI, Appointments.ADFCAPI, Appointments.Static]

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
    appts =
      @sources
      |> Parallel.flat_map(fn source -> source.appointments() end)
      |> Enum.sort_by(& &1.date_time, DateTime)

    Cachex.put(@cache_key, :events, appts)

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
