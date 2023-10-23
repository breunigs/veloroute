defmodule Data.Article.Static.BrNordN8 do
  use Article.Static

  def id(), do: "br-nord-n8"
  def display_id(), do: "N8"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N8 – Ost-West"

  def color(), do: "#a8a8a8"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N8 – Ost-West“ im Bezirk Hamburg-Nord führt von der Kollaustraße (Veloroute 3) nach Wellingsbüttel."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n8",
        direction: :forward,
        from: "Kollaustraße",
        to: "Wellingsbüttel",
        parent_ref: __MODULE__,
        text: "von der Kollaustraße nach Wellingsbüttel",
        videos: [
          {"2023-10-22-br-nord-reg/GX016466", "00:00:33.901", "00:01:26.820"},
          {"2023-10-23-brnrod/GX016492", "00:01:29.222", :end},
          {"2023-10-23-brnrod/GX016493", :start, :end},
          {"2023-10-23-brnrod/GX016494", :start, :end},
          {"2023-10-23-brnrod/GX016495", :start, :end},
          {"2023-10-23-brnrod/GX016496", :start, :end},
          {"2023-10-23-brnrod/GX016497", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n8",
        direction: :backward,
        from: "Wellingsbüttel",
        to: "Kollaustraße",
        parent_ref: __MODULE__,
        text: "von Wellingsbüttel zur Kollaustraße",
        videos: [
          {"2023-10-23-brnrod/GX016498", :start, :end},
          {"2023-10-23-brnrod/GX016499", :start, :end},
          {"2023-10-23-brnrod/GX016500", :start, :end},
          {"2023-10-23-brnrod/GX016501", :start, "00:00:03.837"},
          {"2023-10-23-brnrod/GX016538", "00:00:04.671", "00:00:13.981"},
          {"2023-10-23-brnrod/GX016538", "00:00:20.087", "00:00:44.811"},
          {"2023-10-23-brnrod/GX016538", "00:01:17.811", :end},
          {"2023-10-23-brnrod/GX016539", :start, :end},
          {"2023-10-23-brnrod/GX016540", :start, :end},
          {"2023-10-23-brnrod/GX016541", :start, :end},
          {"2023-10-23-brnrod/GX016542", :start, :end}
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
    <h3>Bezirksroute HH-Nord – Ost-West <.icon>N8</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N8 – Ost-West“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
