defmodule Data.Article.Blog.HammerbrookstrasseSued do
  use Article.Default

  def title(), do: "Hammerbrookstraße – Süd"

  def summary(),
    do:
      "Durchgängige Radfahrstreifen und Protected-Bike-Lanes (2,0m–2,25m). An Bushaltestellen zwischen Gehweg und Wartefläche der Fahrgäste."

  def start(), do: ~d[2026Q1]

  def type(), do: :planned
  def tags(), do: []

  def map_image do
    {name(),
     [
       {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"},
       {"Bezirksamt Hamburg-Mitte, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/bezirksamt/bezirksamtsstruktur/dezernat-wirtschaft-bauen-umwelt-66718"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungen und Karte",
       "https://fragdenstaat.de/anfrage/br-hammerbrookstrasse-sued/#nachricht-1046885"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Richtung Norden war mal ein rund 70cm schmaler <.ref>Hochbordradweg</.ref> vorhanden. In Richtung Süden gab es keinen durchgängig benutzbaren Radweg, sodass auf der <.ref>Fahrbahn</.ref> gefahren werden musste. Wegen Leitungsarbeiten ist die Straße seit einigen Jahren eine Baustelle mit abweichender Führung.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Prinzipiell sind beidseitig je rund 2,25m breite <.ref>Radfahrstreifen</.ref> geplant. Sie werden teilweise als <.ref>Protected-Bike-Lane</.ref> hergerichtet. Weil die Trennelemente zu den KFZ etwas Platz brauchen, bleiben hier noch 2,0m nutzbare Breite.</p>

    <p>An den Bushaltestellen werden die Radwege als 2,0m breite <.ref>Hochbordradwege</.ref> zwischen Gehweg und Wartebereich der Fahrgäste geführt.</p>

    <p>An der Kreuzung mit der <.m bounds="10.023309,53.542125,10.029856,53.546025">Süderstraße</.m> entsteht ein umlaufender Hochbordradweg. Zum Queren sind jeweils eigene Aufstellflächen vorhanden. An den anderen Einmündungen ist <.ref>direktes Linksabbiegen</.ref> vorgesehen. Nur an der <.m bounds="10.019047,53.54855,10.023451,53.551658">Nordkanalstraße</.m> werden dafür Aufstelltaschen aufgemalt.</p>

    <p>Hinzu kommen zahlreiche neue Fahrradbügel und eine Sitzgruppe am <.m bounds="10.02112,53.546407,10.024579,53.547956">Mittelkanal</.m>.</p>

    <h4>Meinung</h4>
    <p>Mit der Planung nach neuem Hamburger Standard erhält die Hammerbrookstraße durchgängige, eigene Radwege in beide Richtungen. Super! Auch die Lösung an der Süderstraße kann sich sehen lassen.</p>

    <p>Leider lässt die Stadt auf langen Abschnitten die Trennelemente entfallen, um KFZ-Parkplätze schaffen zu können. Im nahegelegenen <.v bounds="10.011804,53.552931,10.023008,53.558501" lon={10.016347} lat={53.555581} dir="backward" ref="radroute-7">Steindamm</.v> funktioniert dieser Ansatz nur schlecht und der Radweg ist häufig nicht benutzbar. Hoffentlich klappt es hier besser.</p>

    <p>Die Planung unternimmt auch nichts, um unachtsames Rechtsabbiegen von LKW-Fahrern zu verhindern. Engere Einmündungen würden die Abbiegeschwindigkeit deutlich senken. Da es nur eine Nebenstraße ist, wäre auch die Mitbenutzung der Gegenfahrbahn zum Rechtsabbiegen für die wenigen LKW denkbar.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
