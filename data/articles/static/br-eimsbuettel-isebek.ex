defmodule Data.Article.Static.BrEimsbuettelIsebek do
  use Article.Static

  def id(), do: "br-eimsbuettel-isebek"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Isebek"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Isebek“ in Eimsbüttel verläuft von der Waterloostraße nach Nordenosten Richtung Streekbrücke."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # GPX OK
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :forward,
        from: "Waterloostraße",
        to: "Streekbrücke",
        parent_ref: __MODULE__,
        text: "von der Waterloostraße zur Streekbrücke",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015170", "00:01:19.646", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015171", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015172", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015173", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015174", :start, "00:00:29.596"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015175", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015176", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015177", :start, "00:00:24.057"}
        ]
      },
      ## GPX OK
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :backward,
        from: "Streekbrücke",
        to: "Waterloostraße",
        parent_ref: __MODULE__,
        text: "von der Streekbrücke zur Waterloostraße",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015177", "00:00:53.487", "00:01:12.039"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015177", "00:01:18.478", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015178", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015179", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015180", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015181", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015182", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015183", :start, "00:00:28.690"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang IV",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"},
      {"Beteiligungsverfahren", "abgeschlossen, 2021",
       "https://bezirksrouten-eimsbuettel.beteiligung.hamburg/#/"}
    ]
  end

  # TODO: links
  def text(assigns) do
    ~H"""
    <p>Die Bezirksroute „Isebek“ in Eimsbüttel verläuft von der Waterloostraße (<.icon>13</.icon>) in Richtung Nordosten. Die Route orientiert sich dabei grob am namensgebenden Isebekkanal. An der Schäferkampsallee (<.icon>2</.icon>) und Bogenstraße (<.icon>3</.icon>) quert sie Hamburgs Velorouten. Sie endet an der Streekbrücke (<.icon>4</.icon>).</p>

    <h4>Speziell für diese Route</h4>
    <p>Die Vorplanung setzt meist auf drei Konzepte, um die Route für den Radverkehr zu verbessern:</p>
    <ul>
      <li><strong>Fahrradstraßen:</strong> Detailverbesserungen, die den Stellenwert des Radverkehrs hervorheben. Etwa Markierungen, Vorfahrt und durchgängig breite Fahrgasse. Vorgeschlagen für die Bellealliancestraße und den Abschnitt vom Grindelberg bis zum Mittelweg.</li>
      <li><strong>Radfahrstreifen:</strong> Neu angelegt oder verbreitert, ggf. mit Trennelementen zum KFZ-Verkehr. Vorgeschlagen für Moorkamp, Schlankreye und dem bereits ausgebauten Abschnitt ab Frauenthal.</li>
      <li><strong>KFZ-Einbahnstraßen:</strong> Um KFZ-Durchgangsverkehr von der Route fernzuhalten, sollen KFZ-Einbahnstraßen eingerichtet werden. Sie sind dabei so gelegt, dass eine durchgängige Fahrt entlang der Route für KFZ nicht möglich ist (etwa → – ←). Vorgeschlagen für Moorkamp/Schlankreye, und Innocentiastraße/Hagedornstraße.</li>
    </ul>

    <p>Für die Schäferkampsallee wird vorgeschlagen die südliche Nebenfahrbahn zu einem Zweirichtungsradweg umzubauen. Die Anschlüsse an Bellealliancestraße bzw. Moorkamp sollen dem angepasst werden um direkteres Queren zu ermöglichen. Als weniger attraktive Alternative werden Detailverbesserungen der heutigen Führung vorgeschlagen. Etwa breiterer Radweg auf Kosten des Fußweges auf der Nordseite, oder eine Fahrradstraße auf der Südseite.</p>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
