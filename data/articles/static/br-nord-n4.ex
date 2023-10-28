defmodule Data.Article.Static.BrNordN4 do
  use Article.Static

  def id(), do: "br-nord-n4"
  def display_id(), do: "N4"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N4 – Barmbek-Süd"

  def color(), do: "#bf95ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N4 – Barmbek-Süd“ im Bezirk Hamburg-Nord führt von der Schönen Aussicht (Alster) zum Eulenkamp (Veloroute 6)"

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n4",
        direction: :forward,
        from: "Schöne Aussicht",
        to: "Eulenkamp",
        parent_ref: __MODULE__,
        text: "von der Schönen Aussicht zum Eulenkamp",
        videos: [
          {"2023-10-23-brnrod/GX016521", "00:00:16.250", :end},
          {"2023-10-23-brnrod/GX016522", :start, :end},
          {"2023-10-23-brnrod/GX016523", :start, :end},
          {"2023-10-23-brnrod/GX016524", :start, :end},
          {"2023-10-23-brnrod/GX016525", :start, :end},
          {"2023-10-23-brnrod/GX016526", :start, :end},
          {"2023-10-23-brnrod/GX016527", :start, "00:00:29.129"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n4",
        direction: :backward,
        from: "Eulenkamp",
        to: "Schöne Aussicht",
        parent_ref: __MODULE__,
        text: "vom Eulenkamp zur Schönen Aussicht",
        videos: [
          {"2023-10-23-brnrod/GX016514", :start, :end},
          {"2023-10-23-brnrod/GX016515", :start, :end},
          {"2023-10-23-brnrod/GX016516", :start, :end},
          {"2023-10-23-brnrod/GX016517", :start, :end},
          {"2023-10-23-brnrod/GX016518", :start, :end},
          {"2023-10-23-brnrod/GX016519", :start, :end},
          {"2023-10-23-brnrod/GX016520", :start, :end},
          {"2023-10-23-brnrod/GX016521", :start, "00:00:15.415"}
        ]
      }
    ]

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

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
