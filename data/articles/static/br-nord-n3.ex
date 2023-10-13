defmodule Data.Article.Static.BrNordN3 do
  use Article.Static

  def id(), do: "br-nord-n3"
  def display_id(), do: "N3"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N3 – Barmbek ↔ Fuhlsbüttel"

  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N3 – Barmbek ↔ Fuhlsbüttel“ im Bezirk Hamburg-Nord führt vom Ohlsdorfer Friedhof nach Süden und schließt in zwei Ästen an die Veloroute 6 an."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: []

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord N3 – Barmbek ↔ Fuhlsbüttel“ <.icon>N3</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N3 – Barmbek ↔ Fuhlsbüttel“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
