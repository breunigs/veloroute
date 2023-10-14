defmodule Data.Article.Static.BrNordN6 do
  use Article.Static

  def id(), do: "br-nord-n6"
  def display_id(), do: "N6"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N6 – Stadtpark-Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N6 – Stadtpark-Süd“ im Bezirk Hamburg-Nord führt vom UKE nach Barmbek."

  def tags(), do: [id(), display_id(), "br-nord"]

  # note: W3 and N6 connect at the admin border of Barmbek/Barmfeld, hence the slight naming difference
  # def tracks(),
  #   do: [
  #     %Video.Track{
  #       renderer: 3,
  #       group: "n6-main",
  #       direction: :forward,
  #       from: "UKE",
  #       to: "Barmbek",
  #       parent_ref: __MODULE__,
  #       text: "vom UKE nach Barmfeld",
  #       videos: []
  #     },
  #     %Video.Track{
  #       renderer: 3,
  #       group: "n6-main",
  #       direction: :backward,
  #       from: "Barmbek",
  #       to: "UKE",
  #       parent_ref: __MODULE__,
  #       text: "von Barmfeld zum UKE",
  #       videos: []
  #     },
  #     %Video.Track{
  #       renderer: 3,
  #       group: "n6-leg",
  #       direction: :forward,
  #       from: "Grasweg",
  #       to: "Pestalozzistraße",
  #       parent_ref: __MODULE__,
  #       text: "vom Grasweg zur Pestalozzistraße",
  #       videos: []
  #     },
  #     %Video.Track{
  #       renderer: 3,
  #       group: "n6-leg",
  #       direction: :backward,
  #       from: "Pestalozzistraße",
  #       to: "Grasweg",
  #       parent_ref: __MODULE__,
  #       text: "von der Pestalozzistraße zum Grasweg",
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
    <h3>Bezirksroute HH-Nord – Stadtpark-Süd <.icon>N6</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N6 – Stadtpark-Süd“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
