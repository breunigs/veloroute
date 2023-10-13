defmodule Data.Article.Static.BrNordN7 do
  use Article.Static

  def id(), do: "br-nord-n7"
  def display_id(), do: "N7"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N7 – City-Nord"

  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N7 – City-Nord“ im Bezirk Hamburg-Nord führt vom Grandweg (Veloroute 3) zum Langenfort (Veloroute 5)."

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
    <h3>Bezirksroute HH-Nord – City-Nord <.icon>N7</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N7 – City-Nord“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
