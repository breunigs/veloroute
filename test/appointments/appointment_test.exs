defmodule Appointments.AppointmentTest do
  use ExUnit.Case, async: true

  alias Appointments.Appointment

  setup do
    {:ok, now} = DateTime.now("Etc/UTC")
    future = DateTime.add(now, 13, :hour)
    past = DateTime.add(now, 11, :hour)

    base_appointment = %Appointment{
      title: "Test Event",
      location: "Test Location",
      description: "Test Description",
      date_time: now,
      url: "https://example.com",
      lat: 13.37,
      lon: 13.37
    }

    {:ok, base: base_appointment, now: now, future: future, past: past}
  end

  test "outdated?/1 returns true for appointments before cutoff", %{base: base, past: past} do
    appt = %{base | date_time: past}
    assert Appointment.outdated?(appt) == true
  end

  test "outdated?/1 returns false for appointments after cutoff", %{base: base, future: future} do
    appt = %{base | date_time: future}
    refute Appointment.outdated?(appt)
  end

  test "bounding_box/1 returns bounding box when lat/lon are present", %{base: base} do
    bbox = Appointment.bounding_box(base)
    assert %Geo.BoundingBox{} = bbox
    assert bbox.minLat < bbox.maxLat
    assert bbox.minLon < bbox.maxLon
  end

  test "bounding_box/1 returns nil when lat/lon are missing" do
    appt = %Appointment{
      title: "No Location",
      location: "N/A",
      description: "No coordinates",
      date_time: DateTime.utc_now(),
      url: "https://example.com",
      lat: nil,
      lon: nil
    }

    assert Appointment.bounding_box(appt) == nil
  end
end
