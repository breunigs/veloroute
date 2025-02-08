defmodule Data.Article.Static.Radroute1 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-1"
  def display_name(), do: "1"
  def title(), do: "Radroute 1"
  def color(), do: "#833e5d"

  def summary(),
    do:
      "Radroute 1 verläuft in Ost-West Richtung und verbindet Rissen ↔ Sülldorf ↔ Blankenese ↔ Nienstedten ↔ Klein Flottbek ↔ Othmarschen ↔ Ottensen ↔ Altona ↔ St. Pauli ↔ Neustadt ↔ Altstadt ↔ Borgfelde ↔ Hamm ↔ Horn ↔ Öjendorf"

  def tags(), do: [id()]

  def tracks(), do: []

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In Arbeit.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
