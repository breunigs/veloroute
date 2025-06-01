defmodule Appointments.List do
  def current() do
    Appointments.Updater.cached()
    |> Enum.reject(&Appointments.Appointment.outdated?/1)
  end

  def current_geojson(lang) when is_binary(lang) do
    feats =
      current()
      |> Enum.map(&Appointments.Appointment.geojson(&1, lang))
      |> Util.compact()

    %{
      type: "FeatureCollection",
      features: feats
    }
  end
end
