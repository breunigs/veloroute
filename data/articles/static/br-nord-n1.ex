defmodule Data.Article.Static.BrNordN1 do
  use Article.Static

  def id(), do: "br-nord-n1"
  def display_id(), do: "N1"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N1 – Nord ↔ Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N1 – Nord ↔ Süd“ im Bezirk Hamburg-Nord führt von Langenhorn, durch den Stadtpark nach Hohenfelde"

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
    <h3>Bezirksroute HH-Nord – Nord ↔ Süd <.icon>N1</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N1 – Nord ↔ Süd“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
