defmodule Data.Article.Static.BrNordN5 do
  use Article.Static

  def id(), do: "br-nord-n5"
  def display_id(), do: "N5"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N5 – Osterbek-Route"

  def color(), do: "#a8a8a8"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N5 – Osterbek-Route“ im Bezirk Hamburg-Nord führt von der Krugkoppelbrücke (Alster) zum Eulenkamp (Veloroute 6)"

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n5",
        direction: :forward,
        from: "Krugkoppelbrücke",
        to: "Eulenkamp",
        parent_ref: __MODULE__,
        text: "von der Krugkoppelbrücke zum Eulenkamp",
        videos: [
          {"2023-10-18-brnord/GX016418", "00:00:40.040", :end},
          {"2023-10-18-brnord/GX016419", :start, :end},
          {"2023-10-18-brnord/GX016420", :start, :end},
          {"2023-10-18-brnord/GX016421", :start, :end},
          {"2023-10-18-brnord/GX016422", :start, :end},
          {"2023-10-18-brnord/GX016423", :start, :end},
          {"2023-10-18-brnord/GX016424", :start, :end},
          {"2023-10-18-brnord/GX016425", :start, :end},
          {"2023-10-18-brnord/GX016426", :start, :end},
          {"2023-10-18-brnord/GX016427", :start, "00:00:20.683"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n5",
        direction: :backward,
        from: "Eulenkamp",
        to: "Krugkoppelbrücke",
        parent_ref: __MODULE__,
        text: "vom Eulenkamp zur Krugkoppelbrücke",
        videos: [
          {"2023-10-18-brnord/GX016427", "00:00:41.700", :end},
          {"2023-10-18-brnord/GX016428", :start, :end},
          {"2023-10-18-brnord/GX016429", :start, "00:00:20.120"},
          {"2023-10-18-brnord/GX016411", "00:00:24.658", :end},
          {"2023-10-18-brnord/GX016412", :start, :end},
          {"2023-10-18-brnord/GX016413", :start, :end},
          {"2023-10-18-brnord/GX016414", :start, :end},
          {"2023-10-18-brnord/GX016415", :start, :end},
          {"2023-10-18-brnord/GX016416", :start, :end},
          {"2023-10-18-brnord/GX016417", :start, :end},
          {"2023-10-18-brnord/GX016418", :start, "00:00:35.362"}
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
    <h3>Bezirksroute HH-Nord – Osterbek-Route <.icon>N5</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N5 – Osterbek-Route“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
