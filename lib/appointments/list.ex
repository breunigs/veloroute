defmodule Appointments.List do
  def current() do
    Appointments.Updater.cached()
    |> Enum.reject(&Appointments.Appointment.outdated?/1)
  end
end
