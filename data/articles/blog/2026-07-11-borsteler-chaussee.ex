defmodule Data.Article.Blog.BorstelerChaussee do
  use Article.Default

  def title(), do: "Borsteler Chaussee (Bezirksroute Nord N2)"

  def summary(),
    do:
      "Vorentwurf sieht breitere Radwege, bessere Querungsmöglichkeiten und einen Kreisel am Warnckesweg vor."

  def type(), do: :intent

  def tags(), do: ["br-nord-n2"]

  def map_image do
    {name(),
     [
       {"Bezirksamt Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/fachamt-management-des-oeffentlichen-raums-70286"}
     ]}
  end

  def links(_assigns) do
    [
      {"Präsentation", ~d[2025-11],
       "https://borsteler-chaussee.beteiligung.hamburg/drupal/sites/default/files/2025-11/praesentation_rise-borsteler-chaussee-2025.pdf"},
      {"Beteiligungsverfahren (abgeschlossen)", ~d[2025-11],
       "https://borsteler-chaussee.beteiligung.hamburg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Borsteler Chaussee gibt es meist auf beiden Seiten <.ref>Hochbordradwege</.ref>. Ihre Breite unterscheidet sich, fällt mit 1,0m bis 1,5m aber schmaler aus als heutzutage vorgeschrieben. Ihre Oberfläche wechselt häufig. Konflikte mit dem Fußverkehr treten regelmäßig auf.</p>

    <p>Ausnahme bildet eine Nebenfahrbahn ab <.v bounds="9.975614,53.606441,9.979879,53.608848" lon={9.978403} lat={53.607467} dir="forward" ref={BrNordN2} highlight="Köppenstraße">Höhe Köppenstraße</.v> bis etwa <.v bounds="9.974072,53.607894,9.97811,53.610148" lon={9.975595} lat={53.609425} dir="forward" ref={BrNordN2} highlight="Moorweg">Einmündung Moorweg</.v>, die sich Rad und KFZ im <.ref>Mischverkehr</.ref> teilen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Für ein Beteiligungsverfahren wurde ein Vorentwurf entwickelt. Dieser sieht verschiedene Führungsformen für den Radverkehr vor: <.ref>Protected-Bike-Lane</.ref>, <.ref>Kopenhagener Radweg</.ref> und <.ref>Hochbordradwege</.ref>. Bis auf wenige Engstellen sind diese mindestens 2,0m breit.</p>

    <p>Die <.v bounds="9.975614,53.606441,9.979879,53.608848" lon={9.978403} lat={53.607467} dir="forward" ref={BrNordN2}>Nebenfahrbahn</.v> wird verkürzt und zur Fahrradstraße. KFZ werden bereits ab <.v bounds="9.974532,53.607295,9.979071,53.609427" lon={9.977161} lat={53.608305} dir="forward" ref={BrNordN2}>Moortwiete</.v> auf die Hauptfahrbahn geleitet.</p>

    <p>Am <.v bounds="9.972849,53.609209,9.976754,53.611335" lon={9.974778} lat={53.610235} dir="forward" ref={BrNordN2}>Warnckesweg</.v> regelt ein Kreisverkehr die Vorfahrt. Entsprechend werden alle Radwege vorher aufgelöst. Rad- und KFZ-Verkehr teilen sich dort im <.ref>Mischverkehr</.ref> die <.ref>Fahrbahn</.ref>.</p>

    <p>Hinzu kommen neue Zebrastreifen, mehr Bäume und Aufenthaltsflächen.</p>

    <h4>Meinung</h4>
    <p>Mal sehen, was kommt. Groß Borstel hätte ein Zentrum mit Aufenthaltsqualität verdient, das man auch zu Fuß und mit dem Rad gut erreichen kann. Die aktuelle Regierung fokussiert jedoch vor allem gratis KFZ-Lagerflächen, was eine Umsetzung des Vorentwurfs effektiv verhindert.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
