defmodule Appointments.List do
  def current() do
    all()
    |> Enum.reject(&Appointments.Appointment.outdated?/1)
    |> Enum.sort_by(& &1.date_time, DateTime)
  end

  def all() do
    Appointments.CriticalMassUpdater.cached() ++ Appointments.Static.list()
  end
end
