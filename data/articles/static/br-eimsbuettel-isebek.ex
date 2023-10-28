defmodule Data.Article.Static.BrEimsbuettelIsebek do
  use Article.Static

  def id(), do: "br-eimsbuettel-isebek"
  def display_id(), do: "E4"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – E4 – Isebek"

  def color(), do: "#caa8ff"

  def summary(),
    do:
      "Die Bezirksroute „Isebek“ in Eimsbüttel verläuft von der Waterloostraße nach Nordosten Richtung Streekbrücke."

  def tags(), do: [id(), display_id(), "br-eimsbuettel"]

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
        text: "Bezirksroute Eimsbüttel „Isebek“ → Streekbrücke",
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
        text: "Bezirksroute Eimsbüttel „Isebek“ → Waterloostraße",
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

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Eimsbüttel – Isebek <.icon>E4</.icon></h3>

    <p>Die Bezirksroute „Isebek“ in Eimsbüttel verläuft von der <.v bounds="9.951162,53.564718,9.974008,53.57302" lon={9.956766} lat={53.567132} dir="forward" ref="br-eimsbuettel-isebek">Waterloostraße</.v> (<.icon>13</.icon>) in Richtung Nordosten. Die Route orientiert sich dabei grob am namensgebenden <.m bounds="9.95901,53.57004,9.9868,53.580914">Isebekkanal</.m>. An der <.v bounds="9.953102,53.564784,9.969015,53.572782" lon={9.962984} lat={53.569116} dir="forward" ref="br-eimsbuettel-isebek">Schäferkampsallee</.v> (<.icon>2</.icon>) und <.v bounds="9.966298,53.569095,9.989158,53.579581" lon={9.972973} lat={53.574073} dir="forward" ref="br-eimsbuettel-isebek">Bogenstraße</.v> (<.icon>3</.icon>) quert sie Hamburgs Velorouten. Sie endet an der <.v bounds="9.986734,53.579872,10.004593,53.588298" lon={9.994955} lat={53.583546} dir="forward" ref="br-eimsbuettel-isebek">Streekbrücke</.v> (<.icon>4</.icon>).</p>

    <h4>Speziell für diese Route</h4>
    <p>Die Vorplanung setzt meist auf drei Konzepte, um die Route für den Radverkehr zu verbessern:</p>
    <ul>
      <li><strong>Fahrradstraßen:</strong> Detailverbesserungen, die den Stellenwert des Radverkehrs hervorheben. Etwa Markierungen, Vorfahrt und durchgängig breite Fahrgasse. Vorgeschlagen für die <.v bounds="9.955597,53.56479,9.965481,53.571135" lon={9.960493} lat={53.568137} dir="forward" ref="br-eimsbuettel-isebek">Bellealliancestraße</.v> und den Abschnitt vom <.v bounds="9.976781,53.576803,9.995717,53.58247" lon={9.977797} lat={53.577516} dir="forward" ref="br-eimsbuettel-isebek">Grindelberg</.v> bis zum <.v bounds="9.976781,53.576803,9.995717,53.58247" lon={9.993685} lat={53.579527} dir="forward" ref="br-eimsbuettel-isebek">Mittelweg</.v>.</li>
      <li><strong>Radfahrstreifen:</strong> Neu angelegt oder verbreitert, ggf. mit Trennelementen zum KFZ-Verkehr. Vorgeschlagen für <.v bounds="9.964498,53.568255,9.971118,53.572972" lon={9.967577} lat={53.570302} dir="forward" ref="br-eimsbuettel-isebek">Moorkamp</.v>, <.v bounds="9.968378,53.571089,9.979022,53.578159" lon={9.97428} lat={53.575033} dir="forward" ref="br-eimsbuettel-isebek">Schlankreye</.v> und dem bereits ausgebauten Abschnitt ab <.v bounds="9.990736,53.578997,9.996489,53.584402" lon={9.994275} lat={53.580262} dir="forward" ref="br-eimsbuettel-isebek">Frauenthal</.v>.</li>
      <li><strong>KFZ-Einbahnstraßen:</strong> Um KFZ-Durchgangsverkehr von der Route fernzuhalten, sollen KFZ-Einbahnstraßen eingerichtet werden. Sie sind dabei so gelegt, dass eine durchgängige Fahrt entlang der Route für KFZ nicht möglich ist (etwa → – ←). Vorgeschlagen für <.v bounds="9.964498,53.568255,9.971118,53.572972" lon={9.967577} lat={53.570302} dir="forward" ref="br-eimsbuettel-isebek">Moorkamp</.v>/<.v bounds="9.968378,53.571089,9.979022,53.578159" lon={9.97428} lat={53.575033} dir="forward" ref="br-eimsbuettel-isebek">Schlankreye</.v>, und <.v bounds="9.981724,53.576725,9.996769,53.581639" lon={9.986649} lat={53.578777} dir="forward" ref="br-eimsbuettel-isebek">Innocentiastraße</.v>/<.v bounds="9.981724,53.576725,9.996769,53.581639" lon={9.991988} lat={53.579158} dir="forward" ref="br-eimsbuettel-isebek">Hagedornstraße</.v>.</li>
    </ul>

    <p>Für die <.v bounds="9.961053,53.567343,9.968151,53.571472" lon={9.964881} lat={53.569272} dir="forward" ref="br-eimsbuettel-isebek">Schäferkampsallee</.v> wird vorgeschlagen die südliche Nebenfahrbahn zu einem Zweirichtungsradweg umzubauen. Die Anschlüsse an <.v bounds="9.961053,53.567343,9.968151,53.571472" lon={9.963081} lat={53.569038} dir="forward" ref="br-eimsbuettel-isebek">Bellealliancestraße</.v> bzw. <.v bounds="9.961053,53.567343,9.968151,53.571472" lon={9.966185} lat={53.569198} dir="forward" ref="br-eimsbuettel-isebek">Moorkamp</.v> sollen dem angepasst werden um direkteres Queren zu ermöglichen. Als weniger attraktive Alternative werden Detailverbesserungen der heutigen Führung vorgeschlagen. Etwa breiterer Radweg auf Kosten des Fußweges auf der Nordseite, oder eine Fahrradstraße auf der Südseite.</p>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
