defmodule Data.Article.Static.BrNordN4 do
  use Article.Static

  def id(), do: "br-nord-n4"
  def display_id(), do: "N4"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N4 – Barmbek-Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N4 – Barmbek-Süd“ im Bezirk Hamburg-Nord führt von der Schönen Aussicht (Alster) zum Eulenkamp (Veloroute 6)"

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord – Barmbek-Süd <.icon>N4</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N4 – Barmbek-Süd“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
