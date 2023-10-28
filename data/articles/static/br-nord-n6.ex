defmodule Data.Article.Static.BrNordN6 do
  use Article.Static

  def id(), do: "br-nord-n6"
  def display_id(), do: "N6"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N6 – Stadtpark-Süd"

  def color(), do: "#bf95ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N6 – Stadtpark-Süd“ im Bezirk Hamburg-Nord führt vom UKE nach Barmbek."

  def tags(), do: [id(), display_id(), "br-nord"]

  # note: W3 and N6 connect at the admin border of Barmbek/Barmfeld, hence the slight naming difference
  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n6-main",
        direction: :forward,
        from: "UKE",
        to: "Barmbek",
        parent_ref: __MODULE__,
        text: "vom UKE nach Barmfeld",
        videos: [
          {"2023-10-18-brnord/GX016390", :start, :end},
          {"2023-10-18-brnord/GX016391", :start, :end},
          {"2023-10-18-brnord/GX016392", :start, :end},
          {"2023-10-18-brnord/GX016393", :start, :end},
          {"2023-10-18-brnord/GX016394", :start, :end},
          {"2023-10-18-brnord/GX016395", :start, :end},
          {"2023-10-18-brnord/GX016396", :start, :end},
          {"2023-10-18-brnord/GX016397", :start, :end},
          {"2023-10-18-brnord/GX016398", :start, :end},
          {"2023-10-18-brnord/GX016399", :start, :end},
          {"2023-10-18-brnord/GX016400", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n6-main",
        direction: :backward,
        from: "Barmbek",
        to: "UKE",
        parent_ref: __MODULE__,
        text: "von Barmfeld zum UKE",
        videos: [
          {"2023-10-18-brnord/GX016402", :start, :end},
          {"2023-10-18-brnord/GX016403", :start, :end},
          {"2023-10-18-brnord/GX016434", "00:00:00.467", "00:00:12.980"},
          {"2023-10-18-brnord/GX016435", :start, :end},
          {"2023-10-18-brnord/GX016436", :start, :end},
          {"2023-10-18-brnord/GX016437", :start, "00:00:05.105"},
          {"2023-10-18-brnord/GX016446", "00:00:29.563", :end},
          {"2023-10-18-brnord/GX016447", :start, :end},
          {"2023-10-18-brnord/GX016448", :start, "00:00:10.210"},
          {"2023-10-22-br-nord-reg/GX016462", "00:00:03.070", "00:00:07.741"},
          {"2023-10-18-brnord/GX016449", "00:00:04.104", :end},
          {"2023-10-18-brnord/GX016450", :start, "00:00:18.014"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n6-leg",
        direction: :forward,
        from: "Grasweg",
        to: "Pestalozzistraße",
        parent_ref: __MODULE__,
        text: "vom Grasweg zur Pestalozzistraße",
        videos: [
          {"2023-10-18-brnord/GX016439", "00:00:09.977", "00:00:32.366"},
          {"2023-10-18-brnord/GX016439", "00:01:09.002", :end},
          {"2023-10-18-brnord/GX016440", :start, :end},
          {"2023-10-18-brnord/GX016441", :start, :end},
          {"2023-10-18-brnord/GX016442", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n6-leg",
        direction: :backward,
        from: "Pestalozzistraße",
        to: "Grasweg",
        parent_ref: __MODULE__,
        text: "von der Pestalozzistraße zum Grasweg",
        videos: [
          {"2023-10-18-brnord/GX016443", :start, :end},
          {"2023-10-18-brnord/GX016444", :start, :end},
          {"2023-10-18-brnord/GX016445", :start, :end},
          {"2023-10-18-brnord/GX016446", :start, "00:00:27.355"}
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
    <h3>Bezirksroute HH-Nord – Stadtpark-Süd <.icon>N6</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N6 – Stadtpark-Süd“ künftig verlaufen könnte. Die eingezeichnete und gefahrene Strecke orientiert sich dabei am heute Möglichen. Sollte der Vorschlag des Planungsbüros so von der Politik akzeptiert werden, würden die Verbindungen am Eppendorfer Marktplatz und an der Stadthallenbrücke vermutlich überarbeitet.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
