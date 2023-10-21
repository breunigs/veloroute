defmodule Data.Article.Static.BrNordN7 do
  use Article.Static

  def id(), do: "br-nord-n7"
  def display_id(), do: "N7"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N7 – City-Nord"

  def color(), do: "#a8a8a8"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N7 – City-Nord“ im Bezirk Hamburg-Nord führt vom Grandweg (Veloroute 3) zum Langenfort (Veloroute 5)."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n7",
        direction: :forward,
        from: "Grandweg",
        to: "Langenfort",
        parent_ref: __MODULE__,
        text: "vom Grandweg zum Langenfort",
        videos: [
          {"2023-10-18-brnord/GX016367", "00:00:24.353", :end},
          {"2023-10-18-brnord/GX016368", :start, :end},
          {"2023-10-18-brnord/GX016369", :start, :end},
          {"2023-10-18-brnord/GX016370", :start, "00:00:08.408"},
          {"2023-10-17-brnord/GX016312", "00:00:11.078", :end},
          {"2023-10-17-brnord/GX016313", :start, "00:00:27.427"},
          {"2023-10-17-brnord/GX016313", "00:00:27.361", :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n7",
        direction: :backward,
        from: "Langenfort",
        to: "Grandweg",
        parent_ref: __MODULE__,
        text: "vom Langenfort zum Grandweg",
        videos: [
          {"2023-10-17-brnord/GX016314", "00:00:21.054", :end},
          {"2023-10-17-brnord/GX016315", :start, :end},
          {"2023-10-17-brnord/GX016316", :start, :end},
          {"2023-10-17-brnord/GX016317", :start, :end},
          {"2023-10-17-brnord/GX016318", :start, :end},
          {"2023-10-17-brnord/GX016319", :start, :end},
          {"2023-10-17-brnord/GX016320", :start, :end},
          {"2023-10-17-brnord/GX016321", :start, :end},
          {"2023-10-18-brnord/GX016367", :start, "00:00:21.017"}
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
    <h3>Bezirksroute HH-Nord – City-Nord <.icon>N7</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N7 – City-Nord“ künftig verlaufen könnte.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
