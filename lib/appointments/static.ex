defmodule Appointments.Static do
  @sternfahrt_title "Fahrradsternfahrt"
  @sternfahrt_url "https://fahrradsternfahrt.hamburg/fahrradsternfahrt-hamburg/routenplan/"
  @sternfahrt_date ~U[2025-06-22 00:00:00.000Z]
  @sternfahrt_locations "data/sternfahrt_2025_locations.json"
  @external_resource @sternfahrt_locations

  @sternfahrt_locations @sternfahrt_locations
                        |> File.read!()
                        |> JSON.decode!()
                        |> Map.fetch!("starting_points")
                        |> Enum.map(fn entry ->
                          normal_time = String.pad_leading(entry["time"], 5, "0") <> ":00"
                          time = Time.from_iso8601!(normal_time)
                          date = Map.merge(@sternfahrt_date, Map.take(time, [:hour, :minute]))

                          place =
                            if entry["place_detail"] == "",
                              do: entry["place"],
                              else: entry["place_detail"]

                          title = "#{@sternfahrt_title}: #{place}"

                          %Appointments.Appointment{
                            title: title,
                            location: "",
                            location_long: "",
                            description: "",
                            date_time: date,
                            url: "",
                            lat: entry["lat"],
                            lon: entry["lon"],
                            highlight: false,
                            map_only: true
                          }
                        end)

  def appointments() do
    [
      %Appointments.Appointment{
        title: @sternfahrt_title,
        location: "Startpunkte in Hamburg und Umland",
        location_long:
          "Startpunkte in Hamburg und Umland. Kurzfristige Änderungen der Startpunkte und -zeiten sind möglich. Bitte vorher nochmal auf Veranstaltungsseite schauen.",
        description:
          "Von über 80 Startpunkten im norddeutschen Raum brechen wir am Sonntag, den 22. Juni 2025, mit tausenden Radfahrer*innen zur Fahrradsternfahrt Hamburg in die Innenstadt auf. Unsere Routen führen mit Polizeibegleitung über für uns gesperrte Hauptverkehrsstraßen, die Routen südlich der Elbe fahren wie gewohnt ein Stück auf der Autobahn 255 über die Elbe. Die Teilnahme an der Fahrradsternfahrt ist kostenlos und ohne Anmeldung — notwendig ist lediglich ein verkehrssicheres Fahrrad, Proviant und Sonnenschutz.",
        url: @sternfahrt_url,
        date_time: @sternfahrt_date,
        highlight: true,
        map_only: false
      }
      | @sternfahrt_locations
    ]
  end
end
