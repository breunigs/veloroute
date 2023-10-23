defmodule Data.Article.Static.BrNordN3 do
  use Article.Static

  def id(), do: "br-nord-n3"
  def display_id(), do: "N3"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N3 – Barmbek ↔ Fuhlsbüttel"

  def color(), do: "#a8a8a8"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N3 – Barmbek ↔ Fuhlsbüttel“ im Bezirk Hamburg-Nord führt vom Ohlsdorfer Friedhof nach Süden und schließt in zwei Ästen an die Veloroute 6 an."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n3-main",
        direction: :forward,
        from: "Lortzingstraße",
        to: "Ohlsdorf",
        parent_ref: __MODULE__,
        text: "von der Lortzingstraße nach Ohlsdorf",
        videos: [
          {"2023-10-18-brnord/GX016410", "00:00:34.361", :end},
          {"2023-10-18-brnord/GX016411", :start, "00:00:24.591"},
          {"2023-10-18-brnord/GX016429", "00:00:20.053", :end},
          {"2023-10-18-brnord/GX016430", :start, :end},
          {"2023-10-18-brnord/GX016431", :start, :end},
          {"2023-10-18-brnord/GX016432", :start, :end},
          {"2023-10-18-brnord/GX016433", :start, "00:00:10.511"},
          {"2023-10-23-brnrod/GX016531", "00:00:15.482", :end},
          {"2023-10-23-brnrod/GX016532", :start, :end},
          {"2023-10-23-brnrod/GX016533", :start, :end},
          {"2023-10-23-brnrod/GX016534", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n3-main",
        direction: :backward,
        from: "Ohlsdorf",
        to: "Lortzingstraße",
        parent_ref: __MODULE__,
        text: "von Ohlsdorf zur Lortzingstraße",
        videos: [
          {"2023-10-23-brnrod/GX016501", :start, :end},
          {"2023-10-23-brnrod/GX016502", :start, :end},
          {"2023-10-23-brnrod/GX016503", :start, :end},
          {"2023-10-23-brnrod/GX016504", :start, :end},
          {"2023-10-23-brnrod/GX016505", :start, :end},
          {"2023-10-23-brnrod/GX016506", :start, :end},

          # XXX
          {"2023-10-23-brnrod/GX016507", :start, "00:00:05.572"},
          {"2023-10-18-brnord/GX016406", "00:00:06.740", :end},
          {"2023-10-18-brnord/GX016407", :start, :end},
          {"2023-10-18-brnord/GX016408", :start, :end},
          {"2023-10-18-brnord/GX016409", :start, :end},
          {"2023-10-18-brnord/GX016410", :start, "00:00:31.358"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n3-leg",
        direction: :forward,
        from: "Eulenkamp",
        to: "Steilshooper Straße",
        parent_ref: __MODULE__,
        text: "vom Eulenkamp zur Steilshooper Straße",
        videos: [
          {"2023-10-23-brnrod/GX016529", "00:00:14.481", "00:00:17.317"},
          {"2023-10-23-brnrod/GX016529", "00:00:37.004", :end},
          {"2023-10-23-brnrod/GX016530", :start, :end},
          {"2023-10-23-brnrod/GX016531", :start, "00:00:09.007"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n3-leg",
        direction: :backward,
        from: "Steilshooper Straße",
        to: "Eulenkamp",
        parent_ref: __MODULE__,
        text: "von der Steilshooper Straße zum Eulenkamp",
        videos: [
          {"2023-10-23-brnrod/GX016507", "00:00:10.744", :end},
          {"2023-10-23-brnrod/GX016508", :start, :end},
          {"2023-10-23-brnrod/GX016509", :start, :end}
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
    <h3>Bezirksroute HH-Nord N3 – Barmbek ↔ Fuhlsbüttel“ <.icon>N3</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N3 – Barmbek ↔ Fuhlsbüttel“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
