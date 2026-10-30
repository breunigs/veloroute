defmodule Appointments.Updater do
  use GenServer
  require Logger

  @interval :timer.hours(24)
  # a failed source still has its previous results, so retrying is not urgent
  @retry_interval :timer.hours(6)
  # … unless it has no results at all, e.g. because it failed right after a restart
  @retry_empty_interval :timer.hours(1)
  @sources [Appointments.CriticalMassAPI, Appointments.ADFCAPI, Appointments.Static]

  @cache_key :critical_mass_cache

  @type cache :: %{atom() => [Appointments.Appointment.t()]}

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    Process.send_after(self(), :update, 0)
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
    next =
      try do
        {cache, failed} =
          with {:ok, cache} <- Cachex.get(@cache_key, :sources) do
            update_cache(cache || @empty_cache)
          else
            _ ->
              update_cache(@empty_cache)
          end

        Cachex.put(@cache_key, :sources, cache)

        appts =
          cache
          |> Map.values()
          |> List.flatten()
          |> Enum.sort_by(& &1.date_time, DateTime)

        Cachex.put(@cache_key, :events, appts)

        retry_interval(cache, failed)
      rescue
        e ->
          Logger.error(
            "#{__MODULE__} failed to update: #{inspect(e)}:\n#{Exception.format_stacktrace(__STACKTRACE__)}"
          )

          @retry_empty_interval
      end

    schedule(next)
    {:noreply, state}
  end

  @spec retry_interval(cache(), [module()]) :: pos_integer()
  defp retry_interval(_cache, []), do: @interval

  defp retry_interval(cache, failed) do
    interval =
      if Enum.any?(failed, &(cache[&1] == [])),
        do: @retry_empty_interval,
        else: @retry_interval

    Logger.warning("Retrying #{inspect(failed)} in #{div(interval, :timer.minutes(1))} minutes")
    interval
  end

  def cache_child_spec() do
    {Cachex, name: @cache_key}
  end

  defp schedule(interval) do
    Process.send_after(self(), :update, interval)
  end

  @spec update_cache(cache()) :: {cache(), [module()]}
  defp update_cache(cache) when is_map(cache) do
    results =
      Parallel.map(cache, fn {source, old_appointments} ->
        {source, source.appointments(), old_appointments}
      end)

    new_cache = Enum.into(results, %{}, fn {source, new, old} -> {source, new || old} end)
    failed = for {source, nil, _old} <- results, do: source

    {new_cache, failed}
  end
end
