defmodule Data.Article.Blog.Methfesselstrasse2 do
  use Article.Default

  def title(), do: "Methfesselstraße"

  def type(), do: :intent

  def summary(),
    do: "Straße soll nach Bau der Fernwärmeleitung zur Fahrradstraße aufgewertet werden."

  def tags(), do: ["eimsbüttel", "articles", "br-eimsbuettel-nord-sued"]

  def links(_assigns) do
    [
      {"Präsentation zur Vorplanung", ~d[2025-07],
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/to020.asp?TOLFDNR=1036928"}
    ]
  end

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Paciusweg",
        to: "Hagenbeckstraße",
        parent_ref: __MODULE__,
        text: "Methfesselstraße nach Nordosten",
        historic: %{
          "f644e4482b6231c637912a64a48b7f0b" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018453", "00:00:16.860", "00:00:35.836"},
          {"2023-10-23-brnrod/GX016489", "00:00:30.797", "00:00:50.707"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Hagenbeckstraße",
        to: "Paciusweg",
        parent_ref: __MODULE__,
        text: "Methfesselstraße nach Südwesten",
        historic: %{
          "2d9a492a88c03323cb48aed87720356f" => ~d[2025-03]
        },
        videos: [
          {"2023-10-29-lenhart/GX016647", "00:00:38.698", "00:00:58.358"},
          {"2025-03-18-halsten/GX018476", "00:00:32.532", "00:01:10.720"}
        ]
      }
    ]

  def map_image do
    {name(),
     [
       {"Bezirksamt Eimsbüttel – Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/ihr-bezirksamt/fachamt-management-des-oeffentlichen-raumes-58482"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der westliche Abschnitt der Methfesselstraße wird hauptsächlich als Lagerfläche für private KFZ genutzt. Weder Gehwege noch verbleibende Fahrgasse sind breit genug für gutes Vorankommen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}>Vorplanung</.h4_planning>
    <p>Nach dem Bau der Fernwärmeleitung soll die Straße zur Fahrradstraße umgebaut werden. Als Fahrbahnbreite sind 4,0m vorgesehen. Hinzu kommen jeweils noch Sicherheitsabstände gegen <.ref>Dooring</.ref> auf beiden Seiten.</p>

    <p>An der <.m bounds="9.943077,53.577691,9.946576,53.579769">Rombergstraße</.m> sorgt eine Gehwegüberfahrt für eine Bevorrechtigung der Methfesselstraße.</p>

    <p>Zusätzlich sollen öffentliche Fahrradbügel aufgestellt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
