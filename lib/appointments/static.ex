defmodule Appointments.Static do
  def appointments() do
    [
      %Appointments.Appointment{
        title: "Fahrradsternfahrt",
        location: "Startpunkte in Hamburg und Umland",
        location_long:
          "Startpunkte in Hamburg und Umland. Kurzfristige Änderungen der Startpunkte und -zeiten sind möglich. Bitte am Tag vorher nochmal schauen.",
        description:
          "Von über 80 Startpunkten im norddeutschen Raum brechen wir am Sonntag, den 22. Juni 2025, mit tausenden Radfahrer*innen zur Fahrradsternfahrt Hamburg in die Innenstadt auf. Unsere Routen führen mit Polizeibegleitung über für uns gesperrte Hauptverkehrsstraßen, die Routen südlich der Elbe fahren wie gewohnt ein Stück auf der Autobahn 255 über die Elbe.",
        url: "https://fahrradsternfahrt.hamburg/fahrradsternfahrt-hamburg/routenplan/",
        date_time: ~U[2025-06-22 00:00:00.000Z],
        highlight: true
      }
    ]
  end
end
