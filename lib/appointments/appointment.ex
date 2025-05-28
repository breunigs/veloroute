defmodule Appointments.Appointment do
  @type t() :: %__MODULE__{
          title: binary(),
          location: binary(),
          description: binary(),
          date_time: DateTime.t(),
          url: binary(),
          lat: float() | nil,
          lon: float() | nil
        }

  @enforce_keys [:title, :location, :description, :date_time, :url]
  defstruct @enforce_keys ++ [:lat, :lon]

  @spec outdated?(t()) :: boolean()
  def outdated?(appointment) do
    {:ok, now} = DateTime.now(Settings.r(:timezone))
    cutoff = DateTime.add(now, 12, :hour)
    DateTime.compare(cutoff, appointment.date_time) == :gt
  end

  use Phoenix.Component

  def html(apt, lang) when is_binary(lang) do
    assigns = %{
      apt: apt,
      machine_date: machine_date(apt),
      machine_date_time: DateTime.to_string(apt.date_time),
      human_short: format_date_time(apt, "%d.%m. – %H:%M", "%d.%m.", lang),
      human_long: format_date_time(apt, "%A, %d.%m.%Y – %H:%M", "%A, %d.%m.%Y", lang),
      bounds: bounding_box(apt)
    }

    ~H"""
    <li>
      <time title={@human_long} datetime={@machine_date_time}><%= @human_short %></time>
      <Components.TagHelpers.a href={@apt.url} title={@apt.description}>{@apt.title}</Components.TagHelpers.a>
      –
      <%= if @bounds do %>
        <Components.TagHelpers.m lat={@apt.lat} lon={@apt.lon} bounds={@bounds}>{@apt.location}</Components.TagHelpers.m>
      <% else %>
        {@apt.location}
      <% end %>
    </li>
    """
  end

  def bounding_box(%{lat: lat, lon: lon}) when is_number(lat) and is_number(lon) do
    %Geo.BoundingBox{minLat: lat, maxLat: lat, minLon: lon, maxLon: lon}
    |> Geo.CheapRuler.buffer_bbox(1000)
  end

  def bounding_box(_), do: nil

  defp machine_date(appt), do: Calendar.strftime(appt.date_time, "%Y-%m-%d")

  defp format_date_time(%{date_time: dt}, date_time, date_only, lang) do
    opts =
      if lang == "de" do
        [
          day_of_week_names: fn day_of_week ->
            {"Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"}
            |> elem(day_of_week - 1)
          end
        ]
      end || []

    if dt.hour == 0 && dt.minute == 0 do
      Calendar.strftime(dt, date_only, opts)
    else
      Calendar.strftime(dt, date_time, opts)
    end
  end
end
