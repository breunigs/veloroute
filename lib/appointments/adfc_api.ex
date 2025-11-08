defmodule Appointments.ADFCAPI do
  @max_events 4

  require Logger
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://api-touren-termine.adfc.de/api"
  plug Tesla.Middleware.JSON

  plug Tesla.Middleware.Headers, [
    {"user-agent", "mail@veloroute.hamburg -- event calendar"}
  ]

  @timeout_ms 5 * 60 * 1000
  @adapter_opts_general [adapter: [recv_timeout: @timeout_ms]]

  defp enabled?() do
    Application.get_env(:veloroute, :env) == :prod
  end

  @spec appointments() :: [Appointments.Appointment.t()] | nil
  def appointments() do
    if enabled?(), do: appointments_real(), else: appointments_dummy()
  end

  def appointments_dummy() do
    [
      %Appointments.Appointment{
        title: "Example ADFC Event",
        location: "Koppel 34",
        location_long: "ADFC Zentrale, Koppel 34, 20099 Hamburg",
        description: "Fuhren Fahrrad bevor es cool war",
        url: "https://touren-termine.adfc.de/",
        date_time: DateTime.utc_now(),
        lat: 53.557470,
        lon: 10.009714,
        highlight: false,
        map_only: false
      }
    ]
  end

  def appointments_real() do
    queries = [
      [eventType: "Radtour"],
      [
        eventType: "Termin",
        includedTags: [
          # Fahrrad-Demo
          1,
          # Sternfahrt
          2,
          # Wandertour
          22,
          # Wanderung
          23,
          # Kidical Mass
          61
        ]
      ]
    ]

    Parallel.flat_map(queries, &search/1)
    |> Enum.sort_by(& &1["beginning"])
    |> Stream.map(&to_appointment/1)
    |> Stream.reject(&is_nil/1)
    |> Enum.take(@max_events)
  end

  defp search(query_params) do
    [minLon, minLat, _maxLon, _maxLat] = Settings.r(:bounds)
    center = Settings.r(:bounds) |> Geo.BoundingBox.parse() |> Geo.CheapRuler.center()

    radius_m =
      min(
        Geo.CheapRuler.point2point_dist(center, %{lon: minLon, lat: center.lat}),
        Geo.CheapRuler.point2point_dist(center, %{lon: center.lon, lat: minLat})
      ) * 0.8

    today = Settings.r(:timezone) |> DateTime.now!() |> Calendar.strftime("%Y-%m-%d")

    Logger.info("Updating ADFC appointments #{inspect(query_params)}")

    with {:ok, %{body: %{"items" => list}}} when is_list(list) <-
           get("/eventItems/search",
             query:
               [
                 beginning: today,
                 includeSubsidiary: "false",
                 show: "list",
                 sort: "date",
                 limit: @max_events * 4,
                 offset: 0,
                 fromNow: false,
                 distance: round(radius_m / 1000.0),
                 lat: center.lat,
                 lng: center.lon
               ] ++ query_params,
             opts: @adapter_opts_general
           ) do
      list
    else
      resp ->
        Logger.warning("Received unexpected response: #{inspect(resp)}")
        nil
    end
  end

  defp to_appointment(entry) do
    with {:ok, date_time, 0} <- DateTime.from_iso8601(entry["beginning"]),
         date_time = DateTime.shift_zone!(date_time, Settings.r(:timezone)),
         "Published" <- entry["cStatus"],
         false <- entry["isCancelled"],
         true <- beginner_friendly?(entry),
         true <- accepts_more_people?(entry) do
      %Appointments.Appointment{
        title: title(entry),
        location: simplify_location(entry["startLocation"]),
        location_long: clean_double_plz(entry["startLocation"]),
        description: "#{entry["cShortDescription"]} (Veranstalter: #{entry["cUnitName"]})",
        date_time: date_time,
        lat: entry["latitude"],
        lon: entry["longitude"],
        url: "https://touren-termine.adfc.de/radveranstaltung/#{entry["cSlug"]}",
        highlight: false,
        map_only: false
      }
    else
      _ -> nil
    end
  end

  defp title(%{"eventType" => "Termin"} = entry), do: entry["title"]
  defp title(%{"eventType" => "Radtour"} = entry), do: "ADFC Tour: #{entry["title"]}"

  defp beginner_friendly?(%{"eventType" => "Termin"}), do: true
  defp beginner_friendly?(%{"cLedByTourGuide" => true}), do: true
  defp beginner_friendly?(_entry), do: false

  defp accepts_more_people?(%{"eventType" => "Termin"}), do: true

  defp accepts_more_people?(%{"eventItemId" => event_id})
       when is_binary(event_id) and event_id != "" do
    with {:ok, %{body: %{"eventItem" => details}}} when is_map(details) <-
           get("/eventItems/#{event_id}", opts: @adapter_opts_general) do
      no_registration_needed = details["maximum"] == 0

      (no_registration_needed || details["canRegister"]) &&
        valid_closing_date?(details["closingDate"])
    else
      _ -> false
    end
  end

  defp valid_closing_date?(nil), do: true
  defp valid_closing_date?(""), do: true

  defp valid_closing_date?(date_string) do
    with {:ok, date_time, 0} <- DateTime.from_iso8601(date_string) do
      now = DateTime.now!(Settings.r(:timezone))
      DateTime.compare(date_time, now) != :lt
    else
      _ -> false
    end
  end

  # "Gemeindezentrum, Schulstraße 1, 23869 Elmenhorst in 23869 Stormarn" → "Elmenhorst"
  # "U-Bahnhof Volksdorf Ausgang Marktseite 22359 Hamburg" -> "U-Bahnhof Volksdorf Ausgang Marktseite"
  def simplify_location(string) do
    with [_, plz, city] <- Regex.run(~r/(\d{5})\s+([A-Z][A-Za-z\s-]+)/, string) do
      if city == "Hamburg" do
        String.replace(string, ~r/\s*#{plz}.*/, "")
      else
        city |> String.trim() |> String.replace_suffix(" in", "")
      end
    end
  end

  # "Gemeindezentrum, Schulstraße 1, 23869 Elmenhorst in 23869 Stormarn"
  # →
  # "Gemeindezentrum, Schulstraße 1, 23869 Elmenhorst"
  defp clean_double_plz(string) do
    string
    |> String.replace(~r/(\d{5}\s+[A-Z][A-Za-z\s-]+).*/, "\\1")
    |> String.trim()
    |> String.replace_suffix(" in", "")
  end
end
