defmodule Appointments.Updater do
  use GenServer
  require Logger

  @interval :timer.hours(24)
  @sources [Appointments.CriticalMassAPI, Appointments.ADFCAPI, Appointments.Static]

  @cache_key :critical_mass_cache

  @type cache :: %{atom() => [Appointments.Appointment.t()]}

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

  @empty_cache Enum.into(@sources, %{}, &{&1, []})

  def handle_info(:update, state) do
    try do
      cache =
        with {:ok, cache} <- Cachex.get(@cache_key, :sources) do
          update_cache(cache || @empty_cache)
        else
          _ ->
            update_cache(@empty_cache)
        end

      Cachex.put(@cache_key, :cache, cache)

      appts =
        cache
        |> Map.values()
        |> List.flatten()
        |> Enum.sort_by(& &1.date_time, DateTime)

      Cachex.put(@cache_key, :events, appts)
    rescue
      e ->
        Logger.error(
          "#{__MODULE__} failed to update: #{inspect(e)}:\n#{Exception.format_stacktrace(__STACKTRACE__)}"
        )
    end

    schedule()
    {:noreply, state}
  end

  def cache_child_spec() do
    {Cachex, name: @cache_key}
  end

  defp schedule do
    Process.send_after(self(), :update, @interval)
  end

  @spec update_cache(cache()) :: cache()
  defp update_cache(cache) when is_map(cache) do
    cache
    |> Parallel.map(fn {source, old_appointments} ->
      {source, source.appointments() || old_appointments}
    end)
    |> Enum.into(%{})
  end
end
