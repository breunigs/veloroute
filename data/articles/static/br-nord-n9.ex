defmodule Data.Article.Static.BrNordN9 do
  use Article.Static

  def id(), do: "br-nord-n9"
  def display_id(), do: "N9"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N9 – Langenhorner"

  def color(), do: "#bf95ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N9 – Langenhorner“ im Bezirk Hamburg-Nord führt vom Krohnstieg (Veloroute 14) nach Glashütte."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n9",
        direction: :forward,
        from: "Krohnstieg",
        to: "Glashütte",
        parent_ref: __MODULE__,
        text: "vom Krohnstieg nach Glashütte",
        videos: [
          {"2023-10-25-brnord/GX016590", "00:02:42.763", "00:03:24.471"},
          {"2023-10-25-brnord/GX016584", "00:01:56.350", :end},
          {"2023-10-25-brnord/GX016585", :start, :end},
          {"2023-10-25-brnord/GX016586", :start, "00:00:09.710"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n9",
        direction: :backward,
        from: "Glashütte",
        to: "Krohnstieg",
        parent_ref: __MODULE__,
        text: "von Glashütte zum Krohnstieg",
        videos: [
          {"2023-10-25-brnord/GX016588", "00:00:04.337", "00:00:40.173"},
          {"2023-10-25-brnord/GX016589", "00:00:12.346", :end},
          {"2023-10-25-brnord/GX016590", :start, "00:02:42.797"}
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
    <h3>Bezirksroute HH-Nord – Langenhorner <.icon>N9</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N9 – Langenhorner“ künftig verlaufen könnte.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
