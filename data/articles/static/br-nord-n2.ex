defmodule Data.Article.Static.BrNordN2 do
  use Article.Static

  def id(), do: "br-nord-n2"
  def display_id(), do: "N2"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N2 – Alster ↔ Airport"

  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N2 – Alster ↔ Airport“ im Bezirk Hamburg-Nord führt von Groß Borstel über zwei Äste zur Hoheluftbrücke bzw. Heilwigbrücke"

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
    <h3>Bezirksroute HH-Nord N2 – Alster ↔ Airport“ <.icon>N2</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N2 – Alster ↔ Airport“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
