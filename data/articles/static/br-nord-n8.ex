defmodule Data.Article.Static.BrNordN8 do
  use Article.Static

  def id(), do: "br-nord-n8"
  def display_id(), do: "N8"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N8 – Ost-West"

  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N8 – Ost-West“ im Bezirk Hamburg-Nord führt von der Kollaustraße (Veloroute 3) nach Wellingsbüttel."

  def tags(), do: [id(), display_id(), "br-nord"]

  # def tracks(),
  #   do: [
  #     %Video.Track{
  #       renderer: 3,
  #       group: "n8",
  #       direction: :forward,
  #       from: "Kollaustraße",
  #       to: "Wellingsbüttel",
  #       parent_ref: __MODULE__,
  #       text: "von der Kollaustraße nach Wellingsbüttel",
  #       videos: []
  #     },
  #     %Video.Track{
  #       renderer: 3,
  #       group: "n8",
  #       direction: :backward,
  #       from: "Wellingsbüttel",
  #       to: "Kollaustraße",
  #       parent_ref: __MODULE__,
  #       text: "von Wellingsbüttel zur Kollaustraße",
  #       videos: []
  #     }
  #   ]

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord – Ost-West <.icon>N8</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N8 – Ost-West“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
