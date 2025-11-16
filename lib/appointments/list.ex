defmodule Appointments.List do
  def current() do
    Appointments.Updater.cached()
    |> not_outdated()
    |> not_map_only()
  end

  def current_geojson(lang) when is_binary(lang) do
    feats =
      Appointments.Updater.cached()
      |> not_outdated()
      |> Enum.map(&Appointments.Appointment.geojson(&1, lang))
      |> Util.compact()

    %{
      type: "FeatureCollection",
      features: feats
    }
  end

  defp not_outdated(list) do
    cutoff = Appointments.Appointment.cutoff_date()
    Enum.reject(list, &Appointments.Appointment.outdated?(&1, cutoff))
  end

  defp not_map_only(list) do
    Enum.reject(list, & &1.map_only)
  end
end
