defmodule Data.Article.Static.Termine do
  use Article.Static

  def title(), do: "Termine"

  def summary("de"), do: "Veranstaltungskalender für Fahrraddinge in und um Hamburg."
  def summary("en"), do: "Upcoming events around cycling in and around Hamburg."

  def tags(), do: []

  def languages(), do: ~w[de en]

  def text(assigns) do
    assigns = assign(assigns, :de, assigns.lang == "de")

    ~H"""
    <%= for appointment <- @appointments do %>
      <%= Appointments.Appointment.html_long(appointment, @lang) %>
    <% end %>

    <%= if @lang == "de" do %>
      <h4>ADFC Terminkalender</h4>
      <p>Viele weitere Termine zu geführten Touren, Codierung und sonstigen Veranstaltungen rund ums Fahrrad finden sich auch im <.a href="https://touren-termine.adfc.de/suche?latLng=53.5488282%2C9.98717029">ADFC Terminkalender</.a>.</p>
    <% else %>
      <h4>ADFC Event Calendar</h4>
      <p>You can find many more events – including guided tours, bike registration, and other cycling-related activities — in the <.a href="https://touren-termine.adfc.de/suche?latLng=53.5488282%2C9.98717029">ADFC Event Calendar</.a>.</p>
    <% end %>
    """
  end
end
