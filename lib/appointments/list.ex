defmodule Appointments.List do
  def current() do
    upcoming()
    |> not_map_only()
  end

  def current_geojson(lang) when is_binary(lang) do
    feats =
      upcoming()
      |> Enum.map(&Appointments.Appointment.geojson(&1, lang))
      |> Util.compact()

    %{
      type: "FeatureCollection",
      features: feats
    }
  end

  defp upcoming() do
    Appointments.Updater.cached()
    |> not_outdated()
    |> only_next_occurrence()
  end

  defp not_outdated(list) do
    cutoff = Appointments.Appointment.cutoff_date()
    Enum.reject(list, &Appointments.Appointment.outdated?(&1, cutoff))
  end

  # recurring events (e.g. a monthly Critical Mass) are announced several
  # months ahead; only show the next date of each of them
  defp only_next_occurrence(list) do
    list
    |> Enum.sort_by(& &1.date_time, DateTime)
    |> Enum.uniq_by(& &1.title)
  end

  defp not_map_only(list) do
    Enum.reject(list, & &1.map_only)
  end
end
