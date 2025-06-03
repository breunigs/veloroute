defmodule Appointments.CriticalMassAPI do
  require Logger
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://criticalmass.in/api"
  plug Tesla.Middleware.JSON

  plug Tesla.Middleware.Headers, [
    {"user-agent", "mail@veloroute.hamburg -- event calendar"}
  ]

  @timeout_ms 5 * 60 * 1000
  @adapter_opts_general [adapter: [recv_timeout: @timeout_ms]]

  @spec appointments() :: [Appointments.Appointment.t()]
  def appointments() do
    if enabled?(), do: appointments_real(), else: appointments_dummy()
  end

  def appointments_dummy() do
    [
      %Appointments.Appointment{
        title: "Example Critical Mass",
        location: "Michelwiese",
        location_long: nil,
        description: "Immer spaßig diese Example CM!",
        url: "https://criticalmass.in/hamburg",
        date_time: DateTime.utc_now(),
        lat: 53.546835,
        lon: 9.978936,
        highlight: false,
        map_only: false
      }
    ]
  end

  def appointments_real() do
    [minLon, minLat, maxLon, maxLat] = Settings.r(:bounds)
    city_metadata = city_metadata()

    Logger.info("Updating CriticalMass appointments")

    with {:ok, %{body: list}} when is_list(list) <-
           get("/ride",
             query: [
               bbWestLongitude: minLon,
               bbEastLongitude: maxLon,
               bbSouthLatitude: minLat,
               bbNorthLatitude: maxLat,
               orderDirection: :desc,
               orderBy: :dateTime
             ],
             opts: @adapter_opts_general
           ) do
      list
      |> Enum.map(&to_appointment(&1, city_metadata))
      |> Util.compact()
    end
  end

  defp enabled?() do
    Application.get_env(:veloroute, :env) == :prod
  end

  defp city_metadata() do
    Logger.info("Updating CriticalMass city metadata")

    [minLon, minLat, maxLon, maxLat] = Settings.r(:bounds)

    with {:ok, %{body: list}} when is_list(list) <-
           get("/city",
             query: [
               bbWestLongitude: minLon,
               bbEastLongitude: maxLon,
               bbSouthLatitude: minLat,
               bbNorthLatitude: maxLat,
               size: 100
             ],
             opts: @adapter_opts_general
           ) do
      Enum.reduce(list, %{}, fn
        %{"title" => title, "slugs" => [%{"slug" => slug} | _], "description" => desc}, acc ->
          Map.put(acc, title, %{slug: slug, description: desc})

        _unparsable, acc ->
          acc
      end)
    end
  end

  defp to_appointment(entry, metadata) do
    with {:ok, date_time} <- DateTime.from_unix(entry["date_time"]),
         date_time = DateTime.shift_zone!(date_time, Settings.r(:timezone)),
         true <- entry["enabled"],
         l when is_binary(l) <- entry["location"],
         l when l != "" <- entry["location"],
         false <- String.contains?(entry["location"], "://"),
         title when is_binary(title) <- clean_title(entry["title"], date_time),
         slug when is_binary(slug) <- entry["slug"] || get_in(metadata, [title, :slug]),
         machine_date <- Calendar.strftime(date_time, "%Y-%m-%d") do
      loc_short = String.replace(entry["location"], ~r/\s+\(.*$/, "")
      loc_long = if loc_short != entry["location"], do: entry["location"]

      %Appointments.Appointment{
        title: title,
        location: loc_short,
        location_long: loc_long,
        description: entry["description"] || get_in(metadata, [title, :description]),
        date_time: date_time,
        lat: entry["latitude"],
        lon: entry["longitude"],
        url: "https://criticalmass.in/#{slug}/#{machine_date}",
        highlight: false,
        map_only: false
      }
    else
      _ -> nil
    end
  end

  defp clean_title(nil, _date_time), do: nil

  defp clean_title(title, date_time) do
    title
    |> String.replace(Calendar.strftime(date_time, "%d.%m.%Y"), "")
    |> String.trim()
  end
end
