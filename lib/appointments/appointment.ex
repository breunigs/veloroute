defmodule Appointments.Appointment do
  @type t() :: %__MODULE__{
          title: binary(),
          location: binary(),
          location_long: binary() | nil,
          description: binary(),
          date_time: DateTime.t(),
          url: binary(),
          lat: float() | nil,
          lon: float() | nil,
          highlight: boolean(),
          map_only: boolean()
        }

  @enforce_keys [
    :title,
    :location,
    :description,
    :date_time,
    :url,
    :highlight,
    :location_long,
    :map_only
  ]
  defstruct @enforce_keys ++ [:lat, :lon]

  @spec outdated?(t(), DateTime.t()) :: boolean()
  def outdated?(appointment, cutoff \\ cutoff_date()) do
    DateTime.compare(cutoff, appointment.date_time) == :gt
  end

  def cutoff_date() do
    {:ok, now} = DateTime.now(Settings.r(:timezone))
    DateTime.add(now, -12, :hour)
  end

  use Phoenix.Component

  def geojson(apt, lang) when is_binary(lang) and is_float(apt.lat) and is_float(apt.lon) do
    date = format_date_time(apt, "%a, %d.%m.%Y – %H:%M", "%A, %d.%m.%Y", lang)

    %{
      type: "Feature",
      geometry: %{
        type: "Point",
        coordinates: [apt.lon, apt.lat]
      },
      properties: %{
        name: Data.Article.Static.Termine.name(),
        title: apt.title,
        date: date,
        location: apt.location_long || apt.location,
        description: apt.description,
        url: apt.url
      }
    }
  end

  def geojson(_apt, lang) when is_binary(lang), do: nil

  def html(apt, lang) when is_binary(lang) do
    assigns = build_assigns(apt, lang)

    ~H"""
    <li class={@class}>
      <time title={@human_long} datetime={@machine_date_time}><%= @human_short %></time>
      <Components.TagHelpers.a href={@apt.url} title={@apt.description}>{@apt.title}</Components.TagHelpers.a>
      –
      <span title={@apt.location_long || @apt.location}>
        <%= if @bounds do %>
          <Components.TagHelpers.m lat={@apt.lat} lon={@apt.lon} bounds={@bounds}>{@apt.location}</Components.TagHelpers.m>
        <% else %>
          {@apt.location}
        <% end %>
      </span>
    </li>
    """
  end

  def html_long(apt, lang) when is_binary(lang) do
    assigns = build_assigns(apt, lang)

    ~H"""
    <h4>{@apt.title}    <%= if @apt.highlight do %><div style="float:right;font-size: 3rem;margin-top: -1rem; height: 2rem">⭐</div><% end %></h4>
    <dl class={@class}>
      <dt><%= if @de, do: "Zeit", else: "Date" %></dt><dd><time datetime={@machine_date_time}><%= @human_long %></time></dd>
      <dt><%= if @de, do: "Ort", else: "Place" %></dt>
      <dd lang="de">
        <%= if @bounds do %>
          <Components.TagHelpers.m lat={@apt.lat} lon={@apt.lon} bounds={@bounds}>{@apt.location_long || @apt.location}</Components.TagHelpers.m>
        <% else %>
          {@apt.location_long || @apt.location}
        <% end %>
      </dd>
      <dt><%= if @de, do: "Webseite", else: "Website" %></dt>
      <dd><Components.TagHelpers.a href={@apt.url}>{@base_url}</Components.TagHelpers.a></dd>
    </dl>
    <p lang="de"><%= @apt.description %></p>
    <script type="application/ld+json"><%= Phoenix.HTML.raw(@jsonld) %></script>
    """
  end

  defp build_assigns(apt, lang) do
    %{
      apt: apt,
      de: lang == "de",
      class: if(apt.highlight, do: "highlight"),
      base_url: base_url(apt),
      machine_date: machine_date(apt),
      machine_date_time: DateTime.to_string(apt.date_time),
      human_short: format_date_time(apt, "%d.%m. – %H:%M", "%d.%m.", lang),
      human_long: format_date_time(apt, "%A, %d.%m.%Y – %H:%M", "%A, %d.%m.%Y", lang),
      bounds: bounding_box(apt),
      jsonld: jsonld(apt)
    }
  end

  defp jsonld(apt) do
    location = %{
      "@type": "Place",
      name: apt.location_long || apt.location,
      geo:
        if(apt.lat && apt.lon,
          do: %{
            "@type": "GeoCoordinates",
            latitude: apt.lat,
            longitude: apt.lon
          }
        )
    }

    JSON.encode!(%{
      "@context": "https://schema.org",
      "@type": "Event",
      name: apt.title,
      startDate: DateTime.to_string(apt.date_time),
      eventAttendanceMode: "https://schema.org/OfflineEventAttendanceMode",
      eventStatus: "https://schema.org/EventScheduled",
      location: Util.compact(location),
      description: apt.description,
      url: apt.url
    })
  end

  def bounding_box(%{lat: lat, lon: lon}) when is_number(lat) and is_number(lon) do
    %Geo.BoundingBox{min_lat: lat, max_lat: lat, min_lon: lon, max_lon: lon}
    |> Geo.CheapRuler.buffer_bbox(1000)
  end

  def bounding_box(_), do: nil

  defp base_url(apt) do
    %{host: host, path: path} = URI.parse(apt.url)

    case byte_size(path) do
      1 -> host
      len when len in 2..30 -> "#{host}#{path}"
      _ -> host
    end
  end

  defp machine_date(appt), do: Calendar.strftime(appt.date_time, "%Y-%m-%d")

  defp format_date_time(%{date_time: dt}, date_time, date_only, lang) do
    names = fn day_of_week ->
      {"Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"}
      |> elem(day_of_week - 1)
    end

    abbrev = fn day_of_week -> String.slice(names.(day_of_week), 0..1) end

    opts =
      if lang == "de" do
        [
          day_of_week_names: names,
          abbreviated_day_of_week_names: abbrev
        ]
      end || []

    if dt.hour == 0 && dt.minute == 0 do
      Calendar.strftime(dt, date_only, opts)
    else
      Calendar.strftime(dt, date_time, opts)
    end
  end
end
